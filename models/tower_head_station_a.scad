// ====================================================================
// Tower Head Station A: Drive-Ready Station (100% 3D-Printable)
// 
// Dual-Role Design:
// - Phase 1: Mounts a passive sheave wheel on an M5 bolt axle.
// - Phase 2: Directly bolts to a NEMA 17 stepper motor (4x M3 holes on 31mm centers)
//   without needing any modifications or reprints!
// Bottom has a 20mm socket to mount onto a wooden dowel, PVC pipe, or printed truss.
// ====================================================================

use <tower_sheave.scad>;

$fn = 40;

// Dimensions
bracket_w        = 46.0; // Width of mounting face
bracket_h        = 52.0; // Height of mounting plate
plate_th         = 6.0;  // Thickness of plate
nema17_hole_dist = 31.0; // NEMA 17 standard mounting hole spacing
nema17_pilot_d   = 23.0; // NEMA 17 center collar clearance
m3_hole_d        = 3.4;  // M3 bolt clearance
socket_inner_d   = 20.4; // Fits 20mm (or 3/4 inch) dowel/pipe
socket_wall      = 4.0;
socket_depth     = 25.0;

module tower_head_a() {
    difference() {
        union() {
            // Main motor/axle vertical mounting faceplate
            translate([0, 0, bracket_h / 2])
                cube([bracket_w, plate_th, bracket_h], center = true);

            // Overhead cable guide horn
            translate([0, 10, bracket_h - 4])
                cube([bracket_w, 20 + plate_th, 8], center = true);

            // Lower mast mounting socket
            translate([0, 0, -socket_depth / 2])
                cylinder(d = socket_inner_d + (socket_wall * 2), h = socket_depth, center = true);
                
            // Triangular gussets for structural rigidity
            translate([0, socket_inner_d / 2, 0])
                rotate([0, 90, 0])
                    linear_extrude(height = 12, center = true)
                        polygon([[0, 0], [25, 0], [0, 20]]);
        }

        // Center pilot hole (for motor collar or Phase 1 M5 axle bolt)
        translate([0, 0, bracket_h * 0.55])
            rotate([90, 0, 0])
                cylinder(d = nema17_pilot_d, h = plate_th + 4, center = true);

        // 4x NEMA 17 mounting holes (31mm square pattern)
        for (dx = [-nema17_hole_dist / 2, nema17_hole_dist / 2]) {
            for (dz = [-nema17_hole_dist / 2, nema17_hole_dist / 2]) {
                translate([dx, 0, (bracket_h * 0.55) + dz])
                    rotate([90, 0, 0])
                        cylinder(d = m3_hole_d, h = plate_th + 4, center = true);
            }
        }

        // Cable path slot through the overhead horn
        translate([0, 10, bracket_h - 4])
            cube([20, 25, 12], center = true);

        // Mast socket cavity (bottom) with 45-degree self-aligning lead-in chamfer
        translate([0, 0, -socket_depth / 2 - 1])
            cylinder(d = socket_inner_d, h = socket_depth + 2, center = true);
        translate([0, 0, -socket_depth])
            cylinder(d1 = socket_inner_d + 3.0, d2 = socket_inner_d, h = 3.0);

        // Mast cross-pin clamp hole
        translate([0, 0, -socket_depth / 2])
            rotate([0, 90, 0])
                cylinder(d = 4.2, h = socket_inner_d + 12, center = true);

        // Embossed Station Identification on face: "A - DRIVE"
        translate([-bracket_w / 2 + 3, -plate_th / 2 - 0.1, 4])
            rotate([90, 0, 0])
                linear_extrude(height = 0.8)
                    text("A - DRIVE", size = 4.2, font = "Liberation Sans:style=Bold");
    }
}

// Visual preview with sheave wheel attached
module preview_station_a() {
    tower_head_a();
    #translate([0, plate_th / 2 + 8, bracket_h * 0.55])
        rotate([90, 0, 0])
            tower_sheave();
}

// ====================================================================
// Selection
// ====================================================================
// "print"      -> Upright resting flat on socket rim at Z = 0
// "print_flat" -> Laid flat on its rear motor plate at Z = 0 (ZERO supports!)
// "preview"    -> Upright with sheave wheel attached
mode = "print_flat";

if (mode == "print") {
    translate([0, 0, socket_depth])
        tower_head_a();
} else if (mode == "print_flat") {
    // Laid flat on rear face of motor plate at Z = 0
    translate([0, plate_th / 2, 0])
        rotate([-90, 0, 0])
            tower_head_a();
} else if (mode == "preview") {
    preview_station_a();
}
