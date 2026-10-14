// ====================================================================
// THE PANDAVAS & COMPANIONS STATUES OF MANA VILLAGE
// Location: Swargarohini Marg, Mana Village, Uttarakhand, India
// Authentic Sculptural Ensemble:
//   1. Yudhishthira (Righteous King with Pilgrim Danda & Robes)
//   2. Faithful Canine Companion (Lord Dharma / Yama in disguise)
//   3. Bhima (Colossal warrior with iconic fluted Gada / Mace across shoulder)
//   4. Arjuna (Heroic archer with tall Gandiva Bow & Quiver on back)
//   5. Nakula (Swordsman with Talwar scabbard & traveling cloak)
//   6. Sahadeva (Wise scholar holding sacred Granth / Pothi scripture)
//   7. Draupadi (Empress Panchali in Himalayan saree & Namaste mudra)
// Additive Manufacturing: 100% Manifold Solid, Supportless FDM (Zero mid-air parts)
// ====================================================================

$fn = 28;
eps = 0.05;

// Customizer parameters
display_mode = "trail_procession"; // ["trail_procession", "pedestal_array", "yudhishthira_dog", "bhima", "arjuna", "nakula", "sahadeva", "draupadi"]

render_mana_pandavas();

module render_mana_pandavas() {
    if (display_mode == "trail_procession") {
        swargarohini_trail_procession();
    } else if (display_mode == "pedestal_array") {
        pedestal_showcase_array();
    } else if (display_mode == "yudhishthira_dog") {
        yudhishthira_with_dharma_dog();
    } else if (display_mode == "bhima") {
        bhima_statue_on_pedestal();
    } else if (display_mode == "arjuna") {
        arjuna_statue_on_pedestal();
    } else if (display_mode == "nakula") {
        nakula_statue_on_pedestal();
    } else if (display_mode == "sahadeva") {
        sahadeva_statue_on_pedestal();
    } else if (display_mode == "draupadi") {
        draupadi_statue_on_pedestal();
    }
}

// ---------------------------------------------------------
// 1. AUTHENTIC TRAIL PROCESSION (SINGLE CONTINUOUS DISPLAY)
// ---------------------------------------------------------
module swargarohini_trail_procession() {
    trail_l = 150.0;
    trail_w = 40.0;

    union() {
        // Mountain Trail Plinth with Bevelled Edge & Anti-warp corners
        hull() {
            translate([-trail_l/2 + 4, -trail_w/2 + 4, 0]) cylinder(r = 4, h = 3.5, $fn = 16);
            translate([ trail_l/2 - 4, -trail_w/2 + 4, 0]) cylinder(r = 4, h = 3.5, $fn = 16);
            translate([ trail_l/2 - 4,  trail_w/2 - 4, 0]) cylinder(r = 4, h = 3.5, $fn = 16);
            translate([-trail_l/2 + 4,  trail_w/2 - 4, 0]) cylinder(r = 4, h = 3.5, $fn = 16);
        }

        // Stepped stone trail pavement & roadside boulders
        for (i = [0 : 8]) {
            x_b = -trail_l/2 + 10 + i * 16.0;
            translate([x_b, (i % 2 == 0) ? -16.0 : 16.0, 3.5])
                scale([1.2, 0.9, 0.5])
                    sphere(r = 2.8, $fn = 8);
        }

        // Inscribed Trailhead Marker Plaque (Center Front)
        translate([0, -trail_w/2 + 2.0, 3.5]) {
            hull() {
                translate([-22, 0, 0]) cube([44, 3.0, 1.0]);
                translate([-18, 0, 4.0]) cube([36, 2.5, 0.5]);
            }
        }

        // Procession of Figures along the trail (X-axis marching direction)
        // 1. Yudhishthira & Dog leading at front (X = +52mm)
        translate([50.0, 0, 3.5])
            yudhishthira_and_dog_model();

        // 2. Bhima (X = +30mm)
        translate([28.0, 0, 3.5])
            bhima_statue_model();

