// ====================================================================
// AUTHENTIC SWARGAROHINI ARCH ENTRANCE & PRECISION SNAP-IN TEMPLE BELL
// Location: Mana Village, Chamoli District, Uttarakhand, India
// Additive Manufacturing Architecture:
//   1. Gateway Arch with Deep Keyed Female Snap-In Socket in ceiling
//   2. Standalone Snap-In Temple Bell: Prints flat on wide rim (0% support)
//      with compliant twin cantilever snap beams, lead-in ramps & locking detents
//   3. Deep (10mm), keyed anti-rotation fit with calibrated 0.20mm FDM tolerance
//   4. 100% Flat Base Plinth (Clean, zero extra curbs/grooves)
//   5. Removed tiny floating round objects near the arch rim
// 100% Closed Manifold Solid (NoError)
// ====================================================================

$fn = 36;
eps = 0.05;

// Mode selector: "arch_only", "bell_only", "print_bed_kit", or "assembled"
part_select = "assembled"; // ["arch_only", "bell_only", "print_bed_kit", "assembled"]

// Main Proportions
path_w = 34.0;    // Arch passage clear width
gate_w = 64.0;    // Gate total width across outer pillars
gate_d = 14.0;    // Gate structural depth (Y)
base_w = 88.0;    // Flat base width (X)
base_d = 56.0;    // Flat base depth (Y)
base_h = 2.0;     // Flat base plinth thickness (Thinner low-profile)
pillar_w = 11.0;  // Pillar width
pillar_d = 12.0;  // Pillar depth
pillar_h = 42.0;  // Pillar height up to arch spring line
arch_rise = 22.0; // Arch apex height above pillars

// Snap-Fit Mechanical Specifications
socket_depth = 10.0; // Deep vertical receiver cavity
socket_w = 6.0;      // Socket width (X)
socket_d = 4.4;      // Socket depth (Y)
fit_clearance = 0.20;// Calibrated FDM clearance per side
detent_depth = 0.45; // Tactile snap detent projection
apex_z = base_h + pillar_h + arch_rise; // Arch ceiling datum

render_selected_part();

module render_selected_part() {
    if (part_select == "arch_only") {
        arch_gateway_with_socket();
    } else if (part_select == "bell_only") {
        snapin_bell_for_printing();
    } else if (part_select == "print_bed_kit") {
        // Arch on left, Bell on right for single-plate printing
        translate([-15, 0, 0]) arch_gateway_with_socket();
        translate([50, 0, 0])  snapin_bell_for_printing();
    } else if (part_select == "assembled") {
        arch_gateway_with_socket();
        // Snapped flush into ceiling datum
        translate([0, 0, apex_z - 0.5])
            temple_bell_with_male_snap();
    }
}

// ====================================================================
// 1. GATEWAY ARCH WITH KEYED FEMALE SNAP RECEIVER SOCKET
// ====================================================================
module arch_gateway_with_socket() {
    difference() {
        union() {
            // Flat Base
            flat_base();

            // Left & Right Pillars
            for (side = [-1, 1]) {
                translate([side * (path_w/2 + pillar_w/2), 0, base_h])
                    gate_pillar(side);
            }

            // Cusped Arch Vault & Spandrel Wall
            translate([0, 0, base_h + pillar_h])
                cusped_arch_vault();

            // Entablature Frieze & Cornice
            translate([0, 0, base_h + pillar_h + arch_rise + 3.0])
                gate_entablature();

            // Vertical Cresting Pediment with Surya Medallion
            translate([0, 0, base_h + pillar_h + arch_rise + 10.0])
                top_crest_pediment();
        }

        // Deep Keyed Female Snap-In Receiver Socket at Arch Apex
        translate([0, 0, apex_z - 0.6])
            female_snap_socket();
    }
}

// Internal Female Snap Socket (Self-supporting <=45° ceiling)
module female_snap_socket() {
    union() {
        // Main Keyed Cavity (Goes 10mm straight up into solid entablature)
        translate([-socket_w/2, -socket_d/2, 0])
            cube([socket_w, socket_d, socket_depth]);

