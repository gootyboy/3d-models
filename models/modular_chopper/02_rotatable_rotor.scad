// ====================================================================
// Modular Rotatable Chopper Rotor (50mm / 5.0 cm Swept Diameter)
// Matches 5.0 cm Modular Chopper Standard.
//
// Engineering Specifications:
// - Swept Diameter: 50.0 mm (Radius: 25.0 mm)
// - Hub Diameter: 9.2 mm, Hub Height: 3.2 mm
// - Axle Bore: 4.2 mm through-hole (for 3.6 mm pin -> 0.6mm clearance)
// - Low-friction underside relief pocket (reduces bearing drag)
// - Aerodynamic blade profile with reinforced root cuffs
// - 100% supportless flat print at Z = 0
// - Configurable blade count (2-blade scout standard or 3-blade heavy lift)
// ====================================================================

$fn = 48;

blade_count = 2; // 2 for high-speed scout, 3 for heavy-lift

module rotor_blade(r = 25.0) {
    hull() {
        // Root cuff near hub
        translate([3.8, 0, 0])
            cylinder(r = 2.2, h = 2.0, center = false);
        // Mid span
        translate([13.0, 0, 0])
            cylinder(r = 2.0, h = 1.6, center = false);
    }
    hull() {
        // Mid span
        translate([13.0, 0, 0])
            cylinder(r = 2.0, h = 1.6, center = false);
        // Blade tip (swept taper)
        translate([r - 1.2, -0.3, 0])
            cylinder(r = 1.5, h = 1.2, center = false);
    }
    // Trailing edge airfoil taper
    hull() {
        translate([5.5, -2.6, 0])
            cube([r - 8.5, 0.6, 1.2]);
        translate([5.5, 0, 0])
            cube([r - 8.5, 1.8, 1.6]);
    }
}

module rotatable_rotor(blades = 2, bore_d = 4.2) {
    hub_r = 4.6;
    hub_h = 3.2;
    angle_step = 360 / blades;

    difference() {
        union() {
            // Central Hub
            cylinder(r = hub_r, h = hub_h, center = false);

            // Hub top bevel ring
            translate([0, 0, hub_h - 0.6])
                cylinder(r1 = hub_r, r2 = hub_r - 0.6, h = 0.6, center = false);

            // Blades
            for (i = [0 : blades - 1]) {
                rotate([0, 0, i * angle_step])
                    rotor_blade(25.0);
            }

            // Pitch control hinge details
            for (i = [0 : blades - 1]) {
                rotate([0, 0, i * angle_step])
                    translate([3.6, 2.0, 0])
                        cylinder(r = 0.8, h = 2.2, center = false);
            }
        }

        // Center axle bore for rotatable pin (clearance gap for smooth spinning)
        translate([0, 0, -0.1])
            cylinder(d = bore_d, h = hub_h + 0.2, center = false);

        // Underside low-friction bearing recess
        // Relieves inner surface so only outer rim contacts the mast collar
        translate([0, 0, -0.05])
            cylinder(d = 6.6, h = 0.6, center = false);

        // Top chamfer on bore for easy pin insertion
        translate([0, 0, hub_h - 0.5])
            cylinder(r1 = bore_d/2, r2 = bore_d/2 + 0.6, h = 0.6, center = false);
    }
}

// Default standalone render (2-blade rotor flat on print bed)
translate([0, 0, 0])
    rotatable_rotor(blades = blade_count, bore_d = 4.2);
