/*
    gears testing
 */

include <gears.scad>

/*
echo( g=grad(pressure_angle) ); // 1145.92
echo( r=radian(pressure_angle) ); // 0.349066

polvect = [3,4];
echo( pc=polar_to_cartesian(polvect) ); //  [2.99269, 0.209269]

// ev(r,rho) 
echo( ev=ev( 12,30) ); //  [13.8564, 3.07973]

// sphere_ev(theta0,theta)
echo( sev=sphere_ev(45,20) ); // nan

sph = [ 10, 10, 10]; 
echo( sc=sphere_to_cartesian(sph) ); //  [1.7101, 0.301537, 9.84808]

echo( even = is_even(0) ); // 1
echo( even = is_even(1) ); // 0
echo( even = is_even(2) ); // 1

// ggt() is not used anywhere in the library
//echo( ggt(0,0) );

// a, r0, phi
echo( spiral( 4, 2, 20) ); // 82 - whatever that means
 */

/// Constant values for testing
modulus = 2; 
tooth_number = 20;
tooth_width = 5;
gear_teeth = 20;
width = 20; 
widebore = 40;
midbore = 30;
smalbore = 5;
pressure_angle = 20;
helical = 20;


/*
    module rack( modul, length, height, width, pressure_angle = 20, helix_angle = 0 )
 */
color("red")
   translate([0,0,0])
      rack( modulus, 40, 20, width );
color("blue")
   translate([0,50,0])
      rack( modulus, 40, 20, width, helix_angle=helical );
color("green")
   translate([0,100,0])
      rack( modulus, 40, 20, width, helix_angle=-helical );

/*
    module herringbone_rack( modul, length, height, width, pressure_angle = 20, helix_angle = 0 )
 */
color("red")
   translate([-50,0,0])
      herringbone_rack( modulus, 40, 20, width );
color("blue")
   translate([-50,50,0])
      herringbone_rack( modulus, 40, 20, width, helix_angle=helical );
color("green")
   translate([-50,100,0])
      herringbone_rack( modulus, 40, 20, width, helix_angle=-helical );


/*
    module spur_gear(modul, tooth_number, width, bore, pressure_angle = 20, helix_angle = 0, optimized = true)
*/
color("red")
   translate([150,0,0])
      spur_gear( modulus, tooth_number, width, midbore );
color("blue")
   translate([150,50,0])
      spur_gear( modulus, tooth_number, width, midbore, helix_angle=helical );
color("green")
   translate([150,100,0])
      spur_gear( modulus, tooth_number, width, midbore, helix_angle=-helical );


 /*
    module herringbone_gear(modul, tooth_number, width, bore, pressure_angle = 20, helix_angle=0, optimized=true)

    when helix_angle at default value of zero this is the same as spur_gear()
 */
color("red")
   translate([100,0,0])
      herringbone_gear( modulus, tooth_number, width, midbore ); // gives only straight teeth
color("blue")
   translate([100,50,0])
      herringbone_gear( modulus, tooth_number, width, midbore, helix_angle=helical );
color("green")
   translate([100,100,0])
      herringbone_gear( modulus, tooth_number, width, midbore, helix_angle=-helical );


/**
rack_and_pinion(modul, rack_length, gear_teeth, rack_height, gear_bore, width, pressure_angle=20, 
   helix_angle=0, together_built=true, optimized=true)
 */
color("blue")
   translate([180,-80,0])
      rack_and_pinion( modulus, 50, gear_teeth, 15, smalbore, width, helix_angle=10 );
color("green")
   translate([180,-200,0])
      rack_and_pinion( modulus, 50, gear_teeth, 15, smalbore, width, helix_angle=-10 );

/**
    module herringbone_rack_and_pinion_set(modul, rack_length, gear_teeth, rack_height, gear_bore, width,
        pressure_angle=20, helix_angle=20, together_built=true, optimized=true
        )
 */
color("red")
   translate([250,-80,0])
      herringbone_rack_and_pinion_set( modulus, 50, gear_teeth, 15, smalbore, width );
color("green")
   translate([250,-200,0])
      herringbone_rack_and_pinion_set( modulus, 50, gear_teeth, 15, smalbore, width, helix_angle=-20 );




/**
   ring_gear (modulus, tooth_number, width=5, rim_width=3, pressure_angle=20, helix_angle=20);
 */   
color("red")
   translate([100,-80,0])
      ring_gear (modulus, tooth_number, width, 5 );
color("blue")
   translate([100,-140,0])
      ring_gear (modulus, tooth_number, width, 5, helix_angle=helical  );
color("green")
   translate([100,-200,0])
      ring_gear (modulus, tooth_number, width, 5, helix_angle=-helical  );


