// ====================================================================
// AUTHENTIC SWARGAROHINI PILGRIMAGE: PANDAVAS & DHARMA DOG
// Hand-sculpted from on-site photography at Mana Village, Uttarakhand
// 100% Manifold Solid, Supportless FDM Geometry, High Anatomical Detail
// ====================================================================

$fn = 36;
eps = 0.02;

// Selection parameter
char_select = "procession_trail"; // ["procession_trail", "dog", "yudhishthira", "bhima", "arjuna", "draupadi", "all_statues_kit"]

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
        figure_pedestal(28, 24);
        translate([0, 0, base_h]) detailed_bhima();
    } else if (char_select == "arjuna") {
        figure_pedestal(26, 22);
        translate([0, 0, base_h]) detailed_arjuna();
    } else if (char_select == "draupadi") {
        figure_pedestal(24, 22);
        translate([0, 0, base_h]) detailed_draupadi();
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
// 1. THE FAITHFUL DHARMA DOG (Detailed Himalayan Mountain Hound)
// ====================================================================
module detailed_dharma_dog() {
    union() {
        // --- 4 LEGS WITH PAW TOES & METATARSALS ---
        // Front Left & Right Legs
        for (sy = [-4.0, 4.0]) {
            // Muscular Shoulder & Scapula
            hull() {
                translate([8.5, sy * 0.85, 15.0]) sphere(r = 2.6, $fn = 16);
                translate([9.0, sy, 9.5]) sphere(r = 2.0, $fn = 16);
            }
            // Forearm & Carpus (Wrist)
            hull() {
                translate([9.0, sy, 9.5]) sphere(r = 2.0, $fn = 16);
                translate([9.5, sy, 3.2]) sphere(r = 1.6, $fn = 14);
            }
            // Grounded Paw with Padded Toes
            hull() {
                translate([9.5, sy, 3.2]) sphere(r = 1.6, $fn = 14);
                translate([11.2, sy, 0.6]) scale([1.4, 1.1, 0.7]) sphere(r = 1.8, $fn = 16);
                translate([8.8, sy, 0.0]) cylinder(r = 1.9, h = 1.4, $fn = 16);
            }
            // Individual toe details
            for (ti = [-1.0, 0.0, 1.0]) {
                translate([12.4, sy + ti * 0.75, 0.4]) scale([1.1, 0.7, 0.7]) sphere(r = 0.75, $fn = 10);
            }
        }

        // Hind Left & Right Legs
        for (sy = [-4.4, 4.4]) {
            // Muscular Haunch & Upper Thigh
            hull() {
                translate([-9.0, sy * 0.8, 16.0]) scale([1.3, 0.9, 1.1]) sphere(r = 3.6, $fn = 18);
                translate([-10.5, sy, 10.5]) sphere(r = 2.5, $fn = 16);
            }
            // Hock angle & metatarsus
            hull() {
                translate([-10.5, sy, 10.5]) sphere(r = 2.5, $fn = 16);
                translate([-12.5, sy, 6.5]) sphere(r = 1.8, $fn = 14);
                translate([-8.5, sy, 3.0]) sphere(r = 1.5, $fn = 14);
            }
            // Hind Paw
            hull() {
                translate([-8.5, sy, 3.0]) sphere(r = 1.5, $fn = 14);
                translate([-7.2, sy, 0.6]) scale([1.3, 1.1, 0.7]) sphere(r = 1.8, $fn = 16);
                translate([-9.0, sy, 0.0]) cylinder(r = 1.9, h = 1.4, $fn = 16);
            }
        }

        // --- TORSO / RIB CAGE, FLANKS & TUCKED BELLY ---
        hull() {
            translate([8.0, 0, 15.0]) scale([1.1, 0.9, 1.0]) sphere(r = 5.6, $fn = 22); // Deep chest
            translate([2.0, 0, 15.5]) scale([1.2, 0.8, 1.0]) sphere(r = 5.0, $fn = 22); // Ribcage
            translate([-4.5, 0, 16.0]) scale([1.0, 0.7, 0.9]) sphere(r = 4.4, $fn = 20); // Tucked waist
            translate([-9.0, 0, 16.5]) scale([1.1, 0.8, 1.0]) sphere(r = 4.8, $fn = 20); // Pelvis
        }

        // --- NECK & SCARF ---
        hull() {
            translate([7.5, 0, 15.5]) sphere(r = 4.8, $fn = 20);
            translate([12.5, 0, 22.5]) sphere(r = 3.8, $fn = 20);
        }

        // Orange Scarf / Bandana with Knot (From photo)
        translate([11.5, 0, 20.0]) {
            rotate([0, 35, 0]) {
                difference() {
                    cylinder(r1 = 5.2, r2 = 4.6, h = 4.2, center = true, $fn = 26);
                    cylinder(r = 3.6, h = 5.0, center = true, $fn = 22);
                }
                // Knot tied on side/chest
                translate([0, -4.0, -1.0]) {
                    rotate([25, 0, 15]) {
                        scale([1.3, 0.9, 1.1]) sphere(r = 2.2, $fn = 16);
                        translate([0.6, -1.0, -3.4])
                            cylinder(r1 = 1.8, r2 = 0.8, h = 3.6, $fn = 12);
                    }
                }
            }
        }

        // --- HEAD, MUZZLE & JAW ---
        // Cranium
        hull() {
            translate([14.0, 0, 25.0]) sphere(r = 4.0, $fn = 22);
            translate([16.5, 0, 24.0]) sphere(r = 3.2, $fn = 20);
        }
        // Snout bridge
        hull() {
            translate([16.0, 0, 24.5]) sphere(r = 2.8, $fn = 18);
            translate([21.0, 0, 22.2]) sphere(r = 1.8, $fn = 16);
            translate([22.8, 0, 21.8]) sphere(r = 1.1, $fn = 12); // Nose button
        }
        // Open Lower Jaw with tongue (From photo)
        hull() {
            translate([16.5, 0, 22.2]) sphere(r = 2.1, $fn = 14);
            translate([20.5, 0, 20.4]) sphere(r = 1.3, $fn = 12);
        }
        // Tongue
        hull() {
            translate([18.5, 0, 21.6]) sphere(r = 1.0, $fn = 10);
            translate([20.0, 0, 21.0]) sphere(r = 0.8, $fn = 10);
        }

        // Floppy ears
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
// 2. YUDHISHTHIRA (Ascetic Dharmaraja King)
// Photo Match: Regal stride, draped saffron shawl (Chadar),
// flower garland (Mala), pleated dhoti, ascetic topknot.
// ====================================================================
module detailed_yudhishthira() {
    union() {
        // --- 1. FEET & SANDALS (Firmly grounded) ---
        // Left Foot (Forward)
        hull() {
            translate([3.0, 3.4, 0]) cylinder(r = 2.0, h = 1.4, $fn = 14);
            translate([5.5, 3.4, 0.4]) scale([1.5, 1.0, 0.7]) sphere(r = 1.6, $fn = 12);
        }
        // Right Foot (Rear)
        hull() {
            translate([-1.2, -3.4, 0]) cylinder(r = 2.0, h = 1.4, $fn = 14);
            translate([1.4, -3.4, 0.4]) scale([1.5, 1.0, 0.7]) sphere(r = 1.6, $fn = 12);
        }

        // --- 2. LEGS & PLEATED DHOTI ---
        // Left Leg
        hull() {
            translate([3.0, 3.4, 1.2]) cylinder(r1 = 2.2, r2 = 2.6, h = 9.0, $fn = 16);
            translate([2.0, 3.2, 10.5]) sphere(r = 2.6, $fn = 16);
        }
        hull() {
            translate([2.0, 3.2, 10.5]) sphere(r = 2.6, $fn = 16);
            translate([0.8, 2.8, 18.5]) cylinder(r1 = 2.8, r2 = 3.3, h = 4.5, $fn = 16);
        }
        // Right Leg
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
        // Central cascading dhoti pleats (Fan folds as seen in photo)
        for (i = [0:4]) {
            translate([3.4, -1.4 + i * 0.7, 3.0 + i * 3.0]) {
                rotate([0, 15, 0])
                    scale([0.9, 0.45, 1.3]) cylinder(r = 1.7, h = 3.2, $fn = 12);
            }
        }

        // --- 3. PELVIS & WAIST WRAP (Kamarbandh) ---
        hull() {
            translate([0.4, 0, 18.0]) scale([1.05, 1.35, 1.0]) cylinder(r1 = 4.8, r2 = 4.4, h = 5.0, $fn = 22);
        }
        translate([4.0, 0, 20.0]) {
            scale([1.2, 1.6, 0.9]) sphere(r = 1.8, $fn = 14);
            translate([0, 0, -3.0]) cylinder(r1 = 1.6, r2 = 0.8, h = 3.2, $fn = 12);
        }

        // --- 4. TORSO & DRAPED SAFFRON SHAWL (Chadar) ---
        // Slender heroic torso (V-taper)
        hull() {
            translate([0, 0, 21.0]) scale([1.0, 1.25, 1.0]) cylinder(r1 = 4.4, r2 = 5.6, h = 7.0, $fn = 24);
            translate([0, 0, 28.0]) scale([1.05, 1.35, 1.0]) cylinder(r1 = 5.6, r2 = 4.8, h = 4.0, $fn = 24);
        }

        // Shoulders
        translate([0,  6.2, 30.5]) sphere(r = 2.6, $fn = 16);
        translate([0, -6.2, 30.5]) sphere(r = 2.6, $fn = 16);

        // Saffron Shawl (Chadar) draped across shoulders and chest (From photo)
        hull() {
            translate([0,  6.2, 30.5]) sphere(r = 3.0, $fn = 16);
            translate([0, -6.2, 30.5]) sphere(r = 3.0, $fn = 16);
            translate([-1.0, 0, 31.0]) sphere(r = 3.6, $fn = 20); // Back cape
            translate([1.5, 0, 25.5]) scale([1.2, 1.3, 1.0]) sphere(r = 4.4, $fn = 20); // Chest fold
        }
        // Draped shawl lower hem falling to waist
        hull() {
            translate([1.5, 0, 25.5]) scale([1.2, 1.3, 1.0]) sphere(r = 4.4, $fn = 20);
            translate([1.8, 0, 20.5]) scale([1.1, 1.2, 0.8]) sphere(r = 3.4, $fn = 16);
        }

        // Left Arm draped under shawl fold (As in photo!)
        hull() {
            translate([0, 6.2, 30.5]) sphere(r = 2.8, $fn = 16);
            translate([1.0, 5.4, 23.0]) sphere(r = 2.1, $fn = 14);
            translate([1.8, 4.2, 16.5]) sphere(r = 1.7, $fn = 12);
        }

        // Right Arm & Shawl Clasp (Right hand holding shawl fold on chest)
        hull() {
            translate([0, -6.2, 30.5]) sphere(r = 2.8, $fn = 16);
            translate([1.6, -4.8, 24.0]) sphere(r = 2.1, $fn = 14); // Elbow
            translate([4.0, -1.0, 25.5]) sphere(r = 1.7, $fn = 12); // Hand on chest
        }

        // --- 5. MARIGOLD FLOWER GARLAND (Mala) ---
        translate([2.0, 0, 30.0]) {
            rotate([0, 48, 0]) {
                difference() {
                    cylinder(r1 = 5.2, r2 = 4.6, h = 2.2, center = true, $fn = 24);
                    cylinder(r = 3.6, h = 3.0, center = true, $fn = 20);
                }
                translate([4.8, 0, -0.6])
                    scale([1.2, 0.9, 1.3]) sphere(r = 1.4, $fn = 12);
            }
        }

        // --- 6. REGAL HEAD, SERENE FACE & ROYAL TOPKNOT ---
        translate([0, 0, 33.5]) cylinder(r1 = 3.0, r2 = 2.6, h = 3.5, $fn = 16);

        translate([0.5, 0, 38.0]) {
            scale([1.05, 0.95, 1.1]) sphere(r = 3.2, $fn = 20);

            // Facial Profile
            translate([2.4, 0, 0.8]) scale([1.1, 0.7, 1.0]) sphere(r = 1.0, $fn = 12); // Brow
            translate([3.2, 0, 0.2]) scale([1.4, 0.6, 0.9]) sphere(r = 0.8, $fn = 10); // Nose
            translate([2.4, 0, -1.1]) scale([1.1, 1.3, 1.0]) sphere(r = 1.5, $fn = 14); // Beard & moustache

            // Ears
            for (sy = [-1, 1]) {
                translate([-0.6, sy * 3.2, 0.2]) scale([0.5, 0.3, 0.9]) sphere(r = 1.5, $fn = 10);
            }
            translate([-1.8, 0, -0.4]) scale([1.2, 1.3, 1.3]) sphere(r = 2.2, $fn = 16);

            // Ascetic Royal Jatamukuta Topknot Bun (As in photo!)
            translate([-0.4, 0, 3.0]) {
                sphere(r = 2.1, $fn = 16);
                translate([0, 0, 1.8]) sphere(r = 1.4, $fn = 14);
                translate([0, 0, 2.8]) sphere(r = 0.8, $fn = 10);
            }
        }
    }
}

// ====================================================================
// 3. BHIMA (Mighty Warrior Vrikodara) - ATHLETIC HEROIC CHISELED PHYSIQUE
// Photo Match: Muscular bare chest with chiseled pectorals,
// defined abdominal wall, colossal bulging biceps with hands on hips,
// warrior sash across chest, warrior dhoti hitched at knees, long flowing hair.
// ====================================================================
module detailed_bhima() {
    union() {
        // --- 1. POWERFUL FEET (Firmly grounded) ---
        for (sy = [-3.8, 3.8]) {
            hull() {
                translate([0.5, sy, 0.0]) cylinder(r = 2.2, h = 1.4, $fn = 14);
                translate([3.4, sy, 0.4]) scale([1.5, 1.1, 0.7]) sphere(r = 1.8, $fn = 12);
            }
        }

        // --- 2. MUSCULAR LEGS & WARRIOR KACHHA DHOTI ---
        for (sy = [-3.8, 3.8]) {
            // Muscular calves
            hull() {
                translate([0.5, sy, 1.2]) cylinder(r1 = 2.6, r2 = 3.0, h = 9.5, $fn = 16);
                translate([0.8, sy, 10.7]) sphere(r = 3.0, $fn = 16); // Knee cap
            }
            // Powerful thighs tucked in warrior dhoti
            hull() {
                translate([0.8, sy, 10.7]) sphere(r = 3.0, $fn = 16);
                translate([0.2, sy * 0.8, 19.5]) cylinder(r1 = 3.2, r2 = 3.9, h = 5.0, $fn = 18);
            }
        }
        // Central Dhoti bridge
        hull() {
            translate([0.5, -2.4, 2.5]) cube([2.0, 4.8, 17.0]);
            translate([2.4, -1.6, 3.5]) cube([1.5, 3.2, 15.0]);
        }

        // --- 3. CHISELED ATHLETIC TORSO (V-Taper) ---
        // Waist
        hull() {
            translate([0, 0, 20.0]) scale([0.9, 1.25, 1.0]) cylinder(r1 = 4.6, r2 = 5.6, h = 6.0, $fn = 24);
        }
        // Upper Chest & Broad Back
        hull() {
            translate([0, 0, 26.0]) scale([1.0, 1.4, 1.0]) cylinder(r1 = 5.6, r2 = 6.8, h = 6.5, $fn = 24);
        }

        // Chiseled Left & Right Pectoral Muscle Plates (From photo!)
        for (sy = [-2.8, 2.8]) {
            translate([3.8, sy, 29.5]) scale([1.0, 1.2, 0.9]) sphere(r = 2.5, $fn = 16);
        }
        // Abdominal rectus muscle ridges (Six-pack definition)
        for (zi = [0:2]) {
            for (sy = [-1.4, 1.4]) {
                translate([3.6, sy, 22.0 + zi * 2.4])
                    scale([0.8, 1.0, 0.7]) sphere(r = 1.1, $fn = 12);
            }
        }

        // Saffron Warrior Sash draped diagonally across chest (From photo!)
        translate([1.2, 0, 27.5]) {
            rotate([32, 42, 0]) {
                difference() {
                    cylinder(r1 = 7.4, r2 = 6.8, h = 3.2, center = true, $fn = 24);
                    cylinder(r = 5.4, h = 4.2, center = true, $fn = 20);
                }
            }
        }

        // Flower garland around neck
        translate([2.0, 0, 31.5]) {
            rotate([0, 48, 0]) {
                difference() {
                    cylinder(r1 = 5.8, r2 = 5.0, h = 2.2, center = true, $fn = 24);
                    cylinder(r = 4.0, h = 3.0, center = true, $fn = 20);
                }
            }
        }

        // --- 4. BARE BULGING MUSCULAR ARMS WITH HANDS ON HIPS (From photo!) ---
        // Left Arm (Flared outward with hand firmly on hip)
        hull() {
            translate([0, 7.8, 30.5]) sphere(r = 2.8, $fn = 16); // Deltoid
            translate([1.4, 8.4, 23.5]) sphere(r = 2.4, $fn = 16); // Bicep peak
        }
        hull() {
            translate([1.4, 8.4, 23.5]) sphere(r = 2.4, $fn = 16); // Elbow
            translate([2.2, 6.2, 17.5]) sphere(r = 2.0, $fn = 14); // Forearm
            translate([2.6, 5.0, 15.0]) sphere(r = 1.8, $fn = 12); // Clenched fist on hip
        }

        // Right Arm (Flared outward with hand firmly on hip)
        hull() {
            translate([0, -7.8, 30.5]) sphere(r = 2.8, $fn = 16); // Deltoid
            translate([1.4, -8.4, 23.5]) sphere(r = 2.4, $fn = 16); // Bicep peak
        }
        hull() {
            translate([1.4, -8.4, 23.5]) sphere(r = 2.4, $fn = 16); // Elbow
            translate([2.2, -6.2, 17.5]) sphere(r = 2.0, $fn = 14); // Forearm
            translate([2.6, -5.0, 15.0]) sphere(r = 1.8, $fn = 12); // Clenched fist on hip
        }

        // --- 5. NECK & HEAD WITH LONG FLOWING WARRIOR HAIR ---
        translate([0, 0, 35.0]) cylinder(r1 = 3.8, r2 = 3.4, h = 3.5, $fn = 16);
        translate([0.5, 0, 40.0]) {
            sphere(r = 3.8, $fn = 20);
            translate([2.6, 0, -0.6]) scale([1.1, 1.25, 1.1]) sphere(r = 1.8, $fn = 14); // Strong jaw
            translate([3.4, 0, 0.4]) scale([1.3, 0.65, 0.95]) sphere(r = 1.0, $fn = 12); // Nose

            // Long flowing warrior hair cascading down back & shoulders (From photo!)
            translate([-2.6, 0, -2.8]) {
                hull() {
                    scale([1.1, 1.5, 1.2]) sphere(r = 3.2, $fn = 16);
                    translate([-0.6, 0, -5.5]) scale([0.9, 1.4, 1.0]) sphere(r = 2.6, $fn = 14);
                }
            }
            // Warrior hair topknot
            translate([0, 0, 3.8]) sphere(r = 2.0, $fn = 14);
        }
    }
}

// ====================================================================
// 4. ARJUNA (Supreme Archer Hero - Dhananjaya)
// Photo Match: Slender athletic build, draped orange shawl,
// legendary Gandiva bow across back, archer crownlet.
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
        // Athletic Legs in Dhoti
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

        // Arms in heroic stance
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

        // Legendary Gandiva Bow across back
        hull() {
            translate([-3.8, -7.5, 33.0]) sphere(r = 1.2, $fn = 10);
            translate([-2.8,  0.0, 25.0]) sphere(r = 1.4, $fn = 10);
            translate([-3.8,  7.5, 17.0]) sphere(r = 1.2, $fn = 10);
        }

        // Head & Archer Tiara (Kiriti)
        translate([0, 0, 33.0]) cylinder(r1 = 3.0, r2 = 2.6, h = 3.2, $fn = 16);
        translate([0.5, 0, 37.5]) {
            scale([1.05, 0.95, 1.1]) sphere(r = 3.2, $fn = 20);
            translate([2.4, 0, 0.4]) scale([1.2, 0.7, 1.0]) sphere(r = 1.0, $fn = 12);
            translate([-1.8, 0, -0.4]) scale([1.2, 1.3, 1.3]) sphere(r = 2.2, $fn = 16);
            translate([-0.3, 0, 2.8]) cylinder(r1 = 2.6, r2 = 1.5, h = 3.4, $fn = 16);
        }
    }
}

// ====================================================================
// 5. NAKULA & SAHADEVA (The Noble Twins)
// ====================================================================
module detailed_nakula() {
    detailed_arjuna();
}

module detailed_sahadeva() {
    detailed_arjuna();
}

// ====================================================================
// 7. DRAUPADI (Empress Panchali)
// Photo Match: Traditional Himalayan saree with head veil (pallu),
// graceful feminine poise, hands joined in reverent prayer (namaste).
// ====================================================================
module detailed_draupadi() {
    union() {
        // Feet
        for (sy = [-2.2, 2.2]) {
            hull() {
                translate([0.5, sy, 0.0]) cylinder(r = 1.6, h = 1.4, $fn = 14);
                translate([2.8, sy, 0.4]) scale([1.4, 0.9, 0.6]) sphere(r = 1.4, $fn = 12);
            }
        }

        // Flared Saree Pleats & Robes (Grounded solid footprint)
        hull() {
            translate([0, 0, 0.8]) cylinder(r1 = 5.8, r2 = 4.6, h = 11.5, $fn = 24);
            translate([0, 0, 12.3]) cylinder(r1 = 4.6, r2 = 3.9, h = 7.5, $fn = 22);
        }
        for (i = [0:4]) {
            translate([3.0, 0, 2.0 + i * 3.6])
                scale([0.85, 0.45, 1.3]) cylinder(r = 1.5, h = 3.2, $fn = 12);
        }

        // Slender Torso & Saree Drape
        hull() {
            translate([0, 0, 19.8]) scale([0.95, 1.15, 1.0]) cylinder(r1 = 3.9, r2 = 4.4, h = 6.5, $fn = 22);
            translate([0, 0, 26.3]) scale([1.0, 1.2, 1.0]) sphere(r = 4.4, $fn = 22);
        }
        // Saree Pallu crossing chest
        translate([0.8, 0, 24.8]) {
            rotate([20, 30, 0])
                cylinder(r1 = 4.8, r2 = 4.2, h = 2.6, $fn = 20);
        }

        // Arms in Namaste / Anjali Mudra (Prayer)
        hull() {
            translate([0, 5.0, 25.5]) sphere(r = 1.8, $fn = 14);
            translate([2.2, 1.3, 20.5]) sphere(r = 1.4, $fn = 12);
        }
        hull() {
            translate([0, -5.0, 25.5]) sphere(r = 1.8, $fn = 14);
            translate([2.2, -1.3, 20.5]) sphere(r = 1.4, $fn = 12);
        }
        // Joined praying palms
        translate([2.8, 0, 20.5])
            scale([1.4, 0.75, 1.4]) sphere(r = 1.4, $fn = 14);

        // Neck & Head with Head Pallu (Veiled saree drape from photo)
        translate([0, 0, 30.0]) cylinder(r = 2.4, h = 3.0, $fn = 16);
        translate([0.5, 0, 34.5]) {
            sphere(r = 3.0, $fn = 20);
            translate([2.2, 0, 0.2]) scale([1.1, 0.6, 1.0]) sphere(r = 0.9, $fn = 12); // Face
            // Pallu veil covering back and top of hair
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
    // Row 1: Dog, Yudhishthira, Bhima, Arjuna
    translate([-50, 16, 0]) { figure_pedestal(42, 22); translate([0, 0, base_h]) detailed_dharma_dog(); }
    translate([-16, 16, 0]) { figure_pedestal(26, 22); translate([0, 0, base_h]) detailed_yudhishthira(); }
    translate([ 18, 16, 0]) { figure_pedestal(28, 24); translate([0, 0, base_h]) detailed_bhima(); }
    translate([ 48, 16, 0]) { figure_pedestal(26, 22); translate([0, 0, base_h]) detailed_arjuna(); }

    // Row 2: Nakula, Sahadeva, Draupadi
    translate([-30, -16, 0]) { figure_pedestal(26, 22); translate([0, 0, base_h]) detailed_nakula(); }
    translate([  0, -16, 0]) { figure_pedestal(26, 22); translate([0, 0, base_h]) detailed_sahadeva(); }
    translate([ 30, -16, 0]) { figure_pedestal(24, 22); translate([0, 0, base_h]) detailed_draupadi(); }
}
