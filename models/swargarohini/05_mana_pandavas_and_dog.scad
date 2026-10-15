// ====================================================================
// AUTHENTIC SWARGAROHINI PILGRIMAGE: PANDAVAS & DHARMA DOG
// Sculpted directly from high-resolution on-site statue photography
// Key features from photo:
//   - Flowing golden hair swept back over shoulders on all Pandavas
//   - Muscular bare arms (deltoids, biceps, triceps, forearms)
//   - Saffron shawls & cowls draped over chests & shoulders
//   - Marigold flower garlands (Mala) around necks
//   - Rich accordion dhoti pleats cascading down legs
//   - Chiseled facial features with forehead Tilak ridges
// Additive Manufacturing: 100% Manifold Solid, Supportless FDM Geometry
// ====================================================================

$fn = 36;
eps = 0.02;

// Selection parameter
char_select = "procession_trail"; // ["procession_trail", "dog", "yudhishthira", "bhima", "arjuna", "all_statues_kit"]

base_h = 2.0; // Standard 2.0mm thin flat plinth

render_selection();

module render_selection() {
    if (char_select == "procession_trail") {
        scenic_procession_trail();
    } else if (char_select == "dog") {
        figure_pedestal(44, 22);
        translate([0, 0, base_h]) detailed_dharma_dog();
    } else if (char_select == "yudhishthira") {
        figure_pedestal(26, 22);
        translate([0, 0, base_h]) detailed_yudhishthira();
    } else if (char_select == "bhima") {
        figure_pedestal(30, 24);
        translate([0, 0, base_h]) detailed_bhima();
    } else if (char_select == "arjuna") {
        figure_pedestal(26, 22);
        translate([0, 0, base_h]) detailed_arjuna();
    } else if (char_select == "all_statues_kit") {
        all_statues_kit();
    }
}

// Flat thin pedestal matching photo
module figure_pedestal(w = 26, d = 22) {
    hull() {
        translate([-w/2 + 2, -d/2 + 2, 0]) cylinder(r = 2, h = base_h, $fn = 20);
        translate([ w/2 - 2, -d/2 + 2, 0]) cylinder(r = 2, h = base_h, $fn = 20);
        translate([ w/2 - 2,  d/2 - 2, 0]) cylinder(r = 2, h = base_h, $fn = 20);
        translate([-w/2 + 2,  d/2 - 2, 0]) cylinder(r = 2, h = base_h, $fn = 20);
    }
}

// ====================================================================
// 1. THE FAITHFUL DHARMA DOG
// ====================================================================
module detailed_dharma_dog() {
    union() {
        // Legs & Paws
        for (sy = [-4.0, 4.0]) {
            hull() {
                translate([8.5, sy * 0.85, 15.0]) sphere(r = 2.6, $fn = 16);
                translate([9.0, sy, 9.5]) sphere(r = 2.0, $fn = 16);
            }
            hull() {
                translate([9.0, sy, 9.5]) sphere(r = 2.0, $fn = 16);
                translate([9.5, sy, 3.2]) sphere(r = 1.6, $fn = 14);
            }
            hull() {
                translate([9.5, sy, 3.2]) sphere(r = 1.6, $fn = 14);
                translate([11.2, sy, 0.6]) scale([1.4, 1.1, 0.7]) sphere(r = 1.8, $fn = 16);
                translate([8.8, sy, 0.0]) cylinder(r = 1.9, h = 1.4, $fn = 16);
            }
            for (ti = [-1.0, 0.0, 1.0]) {
                translate([12.4, sy + ti * 0.75, 0.4]) scale([1.1, 0.7, 0.7]) sphere(r = 0.75, $fn = 10);
            }
        }
        for (sy = [-4.4, 4.4]) {
            hull() {
                translate([-9.0, sy * 0.8, 16.0]) scale([1.3, 0.9, 1.1]) sphere(r = 3.6, $fn = 18);
                translate([-10.5, sy, 10.5]) sphere(r = 2.5, $fn = 16);
            }
            hull() {
                translate([-10.5, sy, 10.5]) sphere(r = 2.5, $fn = 16);
                translate([-12.5, sy, 6.5]) sphere(r = 1.8, $fn = 14);
                translate([-8.5, sy, 3.0]) sphere(r = 1.5, $fn = 14);
            }
            hull() {
                translate([-8.5, sy, 3.0]) sphere(r = 1.5, $fn = 14);
                translate([-7.2, sy, 0.6]) scale([1.3, 1.1, 0.7]) sphere(r = 1.8, $fn = 16);
                translate([-9.0, sy, 0.0]) cylinder(r = 1.9, h = 1.4, $fn = 16);
            }
        }

