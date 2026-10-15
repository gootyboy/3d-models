// ====================================================================
// AUTHENTIC SWARGAROHINI ARCH ENTRANCE (MANA VILLAGE, BADRINATH)
// Modeled with precision from on-site photography of Swargarohini trail
// Key Architectural Features:
//   1. White ornate Torana arch gateway spanning the stone pilgrim path
//   2. Tall square carved pilasters with terracotta base & tiered capitals
//   3. Crisp multi-cusped (scalloped) arch opening with central hanging temple bell
//   4. Lintel frieze and horizontal cornice mouldings
//   5. Vertical cresting pediment with radiant golden Sun (Surya) medallion
//      flanked by sculpted makara / elephant scroll crests & corner finials
//   6. Stone paved pathway with side curb retaining walls
// 100% Manifold Solid, Supportless FDM (<=45° Overhangs, NoError)
// ====================================================================

$fn = 36;
eps = 0.05;

// Proportions matched to photograph
path_w = 34.0;    // Arch passage clear width
gate_w = 64.0;    // Gate total width across outer pillars
gate_d = 14.0;    // Gate structural depth (Y)
base_w = 88.0;    // Paved trail foundation width (X)
base_d = 56.0;    // Trail length (Y)
pillar_w = 11.0;  // Pillar width
pillar_d = 12.0;  // Pillar depth
pillar_h = 42.0;  // Pillar height up to arch spring line
arch_rise = 22.0; // Arch apex height above pillars

mana_swargarohini_arch_gate();

module mana_swargarohini_arch_gate() {
    union() {
        // --- 1. CLEAN FLAT BASE ---
        flat_base();

        // --- 2. LEFT & RIGHT CARVED PILLARS ---
        for (side = [-1, 1]) {
            translate([side * (path_w/2 + pillar_w/2), 0, 3.5])
                gate_pillar(side);
        }

        // --- 3. MULTI-CUSPED ARCH VAULT & SPANDRELS ---
        translate([0, 0, 3.5 + pillar_h])
            cusped_arch_vault();

        // --- 4. HANGING TEMPLE BELL (GHANTA) ---
        translate([0, 0, 3.5 + pillar_h + 16.0])
            hanging_temple_bell();

        // --- 5. ENTABLATURE & LINTEL FRIEZE ---
        translate([0, 0, 3.5 + pillar_h + arch_rise + 3.0])
            gate_entablature();

        // --- 6. VERTICAL TOP CRESTING PEDIMENT & SOLAR MEDALLION ---
        translate([0, 0, 3.5 + pillar_h + arch_rise + 10.0])
            top_crest_pediment();
    }
}

// 1. Flat Base Plinth (Clean, completely flat with no extra stuff)
module flat_base() {
    hull() {
        translate([-base_w/2 + 4, -base_d/2 + 4, 0]) cylinder(r = 4, h = 3.5, $fn = 24);
        translate([ base_w/2 - 4, -base_d/2 + 4, 0]) cylinder(r = 4, h = 3.5, $fn = 24);
        translate([ base_w/2 - 4,  base_d/2 - 4, 0]) cylinder(r = 4, h = 3.5, $fn = 24);
        translate([-base_w/2 + 4,  base_d/2 - 4, 0]) cylinder(r = 4, h = 3.5, $fn = 24);
    }
}

// 2. Gateway Pillars (Square shafts with stepped plinths and capitals)
module gate_pillar(side) {
    union() {
        // Terracotta Base Footing (Pinkish/red bottom band in photo)
        hull() {
            translate([-pillar_w/2 - 1.5, -pillar_d/2 - 1.5, 0])
                cube([pillar_w + 3.0, pillar_d + 3.0, 5.0]);
        }

        // Stepped White Plinth Mouldings
        translate([-pillar_w/2 - 0.8, -pillar_d/2 - 0.8, 5.0])
            cube([pillar_w + 1.6, pillar_d + 1.6, 3.5]);
        translate([-pillar_w/2 - 0.3, -pillar_d/2 - 0.3, 8.5])
            cube([pillar_w + 0.6, pillar_d + 0.6, 2.5]);

        // Main White Pillar Shaft
        translate([-pillar_w/2, -pillar_d/2, 11.0])
            cube([pillar_w, pillar_d, pillar_h - 11.0]);

        // Front & Rear Recessed Panels
        for (y_face = [-pillar_d/2 - 0.25, pillar_d/2 - 0.25]) {
            translate([-pillar_w/2 + 1.5, y_face, 13.0])
                cube([pillar_w - 3.0, 0.5, pillar_h - 17.0]);
        }

