module herringbone_gear(modul, tooth_number, width, bore, 
        pressure_angle = 20, helix_angle=0, makeweb = "none"
        )
    {
    halfwide = width/2;
    d = modul * tooth_number;
    r = d / 2;
    c =  (tooth_number <3)? 0 : modul/6;

    df = d - 2 * (modul + c);
    rf = df / 2;

    r_hole = (df - bore)/8;
    rm = bore/2+2*r_hole;
    z_hole = floor(2*pi*rm/(3*r_hole));
        //
        // alter the makeweb setting to "none" WHEN it is "*something*" AND
        //  if r is >= the given width AND
        //  if d (pitch circ diam) is > double the bore.
    echo(r=r, w=width*1.5, d=d, b=2*bore );
    makeweb = (makeweb != "none" && r >= width*1.5 && d > 2*bore ) ? makeweb:"none";
    echo( h2=makeweb);
    translate([0,0,halfwide]) {
        union()
            {
            spur_gear(modul, tooth_number, halfwide,
                    thin_rim(rm,r_hole), pressure_angle, 
                    helix_angle, makeweb
                    );
            mirror([0,0,1])
                {
                spur_gear(modul, tooth_number, halfwide,
                        thin_rim(rm,r_hole), pressure_angle,
                        helix_angle, makeweb
                        );
                }
            }
        }

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
