# Gears-Library
This library started as "[Getriebe Bibliothek für OpenSCAD](https://www.thingiverse.com/thing:1604369)" by janssen86 on Thingiverse but has not been updated in some years.

k37z3r was working on [his fork](https://github.com/k37z3r/Gears-Library) of that OG library up to about a year back (from the date of my fork in May 2025) (at [Gears-Library](https://github.com/k37z3r/Gears-Library) )

## This library contains the following modules:
- rack(modul, length, height, width, pressure_angle=20, helix_angle=0)
- spur_gear(modul, tooth_number, width, bore, pressure_angle=20, helix_angle=0, optimized=true)
- herringbone_gear(modul, tooth_number, width, bore, pressure_angle=20, helix_angle=0, optimized=true)
- rack_and_pinion (modul, rack_length, gear_teeth, rack_height, gear_bore, width, pressure_angle=20, helix_angle=0, together_built=true, optimized=true)
- ring_gear(modul, tooth_number, width, rim_width, pressure_angle=20, helix_angle=0)
- herringbone_ring_gear(modul, tooth_number, width, rim_width, pressure_angle=20, helix_angle=0)
- planetary_gear(modul, sun_teeth, planet_teeth, number_planets, width, rim_width, bore, pressure_angle=20, helix_angle=0, together_built=true, optimized=true)
- bevel_gear(modul, tooth_number,  partial_cone_angle, tooth_width, bore, pressure_angle=20, helix_angle=0)
- bevel_herringbone_gear(modul, tooth_number, partial_cone_angle, tooth_width, bore, pressure_angle=20, helix_angle=0)
- bevel_gear_pair(modul, gear_teeth, pinion_teeth, axis_angle=90, tooth_width, bore, pressure_angle = 20, helix_angle=0, together_built=true)
- bevel_herringbone_gear_pair(modul, gear_teeth, pinion_teeth, axis_angle=90, tooth_width, bore, pressure_angle = 20, helix_angle=0, together_built=true)
- worm(modul, thread_starts, length, bore, pressure_angle=20, lead_angle=10, together_built=true)
- worm_gear(modul, tooth_number, thread_starts, width, length, worm_bore, gear_bore, pressure_angle=20, lead_angle=0, optimized=true, together_built=true)
## Constants and Utility Functions 
Name | value | description
--- | --- | ---
pi | 3.14159 | ratio between diameter and circumerence of a circle
rad | 57.29578 | degrees in a radian for conversions
clearance | 0.2 | arbitrary value for space to leave between mating gears
### Functions
#### rad_to_deg( radians )
convert an Angle in Radians to Degrees using formula:\
(Angle in Radians) × 180°/π = Angle in Degrees\
where 1 Radian = 180/π Degrees = 57.296 Degrees\
was called grad(angle).
#### deg_to_rad( degrees )
convert an Angle in Degrees to Radians using formula:

>Angle in Degrees × π/180° = Angle in Radians\
 rho x π/180° = / 180°/π\
 QED degrees/57.29578 --> radians

was called radian( angle )
#### polar_to_cartesian(\[radius,angle\])
Convert a 2 dimensional position in polar coordinates into cartesian coordinates.
* The input vector must have form \[radius,angle\] were the angles are in degrees.
* It returns a vector of form \[X,Y\]
#### ev(r,rho) 
Adjust polar coords given by r (radius?) and rho to by a rotation ? or a translation ? 
>return a vector \[x,y\] ?
>where x will be radius/cosine(rho)
>and y = rad_to_deg(tan(rho) - deg_to_rad(rho))
>   i.e. polar_to_cartesian( ev(rb,rho_ra) )
#### sphere_ev(theta0,theta)
The two angles, theta0 and theta, are used to calculate a mystery value.
#### sphere_to_cartesian(XYZCoords)
convert a 3 dimensional position in polar coordinates into cartesian coordinates.\
>where XYZCoords is a vector of form [radius,angle,angle] with the angles in degrees
>it returns a vector \[X,Y,Z\]
#### is_even(number)
returns 1 when the given number is even and 0 when odd providing a value that, when multiplied by the modulus of a gear, either preserves it, or zeros it in the calculation.
#### spiral(a, r0, phi);
Function to calculate a scalar value using a*phi + r0.
## Common Parameters
Gears have many forms and the parameters of their construction are the parameters for these modules.
The following diagrams show the derivation and the relationship between them.
### Spur Gears
 <img src="assets/images/442786919-c6cd1ec0-c1bc-4090-af2a-0f618d3bb596.jpg" alt="Spur Gears" style="width:300px;"> 

![spur-gear-params](https://github.com/user-attachments/assets/c6cd1ec0-c1bc-4090-af2a-0f618d3bb596)
### Gear and Pinion
![gear-and-pinion](https://github.com/user-attachments/assets/e5527e30-1829-423f-8731-dccc063d46e8)
### Bevel Gears
![bevel-gear-params](https://github.com/user-attachments/assets/671a48b1-134c-4a77-adc6-cb3c31a2dea0)
### Worm and Worm Gears
The Worm is the cylindrical spiral part of the set, and the Worm Gear is the circular wheel part.
![worm-gear-from-side](https://github.com/user-attachments/assets/a534aabe-2aa3-4d0d-856c-c71f96de39b0)

![worm-gear-parameters](https://github.com/user-attachments/assets/c2199f2b-ae19-4053-80f5-74c7244ee7cf)
### Circular Pitch ( P sub c )
This worm gear parameter is the distance measured along the pitch circle of the gear.
It can be determined by measuring the distance between any two corresponding points of adjacent teeth as shown here.

In order to calculate this parameter, the axial module (m sub a) should be used, which can be calculated as the following relation.
![normal-module-mn](https://github.com/user-attachments/assets/2f818e66-51e2-4992-af88-ba80893d15b9)

where ( m sub n ) is the Normal Module of the gear.
### "helix_angle"
The teeth of simple spur gears are parallel to the axis of the gear's rotation.
Setting the teeth at an angle offers some mechanical advantages at the expense of making the cutting of the gear a bit more complex.
This angle parameter is specified as a decimal number 

With the helix_angle at the default value of zero the gear modules generate involute teeth that are parallel to the axis of the gear's rotation, for spur gears, or perpendicular to the axis of travel for racks.
Alternatively a non-zero value specifies an angle to set the teeth causeing it to take its helical form, with the sign of the value indicating which way the teeth tilt.

### "lead_angle" ![lead-angle-gamma](https://github.com/user-attachments/assets/58fd8ed8-62ea-4db5-ad92-d5c6cc87c641)

This parameter is only used for modules that create a worm gear.

It is the angle between the tangent to the thread helix on the pitch cylinder and the plane normal to the axis of the worm.
If one complete turn of a worm is imagined to be unwound from the body of the worm,
it will form an inclined plane whose base is equal to the pitch circumference of the 
worm with altitude equal to lead of the worm, as shown below. 

The lead ( ![lead-ell](https://github.com/user-attachments/assets/a6cd086a-6191-4dae-933f-00a6dd771b0f) ) is the linear distance through which a point on a thread moves ahead in one revolution of the worm. For single start threads, lead is equal to the axial pitch. Therefore, lead can be calculated as the product of axial pitch and number of starts:
![worm-gear-lead-eqn](https://github.com/user-attachments/assets/260343dc-3707-4c2d-a5dc-d23efae5c6e8)
and we need this for the calculation of the Lead Angle:

![worm-gear-lead-angle-eqn2](https://github.com/user-attachments/assets/91acd96f-eb57-4e93-af7a-59b0654eca28)

 where ![axial-module-mn](https://github.com/user-attachments/assets/838886c0-c29e-4be5-90cb-077d4ed830f7)
 is the Axial Module, and ![pitch-diameter](https://github.com/user-attachments/assets/3143ff4c-4bc3-42de-8c87-8994d7cffb33)
is Pitch Diameter of the worm.

The lead angle is an important factor in determining the efficiency of a worm and worm gear set. Therefore, the efficiency increase as the lead angle increases.
### "modul"
The modulus of a gear is a dimensionless number that defines a great deal of its shape.
This table gives the values allowed by the DIN 780 standard.
a | b | c | d | e | f
--- | --- | --- | --- | --- | ---
0.05 | 0.06 | 0.08 | 0.10 | 0.12 | 0.16
0.20 | 0.25 | 0.3 | 0.4 | 0.5 | 0.6
0.7 | 0.8 | 0.9 | 1 | 1.25 | 1.5
2 | 2.5 | 3 | 4 | 5 | 6
8 | 10 | 12 | 16 | 20 | 25
32 | 40 | 50 | 60
### "optimized"
not sure what this means yet
### pitch diameter (D)
The relation of this pattern with the Normal Module (mn), the number of teeth (z)m and Lead Angle (γ) is given by
![pitch-diameter-eqn](https://github.com/user-attachments/assets/90ffd9f3-2552-4f4c-be38-9929e525a567)
### "pressure_angle"
This parameter defaults to 20 degrees and represents the angle where the gear faces meet.
It is the major factor in how force is transmitted from the driving to the driven gear.
### "thread_starts"
A worm gear, or any other threaded item, may have more than one spiral, or screw thread.
Each additional thread increases the pressure that transfers force at the mating faces of the gears.

This image shows thread starts as seen from the end of the worm gear.

![worm-gear-3-thread-starts](https://github.com/user-attachments/assets/5abf4ee9-78cc-40fd-b1f8-619058067a88)
### "together_built"
Only modules that create a set of gears have this parameter which, when true, creates the gear shapes meshed together.
### "tooth_number"
The number of teeth that the gear will be created with. For modules that create sets of gears each one will have an individual "<part>_teeth" parameter.
# The Gear Modules
## Spur Gear (with Helix option)
spur_gear(modul, tooth_number, width, bore, pressure_angle = 20, helix_angle = 0, optimized = true)

With helix_angle at its default value of zero this module creates a simple spur gear, otherwise a helical gear is created, like this one:
![Stirnrad2](https://github.com/k37z3r/Gears-Library/assets/105192630/603d61a0-9855-46fd-8060-d0576b7ad606)
## Rack (with Helix option)
rack(modul, length, height, width, pressure_angle=20, helix_angle=0)

With helix_angle at its default value of zero this module creates a simple spur gear, otherwise a helical gear is created, like this one:
![Zahnstange](https://github.com/k37z3r/Gears-Library/assets/105192630/5289196e-bc8d-4c8f-b805-0c4448d5542a)
## Rack and Pinion (with Helix option)
rack_and_pinion (modul, rack_length, gear_teeth, rack_height, gear_bore, width, pressure_angle=20, helix_angle=0, together_built=true, optimized=true)

This module uses the rack() and spur_gear() modules to make the desired set of gears. 
![Zahnstange_und_ritzel](https://github.com/k37z3r/Gears-Library/assets/105192630/d2899f6c-59c1-44bc-9a70-1c09489d1202)
## Worm
worm(modul, thread_starts, length, bore, pressure_angle=20, lead_angle=10, together_built=true)

This module makes the cylindrical spiral gear part of a set of worm gears.

![Schnecke1](https://github.com/k37z3r/Gears-Library/assets/105192630/d0593e85-1768-4365-b4ea-43e8637fd881)
## Worm Gear Set
worm_gear(modul, tooth_number, thread_starts, width, length, worm_bore, gear_bore, pressure_angle=20, lead_angle=0, optimized=true, together_built=true)

Makes the Worm and the Worm gear as a set.
![Schneckenradsatz](https://github.com/k37z3r/Gears-Library/assets/105192630/2dd9158b-f78d-4718-961c-1aa869be52bb)
## Planetary Gear Set
planetary_gear(modul, sun_teeth, planet_teeth, number_planets, width, rim_width, bore, pressure_angle=20, helix_angle=0, together_built=true, optimized=true)

The set includes the innermost sun, a number of "planets" greater than one, and the outer gear ring made using the herringbone_gear() and the herringbone_ring_gear() modules respectively.

The reason for using the herringbone modules is their helix_angle parameter.
Set to the default of zero the gears made will be simple spur gears.
For non-zero values it forms double helix gears, a deviation from the usual effect of this parameter simply tilting the gears teeth.
In planetary gears the self-centering effect of the double helix is nessessary to keep the gears aligned as they spin, thus the use of the herringbone modules.
![Planetengetriebe](https://github.com/k37z3r/Gears-Library/assets/105192630/a63f7e01-f9c8-4c52-89cd-5655b7ee908f) 
## Double Helical (Herringbone) Gear
herringbone_gear(modul, tooth_number, width, bore, pressure_angle=20, helix_angle=0, optimized=true)

![Pfeilrad](https://github.com/k37z3r/Gears-Library/assets/105192630/63443104-a93a-4a46-a624-67fd32729ed0)
## Double Helical Pinion and Crown Set
bevel_herringbone_gear_pair(modul, gear_teeth, pinion_teeth, axis_angle=90, tooth_width, bore, pressure_angle = 20, helix_angle=0, together_built=true)

A crown and pinion set require different calculations for the meshing of gears that have their axes of rotation at an angle, namely the axis_angle parameter. 
![Pfeil-Kegelradpaar](https://github.com/k37z3r/Gears-Library/assets/105192630/006997a4-08b1-4c8d-b223-caae3d562d95)
## Double Helical Bevel Gear
bevel_herringbone_gear(modul, tooth_number, partial_cone_angle, tooth_width, bore, pressure_angle=20, helix_angle=0)

Uses two instances of bevel_gear() to make a beveled, double helical gear.
![Pfeil-Kegelrad](https://github.com/k37z3r/Gears-Library/assets/105192630/2b7769a4-9ecc-4ec3-ab70-211d7a23e6c5)
## Double Helical Inner Gear
herringbone_ring_gear(modul, tooth_number, width, rim_width, pressure_angle=20, helix_angle=0)

![Pfeil-Hohlrad](https://github.com/k37z3r/Gears-Library/assets/105192630/795a82a0-5c33-4f9d-9287-27d078e89e62)
## Helical Pinion and Crown Set

![Kegelradpaar](https://github.com/k37z3r/Gears-Library/assets/105192630/0523e401-4d87-46f5-a7ab-651168fcd424)
## Helical Bevel Gear
bevel_gear(modul, tooth_number,  partial_cone_angle, tooth_width, bore, pressure_angle=20, helix_angle=0)

![Kegelrad](https://github.com/k37z3r/Gears-Library/assets/105192630/852e69f1-67ad-460d-89c5-ba79ff444150)
## Helical Inner Gear Wheel

![Hohlrad](https://github.com/k37z3r/Gears-Library/assets/105192630/fc1045d3-34b2-42a3-9ba9-9f3667f92d20)

## Spiral Bevel Gear
spiral_bevel_gear(modul, tooth_number, partial_cone_angle, tooth_width, bore, pressure_angle = 20, helix_angle=30)

Use 16 overlapping, bevel gear intances to make a spiral gear. The helix_angle parameter is ignored.
![spiral-bevel-gear](https://github.com/user-attachments/assets/e421b49c-f6d7-4137-9de4-71113819a878)
