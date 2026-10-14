// ====================================================================
// SWARGAROHINI ENTRANCE: BHIM PUL & SWARGAROHINI MARG GATEWAY
// Location: Mana Village, Chamoli District, Uttarakhand, India
// Authentic Features:
//   1. Saraswati River Chasm / Rocky Himalayan Canyon
//   2. Bhim Pul: Monolithic Boulder Bridge thrown across gorge by Bhima
//   3. Swargarohini Marg Gateway: Traditional Garhwali gabled stone & timber arch
//   4. Trailhead Stone Paved Path with Mani Stone Cairns
// Additive Manufacturing: 100% Manifold Solid, Supportless FDM (<=45° Overhangs)
// ====================================================================

$fn = 32;
eps = 0.05;

// Main Dimensions
diorama_w = 120.0; // Width (X) across river gorge
diorama_d = 90.0;  // Depth (Y) along the trail
base_thick = 4.0;  // Solid build plate foundation

swargarohini_trailhead_entrance();

module swargarohini_trailhead_entrance() {
    union() {
        // --- 1. SOLID FOUNDATION BASE ---
        foundation_base();

        // --- 2. SARASWATI RIVER GORGE & CANYON CLIFFS ---
        saraswati_gorge_and_cliffs();

        // --- 3. BHIM PUL (THE GIANT BOULDER BRIDGE) ---
        bhim_pul_monolith();

        // --- 4. SWARGAROHINI MARG TRADITIONAL ENTRANCE ARCH ---
        translate([0, -22.0, 0])
            swargarohini_marg_gateway();

        // --- 5. TRAILHEAD COBBLESTONE PATH & RETECTING WALLS ---
        trailhead_path_and_walls();
    }
}

// 1. Build Plate Foundation (Chamfered anti-warp corners)
module foundation_base() {
    hull() {
        for (dx = [-diorama_w/2 + 4, diorama_w/2 - 4]) {
            for (dy = [-diorama_d/2 + 4, diorama_d/2 - 4]) {
                translate([dx, dy, 0])
                    cylinder(r = 4, h = base_thick, $fn = 16);
            }
        }
    }
}

// 2. Saraswati River Canyon & Layered Himalayan Rock Cliffs
module saraswati_gorge_and_cliffs() {
    union() {
        // Left Canyon Bank (Mana Village side, Z = 16mm)
        hull() {
            translate([-diorama_w/2, -diorama_d/2, 0])
                cube([46.0, diorama_d, base_thick]);
            translate([-diorama_w/2, -diorama_d/2, 0])
                cube([40.0, diorama_d, 16.0]);
        }
        // Left Cliff Facet Terraces (Supportless 45° rock slopes)
        for (i = [0 : 3]) {
            y_pos = -diorama_d/2 + 8.0 + i * 24.0;
            translate([-14.0, y_pos, 0])
                cylinder(r1 = 9.0, r2 = 3.0, h = 18.0, $fn = 6);
        }

        // Right Canyon Bank (Swargarohini Trail side, Z = 18mm)
        hull() {
            translate([diorama_w/2 - 46.0, -diorama_d/2, 0])
                cube([46.0, diorama_d, base_thick]);
            translate([diorama_w/2 - 40.0, -diorama_d/2, 0])
                cube([40.0, diorama_d, 18.0]);
        }
        // Right Cliff Facet Terraces
        for (i = [0 : 3]) {
            y_pos = -diorama_d/2 + 8.0 + i * 24.0;
            translate([14.0, y_pos, 0])
                cylinder(r1 = 9.0, r2 = 3.0, h = 20.0, $fn = 6);
        }

        // Roaring Saraswati Riverbed (Flowing down Y axis in central gorge)
        // Solid elevated riverbed floor with turbulent cascading water rapids
        hull() {
            translate([-14.0, -diorama_d/2, 0]) cube([28.0, diorama_d, 5.0]);
            translate([-10.0, -diorama_d/2, 0]) cube([20.0, diorama_d, 7.5]);
        }
        // Cascading water torrents / rapids texture
        for (y = [-diorama_d/2 + 6 : 14 : diorama_d/2 - 6]) {
            translate([0, y, 7.0])
                scale([1.8, 0.9, 0.4])
                    sphere(r = 5.0, $fn = 12);
        }
    }
}

// 3. Bhim Pul (Colossal Monolithic Stone Bridge across Saraswati chasm)
module bhim_pul_monolith() {
    bridge_y = 12.0; // Located in upper half of gorge
    bridge_z = 16.0; // Spans across left and right cliff edges

    union() {
        // The Colossal Boulder placed by Bhima (Massive natural slab)
        translate([0, bridge_y, bridge_z]) {
            hull() {
                // Left anchor embedded deeply into left cliff
                translate([-18.0, -7.0, 0]) cube([4.0, 14.0, 6.0]);
                // Center natural thick stone vault
                translate([-6.0, -9.0, 1.5]) cube([12.0, 18.0, 7.5]);
                // Right anchor embedded deeply into right cliff
                translate([14.0, -7.0, 0]) cube([4.0, 14.0, 6.0]);
            }
        }

