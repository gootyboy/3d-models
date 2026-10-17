// ====================================================================
// Modular Rotor Axle Pin & Retaining Cap (5.0 cm Standard)
// Precision bearing pin for low-friction rotation of the main rotor.
//
// Engineering Specifications:
// - Cap Head: 7.6mm diameter x 1.6mm height with chamfered top
// - Bearing Spindle: 3.6mm diameter x 3.6mm length (matches 4.2mm rotor bore)
//   -> 0.6mm diametral clearance ensures free, low-friction spin
//   -> 0.4mm axial play prevents vertical pinching
// - Anchor Stem: 3.2mm diameter x 6.0mm length with retention barb (matches 3.5mm bore)
// - Central compliance slit (0.8mm) enables spring-loaded snap retention
// - 100% supportless vertical print grounded on flat cap head (Z = 0)
// ====================================================================

$fn = 48;

cap_d     = 7.6;
cap_h     = 1.6;
journal_d = 3.6;
journal_h = 3.6;
stem_d    = 3.2;
stem_h    = 6.0;
barb_d    = 3.52; // Slight snap-retaining barb

module rotor_axle_pin() {
    difference() {
        union() {
            // 1. Cap Head (grounded at Z = 0)
            cylinder(d = cap_d, h = cap_h, center = false);
            // Cap chamfer
            translate([0, 0, cap_h - 0.4])
                cylinder(d1 = cap_d, d2 = cap_d - 0.8, h = 0.4, center = false);

            // 2. Bearing Spindle Journal (smooth rotation surface)
            translate([0, 0, cap_h])
                cylinder(d = journal_d, h = journal_h, center = false);

            // 3. Anchor Stem
            translate([0, 0, cap_h + journal_h]) {
                // Shaft
                cylinder(d = stem_d, h = stem_h - 1.0, center = false);

                // Retention barb ring
                translate([0, 0, 2.4])
                    cylinder(d1 = stem_d, d2 = barb_d, h = 0.8, center = false);
                translate([0, 0, 3.2])
                    cylinder(d1 = barb_d, d2 = stem_d, h = 0.6, center = false);

                // Lead-in chamfer at tip for easy insertion
                translate([0, 0, stem_h - 1.0])
                    cylinder(d1 = stem_d, d2 = stem_d - 0.8, h = 1.0, center = false);
            }
        }

        // Longitudinal compliance slot in stem (spring-loaded snap action)
        translate([0, 0, cap_h + journal_h + stem_h/2])
            cube([0.8, stem_d + 1.2, stem_h + 0.4], center = true);
    }
}

// Standalone print orientation: Head flat on bed at Z = 0
rotor_axle_pin();