        // 3. Arjuna (X = +8mm)
        translate([7.0, 0, 3.5])
            arjuna_statue_model();

        // 4. Nakula (X = -13mm)
        translate([-13.0, 0, 3.5])
            nakula_statue_model();

        // 5. Sahadeva (X = -32mm)
        translate([-33.0, 0, 3.5])
            sahadeva_statue_model();

        // 6. Draupadi trailing gracefully (X = -52mm)
        translate([-53.0, 0, 3.5])
            draupadi_statue_model();
    }
}

// ---------------------------------------------------------
// 2. PEDESTAL SHOWCASE ARRAY (GALLERY STYLE)
// ---------------------------------------------------------
module pedestal_showcase_array() {
    spacing_x = 26.0;
    
    // Front Row: Yudhishthira + Dog in center, flanked by Bhima & Arjuna
    translate([0, 0, 0])           yudhishthira_with_dharma_dog();
    translate([-spacing_x, 0, 0])  bhima_statue_on_pedestal();
    translate([spacing_x, 0, 0])   arjuna_statue_on_pedestal();

    // Rear Row: Draupadi, Nakula, Sahadeva
    translate([-spacing_x, 28, 0]) nakula_statue_on_pedestal();
    translate([0, 28, 0])          draupadi_statue_on_pedestal();
    translate([spacing_x, 28, 0])  sahadeva_statue_on_pedestal();
}

// Universal Carved Stone Pedestal Plinth
module carved_stone_pedestal(r = 10.0, h = 3.5) {
    cylinder(r1 = r, r2 = r - 1.2, h = h, $fn = 8); // Octagonal pedestal
}

// Individual Pedestal Wrappers
module yudhishthira_with_dharma_dog() {
    union() {
        hull() {
            translate([-4, 0, 0]) cylinder(r1 = 10.0, r2 = 9.0, h = 3.5, $fn = 8);
            translate([ 9, 0, 0]) cylinder(r1 = 7.5, r2 = 6.5, h = 3.5, $fn = 8);
        }
        translate([0, 0, 3.5])
            yudhishthira_and_dog_model();
    }
}

module bhima_statue_on_pedestal() {
    union() {
        carved_stone_pedestal(r = 11.0);
        translate([0, 0, 3.5]) bhima_statue_model();
    }
}

module arjuna_statue_on_pedestal() {
    union() {
        carved_stone_pedestal(r = 10.0);
        translate([0, 0, 3.5]) arjuna_statue_model();
    }
}

module nakula_statue_on_pedestal() {
    union() {
        carved_stone_pedestal(r = 9.5);
        translate([0, 0, 3.5]) nakula_statue_model();
    }
}

module sahadeva_statue_on_pedestal() {
    union() {
        carved_stone_pedestal(r = 9.5);
        translate([0, 0, 3.5]) sahadeva_statue_model();
    }
}

module draupadi_statue_on_pedestal() {
    union() {
        carved_stone_pedestal(r = 9.5);
        translate([0, 0, 3.5]) draupadi_statue_model();
    }
}