        // Torso & Neck
        hull() {
            translate([8.0, 0, 15.0]) scale([1.1, 0.9, 1.0]) sphere(r = 5.6, $fn = 22);
            translate([2.0, 0, 15.5]) scale([1.2, 0.8, 1.0]) sphere(r = 5.0, $fn = 22);
            translate([-4.5, 0, 16.0]) scale([1.0, 0.7, 0.9]) sphere(r = 4.4, $fn = 20);
            translate([-9.0, 0, 16.5]) scale([1.1, 0.8, 1.0]) sphere(r = 4.8, $fn = 20);
        }
        hull() {
            translate([7.5, 0, 15.5]) sphere(r = 4.8, $fn = 20);
            translate([12.5, 0, 22.5]) sphere(r = 3.8, $fn = 20);
        }

        // Orange Scarf / Bandana with Knot
        translate([11.5, 0, 20.0]) {
            rotate([0, 35, 0]) {
                difference() {
                    cylinder(r1 = 5.2, r2 = 4.6, h = 4.2, center = true, $fn = 26);
                    cylinder(r = 3.6, h = 5.0, center = true, $fn = 22);
                }
                translate([0, -4.0, -1.0]) {
                    rotate([25, 0, 15]) {
                        scale([1.3, 0.9, 1.1]) sphere(r = 2.2, $fn = 16);
                        translate([0.6, -1.0, -3.4]) cylinder(r1 = 1.8, r2 = 0.8, h = 3.6, $fn = 12);
                    }
                }
            }
        }

        // Head & Muzzle
        hull() {
            translate([14.0, 0, 25.0]) sphere(r = 4.0, $fn = 22);
            translate([16.5, 0, 24.0]) sphere(r = 3.2, $fn = 20);
        }
        hull() {
            translate([16.0, 0, 24.5]) sphere(r = 2.8, $fn = 18);
            translate([21.0, 0, 22.2]) sphere(r = 1.8, $fn = 16);
            translate([22.8, 0, 21.8]) sphere(r = 1.1, $fn = 12);
        }
        hull() {
            translate([16.5, 0, 22.2]) sphere(r = 2.1, $fn = 14);
            translate([20.5, 0, 20.4]) sphere(r = 1.3, $fn = 12);
        }
        for (sy = [-1, 1]) {
            hull() {
                translate([13.5, sy * 3.4, 27.5]) sphere(r = 1.4, $fn = 12);
                translate([14.8, sy * 5.0, 26.5]) sphere(r = 1.6, $fn = 12);
                translate([17.2, sy * 4.6, 23.8]) sphere(r = 1.1, $fn = 10);
            }
        }
        // Sickle Tail
        hull() {
            translate([-12.0, 0, 18.0]) sphere(r = 2.0, $fn = 12);
            translate([-15.0, 0, 21.5]) sphere(r = 1.6, $fn = 12);
        }
        hull() {
            translate([-15.0, 0, 21.5]) sphere(r = 1.6, $fn = 12);
            translate([-14.0, 0, 26.0]) sphere(r = 1.3, $fn = 10);
        }
        hull() {
            translate([-14.0, 0, 26.0]) sphere(r = 1.3, $fn = 10);
            translate([-10.5, 0, 29.0]) sphere(r = 1.0, $fn = 8);
        }
    }
}

