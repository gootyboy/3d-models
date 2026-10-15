// ====================================================================
// AUTHENTIC MANA PANDAVAS & DHARMA DOG STATUES
// Swargarohini Pilgrimage Trail, Mana Village, Uttarakhand
// Modeled directly from on-site photography
// Additive Manufacturing: 100% Manifold Solid, Supportless FDM Geometry
// ====================================================================

$fn = 32;
eps = 0.02;

// Selection
char_select = "procession_line"; // ["procession_line", "all_statues_kit", "dog", "yudhishthira", "bhima", "arjuna", "nakula", "sahadeva", "draupadi"]

base_h = 2.0; // Standard thin flat plinth (2.0mm)

render_selection();

module render_selection() {
    if (char_select == "dog") {
        figure_pedestal(38, 20);
        translate([0, 0, base_h]) sculpted_dharma_dog();
    } else if (char_select == "yudhishthira") {
        figure_pedestal(22, 20);
        translate([0, 0, base_h]) sculpted_yudhishthira();
    } else if (char_select == "bhima") {
        figure_pedestal(26, 22);
        translate([0, 0, base_h]) sculpted_bhima();
    } else if (char_select == "arjuna") {
        figure_pedestal(22, 20);
        translate([0, 0, base_h]) sculpted_arjuna();
    } else if (char_select == "nakula") {
        figure_pedestal(22, 20);
        translate([0, 0, base_h]) sculpted_nakula();
    } else if (char_select == "sahadeva") {
        figure_pedestal(22, 20);
        translate([0, 0, base_h]) sculpted_sahadeva();
    } else if (char_select == "draupadi") {
        figure_pedestal(20, 20);
        translate([0, 0, base_h]) sculpted_draupadi();
    } else if (char_select == "procession_line") {
        procession_scenic_base();
    } else if (char_select == "all_statues_kit") {
        all_statues_kit();
    }
}

// Flat thin rectangular plinth matching photo
module figure_pedestal(w = 24, d = 18) {
    hull() {
        translate([-w/2 + 2, -d/2 + 2, 0]) cylinder(r = 2, h = base_h, $fn = 16);
        translate([ w/2 - 2, -d/2 + 2, 0]) cylinder(r = 2, h = base_h, $fn = 16);
        translate([ w/2 - 2,  d/2 - 2, 0]) cylinder(r = 2, h = base_h, $fn = 16);
        translate([-w/2 + 2,  d/2 - 2, 0]) cylinder(r = 2, h = base_h, $fn = 16);
    }
}

// ====================================================================
// 1. THE FAITHFUL DHARMA DOG (Himalayan / Pariah Hound)
// Direct photo match: Golden body, folded ears, open jaw,
// orange neck scarf knot, sturdy athletic paws, sickle tail.
// ====================================================================
module sculpted_dharma_dog() {
    union() {
        // Front Left & Right Legs & Paws
        dog_front_leg(y_pos = 3.6, x_shoulder = 7.5, x_paw = 8.5);
        dog_front_leg(y_pos = -3.6, x_shoulder = 7.5, x_paw = 8.5);

        // Hind Left & Right Legs & Paws
        dog_hind_leg(y_pos = 4.0, x_hip = -8.0, x_paw = -7.5);
        dog_hind_leg(y_pos = -4.0, x_hip = -8.0, x_paw = -7.5);

        // Torso / Thorax & Tucked Belly (Self-supporting $\le 45^\circ$)
        hull() {
            translate([7.0, 0, 13.5]) scale([1.1, 0.9, 1.0]) sphere(r = 5.2, $fn = 20);
            translate([2.0, 0, 14.0]) scale([1.2, 0.85, 1.0]) sphere(r = 4.8, $fn = 20);
            translate([-4.0, 0, 14.5]) scale([1.0, 0.75, 0.9]) sphere(r = 4.2, $fn = 20);
            translate([-8.0, 0, 15.0]) scale([1.1, 0.8, 1.0]) sphere(r = 4.5, $fn = 20);
        }

        // Neck rising forward
        hull() {
            translate([6.5, 0, 14.0]) sphere(r = 4.6, $fn = 20);
            translate([11.0, 0, 20.0]) sphere(r = 3.6, $fn = 20);
        }