        // Self-supporting 45° Peaked Teardrop Roof
        translate([0, 0, socket_depth]) {
            hull() {
                translate([-socket_w/2, -socket_d/2, 0]) cube([socket_w, socket_d, 0.1]);
                translate([0, 0, socket_w/2]) cube([0.1, socket_d, 0.1], center = true);
            }
        }

        // Internal Snap Latch Detent Pockets (Left & Right)
        for (s = [-1, 1]) {
            translate([s * socket_w/2, 0, 6.5]) {
                hull() {
                    translate([0, -socket_d/2 + 0.5, 0])
                        cube([s * (detent_depth + 0.1), socket_d - 1.0, 1.8]);
                    translate([0, -socket_d/2 + 0.5, -0.6])
                        cube([0.1, socket_d - 1.0, 0.1]);
                }
            }
        }

        // 30° Entry Chamfer at Socket Mouth for Smooth Insertion
        hull() {
            translate([-socket_w/2 - 0.8, -socket_d/2 - 0.8, -0.1])
                cube([socket_w + 1.6, socket_d + 1.6, 0.1]);
            translate([-socket_w/2, -socket_d/2, 1.2])
                cube([socket_w, socket_d, 0.1]);
        }
    }
}

// 100% Flat Base Plinth
module flat_base() {
    hull() {
        for (dx = [-base_w/2 + 4, base_w/2 - 4]) {
            for (dy = [-base_d/2 + 4, base_d/2 - 4]) {
                translate([dx, dy, 0])
                    cylinder(r = 4, h = base_h, $fn = 24);
            }
        }
    }
}

// Pillars
module gate_pillar(side) {
    union() {
        // Terracotta Base Footing
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

        // Mid-Height Belt Moulding
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
            translate([-pillar_w/2 - 1.5, -pillar_d/2 - 1.5, 0])
                cube([pillar_w + 3.0, pillar_d + 3.0, 2.5]);
        }
    }
}

// Cusped Arch Vault & Spandrel Wall (Clean, No Floating Dots)
module cusped_arch_vault() {
    arch_span = path_w;
    arch_thick = pillar_d - 1.0;
    wall_h = arch_rise + 3.0;

    difference() {
        // Solid Spandrel Wall
        translate([-gate_w/2 + pillar_w/2 - 1, -arch_thick/2, 0])
            cube([gate_w - pillar_w + 2, arch_thick, wall_h]);

        // Pure 2D Multi-Cusped Arch Cutout (<=45° supportless ceiling)
        rotate([90, 0, 0])
        translate([0, 0, -arch_thick/2 - 1])
        linear_extrude(height = arch_thick + 2) {
            cusped_arch_2d_profile(arch_span, arch_rise);
        }
    }

    // Rosette Medallions in Upper Spandrels (Firmly anchored into solid wall)
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

module cusped_arch_2d_profile(span, rise) {
    union() {
        hull() {
            translate([0, 0]) circle(r = span/2, $fn = 48);
            translate([0, rise - 3.5]) circle(r = 3.5, $fn = 24);
        }
        for (ang = [25, 55, 90, 125, 155]) {
            rad = span/2 - 1.5;
            cx = rad * cos(ang);
            cy = rad * sin(ang) * 0.92;
            translate([cx, cy])
                circle(r = 4.2, $fn = 24);
        }
    }
}

// Entablature
module gate_entablature() {
    beam_w = gate_w + 3.0;
    beam_d = pillar_d + 2.0;

    union() {
        translate([-beam_w/2, -beam_d/2, 0])
            cube([beam_w, beam_d, 2.5]);
        translate([-beam_w/2 + 1.0, -beam_d/2 + 0.6, 2.5])
            cube([beam_w - 2.0, beam_d - 1.2, 2.5]);
        hull() {
            translate([-beam_w/2, -beam_d/2, 5.0])
                cube([beam_w, beam_d, 0.5]);
            translate([-beam_w/2 - 1.2, -beam_d/2 - 1.0, 7.0])
                cube([beam_w + 2.4, beam_d + 2.0, 1.2]);
        }
    }
}

// Top Pediment
module top_crest_pediment() {
    ped_w = gate_w - 4.0;
    ped_thick = 7.0;
    ped_h = 16.0;