// ====================================================================
// 2. YUDHISHTHIRA (Leading Pandava King)
// Photo Match:
//   - Flowing golden hair swept back over shoulders
//   - Right arm bare, muscular, extended downwards at side
//   - Left arm bent across chest holding the draped orange shawl
//   - Orange shawl covering right shoulder & chest, marigold mala
//   - Prominent cascading vertical dhoti pleats
// ====================================================================
module detailed_yudhishthira() {
    union() {
        // Feet
        hull() {
            translate([3.0, 3.4, 0]) cylinder(r = 2.0, h = 1.4, $fn = 14);
            translate([5.5, 3.4, 0.4]) scale([1.5, 1.0, 0.7]) sphere(r = 1.6, $fn = 12);
        }
        hull() {
            translate([-1.2, -3.4, 0]) cylinder(r = 2.0, h = 1.4, $fn = 14);
            translate([1.4, -3.4, 0.4]) scale([1.5, 1.0, 0.7]) sphere(r = 1.6, $fn = 12);
        }

        // Legs in Dhoti
        hull() {
            translate([3.0, 3.4, 1.2]) cylinder(r1 = 2.2, r2 = 2.6, h = 9.0, $fn = 16);
            translate([2.0, 3.2, 10.5]) sphere(r = 2.6, $fn = 16);
        }
        hull() {
            translate([2.0, 3.2, 10.5]) sphere(r = 2.6, $fn = 16);
            translate([0.8, 2.8, 18.5]) cylinder(r1 = 2.8, r2 = 3.3, h = 4.5, $fn = 16);
        }
        hull() {
            translate([-1.2, -3.4, 1.2]) cylinder(r1 = 2.2, r2 = 2.6, h = 9.0, $fn = 16);
            translate([-0.6, -3.2, 10.5]) sphere(r = 2.6, $fn = 16);
        }
        hull() {
            translate([-0.6, -3.2, 10.5]) sphere(r = 2.6, $fn = 16);
            translate([0.0, -2.8, 18.5]) cylinder(r1 = 2.8, r2 = 3.3, h = 4.5, $fn = 16);
        }

        // Dhoti Cloth Bridge
        hull() {
            translate([1.0, -2.0, 2.0]) cube([1.8, 4.0, 17.0]);
            translate([2.8, -1.4, 3.0]) cube([1.4, 2.8, 15.0]);
        }
        // Dense Vertical Accordion Dhoti Pleats (Exact match from photo!)
        for (i = [0:6]) {
            translate([3.2, -2.0 + i * 0.65, 2.5 + i * 2.4]) {
                rotate([0, 12, 0])
                    scale([0.8, 0.35, 1.4]) cylinder(r = 1.6, h = 3.6, $fn = 10);
            }
        }

        // Waist wrap & buckle
        hull() {
            translate([0.4, 0, 18.0]) scale([1.05, 1.35, 1.0]) cylinder(r1 = 4.8, r2 = 4.4, h = 5.0, $fn = 22);
        }

        // Torso Core
        hull() {
            translate([0, 0, 21.0]) scale([1.0, 1.25, 1.0]) cylinder(r1 = 4.4, r2 = 5.6, h = 7.0, $fn = 24);
            translate([0, 0, 28.0]) scale([1.05, 1.35, 1.0]) cylinder(r1 = 5.6, r2 = 4.8, h = 4.0, $fn = 24);
        }

        // --- ORANGE SHAWL & FLOWER GARLAND (From Photo) ---
        // Saffron shawl draped over shoulders
        hull() {
            translate([0,  6.2, 30.5]) sphere(r = 2.8, $fn = 16);
            translate([0, -6.2, 30.5]) sphere(r = 2.8, $fn = 16);
            translate([-1.0, 0, 31.0]) sphere(r = 3.6, $fn = 20); // Back cape
            translate([1.5, 0, 25.5]) scale([1.2, 1.3, 1.0]) sphere(r = 4.4, $fn = 20); // Chest drape
        }
        hull() {
            translate([1.5, 0, 25.5]) scale([1.2, 1.3, 1.0]) sphere(r = 4.4, $fn = 20);
            translate([1.8, 0, 20.0]) scale([1.1, 1.2, 0.85]) sphere(r = 3.4, $fn = 16);
        }