        // Orange Scarf / Bandana with Knot (From photo!)
        translate([9.5, 0, 17.5]) {
            rotate([0, 35, 0]) {
                difference() {
                    cylinder(r1 = 4.8, r2 = 4.3, h = 3.8, center = true, $fn = 24);
                    cylinder(r = 3.2, h = 4.5, center = true, $fn = 20);
                }
                translate([0, -3.8, -0.8]) {
                    rotate([20, 0, 10]) {
                        scale([1.2, 0.8, 1.0]) sphere(r = 2.0, $fn = 16);
                        translate([0.5, -0.8, -3.0])
                            cylinder(r1 = 1.6, r2 = 0.8, h = 3.2, $fn = 12);
                    }
                }
            }
        }

        // Head & Muzzle
        hull() {
            translate([12.5, 0, 22.0]) sphere(r = 3.8, $fn = 20);
            translate([14.5, 0, 21.0]) sphere(r = 3.0, $fn = 18);
        }
        // Snout
        hull() {
            translate([14.0, 0, 21.5]) sphere(r = 2.6, $fn = 16);
            translate([18.5, 0, 19.5]) sphere(r = 1.7, $fn = 16);
            translate([20.0, 0, 19.2]) sphere(r = 1.1, $fn = 12);
        }
        // Open Jaw & Lower Chin
        hull() {
            translate([14.5, 0, 19.5]) sphere(r = 2.0, $fn = 14);
            translate([18.0, 0, 18.0]) sphere(r = 1.2, $fn = 12);
        }
        // Tongue fill
        hull() {
            translate([16.5, 0, 19.0]) sphere(r = 1.0, $fn = 10);
            translate([17.5, 0, 18.4]) sphere(r = 0.8, $fn = 10);
        }

        // Folded Ears
        for (sy = [-1, 1]) {
            hull() {
                translate([12.0, sy * 3.0, 24.2]) sphere(r = 1.2, $fn = 10);
                translate([13.0, sy * 4.5, 23.5]) sphere(r = 1.4, $fn = 10);
                translate([15.0, sy * 4.2, 21.2]) sphere(r = 1.0, $fn = 10);
            }
        }

        // Sickle Tail
        hull() {
            translate([-11.0, 0, 16.5]) sphere(r = 1.8, $fn = 12);
            translate([-13.5, 0, 19.5]) sphere(r = 1.4, $fn = 12);
        }
        hull() {
            translate([-13.5, 0, 19.5]) sphere(r = 1.4, $fn = 12);
            translate([-12.5, 0, 23.5]) sphere(r = 1.2, $fn = 10);
        }
        hull() {
            translate([-12.5, 0, 23.5]) sphere(r = 1.2, $fn = 10);
            translate([-9.5, 0, 25.5]) sphere(r = 0.9, $fn = 8);
        }
    }
}

module dog_front_leg(y_pos, x_shoulder, x_paw) {
    hull() {
        translate([x_shoulder, y_pos * 0.9, 13.5]) sphere(r = 2.4, $fn = 14);
        translate([x_shoulder + 0.5, y_pos, 8.5]) sphere(r = 1.8, $fn = 14);
    }
    hull() {
        translate([x_shoulder + 0.5, y_pos, 8.5]) sphere(r = 1.8, $fn = 14);
        translate([x_paw, y_pos, 3.0]) sphere(r = 1.4, $fn = 14);
    }
    hull() {
        translate([x_paw, y_pos, 3.0]) sphere(r = 1.4, $fn = 14);
        translate([x_paw + 1.2, y_pos, 0.6]) scale([1.4, 1.1, 0.7]) sphere(r = 1.6, $fn = 14);
        translate([x_paw - 0.4, y_pos, 0.0]) cylinder(r = 1.7, h = 1.2, $fn = 14);
    }
}