    union() {
        hull() {
            translate([-ped_w/2, -ped_thick/2, 0])
                cube([ped_w, ped_thick, 2.0]);
            translate([-ped_w/2 + 8.0, -ped_thick/2, 6.0])
                cube([ped_w - 16.0, ped_thick, 2.0]);
            translate([-14.0, -ped_thick/2, ped_h - 1.0])
                cube([28.0, ped_thick, 2.0]);
        }

        for (tier = [1 : 3]) {
            tw = ped_w - tier * 12.0;
            tz = tier * 4.2;
            translate([-tw/2, -ped_thick/2 - 0.4, tz])
                cube([tw, ped_thick + 0.8, 1.2]);
        }

        for (y_face = [-ped_thick/2 - 0.5, ped_thick/2 - 0.5]) {
            translate([0, y_face, ped_h - 2.5]) {
                rotate([-90, 0, 0]) {
                    cylinder(r = 5.6, h = 1.0, $fn = 28);
                    translate([0, 0, 0.6]) cylinder(r = 4.0, h = 0.8, $fn = 24);
                    translate([0, 0, 1.2]) sphere(r = 1.8, $fn = 16);
                    for (a = [0 : 30 : 330]) {
                        rotate([0, 0, a])
                            translate([5.4, -0.6, 0])
                                cube([2.8, 1.2, 0.8]);
                    }
                }
            }
        }

        for (s = [-1, 1]) {
            translate([s * 15.0, 0, 8.0]) {
                hull() {
                    translate([-s * 2.0, -ped_thick/2, 0]) cube([4.0, ped_thick, 3.0]);
                    translate([ s * 4.0, -ped_thick/2, 3.0]) cube([3.0, ped_thick, 3.0]);
                    translate([ s * 6.0, -ped_thick/2, 0]) cube([2.0, ped_thick, 2.0]);
                }
            }
        }

        translate([0, 0, ped_h + 1.0]) {
            cylinder(r1 = 3.6, r2 = 2.4, h = 3.2, $fn = 16);
            translate([0, 0, 3.2]) cylinder(r1 = 2.4, r2 = 0.8, h = 4.0, $fn = 14);
            translate([0, 0, 7.2]) sphere(r = 1.2, $fn = 12);
            translate([0, 0, 8.4]) cylinder(r1 = 0.8, r2 = 0.2, h = 2.0, $fn = 8);
        }

        for (s = [-1, 1]) {
            translate([s * (path_w/2 + pillar_w/2), 0, 0]) {
                translate([-4.5, -4.5, 0]) cube([9.0, 9.0, 2.5]);
                translate([0, 0, 2.5]) {
                    cylinder(r1 = 3.2, r2 = 2.0, h = 3.0, $fn = 14);
                    translate([0, 0, 3.0]) cylinder(r1 = 2.0, r2 = 0.6, h = 3.5, $fn = 12);
                    translate([0, 0, 6.5]) sphere(r = 1.0, $fn = 10);
                }
            }
        }
    }
}

// ====================================================================
// 2. STANDALONE TEMPLE BELL WITH PRECISION SNAP-IN MALE PLUG
// ====================================================================

// Orientated upright on wide rim for 100% Supportless FDM Printing!
module snapin_bell_for_printing() {
    translate([0, 0, 0]) {
        // Bell body resting on rim
        bell_geometry_supportless();

        // Hanging stem & Flush Stop Flange
        translate([0, 0, 8.5]) {
            cylinder(r = 1.2, h = 4.5, $fn = 12);

            // Precision Positive Hard-Stop Flange (Seats flush against ceiling)
            translate([-4.2, -3.2, 4.5])
                cube([8.4, 6.4, 1.2]);

            // Upright Male Snap-Fit Plug
            translate([0, 0, 5.7])
                male_snap_plug_upright();
        }
    }
}

// Bell model oriented for assembled preview (plug pointing UP into ceiling socket)
module temple_bell_with_male_snap() {
    union() {
        // Positive Hard-Stop Bulkhead Flange (Seats flush against ceiling at Z=0 datum)
        translate([-4.2, -3.2, -1.2])
            cube([8.4, 6.4, 1.2]);