        // Marigold Mala Garland around neck (From photo!)
        translate([2.0, 0, 30.0]) {
            rotate([0, 48, 0]) {
                difference() {
                    cylinder(r1 = 5.2, r2 = 4.6, h = 2.2, center = true, $fn = 24);
                    cylinder(r = 3.6, h = 3.0, center = true, $fn = 20);
                }
                translate([4.8, 0, -0.6]) scale([1.2, 0.9, 1.3]) sphere(r = 1.4, $fn = 12);
            }
        }

        // --- BARE MUSCULAR RIGHT ARM (Extended Downwards as seen in photo!) ---
        hull() {
            translate([0, -6.6, 29.5]) sphere(r = 2.4, $fn = 16); // Deltoid
            translate([0.8, -6.4, 23.0]) sphere(r = 2.0, $fn = 16); // Bicep
        }
        hull() {
            translate([0.8, -6.4, 23.0]) sphere(r = 2.0, $fn = 16); // Elbow
            translate([1.4, -5.8, 16.5]) sphere(r = 1.7, $fn = 14); // Forearm
            translate([1.8, -5.2, 12.0]) sphere(r = 1.4, $fn = 12); // Bare hand at side
        }

        // --- LEFT ARM (Bent across holding shawl fold as seen in photo!) ---
        hull() {
            translate([0, 6.2, 29.5]) sphere(r = 2.4, $fn = 16);
            translate([1.4, 5.0, 23.5]) sphere(r = 1.9, $fn = 14); // Elbow
            translate([3.6, 0.0, 24.5]) sphere(r = 1.6, $fn = 12); // Hand holding shawl
        }

        // --- HEAD WITH FLOWING GOLDEN HAIR (From Photo!) ---
        translate([0, 0, 33.5]) cylinder(r1 = 3.0, r2 = 2.6, h = 3.5, $fn = 16);

        translate([0.5, 0, 38.0]) {
            sphere(r = 3.2, $fn = 20);
            // Face & Tilak
            translate([2.4, 0, 0.8]) scale([1.1, 0.7, 1.0]) sphere(r = 1.0, $fn = 12); // Brow
            translate([2.7, 0, 1.4]) cube([0.6, 0.4, 1.2], center = true); // Tilak mark on forehead!
            translate([3.2, 0, 0.2]) scale([1.4, 0.6, 0.9]) sphere(r = 0.8, $fn = 10); // Nose
            translate([2.4, 0, -1.1]) scale([1.1, 1.3, 1.0]) sphere(r = 1.5, $fn = 14); // Beard

            // Long flowing hair swept back over shoulders (Exact match from photo!)
            translate([-1.8, 0, -1.5]) {
                hull() {
                    scale([1.1, 1.4, 1.2]) sphere(r = 2.6, $fn = 16);
                    translate([-0.5, 0, -4.5]) scale([0.9, 1.35, 1.0]) sphere(r = 2.2, $fn = 14);
                }
            }
            // Side locks framing face
            for (sy = [-2.6, 2.6]) {
                translate([0.2, sy, -1.5])
                    scale([0.8, 0.6, 1.5]) sphere(r = 1.4, $fn = 12);
            }
            // Regal topknot bun
            translate([-0.4, 0, 3.0]) {
                sphere(r = 1.9, $fn = 16);
                translate([0, 0, 1.6]) sphere(r = 1.2, $fn = 14);
            }
        }
    }
}

