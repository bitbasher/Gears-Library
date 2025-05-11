# Gears-Library
This library started as "[Getriebe Bibliothek für OpenSCAD](https://www.thingiverse.com/thing:1604369)" by janssen86 on Thingiverse but has not been updated in some years.

k37z3r was working on his fork of that OG library up to about a year back (from the date of my fork) (at [Gears-Library](https://github.com/k37z3r/Gears-Library) )

This library contains the following modules:
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
## Common Parameters

### "helix_angle"
The teeth of simple pinion gears are parallel to the axis of the gear's rotation.
Setting the teeth at an angle offers some mechanical advantages at the expense of making the cutting of the gear a bit more complex.
This angle parameter is specified as a decimal number and when negative indicates the tilt of the teeth is left-high down to lower-right looking at edge of the gear.
### "lead_angle"
Only a parameter for modules that create a worm gear.
### "modul"
The modulus of a gear is a dimensionless number that defines a great deal of its shape.
This library follows the DIN 780 standard for gear modulus and the following are the allowed values.
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
### "pressure_angle"
This parameter defaults to 20 degrees and represents the angle where the gear faces meet.
It is the major factor in how force is transmitted from the driving to the driven gear.
### "thread_starts"
A worm gear, or any other threaded item, may have more than one spiral.
Each additional thread increases the pressure that transfers force at the mating faces of the gears.
### "together_built"
Only modules that create a set of gears have this parameter which, when true, creates the gear shapes meshed together.
### "tooth_number"
The number of teeth that the gear will be created with. For modules that create sets of gears each one will have an individual "<part>_teeth" parameter.
## Rack and Pinion
rack_and_pinion (modul, rack_length, gear_teeth, rack_height, gear_bore, width, pressure_angle=20, helix_angle=0, together_built=true, optimized=true)

![Zahnstange_und_ritzel](https://github.com/k37z3r/Gears-Library/assets/105192630/d2899f6c-59c1-44bc-9a70-1c09489d1202)
## Helical Rack
rack(modul, length, height, width, pressure_angle=20, helix_angle=0)

![Zahnstange](https://github.com/k37z3r/Gears-Library/assets/105192630/5289196e-bc8d-4c8f-b805-0c4448d5542a)
## Helical Gear

![Stirnrad2](https://github.com/k37z3r/Gears-Library/assets/105192630/603d61a0-9855-46fd-8060-d0576b7ad606)
## Worm Gear
 worm(modul, thread_starts, length, bore, pressure_angle=20, lead_angle=10, together_built=true)
 
 worm_gear(modul, tooth_number, thread_starts, width, length, worm_bore, gear_bore, pressure_angle=20, lead_angle=0, optimized=true, together_built=true)

![Schnecke1](https://github.com/k37z3r/Gears-Library/assets/105192630/d0593e85-1768-4365-b4ea-43e8637fd881)
## Planetary Gear
planetary_gear(modul, sun_teeth, planet_teeth, number_planets, width, rim_width, bore, pressure_angle=20, helix_angle=0, together_built=true, optimized=true)

![Planetengetriebe](https://github.com/k37z3r/Gears-Library/assets/105192630/a63f7e01-f9c8-4c52-89cd-5655b7ee908f)
## Double Helical (Herringbone) Gear
herringbone_gear(modul, tooth_number, width, bore, pressure_angle=20, helix_angle=0, optimized=true)

![Pfeilrad](https://github.com/k37z3r/Gears-Library/assets/105192630/63443104-a93a-4a46-a624-67fd32729ed0)
## Double Helical Pinion and Crown Set
bevel_herringbone_gear_pair(modul, gear_teeth, pinion_teeth, axis_angle=90, tooth_width, bore, pressure_angle = 20, helix_angle=0, together_built=true)

![Pfeil-Kegelradpaar](https://github.com/k37z3r/Gears-Library/assets/105192630/006997a4-08b1-4c8d-b223-caae3d562d95)
## Double Helical Bevel Gear
bevel_herringbone_gear(modul, tooth_number, partial_cone_angle, tooth_width, bore, pressure_angle=20, helix_angle=0)

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
## Helical Worm Gear Set

![Schneckenradsatz](https://github.com/k37z3r/Gears-Library/assets/105192630/2dd9158b-f78d-4718-961c-1aa869be52bb)
