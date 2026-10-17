// ====================================================================
// SWARG KI SEEDHI: THE STAIRWAY TO HEAVEN GLACIAL MASSIF
// Location: Swargarohini Massif & Satopanth Glacier, Garhwal Himalayas
// Authentic Geological & Mythic Features:
//   1. Sheer towering Swargarohini Peak Massif
//   2. "Swarg Ki Seedhi": The colossal natural tiered glacial ice steps
//      ascending up the mountain face into the heavens
//   3. Sacred Triangular Glacial Lake (Satopanth Tal) at foot of the steps
//   4. Glacial Moraines, lateral ridges, and Chaukhamba/Swargarohini crags
// Additive Manufacturing: 100% Manifold Solid, Supportless FDM (<=45° Overhangs)
// ====================================================================

$fn = 32;
eps = 0.05;

// Main Dimensions
massif_w = 110.0; // Width (X)
massif_d = 100.0; // Depth (Y)
base_h = 4.0;     // Plinth base thickness

swargarohini_glacial_massif();

module swargarohini_glacial_massif() {
    union() {
        // --- 1. PLINTH FOUNDATION (Z=0 Grounding) ---
        massif_base_plinth();

        // --- 2. SACRED TRIANGULAR SATOPANTH TAL (GLACIAL LAKE) ---
        satopanth_tal_basin();

        // --- 3. SWARG KI SEEDHI (TIERED GLACIAL STAIRWAY) ---
        swarg_ki_seedhi_ice_steps();

        // --- 4. TOWERING SWARGAROHINI PEAKS & MASSIVE RIDGES ---
        swargarohini_peaks();

        // --- 5. LATERAL MORAINE SCREE WALLS ---
        lateral_moraines();
    }
}

// 1. Plinth Foundation (Anti-warp corners)
module massif_base_plinth() {
    hull() {
        for (dx = [-massif_w/2 + 5, massif_w/2 - 5]) {
            for (dy = [-massif_d/2 + 5, massif_d/2 - 5]) {
                translate([dx, dy, 0])
                    cylinder(r = 5, h = base_h, $fn = 16);
            }
        }
    }
}

// 2. Sacred Triangular Satopanth Tal Basin (Where Trimurti bathe)
module satopanth_tal_basin() {
    lake_center_y = -massif_d/2 + 28.0;
    lake_side = 32.0;

    translate([0, lake_center_y, 0]) {
        // Elevated lake shore terrace
        hull() {
            cylinder(r1 = 20.0, r2 = 17.0, h = 6.0, $fn = 3); // Pure triangle
        }
        // Mirror-smooth water surface
        translate([0, 0, 5.0]) {
            cylinder(r1 = 15.0, r2 = 14.0, h = 1.8, $fn = 3);
        }
        // Shoreline holy prayer cairn
        translate([-12.0, -4.0, 6.0]) {
            cylinder(r1 = 2.4, r2 = 1.0, h = 4.0, $fn = 8);
        }
    }
}

// 3. Swarg Ki Seedhi: The Legendary Glacial Ice Steps
// Distinct, cascading horizontal shelf-like terraces ascending the central face
module swarg_ki_seedhi_ice_steps() {
    num_tiers = 9;
    stair_w = 34.0;
    y_start = -10.0;
    y_end = massif_d/2 - 12.0;
    step_depth = (y_end - y_start) / num_tiers;
    z_start = 8.0;
    z_rise = 5.2;

    union() {
        // Cascading Giant Glacial Ice Shelves
        for (i = [0 : num_tiers - 1]) {
            cur_y = y_start + i * step_depth;
            cur_z = z_start + i * z_rise;
            cur_w = stair_w - i * 1.8; // Gracefully tapers toward summit

            // Horizontal step tread with 45° supportless serac face
            hull() {
                translate([-cur_w/2, cur_y, 0])
                    cube([cur_w, step_depth + eps, cur_z]);
                translate([-cur_w/2 + 0.8, cur_y + step_depth * 0.3, 0])
                    cube([cur_w - 1.6, step_depth * 0.7, cur_z + z_rise * 0.4]);
            }

            // Serac ice lip on each step ledge
            translate([0, cur_y + step_depth * 0.85, cur_z + z_rise * 0.3])
                scale([cur_w/2 - 1.0, 1.2, 1.0])
                    sphere(r = 1.0, $fn = 8);
        }

