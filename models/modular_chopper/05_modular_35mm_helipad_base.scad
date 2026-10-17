// ====================================================================
// Modular Helipad Base - 5.0 cm (50mm) Square Interlocking Tile
// Dimensions: 50.0 mm x 50.0 mm x 3.8 mm
// Standard tile footprint designed for 5.0 cm Modular Chopper.
//
// Features:
// - Standard 50mm (5.0 cm) modular grid footprint
// - Male / Female dovetail connectors on orthogonal sides (0.25mm clearance)
// - Precision skid landing alignment slots (20.0mm track for 5cm chopper skids)
// - Helipad 'H' and concentric marking rings
// - 45-degree chamfered perimeter to prevent corner warping
// ====================================================================

$fn = 48;

tile_size = 50.0;
base_h    = 2.8;
relief_h  = 1.0;
total_h   = base_h + relief_h;
skid_span = 20.0; // Distance between skid centers (matches 5cm chopper)

// Dovetail parameters
dt_w_base = 7.0;
dt_w_tip  = 10.5;
dt_depth  = 4.5;
dt_tol    = 0.25; // Radial tolerance for snap fit

module dovetail_male() {
    linear_extrude(height = base_h)
        polygon([
            [-dt_w_base/2, 0],
            [ dt_w_base/2, 0],
            [ dt_w_tip/2,  dt_depth],
            [-dt_w_tip/2,  dt_depth]
        ]);
}

module dovetail_female() {
    w_b = dt_w_base/2 + dt_tol;
    w_t = dt_w_tip/2 + dt_tol;
    d   = dt_depth + dt_tol;
    translate([0, 0, -0.1])
        linear_extrude(height = base_h + 0.2)
            polygon([
                [-w_b, -0.2],
                [ w_b, -0.2],
                [ w_t,  d],
                [-w_t,  d]
            ]);
}

module helipad_markings() {
    // Concentric outer ring
    difference() {
        cylinder(r = 18.5, h = relief_h, center = false);
        translate([0, 0, -0.1])
            cylinder(r = 16.5, h = relief_h + 0.2, center = false);
    }

    // Inner dashed accent ring
    difference() {
        cylinder(r = 12.0, h = relief_h * 0.7, center = false);
        translate([0, 0, -0.1])
            cylinder(r = 10.5, h = relief_h + 0.2, center = false);
    }

    // Classic Helipad 'H' symbol
    h_h = 14.0;
    h_w = 10.5;
    h_t = 2.2;
    // Left vertical bar
    translate([-h_w/2 + h_t/2, 0, relief_h/2])
        cube([h_t, h_h, relief_h], center = true);
    // Right vertical bar
    translate([h_w/2 - h_t/2, 0, relief_h/2])
        cube([h_t, h_h, relief_h], center = true);
    // Center horizontal crossbar
    translate([0, 0, relief_h/2])
        cube([h_w, h_t, relief_h], center = true);

    // Corner alignment chevrons
    for (a = [45, 135, 225, 315]) {
        rotate([0, 0, a]) translate([20.0, 0, relief_h/2])
            cube([2.8, 1.6, relief_h], center = true);
    }
}

module helipad_tile() {
    difference() {
        union() {
            // Main chamfered tile body
            hull() {
                // Flat bottom contact at Z = 0 (48mm x 48mm with 1mm corner chamfers)
                translate([0, 0, 0])
                    cube([tile_size - 1.4, tile_size - 1.4, 0.1], center = true);
                // Beveled top deck at Z = base_h (50mm x 50mm)
                translate([0, 0, base_h])
                    cube([tile_size, tile_size, 0.1], center = true);
            }

            // Male dovetails (+X and +Y)
            translate([tile_size/2, 0, 0])
                rotate([0, 0, -90]) dovetail_male();
            translate([0, tile_size/2, 0])
                dovetail_male();

            // Raised markings
            translate([0, 0, base_h])
                helipad_markings();
        }

        // Female dovetails (-X and -Y)
        translate([-tile_size/2, 0, 0])
            rotate([0, 0, 90]) dovetail_female();
        translate([0, -tile_size/2, 0])
            rotate([0, 0, 180]) dovetail_female();

        // Skid landing guide grooves (aligned along X axis, spaced at skid_span)
        for (sy = [-1, 1]) {
            translate([0, sy * skid_span/2, base_h + relief_h - 0.5])
                cube([36.0, 3.0, 1.2], center = true);
        }

        // Skid center detent dimples
        for (sy = [-1, 1], sx = [-8.0, 8.0]) {
            translate([sx, sy * skid_span/2, base_h + relief_h - 0.9])
                cylinder(r = 1.8, h = 1.2, center = true);
        }
    }
}

// Standalone render grounded at Z = 0
translate([0, 0, 0.05])
    helipad_tile();