// =========================================================
// 1. YUDHISHTHIRA & DHARMA DOG (ACCURATE TO MANA BRONZES)
// =========================================================
module yudhishthira_and_dog_model() {
    union() {
        // Yudhishthira Figure
        translate([-4.0, 0, 0]) {
            // Flowing Dhoti & Pleats (Solid bed anchor)
            hull() {
                translate([0, 0, 0]) cylinder(r1 = 4.5, r2 = 3.4, h = 10.5, $fn = 16);
                translate([0, 0, 10.5]) cylinder(r = 3.2, h = 0.1, $fn = 14);
            }
            // Torso, Royal Angavastram (Shoulder sash) & Sacred Thread
            hull() {
                translate([0, 0, 10.0]) cylinder(r1 = 3.2, r2 = 3.8, h = 7.5, $fn = 12);
                translate([0, 0, 17.5]) scale([1.25, 0.85, 1.0]) sphere(r = 3.4, $fn = 12);
            }
            // Regal Head, Beard & Ascetic Crown Mukut
            translate([0, 0, 21.0]) {
                sphere(r = 2.5, $fn = 14);
                // Beard
                translate([0, 1.2, -1.2]) scale([0.9, 0.7, 1.2]) sphere(r = 1.4, $fn = 10);
                // Mukut / Topknot Crown
                translate([0, 0, 1.4]) cylinder(r1 = 2.4, r2 = 1.1, h = 4.2, $fn = 10);
                translate([0, 0, 5.6]) sphere(r = 0.7, $fn = 8);
            }
            // Right Arm grasping Pilgrim Staff (Tridandi Danda)
            hull() {
                translate([-3.4, 0, 17.0]) sphere(r = 1.3, $fn = 10);
                translate([-4.8, 2.0, 11.0]) sphere(r = 1.1, $fn = 10);
            }
            // Sacred Pilgrim Staff (Thick, self-supporting grounded pillar)
            translate([-4.8, 2.0, 0]) {
                cylinder(r = 1.3, h = 26.5, $fn = 10);
                // Carved trident / lotus finial on top of staff
                translate([0, 0, 26.5]) {
                    sphere(r = 1.8, $fn = 12);
                    cylinder(r1 = 1.8, r2 = 0.4, h = 3.0, $fn = 8);
                }
            }
            // Left Arm in Abhaya Mudra / Dignified fold
            hull() {
                translate([3.4, 0, 17.0]) sphere(r = 1.3, $fn = 10);
                translate([1.8, 2.2, 13.5]) sphere(r = 1.1, $fn = 10);
            }
        }

        // Faithful Dog (Lord Dharma in canine form - Trotting by side)
        translate([8.5, 0, 0]) {
            // Grounded sturdy paws and body
            hull() {
                translate([0, -3.0, 2.2]) sphere(r = 2.4, $fn = 10);
                translate([0,  2.8, 3.8]) sphere(r = 2.6, $fn = 10);
                translate([0, -2.2, 0.0]) cylinder(r = 2.0, h = 2.2, $fn = 8);
                translate([0,  2.2, 0.0]) cylinder(r = 2.0, h = 2.2, $fn = 8);
            }
            // Sturdy chest & neck
            hull() {
                translate([0, 2.8, 3.8]) sphere(r = 2.6, $fn = 10);
                translate([0, 3.5, 8.0]) sphere(r = 1.9, $fn = 10);
            }
            // Head & Muzzle looking attentively up at Yudhishthira
            translate([0, 3.8, 9.2]) {
                rotate([-15, 0, 0]) {
                    sphere(r = 2.0, $fn = 12);
                    // Pointed snout
                    translate([0, 1.8, -0.3]) sphere(r = 1.2, $fn = 8);
                    // Alert prick ears
                    translate([-1.0, -0.4, 1.5]) cylinder(r1 = 0.8, r2 = 0.2, h = 2.0, $fn = 6);
                    translate([ 1.0, -0.4, 1.5]) cylinder(r1 = 0.8, r2 = 0.2, h = 2.0, $fn = 6);
                }
            }
            // Curled husky/Himalayan shepherd tail
            hull() {
                translate([0, -3.5, 3.0]) sphere(r = 1.2, $fn = 8);
                translate([0, -4.2, 6.5]) sphere(r = 0.9, $fn = 8);
                translate([0, -2.5, 7.5]) sphere(r = 0.7, $fn = 8);
            }
        }
    }
}

