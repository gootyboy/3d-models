
$fn = 20;

module horse_and_rider(stride = 0, turn_head = 0) {
    color([0.45, 0.28, 0.16]) {
        // --- HORSE ---
        // 4 Stout legs anchored into deck (Z = -0.2 into roadbed to Z = 7.5)
        // Back Left Leg
        hull() {
            translate([-5.5, -1.8, 7.0]) sphere(r = 1.3);
            translate([-5.5 + stride * 0.8, -1.6, -0.2]) cylinder(r1 = 1.1, r2 = 0.9, h = 3.0);
        }
        // Back Right Leg
        hull() {
            translate([-5.5, 1.8, 7.0]) sphere(r = 1.3);
            translate([-5.5 - stride * 0.8, 1.6, -0.2]) cylinder(r1 = 1.1, r2 = 0.9, h = 3.0);
        }
        // Front Left Leg
        hull() {
            translate([4.5, -1.7, 7.0]) sphere(r = 1.2);
            translate([4.5 - stride * 0.8, -1.5, -0.2]) cylinder(r1 = 1.0, r2 = 0.85, h = 3.0);
        }
        // Front Right Leg
        hull() {
            translate([4.5, 1.7, 7.0]) sphere(r = 1.2);
            translate([4.5 + stride * 0.8, 1.5, -0.2]) cylinder(r1 = 1.0, r2 = 0.85, h = 3.0);
        }

        // Horse Barrel / Torso
        hull() {
            translate([-5.0, 0, 7.5]) sphere(r = 2.8);
            translate([3.5, 0, 8.0]) sphere(r = 2.6);
        }

        // Tail (sloping down to rear hooves, self-supporting 60 deg)
        hull() {
            translate([-7.2, 0, 8.0]) sphere(r = 1.0);
            translate([-8.5, 0, 3.5]) sphere(r = 0.6);
        }

        // Neck (sloping up 50 deg from vertical, supportless)
        rotate([0, 0, turn_head]) {
            hull() {
                translate([3.0, 0, 8.2]) sphere(r = 2.4);
                translate([6.8, 0, 12.8]) sphere(r = 1.6);
            }
            // Horse Head & Muzzle
            hull() {
                translate([6.8, 0, 12.8]) sphere(r = 1.6);
                translate([9.5, 0, 11.2]) sphere(r = 1.0);
            }
            // Ears
            for (side = [-1, 1]) {
                translate([6.2, side * 0.8, 14.0])
                    cylinder(r1 = 0.5, r2 = 0.1, h = 1.2);
            }
            // Mane ridge
            hull() {
                translate([3.2, 0, 10.0]) sphere(r = 0.6);
                translate([6.0, 0, 13.8]) sphere(r = 0.5);
            }
        }
    }

    // --- RIDER ---
    // Saddle
    color([0.25, 0.20, 0.18]) {
        translate([-0.5, 0, 9.8])
            scale([1.4, 1.1, 0.6]) sphere(r = 2.2);
    }

    // Rider Legs (straddling sides)
    color([0.20, 0.25, 0.40]) {
        for (side = [-1, 1]) {
            hull() {
                translate([-0.5, side * 1.6, 10.2]) sphere(r = 1.1);
                translate([0.5, side * 2.3, 7.5]) sphere(r = 0.9);
                translate([1.2, side * 2.1, 5.8]) sphere(r = 0.7);
            }
        }
    }

    // Rider Torso, Arms & Reins
    color([0.65, 0.25, 0.20]) {
        hull() {
            translate([-0.5, 0, 10.5]) sphere(r = 1.6);
            translate([-0.2, 0, 14.5]) sphere(r = 1.4);
        }
        // Arms holding reins connecting to horse neck (continuous loop)
        for (side = [-1, 1]) {
            hull() {
                translate([-0.2, side * 1.5, 14.0]) sphere(r = 0.7);
                translate([2.5, side * 1.0, 12.0]) sphere(r = 0.6);
                translate([4.5, side * 0.5, 10.8]) sphere(r = 0.5);
            }
        }
    }

    // Rider Head & Hat
    color([0.80, 0.68, 0.55]) {
        translate([-0.2, 0, 16.2])
            sphere(r = 1.2);
    }
    // Wide Brimmed Hat / Helmet
    color([0.30, 0.25, 0.22]) {
        translate([-0.2, 0, 17.0])
            cylinder(r1 = 2.4, r2 = 2.2, h = 0.5);
        translate([-0.2, 0, 17.3])
            cylinder(r1 = 1.4, r2 = 1.1, h = 1.4);
    }
}

horse_and_rider(1, 5);
