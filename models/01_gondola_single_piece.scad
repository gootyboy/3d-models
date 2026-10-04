// ====================================================================
// UNIFIED 1-PIECE GONDOLA (Exact Original Design Fused as One Piece)
// 
// Cabin Body + Alpine Roof + C-Hanger Arm merged into 1 continuous solid.
// - Matches the exact look, proportions, and window architecture of the original design.
// - 45° self-supporting gusset under the top hanger bridge for clean printing.
// - 45° chamfered roof eaves for clean bridging over the cabin walls.
// ====================================================================

use <gondola_cabin.scad>;

$fn = 50;

// Dimensions matching gondola_cabin.scad
cabin_w       = 48.0;  // Width
cabin_l       = 64.0;  // Length
cabin_h       = 50.0;  // Body height
wall_th       = 2.4;
corner_r      = 6.0;
roof_h        = 14.0;
roof_lip      = 3.5;
hanger_height = 65.0;
hanger_offset = 26.0;
hanger_th     = 4.5;
pivot_pin_d   = 3.4;

module rounded_box(l, w, h, r) {
    hull() {
        for (x = [-l/2 + r, l/2 - r]) {
            for (y = [-w/2 + r, w/2 - r]) {
                translate([x, y, 0])
                    cylinder(r = r, h = h);
            }
        }
    }
}

// Single-piece unified gondola
module gondola_single_piece_exact() {
    union() {
        // 1. Exact Original Cabin Body
        cabin_body();
        
        // 2. Exact Original Alpine Roof (Fused at top of cabin)
        translate([0, 0, cabin_h]) {
            // 45° support chamfer under the roof eaves so it prints cleanly without sagging
            hull() {
                translate([0, 0, -0.1])
                    rounded_box(cabin_l, cabin_w, 0.2, corner_r);
                translate([0, 0, 2.5])
                    rounded_box(cabin_l + roof_lip * 2, cabin_w + roof_lip * 2, 0.5, corner_r + 1);
            }
            cabin_roof();
        }
        
        // 3. Exact Original Hanger Arm (Standing in its functional upright position)
        translate([0, 0, cabin_h + 14]) {
            hanger_arm();
            
            // 45° Printable Gusset under the top horizontal span (enables support-free printing)
            color("snow")
            translate([0, 6.0, 0])
                rotate([90, 0, 0])
                    linear_extrude(height = hanger_th, center = true)
                        polygon([
                            [hanger_offset - 4, hanger_height - 4],
                            [hanger_offset - 4, hanger_height - 18],
                            [2, hanger_height - 4]
                        ]);
        }
    }
}

// Render single-piece gondola centered at Z = 0
gondola_single_piece_exact();