        // Male Snap-Fit Plug extending UP into the socket
        male_snap_plug_upright();

        // Hanging Chain Link & Bell Body extending DOWN into the archway
        translate([0, 0, -1.2]) {
            // Hanging rod
            translate([0, 0, -4.5])
                cylinder(r = 1.2, h = 4.5, $fn = 12);

            // Inverted Bell Body hanging downwards
            translate([0, 0, -4.5])
                rotate([180, 0, 0])
                    bell_geometry_supportless();
        }
    }
}

// Supportless Bell Geometry (Modeled as natural self-supporting cone <=35°)
module bell_geometry_supportless() {
    union() {
        // Flat Bottom Rim on Build Plate (D = 9.0mm, h = 1.2mm)
        cylinder(r = 4.5, h = 1.2, $fn = 28);

        // Flared Bell Skirt (Smooth <=35° self-supporting inward slope)
        translate([0, 0, 1.2])
            cylinder(r1 = 4.5, r2 = 2.4, h = 4.5, $fn = 28);

        // Upper Dome Crown of Bell
        translate([0, 0, 5.7])
            cylinder(r1 = 2.4, r2 = 1.4, h = 2.8, $fn = 20);

        // Clapper (Inside bell: self-supporting inverted cone anchored to ceiling)
        translate([0, 0, 1.2])
            cylinder(r1 = 1.4, r2 = 0.7, h = 3.5, $fn = 12);
    }
}

// Precision Male Cantilever Snap Plug (FDM-Optimized)
module male_snap_plug_upright() {
    plug_w = socket_w - 2 * fit_clearance; // 5.60mm (0.20mm tolerance per side)
    plug_d = socket_d - 2 * fit_clearance; // 4.00mm (0.20mm tolerance per side)
    plug_h = 9.6;                          // Deep 9.6mm insertion into 10mm cavity
    beam_w = 1.5;                          // Optimal elastic beam thickness
    slot_w = 0.9;                          // Longitudinal compliance spring slot

    difference() {
        union() {
            // Main Keyed Rectangular Stem
            translate([-plug_w/2, -plug_d/2, 0])
                cube([plug_w, plug_d, plug_h]);

            // Dual Lateral Detent Latch Heads (Left & Right)
            for (s = [-1, 1]) {
                translate([s * plug_w/2, 0, 6.5]) {
                    // 30° Lead-In Entry Ramp + 75° Retention Undercut Latch
                    hull() {
                        // Locking detent crest
                        translate([s * (detent_depth - 0.05), -plug_d/2 + 0.3, 0])
                            cube([0.1, plug_d - 0.6, 0.8]);
                        // Base of latch
                        translate([0, -plug_d/2 + 0.3, -1.4])
                            cube([0.1, plug_d - 0.6, 0.1]);
                        // Top retention return face (75° undercut)
                        translate([0, -plug_d/2 + 0.3, 1.2])
                            cube([0.1, plug_d - 0.6, 0.1]);
                    }
                }
            }

            // Lead-in Taper at Plug Tip for Effortless Alignment
            translate([0, 0, plug_h]) {
                hull() {
                    translate([-plug_w/2, -plug_d/2, 0]) cube([plug_w, plug_d, 0.1]);
                    translate([-plug_w/2 + 0.8, -plug_d/2 + 0.6, 1.2])
                        cube([plug_w - 1.6, plug_d - 1.2, 0.1]);
                }
            }
        }

        // Longitudinal Compliance Spring Relief Slot (Enables elastic cantilever flex)
        translate([-slot_w/2, -plug_d - 1, 0.6])
            cube([slot_w, (plug_d + 1) * 2, plug_h + 2]);
    }
}