module dog_hind_leg(y_pos, x_hip, x_paw) {
    hull() {
        translate([x_hip, y_pos * 0.85, 14.5]) scale([1.2, 0.9, 1.0]) sphere(r = 3.2, $fn = 16);
        translate([x_hip - 1.5, y_pos, 9.5]) sphere(r = 2.2, $fn = 14);
    }
    hull() {
        translate([x_hip - 1.5, y_pos, 9.5]) sphere(r = 2.2, $fn = 14);
        translate([x_hip - 3.0, y_pos, 6.0]) sphere(r = 1.6, $fn = 12);
        translate([x_paw, y_pos, 2.8]) sphere(r = 1.4, $fn = 12);
    }
    hull() {
        translate([x_paw, y_pos, 2.8]) sphere(r = 1.4, $fn = 12);
        translate([x_paw + 1.0, y_pos, 0.6]) scale([1.3, 1.1, 0.7]) sphere(r = 1.6, $fn = 14);
        translate([x_paw - 0.4, y_pos, 0.0]) cylinder(r = 1.6, h = 1.2, $fn = 14);
    }
}

// ====================================================================
// 2. YUDHISHTHIRA (Ascetic Dharmaraja King)
// Direct photo match: Saffron chadar draped over shoulders,
// golden dhoti with center pleats, flower garland, calm regal visage.
// ====================================================================
module sculpted_yudhishthira() {
    union() {
        // Feet
        hull() {
            translate([2.5, 3.2, 0]) cylinder(r = 1.8, h = 1.4, $fn = 14);
            translate([4.8, 3.2, 0.4]) scale([1.5, 1.0, 0.7]) sphere(r = 1.5, $fn = 12);
        }
        hull() {
            translate([-1.0, -3.2, 0]) cylinder(r = 1.8, h = 1.4, $fn = 14);
            translate([1.2, -3.2, 0.4]) scale([1.5, 1.0, 0.7]) sphere(r = 1.5, $fn = 12);
        }

        // Legs in Dhoti
        hull() {
            translate([2.5, 3.2, 1.2]) cylinder(r1 = 2.0, r2 = 2.4, h = 8.0, $fn = 16);
            translate([1.5, 3.0, 9.2]) sphere(r = 2.4, $fn = 16);
        }
        hull() {
            translate([1.5, 3.0, 9.2]) sphere(r = 2.4, $fn = 16);
            translate([0.5, 2.5, 16.5]) cylinder(r1 = 2.6, r2 = 3.0, h = 4.0, $fn = 16);
        }
        hull() {
            translate([-1.0, -3.2, 1.2]) cylinder(r1 = 2.0, r2 = 2.4, h = 8.0, $fn = 16);
            translate([-0.5, -3.0, 9.2]) sphere(r = 2.4, $fn = 16);
        }
        hull() {
            translate([-0.5, -3.0, 9.2]) sphere(r = 2.4, $fn = 16);
            translate([0.0, -2.5, 16.5]) cylinder(r1 = 2.6, r2 = 3.0, h = 4.0, $fn = 16);
        }

        // Center Dhoti cloth & pleats
        hull() {
            translate([0.8, -1.8, 2.0]) cube([1.6, 3.6, 15.0]);
            translate([2.4, -1.2, 3.0]) cube([1.2, 2.4, 13.0]);
        }
        for (i = [0:4]) {
            translate([3.0, -1.2 + i * 0.6, 2.5 + i * 2.5]) {
                rotate([0, 15, 0])
                    scale([0.8, 0.4, 1.2]) cylinder(r = 1.6, h = 3.0, $fn = 10);
            }
        }

        // Waist wrap & buckle
        hull() {
            translate([0.2, 0, 16.0]) scale([1.1, 1.4, 1.0]) cylinder(r1 = 4.5, r2 = 4.2, h = 4.5, $fn = 22);
        }
        translate([3.8, 0, 18.0]) {
            scale([1.2, 1.5, 0.8]) sphere(r = 1.6, $fn = 14);
            translate([0, 0, -2.5]) cylinder(r1 = 1.4, r2 = 0.8, h = 2.8, $fn = 12);
        }

        // Torso & Saffron Shawl (Chadar)
        hull() {
            translate([0, 0, 19.0]) scale([1.0, 1.25, 1.0]) cylinder(r1 = 4.2, r2 = 5.2, h = 6.0, $fn = 24);
            translate([0, 0, 25.0]) scale([1.05, 1.3, 1.0]) cylinder(r1 = 5.2, r2 = 4.6, h = 3.5, $fn = 24);
        }
        translate([0,  5.8, 27.0]) sphere(r = 2.5, $fn = 16);
        translate([0, -5.8, 27.0]) sphere(r = 2.5, $fn = 16);