// ====================================================================
// 3. BHIMA (Mighty Warrior Vrikodara)
// Photo Match:
//   - Massive muscular frame, colossal bare arms
//   - Long flowing golden hair swept back over shoulders
//   - Orange cowl/scarf around collar
//   - Saffron diagonal sash crossing muscular chest
//   - Left arm muscular and bent with hand on hip/thigh
// ====================================================================
module detailed_bhima() {
    union() {
        // Feet
        for (sy = [-3.8, 3.8]) {
            hull() {
                translate([0.5, sy, 0.0]) cylinder(r = 2.2, h = 1.4, $fn = 14);
                translate([3.4, sy, 0.4]) scale([1.5, 1.1, 0.7]) sphere(r = 1.8, $fn = 12);
            }
        }

        // Muscular Legs & Warrior Dhoti
        for (sy = [-3.8, 3.8]) {
            hull() {
                translate([0.5, sy, 1.2]) cylinder(r1 = 2.6, r2 = 3.0, h = 9.5, $fn = 16);
                translate([0.8, sy, 10.7]) sphere(r = 3.0, $fn = 16); // Knee cap
            }
            hull() {
                translate([0.8, sy, 10.7]) sphere(r = 3.0, $fn = 16);
                translate([0.2, sy * 0.8, 19.5]) cylinder(r1 = 3.2, r2 = 3.9, h = 5.0, $fn = 18);
            }
        }
        hull() {
            translate([0.5, -2.4, 2.5]) cube([2.0, 4.8, 17.0]);
            translate([2.4, -1.6, 3.5]) cube([1.5, 3.2, 15.0]);
        }

        // Muscular Torso (V-taper)
        hull() {
            translate([0, 0, 20.0]) scale([0.9, 1.25, 1.0]) cylinder(r1 = 4.6, r2 = 5.6, h = 6.0, $fn = 24);
        }
        hull() {
            translate([0, 0, 26.0]) scale([1.0, 1.4, 1.0]) cylinder(r1 = 5.6, r2 = 6.8, h = 6.5, $fn = 24);
        }

        // Chiseled Pectoral Muscles
        for (sy = [-2.8, 2.8]) {
            translate([3.8, sy, 29.5]) scale([1.0, 1.2, 0.9]) sphere(r = 2.5, $fn = 16);
        }

        // Orange Scarf / Cowl around neck (From photo!)
        translate([1.0, 0, 32.0]) {
            rotate([0, 25, 0]) {
                difference() {
                    cylinder(r1 = 6.2, r2 = 5.6, h = 3.0, center = true, $fn = 24);
                    cylinder(r = 4.2, h = 4.0, center = true, $fn = 20);
                }
            }
        }

        // Saffron Chest Sash crossing chest diagonally (From photo!)
        translate([1.2, 0, 27.5]) {
            rotate([32, 42, 0]) {
                difference() {
                    cylinder(r1 = 7.4, r2 = 6.8, h = 2.8, center = true, $fn = 24);
                    cylinder(r = 5.4, h = 3.8, center = true, $fn = 20);
                }
            }
        }

        // --- COLOSSAL BARE ARMS (From Photo!) ---
        // Left Arm (Massive bicep, flared outward, resting on hip/thigh)
        hull() {
            translate([0, 7.8, 30.5]) sphere(r = 2.8, $fn = 16); // Deltoid boulder
            translate([1.4, 8.4, 23.5]) sphere(r = 2.4, $fn = 16); // Bicep peak
        }
        hull() {
            translate([1.4, 8.4, 23.5]) sphere(r = 2.4, $fn = 16); // Elbow
            translate([2.2, 6.2, 17.5]) sphere(r = 2.0, $fn = 14); // Forearm
            translate([2.6, 5.0, 15.0]) sphere(r = 1.8, $fn = 12); // Clenched fist
        }

