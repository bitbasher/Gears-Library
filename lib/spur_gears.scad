module spur_gear(modul, tooth_number, width, bore, 
        pressure_angle = 20, helix_angle=0, makeweb = "none"
        )
    {
    d = modul * tooth_number;
    r = d / 2;
    c =  (tooth_number <3)? 0 : modul/6;

    alpha_spur = atan(tan(pressure_angle)/cos(helix_angle));
    db = d * cos(alpha_spur);
    rb = db / 2;
    da = (modul <1)? d + modul * 2.2 : d + modul * 2;
    ra = da / 2;
    
    df = d - 2 * (modul + c);
    rf = df / 2;

    rho_ra = acos(rb/ra);
    rho_r = acos(rb/r);
    phi_r = grad(tan(rho_r)-radian(rho_r));
    gamma = rad*width/(r*tan(90-helix_angle));
    step = rho_ra/16;
    tau = 360/tooth_number;

    r_hole = (df - bore)/8;
    rm = bore/2+2*r_hole;
    z_hole = floor(2*pi*rm/(3*r_hole));
        // 
        // alter the makeweb setting to "none" WHEN it is "*something*" AND
        //  if r is >= the given width AND
        //  if d (pitch circ diam) is > double the bore.

    echo(r=r, w=width*1.5, d=d, b=2*bore );
    makeweb = (makeweb != "none" && r >= width*1.5 && d > 2*bore ) ? makeweb : "none";
    echo( hs=makeweb);
    // translate() // in herr
    union()
        {
        rotate([0,0,-phi_r-90*(1-clearance)/tooth_number])
            {
            linear_extrude(height = width, twist = gamma)
                {
                difference()
                    {
                    union()
                        {
                        tooth_width = (180*(1-clearance))/tooth_number+2*phi_r;
                        circle(rf);
                        for (rot = [0:tau:360])
                            {
                            rotate (rot)
                                {
                                polygon(
                                    concat( [[0,0]], 
                                        [for (rho = [0:step:rho_ra])
                                            polar_to_cartesian(ev(rb,rho))],
                                        [polar_to_cartesian(ev(rb,rho_ra))], 
                                        [for (rho = [rho_ra:-step:0])
                                            polar_to_cartesian( [ev(rb,rho)[0], tooth_width-ev(rb,rho)[1] ] ) 
                                            ]
                                        )
                                    );
                                }
                            } // end for(rot)
                        } // end union
                    circle(r = rm + r_hole*1.49 );
                    } // end difference()
                }
            } // end rotate()

        if (makeweb == "lightweb") 
            {
            linear_extrude(height = width)
                {
                difference()
                    {
                    circle(r = (bore+r_hole)/2);
                    circle(r = bore/2);
                    }
                }
            linear_extrude(height = (width-r_hole/2 < width*2/3) ? width*2/3 : width-r_hole/2)
                {
                difference()
                    {
                    circle(r=rm+r_hole*1.51);
                    union()
                        {
                        circle(r=(bore+r_hole)/2);
                        for (i = [0:1:z_hole])
                            {
                            translate(sphere_to_cartesian([rm,90,i*360/z_hole]))
                                circle(r = r_hole);
                            }
                        }
                    }
                }
            } // end optimised
        else if (makeweb=="fullweb")
            {
            linear_extrude(height = width)
                {
                difference()
                    {
                    circle(r = rm+r_hole*1.51);
                    circle(r = bore/2);
                    }
                }
            } // end else makeweb full .. so no web
        } // end union
}