/**
   herringbone_ring_gear(modulus, tooth_number, width=5, rim_width=3, pressure_angle=20, helix_angle=30);
 */
color("red")
   translate([30,-80,0])
      herringbone_ring_gear( modulus, tooth_number, width, rim_width=5, helix_angle=helical);
color("green")
   translate([30,-200,0])
      herringbone_ring_gear( modulus, tooth_number, width, rim_width=5, helix_angle=-helical);


/**
   planetary_gear(modulus.2, sun_teeth=9, planet_teeth=6, number_planets=5, width=19.5, rim_width=1, bore=7.1, pressure_angle=20, helix_angle=0, together_built=true, optimized=false);

   when helix_angle is non-zero the teeth are formed as a double helix pointing right for a positive value and left for negative
 */
color("red")
   translate([-50,-80,0])
   planetary_gear(modulus, sun_teeth=9, planet_teeth=6, number_planets=3, width, rim_width=3, bore=7.1 );
color("green")
   translate([-50,-200,0])
      planetary_gear(modulus, sun_teeth=9, planet_teeth=6, number_planets=3, width, rim_width=3, bore=7.1, helix_angle=helical );


/**
   bevel_gear(modulus, tooth_number, partial_cone_angle=45, tooth_width=5, bore=4, pressure_angle=20, helix_angle=20);
 */
color("red")
   translate([-100,0,0])
      bevel_gear(modulus, tooth_number, 45, tooth_width, bore=20 );
color("blue")
   translate([-100,50,0])
      bevel_gear(modulus, tooth_number, 45, tooth_width, bore=20, helix_angle=helical );



/**
   spiral_bevel_gear(modulus, tooth_number, partial_cone_angle=45, tooth_width=5, bore=4, pressure_angle=20, helix_angle=20);
 */
color("red")
   translate([-150,0,0])
      spiral_bevel_gear(modulus, tooth_number, 45, 15, bore=20 );
color("green")
   translate([-150,100,0])
      spiral_bevel_gear(modulus, tooth_number, 45, 15, bore=20, helix_angle=helical );



/**
   bevel_herringbone_gear(modulus, tooth_number, partial_cone_angle=45, tooth_width=5, bore=4, pressure_angle=20, helix_angle=30);
 */
color("red")
   translate([-200,0,0])
      bevel_herringbone_gear(modulus, tooth_number, partial_cone_angle=45, tooth_width, bore=20, helix_angle=helical);


/**
   bevel_gear_set(modul, gear_teeth, pinion_teeth, axis_angle=90, tooth_width, gear_bore, pinion_bore, pressure_angle=20, helix_angle=0, together_built=true){
 */
color("red")
   translate([-250,0,0])
      bevel_gear_set(modulus, gear_teeth, pinion_teeth=11, axis_angle=100, tooth_width, gear_bore=10, pinion_bore=7 );
color("green")
   translate([-250,100,0])
      bevel_gear_set(modulus, gear_teeth, pinion_teeth=11, axis_angle=100, tooth_width, gear_bore=10, pinion_bore=7, helix_angle=helical );


/** 
   herringbone_bevel_gear_set( modul, gear_teeth, pinion_teeth, axis_angle=90, tooth_width, gear_bore, pinion_bore, pressure_angle = 20, helix_angle=10, together_built=true)
 */
color("red")
   translate([-300,0,0])
      herringbone_bevel_gear_set( modulus, gear_teeth, pinion_teeth=11, axis_angle=100, tooth_width, smalbore, smalbore, helix_angle=helical);


/**
   worm(modulus, thread_starts=2, length=15, bore=4, pressure_angle=20, lead_angle=10, together_built=true);
 
   must specify lead_angle, and it must be 0.1  
 */
color("red")
   translate([50,0,0])
      worm( modulus, thread_starts=1, length=15, smalbore, lead_angle=5 );

color("yellow")
   translate([50,50,0])
      worm( modulus, thread_starts=2, length=15, smalbore, lead_angle=10 );

color("purple")
   translate([50,100,0])
      worm( modulus, thread_starts=1, length=15, smalbore, lead_angle=15 );



/**
   worm_gear_set(modulus, tooth_number, thread_starts=2, width=8, length=20, worm_bore=4, gear_bore=4, 
      pressure_angle=20, lead_angle=10, optimized=1, together_built=1, show_spur=true, show_worm=true );
 */
color("red")
   translate([-150,-80,0])
      worm_gear_set(modulus, tooth_number, thread_starts=1, width, length=20, worm_bore=4, gear_bore=4, lead_angle=5  );
color("green")
   translate([-150,-200,0])
      worm_gear_set(modulus, tooth_number, thread_starts=2, width, length=20, worm_bore=4, gear_bore=4, lead_angle=20  );