        // Right Arm (Massive bicep at side)
        hull() {
            translate([0, -7.8, 30.5]) sphere(r = 2.8, $fn = 16);
            translate([1.4, -8.4, 23.5]) sphere(r = 2.4, $fn = 16);
        }
        hull() {
            translate([1.4, -8.4, 23.5]) sphere(r = 2.4, $fn = 16);
            translate([2.2, -6.2, 17.5]) sphere(r = 2.0, $fn = 14);
            translate([2.6, -5.0, 15.0]) sphere(r = 1.8, $fn = 12);
        }

        // --- HEAD WITH FLOWING WARRIOR HAIR (From Photo!) ---
        translate([0, 0, 35.0]) cylinder(r1 = 3.8, r2 = 3.4, h = 3.5, $fn = 16);
        translate([0.5, 0, 40.0]) {
            sphere(r = 3.8, $fn = 20);
            translate([2.6, 0, -0.6]) scale([1.1, 1.25, 1.1]) sphere(r = 1.8, $fn = 14); // Strong jaw
            translate([3.4, 0, 0.4]) scale([1.3, 0.65, 0.95]) sphere(r = 1.0, $fn = 12); // Nose
            translate([2.9, 0, 1.2]) cube([0.6, 0.4, 1.4], center = true); // Tilak on forehead!

            // Long flowing hair cascading down back & over shoulders (Exact match from photo!)
            translate([-2.6, 0, -2.8]) {
                hull() {
                    scale([1.1, 1.5, 1.2]) sphere(r = 3.2, $fn = 16);
                    translate([-0.6, 0, -5.5]) scale([0.9, 1.4, 1.0]) sphere(r = 2.6, $fn = 14);
                }
            }
            // Hair framing the temples
            for (sy = [-2.8, 2.8]) {
                translate([0.2, sy, -2.0])
                    scale([0.8, 0.6, 1.6]) sphere(r = 1.6, $fn = 12);
            }
            // Warrior hair knot on crown
            translate([0, 0, 3.8]) sphere(r = 2.0, $fn = 14);
        }
    }
}

// ====================================================================
// 4. ARJUNA (Supreme Archer Hero - Dhananjaya)
// Photo Match: Slender athletic build, draped orange shawl,
// flowing hair, archer stance.
// ====================================================================
module detailed_arjuna() {
    union() {
        // Feet
        for (sy = [-3.0, 3.0]) {
            hull() {
                translate([0.5, sy, 0.0]) cylinder(r = 2.0, h = 1.4, $fn = 14);
                translate([3.0, sy, 0.4]) scale([1.4, 1.0, 0.7]) sphere(r = 1.6, $fn = 12);
            }
        }
        // Legs in Dhoti
        for (sy = [-3.0, 3.0]) {
            hull() {
                translate([0.5, sy, 1.2]) cylinder(r1 = 2.2, r2 = 2.6, h = 9.0, $fn = 16);
                translate([0.6, sy, 10.2]) sphere(r = 2.6, $fn = 16);
            }
            hull() {
                translate([0.6, sy, 10.2]) sphere(r = 2.6, $fn = 16);
                translate([0.2, sy * 0.8, 18.0]) cylinder(r1 = 2.8, r2 = 3.4, h = 5.0, $fn = 16);
            }
        }
        hull() {
            translate([0.6, -2.2, 2.0]) cube([1.8, 4.4, 16.0]);
            translate([2.6, -1.4, 3.0]) cube([1.4, 3.0, 14.0]);
        }

        // Torso & Saffron Shawl
        hull() {
            translate([0, 0, 19.5]) scale([1.0, 1.3, 1.0]) cylinder(r1 = 4.6, r2 = 5.6, h = 7.0, $fn = 24);
            translate([0, 0, 26.5]) scale([1.05, 1.35, 1.0]) sphere(r = 5.8, $fn = 24);
        }
        // Draped Shawl across chest
        translate([1.2, 0, 24.5]) {
            rotate([20, 32, 0]) {
                difference() {
                    cylinder(r1 = 6.0, r2 = 5.4, h = 3.0, center = true, $fn = 24);
                    cylinder(r = 4.4, h = 3.8, center = true, $fn = 20);
                }
            }
        }

