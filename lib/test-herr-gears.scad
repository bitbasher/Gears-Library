include <gears.scad>

gearmod=2; // [1,2,3,4]
teeth =20; // [5:1:30]
width = 6;
bore_diam=6;
slant = 24; // [-30,0:0.5:30.0]
webtype = "none"; // ["none","lightweb","fullweb"]
color("lightgreen"){
spur_gear( gearmod, teeth, width, bore_diam, helix_angle=slant, makeweb = webtype);
translate( [50,0,0] )
    spur_gear( gearmod, teeth, width, bore_diam, helix_angle=-slant, makeweb = webtype);
}
color("lightblue"){
translate( [0,50,0]) {
    herringbone_gear( gearmod, teeth, width, bore_diam, helix_angle=slant, makeweb = webtype);
    translate( [50,0,0] )
        herringbone_gear( gearmod, teeth, width, bore_diam, helix_angle = -slant, makeweb = webtype);
    }
}

function thin_rim(rm,r_hole) = 2*(rm+r_hole*1.49);

module herringbone_gear(modul, tooth_number, width, bore, 
        pressure_angle = 20, helix_angle=0, makeweb = "none"
        )
    {
    halfwide = width/2;
    d = modul * tooth_number;               // Pitch circle diameter
    r = d / 2;                              
    c =  (tooth_number <3)? 0 : modul/6;    // head play

    df = d - 2 * (modul + c);               // Root circle diameter
    rf = df / 2;                            // Root circle radius

    r_hole = (df - bore)/8;                 // Radius reduction holes
    rm = bore/2+2*r_hole;                   // Radius of red'n hole centers
    z_hole = floor(2*pi*rm/(3*r_hole));     // qty red'n holes to make
    
        // alter the makeweb setting to "none" WHEN it is "*something*" AND
        //  if r is >= the given width AND
        //  if d (pitch circ diam) is > double the bore.

    makeweb = (makeweb != "none" && r >= width*1.5 && d > 2*bore ) ? makeweb:"none";

    translate([0,0,halfwide])
        {
        union()
            { // thin_rim(rm,r_hole)
            spur_gear(modul, tooth_number, halfwide,
                    bore, pressure_angle, 
                    helix_angle, makeweb="none"
                    );
            mirror([0,0,1])
                {
                spur_gear(modul, tooth_number, halfwide,
                        bore, pressure_angle,
                        helix_angle, makeweb="none"
                        );
                }
            }
        }

    if (makeweb == "lightweb")
        difference() 
            {
            union()
                {
                lightweb( width, rm, r_hole );
                addhub( width, (bore+r_hole)/2 );
                }
            cylinder( h = width*2, r = bore/2); // cut the axle hole
            }
    else if (makeweb=="fullweb")
        fullweb( width, rm+r_hole*1.51, bore/2 );
    }

module fullweb( wid, rad, hol )
    {
    difference()
        {
        cylinder( h = wid, r = rad );
        translate( [0,0,-wid*0.1] ) 
            cylinder( h = wid*1.2, r = hol );
        }
    }

module spur_gear(modul, tooth_number, width, bore, 
        pressure_angle = 20, helix_angle = 0, makeweb = "none"
        )
    {
    d = modul * tooth_number;
    r = d / 2;
    c = (tooth_number <3)? 0 : modul/6;

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
    makeweb = (makeweb != "none" && r >= width*1.5 && d > 2*bore ) ? makeweb : "none";

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

        if (makeweb=="lightweb")
            difference() 
                {
                union()
                    {
                    lightweb( width, rm, r_hole );
                    addhub( width, (bore+r_hole)/2 );
                    }
                cylinder( h = width*2, r = bore/2); // cut the axle hole
                }
        else if (makeweb=="fullweb")
            fullweb( width, rm+r_hole*1.51, bore/2 );
        }
    }

module lightweb( wid, radm, hol )
    {
    z_hole = floor(2*pi*radm/(3*hol));
    rad = radm+hol*1.51;
    difference()
        {
        translate( [0,0,wid/2] )  // center the web vertically
            cylinder(h = wid/3, r = rad, center=true ); // make the web
        union()
            {
            for (i = [0:1:z_hole])  // make all the cutouts
                translate(sphere_to_cartesian([radm,90,i*360/z_hole]))
                    cylinder( h = width*1.2, r = hol );
            }
        }
    }


module addhub( wid, rad )
    {
    difference()
        {
        translate( [0,0,wid/2] )
            cylinder( h = wid*.9, r = rad, center=true );
        }
    }