        // Central Celestial Ascent Spine (Ascends straight to Swarga)
        hull() {
            translate([-4.0, y_start, z_start]) cube([8.0, 2.0, 1.0]);
            translate([-2.5, y_end, z_start + num_tiers * z_rise]) cube([5.0, 2.0, 1.0]);
        }
    }
}

// 4. Towering Swargarohini Massif Peaks (Swargarohini I, II, III)
module swargarohini_peaks() {
    summit_y = massif_d/2 - 14.0;
    summit_z = 58.0; // Towering pinnacle

    union() {
        // Main Swargarohini I Summit (Central Pyramid Peak)
        hull() {
            translate([-24.0, summit_y - 12.0, 0]) cube([48.0, 16.0, 10.0]);
            translate([-14.0, summit_y - 6.0, 32.0]) cube([28.0, 12.0, 8.0]);
            translate([0, summit_y, summit_z]) cylinder(r1 = 4.0, r2 = 0.5, h = 4.0, $fn = 6);
        }

        // Swargarohini II Peak (Left Flank)
        hull() {
            translate([-massif_w/2 + 10, summit_y - 10, 0]) cylinder(r = 14, h = 8, $fn = 6);
            translate([-36.0, summit_y - 4, 28.0]) cylinder(r = 8, h = 6, $fn = 6);
            translate([-32.0, summit_y, 48.0]) cylinder(r1 = 3.0, r2 = 0.5, h = 3.0, $fn = 6);
        }

        // Swargarohini III Peak (Right Flank)
        hull() {
            translate([massif_w/2 - 10, summit_y - 10, 0]) cylinder(r = 14, h = 8, $fn = 6);
            translate([36.0, summit_y - 4, 28.0]) cylinder(r = 8, h = 6, $fn = 6);
            translate([32.0, summit_y, 48.0]) cylinder(r1 = 3.0, r2 = 0.5, h = 3.0, $fn = 6);
        }

        // Connecting knife-edge arête ridges (Supportless 45° pyramidal walls)
        hull() {
            translate([-32.0, summit_y, 46.0]) cylinder(r = 1.5, h = 0.1, $fn = 6);
            translate([0, summit_y, summit_z]) cylinder(r = 1.5, h = 0.1, $fn = 6);
        }
        hull() {
            translate([32.0, summit_y, 46.0]) cylinder(r = 1.5, h = 0.1, $fn = 6);
            translate([0, summit_y, summit_z]) cylinder(r = 1.5, h = 0.1, $fn = 6);
        }
    }
}

// 5. Lateral Glacial Moraines (Framing both sides of the stairway)
module lateral_moraines() {
    union() {
        // Left Lateral Moraine Ridge
        for (i = [0 : 3]) {
            y_pos = -25.0 + i * 20.0;
            x_pos = -38.0 - (i % 2) * 3.0;
            h_pos = 12.0 + i * 6.5;
            translate([x_pos, y_pos, 0])
                cylinder(r1 = 11.0, r2 = 3.5, h = h_pos, $fn = 6);
        }

        // Right Lateral Moraine Ridge
        for (i = [0 : 3]) {
            y_pos = -25.0 + i * 20.0;
            x_pos = 38.0 + (i % 2) * 3.0;
            h_pos = 12.0 + i * 6.5;
            translate([x_pos, y_pos, 0])
                cylinder(r1 = 11.0, r2 = 3.5, h = h_pos, $fn = 6);
        }
    }
}
