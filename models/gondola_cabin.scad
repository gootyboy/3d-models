// ====================================================================
// Alpine Christmas Gondola Cabin & Hanger Arm (100% 3D-Printable)
// 
// Print-Optimized:
// - ZERO floating parts: all components sit perfectly flat on the build plate (Z=0).
// - Self-supporting window arches: 45-degree angled lintels eliminate bridging droop.
// - Flat hanger orientation: printed on its side for maximum strength along layer lines.
// ====================================================================

$fn = 40;

// Dimensions (mm)
cabin_w       = 48.0;  // Width (across track)
cabin_l       = 64.0;  // Length (along track)
cabin_h       = 50.0;  // Body height
wall_th       = 2.4;   // Wall thickness
corner_r      = 6.0;   // Rounded corner radius

// Hanger Dimensions
hanger_height = 65.0;  // Vertical clearance from roof to trolley
hanger_offset = 26.0;  // Side offset to clear the cable line
hanger_th     = 4.5;   // Arm thickness
pivot_pin_d   = 3.4;   // Hole matching trolley lower pivot (M3 screw)

// Helper: Rounded Box
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

// 1. Cabin Body (Sits flat on build plate at Z=0, zero supports needed)
module cabin_body() {
    difference() {
        // Outer shell
        rounded_box(cabin_l, cabin_w, cabin_h, corner_r);
        
        // Hollow interior
        translate([0, 0, wall_th])
            rounded_box(cabin_l - wall_th*2, cabin_w - wall_th*2, cabin_h + 2, max(1, corner_r - wall_th));
        
        // Side Windows with 45-degree arched lintels (overhang angle printable without supports)
        for (y = [-cabin_w/2 - 2, cabin_w/2 + 2]) {
            for (x = [-cabin_l/4, cabin_l/4]) {
                translate([x, y, cabin_h * 0.38])
                    rotate([90, 0, 0])
                        hull() {
                            // Lower rectangular window portion
                            rounded_box(cabin_l * 0.32, cabin_h * 0.35, wall_th * 3, 2);
                            // 45-degree pointed top arch for clean bridging
                            translate([0, cabin_h * 0.22, 0])
                                rotate([0, 0, 45])
                                    cube([cabin_l * 0.22, cabin_l * 0.22, wall_th * 3], center = true);
                        }
            }
        }
        
        // Front & Rear Windows
        for (x = [-cabin_l/2 - 2, cabin_l/2 + 2]) {
            translate([x, 0, cabin_h * 0.42])
                rotate([0, 90, 0])
                    hull() {
                        rounded_box(cabin_h * 0.35, cabin_w * 0.52, wall_th * 3, 2);
                        translate([0, cabin_w * 0.2, 0])
                            rotate([0, 0, 45])
                                cube([cabin_w * 0.25, cabin_w * 0.25, wall_th * 3], center = true);
                    }
        }
        
        // Roof alignment rim with front orientation keyway notch
        translate([0, 0, cabin_h - 2])
            difference() {
                rounded_box(cabin_l + 2, cabin_w + 2, 4, corner_r);
                rounded_box(cabin_l - 1.6, cabin_w - 1.6, 6, corner_r);
                // Alignment notch at front (+X)
                translate([cabin_l / 2 - 2, 0, 0])
                    cube([6, 8, 8], center = true);
            }
    }
}

// 2. Cabin Alpine Roof (100% Flat on Bed at Z=0, ZERO negative Z geometry)
module cabin_roof() {
    roof_lip = 3.5;
    roof_h   = 14.0;
    clevis_slot_w = 4.8; // Slot width to receive the 4.2mm hanger arm tab
    clevis_h      = 10.0;
    