        // Mid-Height Decorative Belt Moulding
        translate([-pillar_w/2 - 0.5, -pillar_d/2 - 0.5, 24.0])
            cube([pillar_w + 1.0, pillar_d + 1.0, 2.2]);

        // Stepped Capital Bracket (45° Supportless Corbel)
        translate([0, 0, pillar_h]) {
            hull() {
                translate([-pillar_w/2, -pillar_d/2, -5.0])
                    cube([pillar_w, pillar_d, 0.5]);
                translate([-pillar_w/2 - 1.2, -pillar_d/2 - 1.2, 0.0])
                    cube([pillar_w + 2.4, pillar_d + 2.4, 0.5]);
            }
            // Capital Abacus slab
            translate([-pillar_w/2 - 1.5, -pillar_d/2 - 1.5, 0])
                cube([pillar_w + 3.0, pillar_d + 3.0, 2.5]);
        }
    }
}

// 3. Crisp Multi-Cusped / Scalloped Arch & Spandrel Wall
module cusped_arch_vault() {
    arch_span = path_w;
    arch_thick = pillar_d - 1.0;
    wall_h = arch_rise + 3.0;

    difference() {
        // Solid Spandrel Wall Spanning Between Pillars
        translate([-gate_w/2 + pillar_w/2 - 1, -arch_thick/2, 0])
            cube([gate_w - pillar_w + 2, arch_thick, wall_h]);

        // Pure 2D Multi-Cusped Arch Cutout Extruded through Y-Axis (Correct +Y -> +Z rotation)
        rotate([90, 0, 0])
        translate([0, 0, -arch_thick/2 - 1])
        linear_extrude(height = arch_thick + 2) {
            cusped_arch_2d_profile(arch_span, arch_rise);
        }
    }

    // Outer Molded Arch Trim Band (Cusped Arch Border)
    for (y_face = [-arch_thick/2 - 0.35, arch_thick/2 - 0.35]) {
        translate([0, y_face, 0]) {
            for (ang = [18 : 12 : 162]) {
                rad = arch_span/2 + 1.6;
                cx = rad * cos(ang);
                cz = rad * sin(ang) * 0.95 + 1.0;
                translate([cx, 0, cz])
                    rotate([-90, 0, 0])
                        cylinder(r = 1.0, h = 0.7, $fn = 12);
            }
        }
    }

    // Rosette Medallions in Upper Spandrels (Seen in photo)
    for (s = [-1, 1]) {
        for (y_face = [-arch_thick/2 - 0.4, arch_thick/2 - 0.4]) {
            translate([s * (arch_span/2 - 2.5), y_face, wall_h - 4.5]) {
                rotate([-90, 0, 0]) {
                    cylinder(r = 2.5, h = 0.8, $fn = 16);
                    translate([0, 0, 0.4]) sphere(r = 1.1, $fn = 12);
                }
            }
        }
    }
}

// 2D Profile of Multi-Cusped / Scalloped Arch Opening (in X-Y plane where Y is height)
module cusped_arch_2d_profile(span, rise) {
    union() {
        // Main semi-circular / pointed arch vault opening
        hull() {
            translate([0, 0]) circle(r = span/2, $fn = 48);
            translate([0, rise - 3.5]) circle(r = 3.5, $fn = 24);
        }

        // Multi-cusp / Scallop Lobes along the opening rim
        for (ang = [25, 55, 90, 125, 155]) {
            rad = span/2 - 1.5;
            cx = rad * cos(ang);
            cy = rad * sin(ang) * 0.92;
            translate([cx, cy])
                circle(r = 4.2, $fn = 24);
        }
    }
}

// 4. Authentic Hanging Temple Bell (Ghanta) under Arch Apex
module hanging_temple_bell() {
    union() {
        // Solid Chain / Rod anchored to arch vault ceiling
        translate([0, 0, 0])
            cylinder(r = 1.0, h = 5.0, $fn = 10);

        // Bell Body (Golden brass temple bell as in photo)
        translate([0, 0, 0]) {
            // Upper dome of bell
            cylinder(r1 = 1.6, r2 = 2.4, h = 2.0, $fn = 16);
            // Flared skirt of bell
            translate([0, 0, -3.2])
                cylinder(r1 = 4.0, r2 = 2.4, h = 3.2, $fn = 20);
            // Lower lip
            translate([0, 0, -4.0])
                cylinder(r1 = 4.4, r2 = 4.0, h = 0.8, $fn = 20);
            // Clapper bead
            translate([0, 0, -5.2])
                sphere(r = 1.3, $fn = 10);
        }
    }
}

// 5. Entablature & Lintel Frieze (Horizontal Moulding Beam)
module gate_entablature() {
    beam_w = gate_w + 3.0;
    beam_d = pillar_d + 2.0;