        // Draped Mantle
        hull() {
            translate([0,  5.8, 27.0]) sphere(r = 2.8, $fn = 16);
            translate([0, -5.8, 27.0]) sphere(r = 2.8, $fn = 16);
            translate([-0.8, 0, 27.5]) sphere(r = 3.4, $fn = 20);
            translate([1.2, 0, 22.5]) scale([1.2, 1.3, 1.0]) sphere(r = 4.2, $fn = 20);
        }
        hull() {
            translate([1.2, 0, 22.5]) scale([1.2, 1.3, 1.0]) sphere(r = 4.2, $fn = 20);
            translate([1.6, 0, 18.0]) scale([1.1, 1.2, 0.8]) sphere(r = 3.2, $fn = 16);
        }

        // Left Arm
        hull() {
            translate([0, 5.8, 27.0]) sphere(r = 2.6, $fn = 16);
            translate([0.8, 5.0, 20.5]) sphere(r = 2.0, $fn = 14);
            translate([1.5, 4.0, 15.0]) sphere(r = 1.6, $fn = 12);
        }
        // Right Arm holding shawl
        hull() {
            translate([0, -5.8, 27.0]) sphere(r = 2.6, $fn = 16);
            translate([1.5, -4.5, 21.5]) sphere(r = 1.9, $fn = 14);
            translate([3.8, -1.0, 22.5]) sphere(r = 1.6, $fn = 12);
        }

        // Garland (Mala)
        translate([2.0, 0, 27.0]) {
            rotate([0, 48, 0]) {
                difference() {
                    cylinder(r1 = 5.0, r2 = 4.4, h = 2.0, center = true, $fn = 24);
                    cylinder(r = 3.4, h = 2.6, center = true, $fn = 20);
                }
                translate([4.6, 0, -0.6])
                    scale([1.2, 0.9, 1.3]) sphere(r = 1.3, $fn = 12);
            }
        }

        // Head & Topknot Bun
        translate([0, 0, 30.5]) cylinder(r1 = 2.8, r2 = 2.4, h = 3.0, $fn = 16);
        translate([0.5, 0, 34.5]) {
            scale([1.05, 0.95, 1.1]) sphere(r = 3.0, $fn = 20);
            translate([2.2, 0, 0.8]) scale([1.1, 0.7, 1.0]) sphere(r = 1.0, $fn = 12);
            translate([3.0, 0, 0.2]) scale([1.3, 0.6, 0.9]) sphere(r = 0.8, $fn = 10);
            translate([2.2, 0, -1.0]) scale([1.1, 1.3, 1.0]) sphere(r = 1.4, $fn = 14);

            for (sy = [-1, 1]) {
                translate([-0.6, sy * 3.0, 0.2]) scale([0.5, 0.3, 0.9]) sphere(r = 1.4, $fn = 10);
            }
            translate([-1.6, 0, -0.4]) scale([1.2, 1.3, 1.3]) sphere(r = 2.0, $fn = 16);

            translate([-0.4, 0, 2.8]) {
                sphere(r = 2.0, $fn = 16);
                translate([0, 0, 1.6]) sphere(r = 1.4, $fn = 14);
                translate([0, 0, 2.6]) sphere(r = 0.8, $fn = 10);
            }
        }
    }
}

// ====================================================================
// 3. BHIMA (Mighty Warrior Vrikodara)
// Massive muscular bare chest & biceps, sash across torso, flowing hair
// ====================================================================
module sculpted_bhima() {
    union() {
        // Feet
        for (sy = [-3.4, 3.4]) {
            hull() {
                translate([0.5, sy, 0.0]) cylinder(r = 2.0, h = 1.4, $fn = 14);
                translate([3.0, sy, 0.4]) scale([1.5, 1.1, 0.7]) sphere(r = 1.6, $fn = 12);
            }
        }