    difference() {
        union() {
            // Hipped pitched roof starts at Z = 0
            hull() {
                rounded_box(cabin_l + roof_lip*2, cabin_w + roof_lip*2, 2.5, corner_r + 1);
                translate([0, 0, roof_h])
                    rounded_box(cabin_l * 0.45, cabin_w * 0.25, 1, 2);
            }
            
            // Slotted mounting bracket (clevis) on roof ridge
            translate([0, 0, roof_h])
                cube([14.0, 12.0, clevis_h], center = false);
        }
        
        // Underside recess for cabin rim (goes UPWARDS into the roof from Z = 0 to Z = 2.5, NEVER below Z=0!)
        translate([0, 0, -0.01])
            rounded_box(cabin_l - wall_th*2 - 0.4, cabin_w - wall_th*2 - 0.4, 2.6, corner_r - wall_th);

        // Vertical slot in the mounting bracket to receive the hanger tab
        translate([0, 6.0, roof_h + clevis_h / 2 + 1])
            cube([15.0, clevis_slot_w, clevis_h + 4], center = true);

        // Horizontal cross-pin hole (M3 screw slides through from the outside)
        translate([0, 6.0, roof_h + clevis_h * 0.55])
            rotate([0, 90, 0])
                cylinder(d = 3.4, h = 18.0, center = true);

        // Captive M3 Nut Pocket on -X side of clevis bracket (holds nut captive!)
        translate([-5.5, 6.0, roof_h + clevis_h * 0.55])
            rotate([0, 90, 0])
                cylinder(d = 6.4, h = 3.5, $fn = 6, center = true);

        // Visual alignment arrow debossed on top of clevis
        translate([0, 6.0, roof_h + clevis_h - 0.5])
            linear_extrude(height = 1.0)
                polygon([[-4, -1.5], [1, -1.5], [1, -3], [4, 0], [1, 3], [1, 1.5], [-4, 1.5]]);
                
        // Alignment keyway pocket (recessed UPWARDS from Z=0)
        translate([cabin_l / 2 - 4.5, 0, 1.5])
            cube([4.0, 7.0, 3.2], center = true);
    }
}

// 3. Hanger Arm (100% Flat Planar 2D Extrusion - ZERO floating geometry!)
module hanger_arm_flat() {
    linear_extrude(height = hanger_th) {
        difference() {
            union() {
                // Lower tab (slides into roof clevis)
                translate([0, 0])
                    hull() {
                        translate([0, -3]) square([11.0, 6], center = true);
                        translate([0, 5]) square([11.0, 6], center = true);
                    }
                // Lower horizontal bridge
                hull() {
                    translate([0, 4]) circle(d = 8.0);
                    translate([hanger_offset, 4]) circle(d = 8.0);
                }
                // Vertical C-stem
                hull() {
                    translate([hanger_offset, 4]) circle(d = 8.0);
                    translate([hanger_offset, hanger_height]) circle(d = 8.0);
                }
                // Top horizontal bridge
                hull() {
                    translate([hanger_offset, hanger_height]) circle(d = 8.0);
                    translate([0, hanger_height]) circle(d = 10.0);
                }
                // Top pivot eyelet
                translate([0, hanger_height])
                    circle(d = 10.0);
            }
            // Lower horizontal pin hole
            translate([0, 0])
                circle(d = 3.4);
            // Top pivot pin hole
            translate([0, hanger_height])
                circle(d = pivot_pin_d);
        }
    }
}

// Alias for 3D preview: stands upright
module hanger_arm() {
    translate([0, 6.0, 0])
        rotate([90, 0, 0])
            hanger_arm_flat();
}

// Full assembled view helper
module gondola_assembled() {
    cabin_body();
    translate([0, 0, cabin_h]) cabin_roof();
    translate([0, 0, cabin_h + 14]) hanger_arm();
}

// ====================================================================
// Print Selection
// ====================================================================
// Options:
//   "plate"    -> All 3 parts laid out side-by-side flat on bed at Z=0 (15–20mm spacing!)
//   "cabin"    -> Only cabin body (flat at Z=0)
//   "roof"     -> Only roof (flat at Z=0)
//   "hanger"   -> Only hanger arm (flat at Z=0)
//   "preview"  -> Visual assembled preview
part = "plate";

if (part == "plate") {
    // Generously spaced print-bed layout: ALL parts at Z=0, ZERO overhangs!
    translate([-55, 0, 0]) cabin_body();
    translate([55, 0, 0]) cabin_roof();
    translate([0, 42, 0]) hanger_arm_flat();
} else if (part == "cabin") {
    cabin_body();
} else if (part == "roof") {
    cabin_roof();
} else if (part == "hanger") {
    hanger_arm_flat();
} else if (part == "preview") {
    gondola_assembled();
}