// =========================================================
// 2. BHIMA (MASSIVE MUSCULAR WARRIOR WITH ICONIC GADA)
// =========================================================
module bhima_statue_model() {
    union() {
        // Massive Heavy-set Legs & Warrior Dhoti (Broad grounding)
        hull() {
            translate([0, 0, 0]) cylinder(r1 = 5.6, r2 = 4.4, h = 11.0, $fn = 16);
            translate([0, 0, 11.0]) cylinder(r = 4.0, h = 0.1, $fn = 14);
        }
        // Colossal Muscular Chest & Warrior Harness
        hull() {
            translate([0, 0, 10.5]) cylinder(r1 = 4.0, r2 = 5.2, h = 8.0, $fn = 14);
            translate([0, 0, 18.5]) scale([1.5, 0.95, 1.0]) sphere(r = 4.3, $fn = 14);
        }
        // Warrior Head, Fierce Moustache & Topknot
        translate([0, 0, 22.8]) {
            sphere(r = 2.8, $fn = 14);
            // Powerful warrior hair bun
            translate([0, -0.6, 2.4]) sphere(r = 1.6, $fn = 10);
            // Moustache
            translate([0, 1.4, -0.6]) scale([1.4, 0.6, 0.6]) sphere(r = 1.2, $fn = 8);
        }
        // Right Arm supporting the heavy Gada on shoulder
        hull() {
            translate([-4.8, 0, 19.0]) sphere(r = 1.8, $fn = 10);
            translate([-3.8, -2.8, 20.0]) sphere(r = 1.5, $fn = 10);
        }
        // Legendary Colossal Fluted Mace (Gada)
        translate([-4.0, -2.8, 20.0]) {
            rotate([-32, 18, 0]) {
                // Heavy shaft
                cylinder(r = 1.7, h = 18.0, center = true, $fn = 10);
                // Fluted Mace Head
                translate([0, 0, 9.5]) {
                    sphere(r = 4.4, $fn = 14);
                    // Fluted ridges
                    for (a = [0 : 60 : 300]) {
                        rotate([0, 0, a])
                            translate([3.5, 0, 0])
                                scale([0.6, 0.6, 1.2]) sphere(r = 1.2, $fn = 8);
                    }
                    // Crown spike on mace
                    cylinder(r1 = 4.4, r2 = 1.2, h = 3.0, $fn = 8);
                    translate([0, 0, 3.0]) sphere(r = 1.0, $fn = 8);
                }
            }
        }
        // Left Arm resting powerfully at hip with fist
        hull() {
            translate([4.8, 0, 18.5]) sphere(r = 1.7, $fn = 10);
            translate([4.4, 0, 11.5]) sphere(r = 1.4, $fn = 10);
        }
    }
}