        // Muscular Legs & Warrior Dhoti (Veeragacche knee tuck)
        for (sy = [-3.4, 3.4]) {
            hull() {
                translate([0.5, sy, 1.2]) cylinder(r1 = 2.4, r2 = 2.8, h = 8.5, $fn = 16);
                translate([0.8, sy, 9.7]) sphere(r = 2.8, $fn = 16);
            }
            hull() {
                translate([0.8, sy, 9.7]) sphere(r = 2.8, $fn = 16);
                translate([0.2, sy * 0.8, 17.5]) cylinder(r1 = 3.2, r2 = 3.8, h = 4.5, $fn = 18);
            }
        }
        // Dhoti Cloth Bridge
        hull() {
            translate([0.5, -2.4, 2.5]) cube([2.0, 4.8, 15.0]);
            translate([2.2, -1.6, 3.5]) cube([1.5, 3.2, 13.0]);
        }

        // Massive Broad Muscular Torso & Pecks
        hull() {
            translate([0, 0, 18.0]) scale([1.1, 1.35, 1.0]) cylinder(r1 = 5.6, r2 = 7.2, h = 8.5, $fn = 24);
            translate([0, 0, 26.5]) scale([1.2, 1.5, 1.0]) sphere(r = 7.0, $fn = 24);
        }
        for (sy = [-2.6, 2.6]) {
            translate([4.2, sy, 26.0]) scale([1.0, 1.2, 0.9]) sphere(r = 2.4, $fn = 16);
        }

        // Saffron Warrior Sash across chest (Visible in photo!)
        translate([1.2, 0, 24.5]) {
            rotate([30, 40, 0]) {
                difference() {
                    cylinder(r1 = 7.4, r2 = 6.8, h = 3.2, center = true, $fn = 24);
                    cylinder(r = 5.4, h = 4.0, center = true, $fn = 20);
                }
            }
        }

        // Bulging Muscular Arms
        // Left Arm
        hull() {
            translate([0, 8.2, 27.0]) sphere(r = 2.8, $fn = 16);
            translate([1.5, 7.8, 19.5]) sphere(r = 2.4, $fn = 16);
            translate([2.5, 6.0, 13.0]) sphere(r = 2.0, $fn = 14);
        }
        // Right Arm
        hull() {
            translate([0, -8.2, 27.0]) sphere(r = 2.8, $fn = 16);
            translate([1.5, -7.8, 19.5]) sphere(r = 2.4, $fn = 16);
            translate([2.5, -6.0, 13.0]) sphere(r = 2.0, $fn = 14);
        }

        // Neck & Head with Flowing Warrior Hair
        translate([0, 0, 32.5]) cylinder(r1 = 3.8, r2 = 3.4, h = 3.2, $fn = 16);
        translate([0.5, 0, 37.0]) {
            sphere(r = 3.8, $fn = 20);
            translate([2.6, 0, -0.6]) scale([1.1, 1.2, 1.1]) sphere(r = 1.8, $fn = 14);
            // Long flowing hair down back (As in photo!)
            translate([-2.4, 0, -2.5]) {
                hull() {
                    scale([1.1, 1.5, 1.2]) sphere(r = 3.0, $fn = 16);
                    translate([-0.5, 0, -4.5]) scale([0.9, 1.4, 1.0]) sphere(r = 2.4, $fn = 14);
                }
            }
            translate([0, 0, 3.6]) sphere(r = 2.0, $fn = 14);
        }
    }
}

// ====================================================================
// 4. ARJUNA (Supreme Archer Hero)
// Athletic poise, draped orange shawl, royal warrior stance
// ====================================================================
module sculpted_arjuna() {
    union() {
        // Feet
        for (sy = [-2.8, 2.8]) {
            hull() {
                translate([0.5, sy, 0.0]) cylinder(r = 1.8, h = 1.4, $fn = 14);
                translate([2.8, sy, 0.4]) scale([1.4, 1.0, 0.7]) sphere(r = 1.5, $fn = 12);
            }
        }
        // Athletic Legs in Dhoti
        for (sy = [-2.8, 2.8]) {
            hull() {
                translate([0.5, sy, 1.2]) cylinder(r1 = 2.1, r2 = 2.5, h = 8.5, $fn = 16);
                translate([0.6, sy, 9.7]) sphere(r = 2.5, $fn = 16);
            }
            hull() {
                translate([0.6, sy, 9.7]) sphere(r = 2.5, $fn = 16);
                translate([0.2, sy * 0.8, 17.0]) cylinder(r1 = 2.8, r2 = 3.3, h = 4.5, $fn = 16);
            }
        }
        hull() {
            translate([0.6, -2.0, 2.0]) cube([1.8, 4.0, 15.0]);
            translate([2.4, -1.4, 3.0]) cube([1.2, 2.8, 13.0]);
        }

