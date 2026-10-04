// ====================================================================
// Tower Base & 3D-Printable Alpine Mast Column (100% Support-Free)
// 
// Features:
// - 110mm Wide, stable holiday-styled baseplate (Z = 0)
// - 100% 3D-Printable Alpine Tower Mast Column:
//     * Sits flat on print bed at Z = 0.00 mm
//     * Lower male plug (20.0mm) drops directly into tower_base socket
//     * Upper male plug (20.0mm) plugs directly into tower_head_station_a / b
//     * Stiff cruciform ribbed / fluted pylon withstands high cable tension
//     * 12mm central hollow channel allows motor wires to pass internally
//     * Fits easily within FLSUN T1's 330mm vertical build volume
// ====================================================================

$fn = 50;

base_dia       = 110.0; // Wide footprint for stability against cable tension
base_th        = 8.0;   // Solid base thickness
socket_inner_d = 20.4;  // Fits 20.0mm mast plug or 20mm/3/4" dowel
socket_wall    = 4.5;
socket_h       = 32.0;

// 1. Sturdy Baseplate (Sits flat at Z = 0)
module tower_base() {
    difference() {
        union() {
            // Main disc with beveled edge
            cylinder(d1 = base_dia, d2 = base_dia - 6, h = base_th);
            
            // Central socket column
            cylinder(d = socket_inner_d + (socket_wall * 2), h = socket_h);
                
            // 4x Rigid support ribs
            for (a = [0 : 90 : 270]) {
                rotate([0, 0, a])
                    translate([socket_inner_d / 2, -socket_wall / 2, 0])
                        cube([base_dia / 2 - socket_inner_d / 2 - 8, socket_wall, socket_h * 0.7]);
            }
        }

        // Central socket with self-centering lead-in chamfer (starts at Z = 3)
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

// 2. 100% 3D-Printable Alpine Mast Column
// Total height = plug_b_len (26) + column_h (180) + plug_t_len (22) = 228 mm
// Fits easily on FLSUN T1 (330mm max height).
module tower_mast(column_h = 180) {
    plug_b_len = 26.0; // Bottom tenon into base socket
    plug_t_len = 22.0; // Top tenon into head socket
    plug_d     = 20.0; // 0.4mm clearance fit into 20.4mm sockets
    collar_d   = 30.0; // Flanged stop-collar
    wire_id    = 10.0; // Internal wiring channel
    
    difference() {
        union() {
            // Lower Tenon (starts at Z = 0 flat on bed)
            cylinder(d = plug_d, h = plug_b_len);
            
            // Flanged stop collar transition (rests on top of base socket)
            translate([0, 0, plug_b_len])
                cylinder(d1 = plug_d, d2 = collar_d, h = 4.0);
            
            // Main Tower Mast Body (Tapered Alpine Pylon with stiffening ribs)
            translate([0, 0, plug_b_len + 4.0])
                cylinder(d1 = collar_d, d2 = collar_d - 4.0, h = column_h - 4.0);
                
            // 4x Structural Aerodynamic Stiffening Ribs (resist cable pull)
            for (a = [0, 90, 180, 270]) {
                rotate([0, 0, a])
                    translate([-2.0, 0, plug_b_len + 2.0])
                        hull() {
                            cube([4.0, collar_d / 2 + 5.0, 4.0]);
                            translate([0, 0, column_h - 10.0])
                                cube([4.0, collar_d / 2 + 1.0, 4.0]);
                        }
            }
            
            // Top Tenon Transition & Upper Plug (slides into station head socket)
            translate([0, 0, plug_b_len + column_h])
                cylinder(d1 = collar_d - 4.0, d2 = plug_d, h = 3.0);
            translate([0, 0, plug_b_len + column_h + 3.0])
                cylinder(d = plug_d, h = plug_t_len - 3.0);
        }
        
        // Continuous Central Wiring Conduit (hollow all the way through for Phase 2 motor wires)
        translate([0, 0, -1])
            cylinder(d = wire_id, h = plug_b_len + column_h + plug_t_len + 4);
            
        // Lower M4 Cross-Pin Hole (aligns with tower_base pin hole)
        translate([0, 0, 16.2])
            rotate([90, 0, 0])
                cylinder(d = 4.2, h = plug_d + 10, center = true);
                
        // Upper M4 Cross-Pin Hole (aligns with station head pin hole)
        translate([0, 0, plug_b_len + column_h + 12.5])
            rotate([0, 90, 0])
                cylinder(d = 4.2, h = plug_d + 10, center = true);
                
        // Decorative / Weight-reduction Diamond Windows (45° angles = support-free!)
        for (z = [plug_b_len + 25 : 30 : plug_b_len + column_h - 25]) {
            translate([0, 0, z])
                rotate([90, 0, 0])
                    rotate([0, 0, 45])
                        cube([12.0, 12.0, collar_d + 14], center = true);
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
    tower_mast();
}