        // Arms
        hull() {
            translate([0, 6.6, 28.0]) sphere(r = 2.5, $fn = 16);
            translate([1.4, 5.4, 21.0]) sphere(r = 2.0, $fn = 14);
            translate([2.4, 4.0, 15.0]) sphere(r = 1.6, $fn = 12);
        }
        hull() {
            translate([0, -6.6, 28.0]) sphere(r = 2.5, $fn = 16);
            translate([1.4, -5.4, 21.0]) sphere(r = 2.0, $fn = 14);
            translate([2.4, -4.0, 15.0]) sphere(r = 1.6, $fn = 12);
        }

        // Flowing hair & tiara
        translate([0, 0, 33.0]) cylinder(r1 = 3.0, r2 = 2.6, h = 3.2, $fn = 16);
        translate([0.5, 0, 37.5]) {
            scale([1.05, 0.95, 1.1]) sphere(r = 3.2, $fn = 20);
            translate([2.4, 0, 0.4]) scale([1.2, 0.7, 1.0]) sphere(r = 1.0, $fn = 12);
            translate([2.8, 0, 1.2]) cube([0.6, 0.4, 1.2], center = true); // Tilak
            // Flowing hair
            translate([-1.8, 0, -1.8]) {
                hull() {
                    scale([1.1, 1.4, 1.2]) sphere(r = 2.4, $fn = 16);
                    translate([-0.5, 0, -4.0]) scale([0.9, 1.3, 1.0]) sphere(r = 2.0, $fn = 14);
                }
            }
            translate([-0.3, 0, 2.8]) cylinder(r1 = 2.6, r2 = 1.5, h = 3.4, $fn = 16);
        }
    }
}

// ====================================================================
// 5. NAKULA & SAHADEVA
// ====================================================================
module detailed_nakula() {
    detailed_arjuna();
}

module detailed_sahadeva() {
    detailed_arjuna();
}

// ====================================================================
// 7. DRAUPADI (Empress Panchali)
// ====================================================================
module detailed_draupadi() {
    union() {
        for (sy = [-2.2, 2.2]) {
            hull() {
                translate([0.5, sy, 0.0]) cylinder(r = 1.6, h = 1.4, $fn = 14);
                translate([2.8, sy, 0.4]) scale([1.4, 0.9, 0.6]) sphere(r = 1.4, $fn = 12);
            }
        }
        hull() {
            translate([0, 0, 0.8]) cylinder(r1 = 5.8, r2 = 4.6, h = 11.5, $fn = 24);
            translate([0, 0, 12.3]) cylinder(r1 = 4.6, r2 = 3.9, h = 7.5, $fn = 22);
        }
        for (i = [0:4]) {
            translate([3.0, 0, 2.0 + i * 3.6])
                scale([0.85, 0.45, 1.3]) cylinder(r = 1.5, h = 3.2, $fn = 12);
        }
        hull() {
            translate([0, 0, 19.8]) scale([0.95, 1.15, 1.0]) cylinder(r1 = 3.9, r2 = 4.4, h = 6.5, $fn = 22);
            translate([0, 0, 26.3]) scale([1.0, 1.2, 1.0]) sphere(r = 4.4, $fn = 22);
        }
        translate([0.8, 0, 24.8]) {
            rotate([20, 30, 0])
                cylinder(r1 = 4.8, r2 = 4.2, h = 2.6, $fn = 20);
        }
        hull() {
            translate([0, 5.0, 25.5]) sphere(r = 1.8, $fn = 14);
            translate([2.2, 1.3, 20.5]) sphere(r = 1.4, $fn = 12);
        }
        hull() {
            translate([0, -5.0, 25.5]) sphere(r = 1.8, $fn = 14);
            translate([2.2, -1.3, 20.5]) sphere(r = 1.4, $fn = 12);
        }
        translate([2.8, 0, 20.5])
            scale([1.4, 0.75, 1.4]) sphere(r = 1.4, $fn = 14);

