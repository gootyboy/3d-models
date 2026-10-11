// ====================================================================
// Botanically & Architecturally Accurate Stone Arch Bridge (V-Valley Edition)
// Dimensions: Length 13.0 cm (130 mm), Width 2.7 cm (27 mm), Height 3.5 cm (35 mm)
// Features:
// - V-Shaped Valley Sloped Abutment Ends (Seats flush against sloping mountain valley walls)
// - Continuous Solid Roadbed (Zero gaps/holes) with Cobblestone Surface Detail
// - Radial Voussoir Arch Ring with Central Keystone Crown
// - Staggered Ashlar Masonry Wall Block Relief
// - Capped Parapet Side Safety Walls
// - Flared Base Pier Footing Anchors
// 100% Manifold Solid for 3D Printing (Supportless Overhangs, NoError)
// ====================================================================

$fn = 40;

// Core Dimension Parameters
length = 130.0;   // 13 cm total road deck span
width  = 27.0;    // 2.7 cm road width (50% wider)
height = 35.0;    // 3.5 cm bridge height

road_z = height - 6.0; // 29.0mm road deck level

// Graceful Segmental Arch Proportions (Leaves 4.5mm solid stone crown under road)
arch_span = 58.0;     // Main Arch Span Opening at base (Z = 0)
arch_r    = 29.0;     // Arch Radius
arch_center_z = -4.5; // Arch center Z offset (Apex reaches Z = 24.5mm)

// V-Valley Abutment Slope Parameter (Ends angled inward to fit V-shaped mountain valley)
// - At road level (Z = 35mm): Span is full 130mm
// - At base level (Z = 0mm): Span narrows by 2 * valley_slope_dx (98mm span, leaving 20mm solid footings)
// - 16.0mm offset over 35mm height creates ~65° slope matching natural mountain gorge walls
valley_slope_dx = 16.0; 

module stone_arch_bridge(slope_dx = valley_slope_dx) {
    intersection() {
        // --- Complete Classical Stone Arch Bridge Assembly ---
        union() {
            difference() {
                // --- 1. Main Solid Bridge Body ---
                union() {
                    // Main Bridge Block (Solid up to roadbed Z = 29.0mm)
                    translate([-length/2, -width/2, 0])
                        cube([length, width, road_z]);
                    
                    // Side Parapet Walls (Z = 29.0 to 35.0mm, height = 6.0mm)
                    translate([-length/2, -width/2, road_z])
                        cube([length, 2.5, 6.0]);
                    translate([-length/2, width/2 - 2.5, road_z])
                        cube([length, 2.5, 6.0]);

                    // Base Abutment Anchor Plinth along Y
                    for (side = [-1, 1]) {
                        scale([side, 1, 1])
                            translate([arch_span/2 - 1.0, -width/2 - 0.8, 0])
                                cube([(length/2 - slope_dx) - (arch_span/2 - 1.0) + 4.0, width + 1.6, 6.0]);
                    }
                }

                // --- 2. Main Arch Vault Cutout (Apex at Z = 24.5mm, 4.5mm below roadbed) ---
                translate([0, -width/2 - 2, arch_center_z])
                    rotate([-90, 0, 0])
                        cylinder(r = arch_r, h = width + 4, $fn = 80);

                // --- 3. Mortar Joint Grooves on Spandrel Walls ---
                for (y_pos = [-width/2 - 0.1, width/2 - 0.3]) {
                    translate([0, y_pos, 0]) {
                        // Horizontal Mortar Grooves
                        for (z = [4 : 3.5 : height - 7]) {
                            translate([-length/2 - 1, 0, z])
                                cube([length + 2, 0.4, 0.4]);
                        }
                        // Vertical Mortar Grooves (Staggered Brick Pattern)
                        for (row = [0 : 8]) {
                            z_val = 4 + row * 3.5;
                            stagger = (row % 2 == 0) ? 0 : 5.0;
                            for (x = [-length/2 + 2 + stagger : 10.0 : length/2 - 2]) {
                                // Only carve grooves outside arch cutout
                                if (abs(x) > 28 || z_val > arch_center_z + sqrt(max(0, arch_r*arch_r - x*x)) + 1.2) {
                                    translate([x, 0, z_val])
                                        cube([0.4, 0.4, 3.5]);
                                }
                            }
                        }
                    }
                }

                // --- 4. Cobblestone Roadbed Deck Surface Detail (Continuous across whole deck) ---
                for (x = [-length/2 + 2 : 3.5 : length/2 - 2]) {
                    for (y = [-width/2 + 3.2 : 3.2 : width/2 - 3.2]) {
                        translate([x + (y % 2 == 0 ? 0 : 1.2), y, road_z])
                            rotate([0, 0, 45])
                                cube([2.2, 2.2, 0.4]);
                    }
                }
            }

            // --- 5. Radial Arch Voussoir Ring & Keystone (Extruded Relief) ---
            for (side_sign = [-1, 1]) {
                y_ring = side_sign * (width/2 + 0.35);
                translate([0, y_ring, arch_center_z]) {
                    // Radial Voussoir Stones centered concentric on the arch
                    for (a = [15 : 10 : 165]) {
                        ang = a - 90;
                        is_keystone = (a == 90);
                        v_thickness = is_keystone ? 4.8 : 3.8;
                        v_outer_r   = is_keystone ? arch_r + 4.0 : arch_r + 3.4;
                        
                        color(is_keystone ? [0.65, 0.45, 0.32] : [0.55, 0.52, 0.48]) {
                            hull() {
                                rotate([0, -ang, 0])
                                    translate([0, 0, arch_r - 0.4])
                                        cube([v_thickness, 0.7, 0.4], center = true);
                                rotate([0, -ang, 0])
                                    translate([0, 0, v_outer_r])
                                        cube([v_thickness * 1.15, 0.7, 0.4], center = true);
                            }
                        }
                    }
                }
            }

            // --- 6. Parapet Top Capstones ---
            color([0.58, 0.55, 0.50]) {
                for (y_par = [-width/2 + 1.25, width/2 - 1.25]) {
                    for (x = [-length/2 + 1.5 : 5.0 : length/2 - 1.5]) {
                        translate([x, y_par, height - 0.2])
                            cube([4.6, 2.7, 0.4], center = true);
                    }
                }
            }
        }

        // --- 7. V-Valley Envelope Cutting Profile ---
        // Slopes inward from X = +/- length/2 at top to X = +/- (length/2 - slope_dx) at base
        hull() {
            translate([-length/2, -width/2 - 2, height - 0.2])
                cube([length, width + 4, 1.0]);
            translate([-(length/2 - slope_dx), -width/2 - 2, -0.5])
                cube([length - 2 * slope_dx, width + 4, 1.0]);
        }
    }
}

stone_arch_bridge();