        // Torso & Saffron Shawl
        hull() {
            translate([0, 0, 18.5]) scale([1.0, 1.3, 1.0]) cylinder(r1 = 4.4, r2 = 5.4, h = 6.5, $fn = 24);
            translate([0, 0, 25.5]) scale([1.1, 1.4, 1.0]) sphere(r = 5.5, $fn = 24);
        }
        // Draped Shawl across chest
        translate([1.0, 0, 23.0]) {
            rotate([20, 32, 0]) {
                difference() {
                    cylinder(r1 = 5.8, r2 = 5.2, h = 2.8, center = true, $fn = 24);
                    cylinder(r = 4.2, h = 3.6, center = true, $fn = 20);
                }
            }
        }

        // Arms
        hull() {
            translate([0, 6.2, 26.5]) sphere(r = 2.4, $fn = 16);
            translate([1.2, 5.0, 20.0]) sphere(r = 1.9, $fn = 14);
            translate([2.2, 3.8, 14.5]) sphere(r = 1.5, $fn = 12);
        }
        hull() {
            translate([0, -6.2, 26.5]) sphere(r = 2.4, $fn = 16);
            translate([1.2, -5.0, 20.0]) sphere(r = 1.9, $fn = 14);
            translate([2.2, -3.8, 14.5]) sphere(r = 1.5, $fn = 12);
        }

        // Head & Archer Tiara
        translate([0, 0, 31.0]) cylinder(r1 = 2.8, r2 = 2.5, h = 3.0, $fn = 16);
        translate([0.5, 0, 35.0]) {
            scale([1.05, 0.95, 1.1]) sphere(r = 3.0, $fn = 20);
            translate([2.2, 0, 0.4]) scale([1.2, 0.7, 1.0]) sphere(r = 0.9, $fn = 12);
            translate([-1.6, 0, -0.4]) scale([1.2, 1.3, 1.3]) sphere(r = 2.0, $fn = 16);
            translate([-0.3, 0, 2.6]) cylinder(r1 = 2.4, r2 = 1.4, h = 3.2, $fn = 16);
        }
    }
}

// ====================================================================
// 5. NAKULA & SAHADEVA (The Noble Twins)
// ====================================================================
module sculpted_nakula() {
    sculpted_arjuna();
}

module sculpted_sahadeva() {
    sculpted_arjuna();
}

// ====================================================================
// 7. DRAUPADI (Empress Panchali)
// Elegant Himalayan saree drape with head veil (pallu), hands in prayer
// ====================================================================
module sculpted_draupadi() {
    union() {
        // Grounded Feet
        for (sy = [-2.0, 2.0]) {
            hull() {
                translate([0.5, sy, 0.0]) cylinder(r = 1.4, h = 1.2, $fn = 12);
                translate([2.5, sy, 0.3]) scale([1.3, 0.9, 0.6]) sphere(r = 1.3, $fn = 10);
            }
        }
        // Flared Saree Pleats & Robes (Grounded solid footprint)
        hull() {
            translate([0, 0, 0.8]) cylinder(r1 = 5.2, r2 = 4.2, h = 10.0, $fn = 22);
            translate([0, 0, 10.8]) cylinder(r1 = 4.2, r2 = 3.6, h = 7.0, $fn = 20);
        }
        for (i = [0:3]) {
            translate([2.6, 0, 2.0 + i * 3.5])
                scale([0.8, 0.4, 1.2]) cylinder(r = 1.4, h = 3.0, $fn = 10);
        }

        // Slender Torso & Saree Drape
        hull() {
            translate([0, 0, 17.5]) scale([1.0, 1.2, 1.0]) cylinder(r1 = 3.6, r2 = 4.2, h = 6.0, $fn = 20);
            translate([0, 0, 23.5]) scale([1.05, 1.25, 1.0]) sphere(r = 4.2, $fn = 20);
        }
        translate([0.6, 0, 22.0]) {
            rotate([20, 30, 0])
                cylinder(r1 = 4.4, r2 = 4.0, h = 2.4, $fn = 20);
        }

