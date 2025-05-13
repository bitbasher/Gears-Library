include <lib/gears.scad>


echo( rad_to_deg( 1 ) );

echo( deg_to_rad( 60 ) );

spur_gear( 2, 12, 10, 5, helix_angle = 0 );

module spur_gear(modul, tooth_number, width, bore, pressure_angle = 20, helix_angle = 0 )
    {
    d = modul * tooth_number;
    r = d / 2;
    alpha_spur = atan(tan(pressure_angle)/cos(helix_angle));
    db = d * cos(alpha_spur);
    rb = db / 2;
    da = (modul <1)? d + modul * 2.2 : d + modul * 2;
    ra = da / 2;
    c =  (tooth_number <3)? 0 : modul/6;
    df = d - 2 * (modul + c);
    rf = df / 2;
    rho_ra = acos(rb/ra);
    rho_r = acos(rb/r);
    phi_r = grad(tan(rho_r)-radian(rho_r));
    gamma = rad*width/(r*tan(90-helix_angle));
    step = rho_ra/16;
    tau = 360/tooth_number;
    r_hole = (2*rf - bore)/8;
    rm = bore/2+2*r_hole;
    z_hole = floor(2*pi*rm/(3*r_hole));
    
    //union(){
        //rotate([0,0,-phi_r-90*(1-clearance)/tooth_number]){
            //linear_extrude(height = width, twist = gamma){
                //difference(){
                    union(){
                        tooth_width = (180*(1-clearance))/tooth_number+2*phi_r;
                        //circle(rf);
                        for (rot = [0:tau:360]){
                            rotate (rot){
                                polygon(
                                    concat( //[[0,0]], 
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
                    //circle(r = rm + r_hole*1.49 ); // hole in centre
                   // } // end difference()
                //}
            //} // end rotate()
        //} // end union
}
