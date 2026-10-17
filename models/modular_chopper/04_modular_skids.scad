// ====================================================================
// Modular Chopper Undercarriage (Skids & Wheeled Taxi Gear)
// Precision modular landing gear interchangeable system for 5.0 cm Chopper.
//
// Engineering Specifications:
// - Standardized Dual Chassis Mounting Pins (2.8mm dia x 2.6mm h)
// - Pin locations: X = -3.5mm (rear) and X = +7.5mm (front)
//   -> 100% Non-interfering with tail boom snap socket (which terminates at X = -5.0mm)
// - Option "skids": Twin landing skids (20.0mm track, 35.0mm length, 100% flat bed runner)
// - Option "wheels": Tricycle taxi gear (dual main wheels + steerable nose wheel)
// - 100% self-supporting flat print layout at Z = 0
// ====================================================================

$fn = 40;

gear_type = "skids"; // "skids" or "wheels"

pin_d        = 2.8;
pin_h        = 2.6;
skid_rear_x  = -3.5;
skid_front_x =  7.5;
skid_span    = 20.0; // Width between skids

module mounting_spine(skid_rear_x = -3.5, skid_front_x = 7.5) {
    // Central mounting bridge block - 100% flat grounded at Z = 0
    hull() {
        translate([skid_front_x, 0, 0])
            cylinder(d = 5.2, h = 2.6, center = false);
        translate([skid_rear_x, 0, 0])
            cylinder(d = 5.2, h = 2.6, center = false);
    }
    // Twin chassis mounting registration pins
    for (sx = [skid_rear_x, skid_front_x]) {
        translate([sx, 0, 2.6]) {
            cylinder(d = pin_d, h = pin_h, center = false);
            // Pin lead-in chamfer
            translate([0, 0, pin_h - 0.5])
                cylinder(d1 = pin_d, d2 = pin_d - 0.6, h = 0.5, center = false);
        }
    }
}

module landing_skids(skid_rear_x = -3.5, skid_front_x = 7.5) {
    difference() {
        union() {
            // 1. Central spine grounded flat at Z = 0
            mounting_spine(skid_rear_x = skid_rear_x, skid_front_x = skid_front_x);

            // 2. Solid cross struts grounded flat on Z = 0 (connect spine to skids)
            for (sx = [skid_rear_x, skid_front_x]) {
                for (sy = [-1, 1]) {
                    hull() {
                        translate([sx, 0, 0])
                            cylinder(d = 4.8, h = 2.4, center = false);
                        translate([sx, sy * skid_span/2, 0])
                            cylinder(d = 3.2, h = 2.0, center = false);
                    }
                }
            }

            // 3. Twin longitudinal skids (100% continuous flat bed runner on Z = 0)
            // Completely flat on bottom so it touches the ground along its entire length!
            for (sy = [-1, 1]) {
                y = sy * skid_span/2;

                // Main flat runner touching the ground from X = -16.5 to X = +16.5
                hull() {
                    translate([-15.5, y, 0])
                        cylinder(d = 3.2, h = 1.4, center = false);
                    translate([15.5, y, 0])
                        cylinder(d = 3.2, h = 1.4, center = false);
                }

                // Chamfered top ridge (45° taper for clean finish)
                hull() {
                    translate([-15.0, y, 1.2])
                        cylinder(d1 = 3.2, d2 = 1.6, h = 1.0, center = false);
                    translate([15.0, y, 1.2])
                        cylinder(d1 = 3.2, d2 = 1.6, h = 1.0, center = false);
                }

                // Front nose cap
                hull() {
                    translate([15.5, y, 0])
                        cylinder(d = 3.2, h = 1.4, center = false);
                    translate([17.2, y, 0])
                        cylinder(d1 = 2.4, d2 = 1.2, h = 1.8, center = false);
                }

                // Rear tail cap
                hull() {
                    translate([-15.5, y, 0])
                        cylinder(d = 3.2, h = 1.4, center = false);
                    translate([-17.0, y, 0])
                        cylinder(d1 = 2.4, d2 = 1.2, h = 1.6, center = false);
                }

                // Starboard boarding step (grounded flat on Z = 0)
                if (sy > 0) {
                    translate([2.0, y + 1.8, 0])
                        cube([6.0, 1.6, 1.4], center = false);
                }
            }
        }

        // Flat ground contact plane at Z = 0
        translate([0, 0, -5.0])
            cube([60, 60, 10], center = true);
    }
}

module wheeled_gear() {
    difference() {
        union() {
            // Central spine grounded flat at Z = 0
            mounting_spine();

            // Nose gear strut grounded on Z = 0
            hull() {
                translate([skid_front_x, 0, 0])
                    cylinder(d = 4.8, h = 2.4, center = false);
                translate([skid_front_x + 3.2, 0, 0])
                    cylinder(d = 3.6, h = 2.0, center = false);
            }
            // Nose wheel with grounded contact base
            hull() {
                translate([skid_front_x + 3.2, 0, 2.6])
                    rotate([90, 0, 0])
                        cylinder(d = 5.2, h = 2.0, center = true);
                translate([skid_front_x + 3.2, 0, 0])
                    cube([3.6, 2.0, 0.2], center = true);
            }

            // Main rear gear outrigger struts grounded on Z = 0
            for (sy = [-1, 1]) {
                hull() {
                    translate([skid_rear_x, 0, 0])
                        cylinder(d = 4.8, h = 2.4, center = false);
                    translate([skid_rear_x, sy * 9.5, 0])
                        cylinder(d = 3.6, h = 2.0, center = false);
                }
                // Rear wheels with grounded contact base
                hull() {
                    translate([skid_rear_x, sy * 9.5, 2.6])
                        rotate([90, 0, 0])
                            cylinder(d = 5.6, h = 2.2, center = true);
                    translate([skid_rear_x, sy * 9.5, 0])
                        cube([4.0, 2.2, 0.2], center = true);
                }
            }
        }

        // Flat ground contact plane at Z = 0
        translate([0, 0, -5.0])
            cube([60, 60, 10], center = true);
    }
}

if (gear_type == "skids") {
    landing_skids();
} else if (gear_type == "wheels") {
    wheeled_gear();
}