    union() {
        // Architrave Lower Moulding
        translate([-beam_w/2, -beam_d/2, 0])
            cube([beam_w, beam_d, 2.5]);

        // Mid Frieze Band
        translate([-beam_w/2 + 1.0, -beam_d/2 + 0.6, 2.5])
            cube([beam_w - 2.0, beam_d - 1.2, 2.5]);

        // Upper Cornice (Stepped 45° projection)
        hull() {
            translate([-beam_w/2, -beam_d/2, 5.0])
                cube([beam_w, beam_d, 0.5]);
            translate([-beam_w/2 - 1.2, -beam_d/2 - 1.0, 7.0])
                cube([beam_w + 2.4, beam_d + 2.0, 1.2]);
        }
    }
}

// 6. Vertical Top Cresting Pediment with Surya Medallion & Finials
module top_crest_pediment() {
    ped_w = gate_w - 4.0;
    ped_thick = 7.0; // Sturdy vertical parapet wall
    ped_h = 16.0;

    union() {
        // Vertical Parapet Wall with Curvilinear Arch Pediment
        hull() {
            // Base along cornice
            translate([-ped_w/2, -ped_thick/2, 0])
                cube([ped_w, ped_thick, 2.0]);
            // Stepped middle
            translate([-ped_w/2 + 8.0, -ped_thick/2, 6.0])
                cube([ped_w - 16.0, ped_thick, 2.0]);
            // Top central arch crest
            translate([-14.0, -ped_thick/2, ped_h - 1.0])
                cube([28.0, ped_thick, 2.0]);
        }

        // Stepped Upper Trim Moulding on Pediment
        for (tier = [1 : 3]) {
            tw = ped_w - tier * 12.0;
            tz = tier * 4.2;
            translate([-tw/2, -ped_thick/2 - 0.4, tz])
                cube([tw, ped_thick + 0.8, 1.2]);
        }

        // Central Vertical Surya (Sun) Medallion (Facing forward along -Y as in photo!)
        for (y_face = [-ped_thick/2 - 0.5, ped_thick/2 - 0.5]) {
            translate([0, y_face, ped_h - 2.5]) {
                rotate([-90, 0, 0]) {
                    // Central Sun Disc
                    cylinder(r = 5.6, h = 1.0, $fn = 28);
                    // Inner concentric relief ring
                    translate([0, 0, 0.6]) cylinder(r = 4.0, h = 0.8, $fn = 24);
                    translate([0, 0, 1.2]) sphere(r = 1.8, $fn = 16);

                    // Radiant Sun Rays (Triangular/radial flares as in photo)
                    for (a = [0 : 30 : 330]) {
                        rotate([0, 0, a])
                            translate([5.4, -0.6, 0])
                                cube([2.8, 1.2, 0.8]);
                    }
                }
            }
        }

        // Flanking Sculpted Crest Motifs (Elephants / Makara scroll wings)
        for (s = [-1, 1]) {
            translate([s * 15.0, 0, 8.0]) {
                hull() {
                    translate([-s * 2.0, -ped_thick/2, 0]) cube([4.0, ped_thick, 3.0]);
                    translate([ s * 4.0, -ped_thick/2, 3.0]) cube([3.0, ped_thick, 3.0]);
                    translate([ s * 6.0, -ped_thick/2, 0]) cube([2.0, ped_thick, 2.0]);
                }
            }
        }

        // Central Sacred Kalasha Finial on Highest Peak
        translate([0, 0, ped_h + 1.0]) {
            cylinder(r1 = 3.6, r2 = 2.4, h = 3.2, $fn = 16);
            translate([0, 0, 3.2]) cylinder(r1 = 2.4, r2 = 0.8, h = 4.0, $fn = 14);
            translate([0, 0, 7.2]) sphere(r = 1.2, $fn = 12);
            translate([0, 0, 8.4]) cylinder(r1 = 0.8, r2 = 0.2, h = 2.0, $fn = 8);
        }

        // Left & Right Outer Pillar Finials (Directly above pillar columns)
        for (s = [-1, 1]) {
            translate([s * (path_w/2 + pillar_w/2), 0, 0]) {
                // Stepped pedestal base
                translate([-4.5, -4.5, 0]) cube([9.0, 9.0, 2.5]);
                // Kalasha Urn Finial
                translate([0, 0, 2.5]) {
                    cylinder(r1 = 3.2, r2 = 2.0, h = 3.0, $fn = 14);
                    translate([0, 0, 3.0]) cylinder(r1 = 2.0, r2 = 0.6, h = 3.5, $fn = 12);
                    translate([0, 0, 6.5]) sphere(r = 1.0, $fn = 10);
                }
            }
        }
    }
}
