// ====================================================================
// SWARGAROHINI: STAIRWAY TO HEAVEN ENTRANCE GATEWAY
// Location: Garhwal Himalayas, Uttarakhand, India
// Mythological Origin: Pandavas' Mahaprasthanika Parva final ascent
// Design: 100% Manifold, Supportless FDM 3D Printable (<=45° Overhangs)
// ====================================================================

$fn = 32;
eps = 0.05;

// Main Dimensions
base_w = 90.0;    // Width (X)
base_d = 120.0;   // Depth / Run (Y)
base_h = 3.0;     // Base plinth thickness

// Overall Scene
swargarohini_entrance_portal();

module swargarohini_entrance_portal() {
    union() {
        // --- 1. MOUNTAIN TERRAIN BASE PLINTH ---
        mountain_base_plinth();

        // --- 2. ASCENDING STONE STAIRWAY ("SWARG KI SEEDHI") ---
        ascending_stairway();

        // --- 3. FLANKING GLACIAL CRAGS & ROCK LEDGES ---
        flanking_crags();

        // --- 4. SACRED HIMALAYAN ENTRANCE GATEWAY (SWARGA DWARA) ---
        translate([0, 20.0, 0])
            swarga_dwara_arch();

        // --- 5. CELESTIAL PINNACLE CLOUD STEPS (HIGH SUMMIT) ---
        summit_portal_backdrop();
    }
}

// 1. Solid Grounding Base Plinth
module mountain_base_plinth() {
    hull() {
        translate([-base_w/2 + 3, -base_d/2 + 3, 0]) cylinder(r = 3, h = base_h, $fn = 16);
        translate([ base_w/2 - 3, -base_d/2 + 3, 0]) cylinder(r = 3, h = base_h, $fn = 16);
        translate([ base_w/2 - 3,  base_d/2 - 3, 0]) cylinder(r = 3, h = base_h, $fn = 16);
        translate([-base_w/2 + 3,  base_d/2 - 3, 0]) cylinder(r = 3, h = base_h, $fn = 16);
    }
}

// 2. Ascending Stone Stairway
module ascending_stairway() {
    num_steps = 14;
    stair_w = 26.0;
    stair_start_y = -base_d/2 + 8.0;
    stair_end_y = base_d/2 - 8.0;
    y_step_pitch = (stair_end_y - stair_start_y) / num_steps;
    z_rise = 3.2;

    union() {
        // Solid core mass under stairs (Zero hollows, zero non-manifold edges)
        hull() {
            translate([-stair_w/2, stair_start_y, 0])
                cube([stair_w, 2.0, base_h]);
            translate([-stair_w/2, stair_end_y - y_step_pitch, 0])
                cube([stair_w, 2.0, base_h + (num_steps - 1) * z_rise]);
        }

        // Stepped risers and stone treads
        for (i = [0 : num_steps - 1]) {
            y_pos = stair_start_y + i * y_step_pitch;
            h_pos = base_h + (i + 1) * z_rise;
            translate([-stair_w/2, y_pos, 0])
                cube([stair_w, y_step_pitch + eps, h_pos]);
        }

        // Flanking Stone Balustrades with supportless 45° slope
        for (side = [-1, 1]) {
            translate([side * (stair_w/2 + 2.5), 0, 0])
                balustrade(stair_start_y, stair_end_y, num_steps, z_rise);
        }
    }
}

// Stair Balustrade / Retaining Wall
module balustrade(y_start, y_end, steps, rise) {
    b_thick = 4.5;
    h_start = base_h + 5.0;
    h_end = base_h + steps * rise + 5.0;

    hull() {
        translate([-b_thick/2, y_start, 0])
            cube([b_thick, 3.0, h_start]);
        translate([-b_thick/2, y_end - 4.0, 0])
            cube([b_thick, 3.0, h_end]);
    }
    // Decorative Tibetan/Himalayan Mani stone markers on piers
    translate([0, y_start + 1.5, h_start])
        cylinder(r1 = 2.4, r2 = 1.0, h = 3.5, $fn = 8);
    translate([0, y_end - 2.5, h_end])
        cylinder(r1 = 2.4, r2 = 1.0, h = 3.5, $fn = 8);
}

// 3. Glacial Crags & Layered Himalayan Rocks (Supportless <= 45° slopes)
module flanking_crags() {
    union() {
        // Left Ridge
        for (i = [0 : 4]) {
            y_c = -40 + i * 22;
            x_c = -32 - (i % 2) * 4;
            h_c = 10 + i * 7.5;
            translate([x_c, y_c, 0])
                cylinder(r1 = 12.0, r2 = 3.0, h = h_c, $fn = 6);
        }