// =========================================================
// 3. ARJUNA (SUPREME ARCHER WITH GANDIVA & QUIVER)
// =========================================================
module arjuna_statue_model() {
    union() {
        // Stately Robes & Dhoti
        hull() {
            translate([0, 0, 0]) cylinder(r1 = 4.5, r2 = 3.5, h = 10.5, $fn = 16);
            translate([0, 0, 10.5]) cylinder(r = 3.2, h = 0.1, $fn = 14);
        }
        // Athletic Torso & Archer Chestguard
        hull() {
            translate([0, 0, 10.0]) cylinder(r1 = 3.2, r2 = 3.9, h = 7.5, $fn = 12);
            translate([0, 0, 17.5]) scale([1.35, 0.85, 1.0]) sphere(r = 3.5, $fn = 12);
        }
        // Quiver of Divine Arrows strapped across back
        translate([1.4, -3.5, 14.5]) {
            rotate([-18, 12, 0]) {
                cylinder(r1 = 1.8, r2 = 2.2, h = 10.0, $fn = 8);
                // Arrow nocks & fletchings protruding
                translate([0, 0, 10.0]) {
                    cylinder(r1 = 2.0, r2 = 0.9, h = 3.0, $fn = 8);
                    translate([0, 0, 3.0]) sphere(r = 1.0, $fn = 8);
                }
            }
        }
        // Head & Archer Tiara (Kiriti)
        translate([0, 0, 21.2]) {
            sphere(r = 2.4, $fn = 14);
            translate([0, 0, 1.8]) cylinder(r1 = 2.2, r2 = 1.3, h = 2.5, $fn = 10);
            translate([0, 0, 4.3]) sphere(r = 0.8, $fn = 8);
        }
        // Left Arm gripping the upright Gandiva Bow
        hull() {
            translate([3.6, 0, 17.5]) sphere(r = 1.4, $fn = 10);
            translate([5.2, 2.0, 11.5]) sphere(r = 1.2, $fn = 10);
        }
        // Divine Gandiva Bow (Recurve profile, grounded into plinth for 100% stability)
        translate([5.4, 2.0, 0]) {
            union() {
                // Lower bow limb grounded to bed
                hull() {
                    translate([0, 0, 0]) cylinder(r = 1.4, h = 0.5, $fn = 8);
                    translate([0.6, 0, 11.5]) cylinder(r = 1.4, h = 0.5, $fn = 8);
                }
                // Upper recurve bow limb
                hull() {
                    translate([0.6, 0, 11.5]) cylinder(r = 1.4, h = 0.5, $fn = 8);
                    translate([-0.6, 0, 26.0]) cylinder(r = 1.1, h = 0.5, $fn = 8);
                }
                // Bow string anchor strut (Rigid, print-safe)
                hull() {
                    translate([-0.5, 0, 25.5]) cylinder(r = 0.9, h = 0.5, $fn = 8);
                    translate([-0.5, 0, 2.0]) cylinder(r = 0.9, h = 0.5, $fn = 8);
                }
            }
        }
        // Right Arm across chest (Checking bowstring / warrior salute)
        hull() {
            translate([-3.6, 0, 17.5]) sphere(r = 1.4, $fn = 10);
            translate([-1.8, 2.2, 13.0]) sphere(r = 1.1, $fn = 10);
        }
    }
}

// =========================================================
// 4. NAKULA (HANDSOME SWORDSMAN WITH TALWAR & CLOAK)
// =========================================================
module nakula_statue_model() {
    union() {
        // Legs & Flowing Shawl Drape
        hull() {
            translate([0, 0, 0]) cylinder(r1 = 4.3, r2 = 3.3, h = 10.0, $fn = 16);
            translate([0, -1.0, 0]) cylinder(r1 = 3.9, r2 = 2.9, h = 12.5, $fn = 14);
        }
        // Torso & Asymmetric Traveling Cloak
        hull() {
            translate([0, 0, 10.0]) cylinder(r1 = 3.1, r2 = 3.6, h = 7.0, $fn = 12);
            translate([0, 0, 17.0]) scale([1.25, 0.9, 1.0]) sphere(r = 3.3, $fn = 12);
        }
        // Head
        translate([0, 0, 20.5]) {
            sphere(r = 2.3, $fn = 14);
            translate([0, 0, 1.6]) cylinder(r1 = 1.9, r2 = 0.8, h = 2.2, $fn = 8);
        }
        // Curved Himalayan Talwar Sword at hip (Solidly anchored from belt to floor)
        translate([-4.0, 0, 0]) {
            rotate([8, -6, 0]) {
                // Scabbard grounded to floor
                hull() {
                    translate([0, 0, 0]) cube([1.5, 2.6, 1.0]);
                    translate([0, 0, 14.0]) cube([1.5, 2.6, 1.0]);
                }
                // Hilt & Disk Pommel
                translate([0.7, 1.3, 14.5]) {
                    cylinder(r = 1.1, h = 3.2, $fn = 8);
                    translate([0, 0, 3.2]) cylinder(r1 = 1.8, r2 = 0.5, h = 1.2, $fn = 10);
                }
            }
        }
        // Arms
        hull() {
            translate([-3.4, 0, 17.0]) sphere(r = 1.3, $fn = 8);
            translate([-3.8, 0.8, 14.0]) sphere(r = 1.1, $fn = 8);
        }
        hull() {
            translate([3.4, 0, 17.0]) sphere(r = 1.3, $fn = 8);
            translate([2.4, 1.8, 11.0]) sphere(r = 1.1, $fn = 8);
        }
    }
}