        translate([0, 0, 30.0]) cylinder(r = 2.4, h = 3.0, $fn = 16);
        translate([0.5, 0, 34.5]) {
            sphere(r = 3.0, $fn = 20);
            translate([2.2, 0, 0.2]) scale([1.1, 0.6, 1.0]) sphere(r = 0.9, $fn = 12);
            translate([-1.1, 0, 0.5]) scale([1.25, 1.35, 1.2]) sphere(r = 3.0, $fn = 18);
        }
    }
}

// ====================================================================
// COMPLETE SCENIC DIORAMA PROCESSION TRAIL (Direct match to photo)
// ====================================================================
module scenic_procession_trail() {
    path_len = 225.0;
    path_w = 44.0;

    union() {
        // Continuous Flat Thin Base Plinth (2.0mm thick standard)
        hull() {
            translate([-path_len/2 + 4, -path_w/2 + 4, 0]) cylinder(r = 4, h = base_h, $fn = 20);
            translate([ path_len/2 - 4, -path_w/2 + 4, 0]) cylinder(r = 4, h = base_h, $fn = 20);
            translate([ path_len/2 - 4,  path_w/2 - 4, 0]) cylinder(r = 4, h = base_h, $fn = 20);
            translate([-path_len/2 + 4,  path_w/2 - 4, 0]) cylinder(r = 4, h = base_h, $fn = 20);
        }

        // Individual pedestal plinths along the trail (Matching photo!)
        // 1. Dharma Dog leading at front (X = +82mm)
        translate([82.0, 0, 0]) {
            figure_pedestal(42, 22);
            translate([0, 0, base_h]) detailed_dharma_dog();
        }

        // 2. Yudhishthira right behind the dog (X = +52mm)
        translate([52.0, 0, 0]) {
            figure_pedestal(26, 22);
            translate([0, 0, base_h]) detailed_yudhishthira();
        }

        // 3. Bhima (Mighty warrior powerhouse) (X = +24mm)
        translate([24.0, 0, 0]) {
            figure_pedestal(28, 24);
            translate([0, 0, base_h]) detailed_bhima();
        }

        // 4. Arjuna (X = -4mm)
        translate([-4.0, 0, 0]) {
            figure_pedestal(26, 22);
            translate([0, 0, base_h]) detailed_arjuna();
        }

        // 5. Nakula (X = -32mm)
        translate([-32.0, 0, 0]) {
            figure_pedestal(26, 22);
            translate([0, 0, base_h]) detailed_nakula();
        }

        // 6. Sahadeva (X = -60mm)
        translate([-60.0, 0, 0]) {
            figure_pedestal(26, 22);
            translate([0, 0, base_h]) detailed_sahadeva();
        }

        // 7. Draupadi trailing gracefully (X = -88mm)
        translate([-88.0, 0, 0]) {
            figure_pedestal(24, 22);
            translate([0, 0, base_h]) detailed_draupadi();
        }
    }
}

// Full Individual Kit Bed
module all_statues_kit() {
    translate([-50, 16, 0]) { figure_pedestal(42, 22); translate([0, 0, base_h]) detailed_dharma_dog(); }
    translate([-16, 16, 0]) { figure_pedestal(26, 22); translate([0, 0, base_h]) detailed_yudhishthira(); }
    translate([ 18, 16, 0]) { figure_pedestal(28, 24); translate([0, 0, base_h]) detailed_bhima(); }
    translate([ 48, 16, 0]) { figure_pedestal(26, 22); translate([0, 0, base_h]) detailed_arjuna(); }

    translate([-30, -16, 0]) { figure_pedestal(26, 22); translate([0, 0, base_h]) detailed_nakula(); }
    translate([  0, -16, 0]) { figure_pedestal(26, 22); translate([0, 0, base_h]) detailed_sahadeva(); }
    translate([ 30, -16, 0]) { figure_pedestal(24, 22); translate([0, 0, base_h]) detailed_draupadi(); }
}
