// ====================================================================
// Tower Base & Modular Mast (100% 3D-Printable)
// 
// Features:
// - Wide, stable holiday-styled baseplate (can be clamped, screwed, or weighted)
// - 20mm upper socket accepts:
//     Option A: Standard wooden dowel or PVC pipe (custom height)
//     Option B: Stackable 3D-printed lattice mast segments (provided below)
// ====================================================================

$fn = 40;

base_dia       = 110.0; // Wide footprint for stability against cable tension
base_th        = 8.0;   // Solid base thickness
socket_inner_d = 20.4;  // Fits 20mm dowel or lattice mast plug
socket_wall    = 4.5;
socket_h       = 32.0;

// 1. Sturdy Baseplate
module tower_base() {
    difference() {
        union() {
            // Main disc with beveled edge
            cylinder(d1 = base_dia, d2 = base_dia - 6, h = base_th);
            
            // Central socket column
            translate([0, 0, 0])
                cylinder(d = socket_inner_d + (socket_wall * 2), h = socket_h);
                
            // 4x Rigid support ribs
            for (a = [0 : 90 : 270]) {
                rotate([0, 0, a])
                    translate([socket_inner_d / 2, -socket_wall / 2, 0])
                        cube([base_dia / 2 - socket_inner_d / 2 - 8, socket_wall, socket_h * 0.7]);
            }
        }

        // Central dowel/mast socket with self-centering lead-in chamfer
        translate([0, 0, 3])
            cylinder(d = socket_inner_d, h = socket_h + 2);
        translate([0, 0, socket_h - 2])
            cylinder(d1 = socket_inner_d, d2 = socket_inner_d + 3.0, h = 3.0);

        // 4x Perimeter screw/mounting holes (optional hold-down screws/clamps)
        for (a = [45 : 90 : 315]) {
            rotate([0, 0, a])
                translate([base_dia / 2 - 10, 0, -1])
                    cylinder(d = 4.5, h = base_th + 4);
        }

        // Cross-pin clamp hole for socket
        translate([0, 0, socket_h * 0.6])
            rotate([90, 0, 0])
                cylinder(d = 4.2, h = socket_inner_d + 16, center = true);
    }
}

// 2. Optional 3D-Printable Lattice Mast Segment (Stackable)
module tower_mast_segment(height = 100) {
    difference() {
        union() {
            // Main lattice column
            cylinder(d = 20.0, h = height);
            
            // Lower plug that fits into tower_base socket
            translate([0, 0, -24])
                cylinder(d = 20.0, h = 24);
        }
        
        // Upper receiving socket for stacking another segment or tower head
        translate([0, 0, height - 24])
            cylinder(d = socket_inner_d, h = 26);
            
        // Hollow interior for lightness / wiring (pass motor wires internally in Phase 2!)
        cylinder(d = 12.0, h = height + 10, center = true);
        
        // Decorative / lightweight lattice cutouts
        for (z = [15 : 20 : height - 20]) {
            translate([0, 0, z])
                rotate([90, 0, 0])
                    cylinder(d = 10, h = 24, center = true);
            translate([0, 0, z + 10])
                rotate([0, 90, 0])
                    cylinder(d = 10, h = 24, center = true);
        }
    }
}

// ====================================================================
// Selection
// ====================================================================
part = "base"; // "base" or "mast"

if (part == "base") {
    tower_base();
} else if (part == "mast") {
    tower_mast_segment(100);
}