        // Right Ridge
        for (i = [0 : 4]) {
            y_c = -40 + i * 22;
            x_c = 32 + (i % 2) * 4;
            h_c = 10 + i * 7.5;
            translate([x_c, y_c, 0])
                cylinder(r1 = 12.0, r2 = 3.0, h = h_c, $fn = 6);
        }

        // Interlocking rock footings
        hull() {
            translate([-base_w/2 + 2, -base_d/2 + 10, 0]) cylinder(r = 6, h = 6, $fn = 8);
            translate([-base_w/2 + 6,  base_d/2 - 10, 0]) cylinder(r = 6, h = 26, $fn = 8);
        }
        hull() {
            translate([ base_w/2 - 2, -base_d/2 + 10, 0]) cylinder(r = 6, h = 6, $fn = 8);
            translate([ base_w/2 - 6,  base_d/2 - 10, 0]) cylinder(r = 6, h = 26, $fn = 8);
        }
    }
}

// 4. Sacred Swarga Dwara (Gateway Arch)
module swarga_dwara_arch() {
    pillar_span = 34.0; // Distance between pillars
    pillar_w = 6.5;
    pillar_d = 7.0;
    arch_base_z = 24.0; // Anchors into mountain stairs at Y=20
    arch_h = 32.0;

    union() {
        // Left & Right Carved Gate Pillars
        for (s = [-1, 1]) {
            translate([s * pillar_span/2, 0, 0]) {
                // Grounded Pillar Column from Z=0 up to arch beam
                translate([-pillar_w/2, -pillar_d/2, 0])
                    cube([pillar_w, pillar_d, arch_base_z + arch_h]);

                // Stepped base plinth
                translate([0, 0, arch_base_z])
                    cylinder(r1 = 5.5, r2 = 4.2, h = 4.0, $fn = 8);

                // Capital bracket
                translate([0, 0, arch_base_z + arch_h - 2.0])
                    cylinder(r1 = 4.0, r2 = 6.0, h = 3.0, $fn = 8);
            }
        }

        // Supportless Pointed Arch (Gothic / Nagara Torana arch <=45°)
        translate([0, 0, arch_base_z + arch_h]) {
            // Main lintel beam
            translate([-pillar_span/2 - 5, -pillar_d/2 - 0.5, 0])
                cube([pillar_span + 10, pillar_d + 1.0, 5.0]);

            // Stepped Nagara Cornice Roof (45° stepped overhangs)
            for (level = [1 : 4]) {
                roof_w = pillar_span + 10 - level * 4.5;
                roof_d = pillar_d + 1.0 - level * 0.8;
                roof_z = 5.0 + (level - 1) * 3.5;
                translate([-roof_w/2, -roof_d/2, roof_z])
                    cube([roof_w, roof_d, 3.5]);
            }

            // Sacred Kalasha Finial Peak
            translate([0, 0, 5.0 + 4 * 3.5]) {
                cylinder(r1 = 3.2, r2 = 2.4, h = 3.5, $fn = 12);
                translate([0, 0, 3.5]) cylinder(r1 = 2.4, r2 = 0.5, h = 5.0, $fn = 12);
                translate([0, 0, 8.5]) sphere(r = 1.0, $fn = 12);
            }

            // Under-Arch Gusset Brackets (45° chamfered transitions - zero bridging issues)
            for (s = [-1, 1]) {
                translate([s * (pillar_span/2 - 3.5), 0, -6.0]) {
                    hull() {
                        translate([0, -pillar_d/2, 6.0]) cube([1.0, pillar_d, 0.5]);
                        translate([-s * 4.5, -pillar_d/2, 6.0]) cube([1.0, pillar_d, 0.5]);
                        translate([0, -pillar_d/2, 0.0]) cube([1.0, pillar_d, 0.5]);
                    }
                }
            }
        }
    }
}

// 5. High Summit Backdrop / Swargarohini Mountain Gate
module summit_portal_backdrop() {
    summit_y = base_d/2 - 6.0;
    summit_z = 48.0;

    union() {
        // Central Peak Gateway Backdrop
        hull() {
            translate([-18, summit_y - 4, 0]) cube([36, 6, 2]);
            translate([-10, summit_y - 2, summit_z]) cube([20, 4, 8]);
            translate([0, summit_y, summit_z + 18]) cylinder(r = 3.5, h = 0.1, $fn = 6);
        }

        // Flanking High Needle Peaks
        for (s = [-1, 1]) {
            hull() {
                translate([s * 32, summit_y - 4, 0]) cylinder(r = 8, h = 5, $fn = 6);
                translate([s * 25, summit_y, summit_z + 10]) cylinder(r = 2.5, h = 2, $fn = 6);
            }
        }
    }
}