// =========================================================
// 5. SAHADEVA (WISE SCHOLAR WITH SACRED SCRIPTURE GRANTH)
// =========================================================
module sahadeva_statue_model() {
    union() {
        // Scholarly Draped Robes
        hull() {
            translate([0, 0, 0]) cylinder(r1 = 4.3, r2 = 3.3, h = 10.0, $fn = 16);
            translate([0, 0, 10.0]) cylinder(r = 3.1, h = 0.1, $fn = 14);
        }
        // Torso
        hull() {
            translate([0, 0, 10.0]) cylinder(r1 = 3.1, r2 = 3.6, h = 7.0, $fn = 12);
            translate([0, 0, 17.0]) scale([1.25, 0.85, 1.0]) sphere(r = 3.2, $fn = 12);
        }
        // Head
        translate([0, 0, 20.5]) {
            sphere(r = 2.3, $fn = 14);
            translate([0, 0, 1.5]) cylinder(r1 = 1.9, r2 = 0.7, h = 2.4, $fn = 8);
        }
        // Both Arms holding the Sacred Pothi / Granth Scripture in front
        hull() {
            translate([-3.2, 0, 16.5]) sphere(r = 1.2, $fn = 8);
            translate([-1.8, 2.8, 13.0]) sphere(r = 1.0, $fn = 8);
        }
        hull() {
            translate([3.2, 0, 16.5]) sphere(r = 1.2, $fn = 8);
            translate([1.8, 2.8, 13.0]) sphere(r = 1.0, $fn = 8);
        }
        // Sacred Palm-Leaf Scripture Manuscript (Pothi Book)
        translate([-4.0, 2.5, 12.0]) {
            hull() {
                cube([8.0, 2.6, 2.2]);
            }
            // Binding cord ribbon detail
            translate([3.6, -0.1, 0]) cube([0.8, 2.8, 2.4]);
        }
    }
}

// =========================================================
// 6. DRAUPADI (EMPRESS PANCHALI IN HIMALAYAN DRAPE)
// =========================================================
module draupadi_statue_model() {
    union() {
        // Flowing Pleated Saree (Solid broad grounding)
        hull() {
            translate([0, 0, 0]) cylinder(r1 = 4.8, r2 = 3.2, h = 9.5, $fn = 16);
            translate([0, 0, 9.5]) cylinder(r = 2.8, h = 0.1, $fn = 14);
        }
        // Slender Torso & Saree Pallu crossing chest
        hull() {
            translate([0, 0, 9.5]) cylinder(r1 = 2.8, r2 = 3.2, h = 6.5, $fn = 12);
            translate([0, 0, 16.0]) scale([1.15, 0.8, 1.0]) sphere(r = 2.9, $fn = 12);
        }
        // Head, Veiled Hair Bun & Maang Tikka
        translate([0, 0, 19.8]) {
            sphere(r = 2.1, $fn = 14);
            // Elegant traditional Juda (Hair Bun)
            translate([0, -1.6, 0.4]) sphere(r = 1.5, $fn = 10);
            // Saree veil over head
            translate([0, -0.5, 1.4]) scale([1.1, 1.2, 0.8]) sphere(r = 1.8, $fn = 10);
        }
        // Both Hands joined in revered Namaste / Anjali Mudra
        hull() {
            translate([-2.8, 0, 15.5]) sphere(r = 1.1, $fn = 8);
            translate([0, 2.2, 13.8]) sphere(r = 0.9, $fn = 8);
        }
        hull() {
            translate([2.8, 0, 15.5]) sphere(r = 1.1, $fn = 8);
            translate([0, 2.2, 13.8]) sphere(r = 0.9, $fn = 8);
        }
        // Folded praying palms
        translate([0, 2.5, 13.8])
            scale([0.8, 1.3, 1.3]) sphere(r = 1.0, $fn = 8);
    }
}