        // Arms in Namaste / Anjali Mudra (Prayer)
        hull() {
            translate([0, 4.6, 23.0]) sphere(r = 1.6, $fn = 12);
            translate([2.0, 1.2, 18.5]) sphere(r = 1.2, $fn = 10);
        }
        hull() {
            translate([0, -4.6, 23.0]) sphere(r = 1.6, $fn = 12);
            translate([2.0, -1.2, 18.5]) sphere(r = 1.2, $fn = 10);
        }
        translate([2.6, 0, 18.5])
            scale([1.3, 0.7, 1.3]) sphere(r = 1.2, $fn = 12);

        // Neck & Head with Head Pallu
        translate([0, 0, 27.5]) cylinder(r = 2.2, h = 2.8, $fn = 14);
        translate([0.4, 0, 31.0]) {
            sphere(r = 2.7, $fn = 20);
            translate([2.0, 0, 0.2]) scale([1.1, 0.6, 1.0]) sphere(r = 0.8, $fn = 10);
            translate([-0.8, 0, 0.4]) scale([1.25, 1.35, 1.2]) sphere(r = 2.6, $fn = 18);
        }
    }
}

// Complete Scenic Diorama Procession Base
module procession_scenic_base() {
    path_len = 190.0;
    path_w = 40.0;

    union() {
        // Flat thin base plinth (2.0mm thick standard)
        hull() {
            translate([-path_len/2 + 4, -path_w/2 + 4, 0]) cylinder(r = 4, h = base_h, $fn = 20);
            translate([ path_len/2 - 4, -path_w/2 + 4, 0]) cylinder(r = 4, h = base_h, $fn = 20);
            translate([ path_len/2 - 4,  path_w/2 - 4, 0]) cylinder(r = 4, h = base_h, $fn = 20);
            translate([-path_len/2 + 4,  path_w/2 - 4, 0]) cylinder(r = 4, h = base_h, $fn = 20);
        }

        // Procession line as seen in photo:
        // 1. Dog
        translate([70.0, 0, base_h]) sculpted_dharma_dog();
        // 2. Yudhishthira
        translate([46.0, 0, base_h]) sculpted_yudhishthira();
        // 3. Bhima
        translate([20.0, 0, base_h]) sculpted_bhima();
        // 4. Arjuna
        translate([-6.0, 0, base_h]) sculpted_arjuna();
        // 5. Nakula
        translate([-30.0, 0, base_h]) sculpted_nakula();
        // 6. Sahadeva
        translate([-54.0, 0, base_h]) sculpted_sahadeva();
        // 7. Draupadi
        translate([-76.0, 0, base_h]) sculpted_draupadi();
    }
}

// Full Individual Kit Bed
module all_statues_kit() {
    // Row 1: Dog, Yudhishthira, Bhima, Arjuna
    translate([-42, 16, 0]) {
        figure_pedestal(38, 20);
        translate([0, 0, base_h]) sculpted_dharma_dog();
    }
    translate([-12, 16, 0]) {
        figure_pedestal(22, 20);
        translate([0, 0, base_h]) sculpted_yudhishthira();
    }
    translate([ 18, 16, 0]) {
        figure_pedestal(26, 22);
        translate([0, 0, base_h]) sculpted_bhima();
    }
    translate([ 46, 16, 0]) {
        figure_pedestal(22, 20);
        translate([0, 0, base_h]) sculpted_arjuna();
    }

    // Row 2: Nakula, Sahadeva, Draupadi
    translate([-28, -16, 0]) {
        figure_pedestal(22, 20);
        translate([0, 0, base_h]) sculpted_nakula();
    }
    translate([  0, -16, 0]) {
        figure_pedestal(22, 20);
        translate([0, 0, base_h]) sculpted_sahadeva();
    }
    translate([ 28, -16, 0]) {
        figure_pedestal(20, 20);
        translate([0, 0, base_h]) sculpted_draupadi();
    }
}