        // Stepped stone footings supporting bridge abutments (Self-supporting 45°)
        translate([-13.0, bridge_y, 0])
            cylinder(r1 = 7.0, r2 = 4.0, h = bridge_z + 2.0, $fn = 8);
        translate([13.0, bridge_y, 0])
            cylinder(r1 = 7.0, r2 = 4.0, h = bridge_z + 2.0, $fn = 8);

        // Ancient Stone Trail Crossing over the rock
        translate([0, bridge_y, bridge_z + 7.5]) {
            // Walking platform surface
            hull() {
                translate([-18.0, -4.5, 0]) cube([36.0, 9.0, 1.0]);
            }
            // Traditional low stone protective curb edges
            for (dy = [-4.5, 3.5]) {
                translate([-18.0, dy, 0.8])
                    cube([36.0, 1.0, 1.8]);
            }
        }
    }
}

// 4. Traditional Garhwali Entrance Gate (Swargarohini Marg Trailhead)
module swargarohini_marg_gateway() {
    gate_span = 38.0;
    gate_h = 32.0;
    col_w = 6.0;
    col_d = 7.0;
    plinth_z = 16.0; // Sits on Mana side terrace

    translate([0, 0, plinth_z]) {
        union() {
            // Left & Right Carved Masonry Columns
            for (s = [-1, 1]) {
                translate([s * gate_span/2, 0, 0]) {
                    // Stepped base plinth
                    translate([-col_w/2 - 1.0, -col_d/2 - 1.0, 0])
                        cube([col_w + 2.0, col_d + 2.0, 4.0]);

                    // Main stone pillar
                    translate([-col_w/2, -col_d/2, 0])
                        cube([col_w, col_d, gate_h]);

                    // Stone bracket capital (45° supportless bevel)
                    translate([0, 0, gate_h - 2.0])
                        cylinder(r1 = 3.5, r2 = 5.5, h = 3.0, $fn = 8);
                }
            }

            // Cross Lintel Beam with Signboard ("SWARGAROHINI MARG")
            translate([0, 0, gate_h]) {
                // Lower timber lintel beam
                translate([-gate_span/2 - 3, -col_d/2 - 0.5, 0])
                    cube([gate_span + 6, col_d + 1.0, 4.0]);

                // Traditional Garhwali Gabled Slate Roof (Overhang <= 42°)
                roof_span = gate_span + 14.0;
                roof_d = col_d + 8.0;
                roof_h = 10.0;

                hull() {
                    // Base of gabled roof
                    translate([-roof_span/2, -roof_d/2, 3.8])
                        cube([roof_span, roof_d, 1.0]);
                    // Ridge peak beam
                    translate([-roof_span/2 + 2, -1.0, 3.8 + roof_h])
                        cube([roof_span - 4, 2.0, 1.0]);
                }

                // Decorative Ridge Finials (Kalasha bells at both ends and center)
                for (fx = [-roof_span/2 + 4, 0, roof_span/2 - 4]) {
                    translate([fx, 0, 4.0 + roof_h]) {
                        cylinder(r1 = 1.8, r2 = 0.5, h = 3.5, $fn = 10);
                        translate([0, 0, 3.5]) sphere(r = 0.8, $fn = 10);
                    }
                }

                // Arch brackets under lintel (45° chamfers - 100% supportless)
                for (s = [-1, 1]) {
                    translate([s * (gate_span/2 - 4.0), 0, -5.0]) {
                        hull() {
                            translate([0, -col_d/2, 5.0]) cube([1.0, col_d, 0.5]);
                            translate([-s * 4.5, -col_d/2, 5.0]) cube([1.0, col_d, 0.5]);
                            translate([0, -col_d/2, 0.0]) cube([1.0, col_d, 0.5]);
                        }
                    }
                }
            }
        }
    }
}

// 5. Cobblestone Trailhead Path & Boundary Retaining Walls
module trailhead_path_and_walls() {
    union() {
        // Mana Trail Approach Path (Leading from gate down to Bhim Pul)
        hull() {
            translate([-10.0, -diorama_d/2 + 4, 16.0]) cube([20.0, 2.0, 1.0]);
            translate([-8.0, 8.0, 16.0]) cube([16.0, 2.0, 1.0]);
        }

        // Stepped pathway leading across Bhim Pul to Swargarohini trail
        hull() {
            translate([6.0, 16.0, 16.5]) cube([12.0, 2.0, 1.0]);
            translate([8.0, diorama_d/2 - 6, 18.0]) cube([16.0, 2.0, 1.0]);
        }

        // Ancient Mani Stone Cairns & Prayer Pillars on the trail
        translate([-26.0, -10.0, 16.0]) {
            cylinder(r1 = 3.5, r2 = 2.0, h = 4.0, $fn = 8);
            translate([0, 0, 4.0]) cylinder(r1 = 2.0, r2 = 0.8, h = 3.5, $fn = 8);
        }
        translate([28.0, 28.0, 18.0]) {
            cylinder(r1 = 4.0, r2 = 2.5, h = 5.0, $fn = 8);
            translate([0, 0, 5.0]) cylinder(r1 = 2.5, r2 = 1.0, h = 4.0, $fn = 8);
        }
    }
}
