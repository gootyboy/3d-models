// ====================================================================
// THE PANDAVAS & COMPANIONS ON THE SACRED SWARGAROHINI ASCENT
// Mythological Ascent to Heaven (Mahabharata: Mahaprasthanika Parva)
// Figures:
//   1. Yudhishthira (King of Dharma with Staff & Royal Crown)
//   2. The Loyal Dog (Lord Yama / Dharma in canine form)
//   3. Bhima (Mighty warrior with colossal Gada / Mace)
//   4. Arjuna (Supreme archer with Gandiva Bow & Quiver)
//   5. Nakula (Swordsman twin with talwar & traveling cloak)
//   6. Sahadeva (Wise scholar twin with sacred scripture scroll)
//   7. Draupadi (Empress Panchali in pilgrimage robes)
// Design: 100% Manifold Solid, Supportless FDM (solid drapes & anchors)
// ====================================================================

$fn = 24;
eps = 0.05;

// Selection parameter: "procession", "plinth_array", or individual names
figure_select = "plinth_array"; // ["procession", "plinth_array", "yudhishthira", "bhima", "arjuna", "nakula", "sahadeva", "draupadi"]

render_selection();

module render_selection() {
    if (figure_select == "plinth_array") {
        pandavas_plinth_array();
    } else if (figure_select == "procession") {
        pandavas_procession_line();
    } else if (figure_select == "yudhishthira") {
        yudhishthira_and_dog();
    } else if (figure_select == "bhima") {
        figure_base(); bhima_figure();
    } else if (figure_select == "arjuna") {
        figure_base(); arjuna_figure();
    } else if (figure_select == "nakula") {
        figure_base(); nakula_figure();
    } else if (figure_select == "sahadeva") {
        figure_base(); sahadeva_figure();
    } else if (figure_select == "draupadi") {
        figure_base(); draupadi_figure();
    }
}

// ---------------------------------------------------------
// DISPLAY PLINTH ARRAY (7 FIGURES ON INDIVIDUAL STEPPED BASES)
// ---------------------------------------------------------
module pandavas_plinth_array() {
    spacing_x = 24.0;
    
    // Front Row: Yudhishthira & Dog in center, flanked by Bhima & Arjuna
    translate([0, 0, 0])
        yudhishthira_and_dog();

    translate([-spacing_x, 0, 0]) {
        figure_base();
        bhima_figure();
    }

    translate([spacing_x, 0, 0]) {
        figure_base();
        arjuna_figure();
    }

    // Rear Row: Draupadi, Nakula, Sahadeva
    translate([-spacing_x, 26, 0]) {
        figure_base();
        nakula_figure();
    }

    translate([0, 26, 0]) {
        figure_base();
        draupadi_figure();
    }

    translate([spacing_x, 26, 0]) {
        figure_base();
        sahadeva_figure();
    }
}

// ---------------------------------------------------------
// PROCESSION LINE (SINGLE FILE PILGRIMAGE MARCH)
// ---------------------------------------------------------
module pandavas_procession_line() {
    // Procession marching order in legend:
    // Yudhishthira (front), Bhima, Arjuna, Nakula, Sahadeva, Draupadi (trail)
    translate([0, 75, 0])  yudhishthira_and_dog();
    translate([0, 50, 0])  { figure_base(); bhima_figure(); }
    translate([0, 25, 0])  { figure_base(); arjuna_figure(); }
    translate([0, 0, 0])   { figure_base(); nakula_figure(); }
    translate([0, -25, 0]) { figure_base(); sahadeva_figure(); }
    translate([0, -50, 0]) { figure_base(); draupadi_figure(); }
}

// Universal Bevelled Figure Base Plinth (Stops tipping, ensures 100% bed adhesion)
module figure_base(r = 9.0, h = 2.5) {
    cylinder(r1 = r, r2 = r - 1.0, h = h, $fn = 24);
}

// =========================================================
// 1. YUDHISHTHIRA (DHARMARAJA) & THE FAITHFUL CANINE
// =========================================================
module yudhishthira_and_dog() {
    union() {
        // Shared elongated base for King & Dog
        hull() {
            translate([-4, 0, 0]) cylinder(r1 = 9.0, r2 = 8.0, h = 2.5, $fn = 24);
            translate([ 9, 0, 0]) cylinder(r1 = 7.0, r2 = 6.0, h = 2.5, $fn = 24);
        }

        // Yudhishthira Figure
        translate([-4, 0, 2.5])
            yudhishthira_figure();

        // Faithful Dog (Lord Dharma in disguise)
        translate([8.5, 0, 2.5])
            dharma_dog();
    }
}

module yudhishthira_figure() {
    union() {
        // Robed Lower Body & Dhoti (Solid drape anchor to ground)
        hull() {
            translate([0, 0, 0]) cylinder(r1 = 4.2, r2 = 3.2, h = 10.0, $fn = 14);
            translate([0, 0, 10]) cylinder(r = 3.0, h = 0.1, $fn = 14);
        }
        // Royal Upper Torso & Angavastram (Shoulder sash)
        hull() {
            translate([0, 0, 9.5]) cylinder(r1 = 3.0, r2 = 3.6, h = 7.0, $fn = 12);
            translate([0, 0, 16.5]) scale([1.2, 0.8, 1.0]) sphere(r = 3.2, $fn = 12);
        }
        // Head & Royal Mukut / Crown
        translate([0, 0, 20.0]) {
            sphere(r = 2.4, $fn = 14); // Head
            // Mukut / Crown
            translate([0, 0, 1.2]) cylinder(r1 = 2.3, r2 = 1.0, h = 3.8, $fn = 10);
            translate([0, 0, 5.0]) sphere(r = 0.6, $fn = 10);
        }
        // Right Arm holding Royal Danda (Walking Staff)
        hull() {
            translate([-3.2, 0, 16.0]) sphere(r = 1.2, $fn = 10);
            translate([-4.5, 2.0, 10.0]) sphere(r = 1.0, $fn = 10);
        }
        // Sacred Pilgrim Staff (Thick, self-supporting grounded rod)
        translate([-4.5, 2.0, 0]) {
            cylinder(r = 1.2, h = 25.0, $fn = 10);
            translate([0, 0, 25.0]) sphere(r = 1.8, $fn = 12);
        }
        // Left Arm folded across chest in blessing / poise
        hull() {
            translate([3.2, 0, 16.0]) sphere(r = 1.2, $fn = 10);
            translate([1.5, 2.2, 13.0]) sphere(r = 1.0, $fn = 10);
        }
    }
}

// Loyal Dog (Lord Dharma)
module dharma_dog() {
    union() {
        // Solid body core grounded with legs
        hull() {
            translate([0, -2.5, 2.0]) sphere(r = 2.2, $fn = 10);
            translate([0,  2.5, 3.5]) sphere(r = 2.4, $fn = 10);
            translate([0, -2.0, 0.0]) cylinder(r = 1.8, h = 2.0, $fn = 8);
            translate([0,  2.0, 0.0]) cylinder(r = 1.8, h = 2.0, $fn = 8);
        }
        // Chest & Neck
        hull() {
            translate([0, 2.5, 3.5]) sphere(r = 2.4, $fn = 10);
            translate([0, 3.2, 7.5]) sphere(r = 1.7, $fn = 10);
        }
        // Head & Muzzle
        translate([0, 3.5, 8.5]) {
            sphere(r = 1.8, $fn = 10);
            // Snout pointing forward
            translate([0, 1.6, -0.2]) sphere(r = 1.1, $fn = 8);
            // Alert ears
            translate([-0.9, -0.4, 1.4]) cylinder(r1 = 0.7, r2 = 0.2, h = 1.8, $fn = 6);
            translate([ 0.9, -0.4, 1.4]) cylinder(r1 = 0.7, r2 = 0.2, h = 1.8, $fn = 6);
        }
        // Tail curling upward (solid loop)
        hull() {
            translate([0, -3.2, 2.8]) sphere(r = 1.1, $fn = 8);
            translate([0, -4.0, 6.0]) sphere(r = 0.8, $fn = 8);
        }
    }
}

// =========================================================
// 2. BHIMA (MIGHTY WARRIOR WITH COLOSSAL GADA)
// =========================================================
module bhima_figure() {
    translate([0, 0, 2.5]) {
        union() {
            // Massive Sturdy Legs & Dhoti (Grounded mass)
            hull() {
                translate([0, 0, 0]) cylinder(r1 = 5.2, r2 = 4.2, h = 10.0, $fn = 14);
                translate([0, 0, 10]) cylinder(r = 3.8, h = 0.1, $fn = 14);
            }
            // Broad Muscular Torso & Chest
            hull() {
                translate([0, 0, 9.5]) cylinder(r1 = 3.8, r2 = 4.8, h = 7.5, $fn = 12);
                translate([0, 0, 17.0]) scale([1.4, 0.9, 1.0]) sphere(r = 4.0, $fn = 12);
            }
            // Warrior Head & Knot
            translate([0, 0, 21.0]) {
                sphere(r = 2.6, $fn = 14);
                // Top-knot warrior hair
                translate([0, -0.5, 2.2]) sphere(r = 1.4, $fn = 10);
            }
            // Right Arm carrying heavy Mace (Gada) over shoulder
            hull() {
                translate([-4.5, 0, 17.5]) sphere(r = 1.6, $fn = 10);
                translate([-3.5, -2.5, 18.5]) sphere(r = 1.4, $fn = 10);
            }
            // Colossal Gada (Mace) anchored across shoulder & resting on back/ground
            translate([-3.8, -2.5, 18.5]) {
                // Shaft
                rotate([-35, 15, 0]) {
                    cylinder(r = 1.5, h = 16.0, center = true, $fn = 10);
                    // Mace Head (Heavy fluted sphere & spikes)
                    translate([0, 0, 8.5]) {
                        sphere(r = 4.0, $fn = 12);
                        cylinder(r1 = 4.0, r2 = 1.0, h = 2.5, $fn = 8);
                    }
                }
            }
            // Left Arm flexed at hip
            hull() {
                translate([4.5, 0, 17.0]) sphere(r = 1.6, $fn = 10);
                translate([4.0, 0, 10.5]) sphere(r = 1.3, $fn = 10);
            }
        }
    }
}

// =========================================================
// 3. ARJUNA (SUPREME ARCHER WITH GANDIVA BOW)
// =========================================================
module arjuna_figure() {
    translate([0, 0, 2.5]) {
        union() {
            // Legs & Robes
            hull() {
                translate([0, 0, 0]) cylinder(r1 = 4.4, r2 = 3.4, h = 10.0, $fn = 14);
                translate([0, 0, 10]) cylinder(r = 3.0, h = 0.1, $fn = 14);
            }
            // Athletic Torso
            hull() {
                translate([0, 0, 9.5]) cylinder(r1 = 3.0, r2 = 3.7, h = 7.0, $fn = 12);
                translate([0, 0, 16.5]) scale([1.3, 0.8, 1.0]) sphere(r = 3.3, $fn = 12);
            }
            // Quiver of Arrows slung on back
            translate([1.2, -3.2, 14.0]) {
                rotate([-15, 10, 0]) {
                    cylinder(r1 = 1.6, r2 = 2.0, h = 9.0, $fn = 8);
                    // Arrow nocks
                    translate([0, 0, 9.0]) cylinder(r1 = 1.8, r2 = 0.8, h = 2.5, $fn = 8);
                }
            }
            // Archer Head & Tiara/Headband
            translate([0, 0, 20.2]) {
                sphere(r = 2.3, $fn = 14);
                translate([0, 0, 1.6]) cylinder(r1 = 2.0, r2 = 1.2, h = 2.0, $fn = 10);
            }
            // Left Arm grasping upright Gandiva Bow
            hull() {
                translate([3.5, 0, 16.5]) sphere(r = 1.3, $fn = 10);
                translate([4.8, 2.0, 11.0]) sphere(r = 1.1, $fn = 10);
            }
            // Legendary Gandiva Bow (Curved, anchored to ground plinth)
            translate([5.0, 2.0, 0]) {
                union() {
                    // Lower bow limb to ground
                    hull() {
                        translate([0, 0, 0]) cylinder(r = 1.3, h = 0.5, $fn = 8);
                        translate([0.5, 0, 11.0]) cylinder(r = 1.3, h = 0.5, $fn = 8);
                    }
                    // Upper recurve bow limb
                    hull() {
                        translate([0.5, 0, 11.0]) cylinder(r = 1.3, h = 0.5, $fn = 8);
                        translate([-0.5, 0, 24.0]) cylinder(r = 1.0, h = 0.5, $fn = 8);
                    }
                }
            }
            // Right Hand on chest/belt
            hull() {
                translate([-3.5, 0, 16.5]) sphere(r = 1.3, $fn = 10);
                translate([-1.8, 2.0, 12.0]) sphere(r = 1.0, $fn = 10);
            }
        }
    }
}

// =========================================================
// 4. NAKULA (MASTER SWORDSMAN WITH TALWAR & CLOAK)
// =========================================================
module nakula_figure() {
    translate([0, 0, 2.5]) {
        union() {
            // Legs & Cloak Drape
            hull() {
                translate([0, 0, 0]) cylinder(r1 = 4.2, r2 = 3.2, h = 9.5, $fn = 14);
                translate([0, -1.0, 0]) cylinder(r1 = 3.8, r2 = 2.8, h = 12.0, $fn = 14);
            }
            // Torso & Traveling Cape
            hull() {
                translate([0, 0, 9.5]) cylinder(r1 = 3.0, r2 = 3.5, h = 6.5, $fn = 12);
                translate([0, 0, 16.0]) scale([1.2, 0.85, 1.0]) sphere(r = 3.2, $fn = 12);
            }
            // Head
            translate([0, 0, 19.5]) {
                sphere(r = 2.2, $fn = 14);
                translate([0, 0, 1.5]) cylinder(r1 = 1.8, r2 = 0.8, h = 2.0, $fn = 8);
            }
            // Sheathed Himalayan Sword / Talwar at side (Anchored to hip and ground)
            translate([-3.8, 0, 3.0]) {
                rotate([10, -5, 0]) {
                    hull() {
                        translate([0, 0, -3.0]) cube([1.4, 2.4, 1.0]);
                        translate([0, 0, 11.0]) cube([1.4, 2.4, 1.0]);
                    }
                    // Sword Hilt & Pommel
                    translate([0.7, 1.2, 11.5]) {
                        cylinder(r = 1.0, h = 3.0, $fn = 8);
                        translate([0, 0, 3.0]) sphere(r = 1.4, $fn = 8);
                    }
                }
            }
            // Arms
            hull() {
                translate([-3.2, 0, 16.0]) sphere(r = 1.2, $fn = 8);
                translate([-3.5, 0.8, 13.0]) sphere(r = 1.0, $fn = 8);
            }
            hull() {
                translate([3.2, 0, 16.0]) sphere(r = 1.2, $fn = 8);
                translate([2.2, 1.8, 10.0]) sphere(r = 1.0, $fn = 8);
            }
        }
    }
}

// =========================================================
// 5. SAHADEVA (SCHOLAR ASTRONOMER WITH SCRIPTURE SCROLL)
// =========================================================
module sahadeva_figure() {
    translate([0, 0, 2.5]) {
        union() {
            // Robes
            hull() {
                translate([0, 0, 0]) cylinder(r1 = 4.2, r2 = 3.2, h = 9.5, $fn = 14);
                translate([0, 0, 9.5]) cylinder(r = 3.0, h = 0.1, $fn = 14);
            }
            // Torso
            hull() {
                translate([0, 0, 9.5]) cylinder(r1 = 3.0, r2 = 3.5, h = 6.5, $fn = 12);
                translate([0, 0, 16.0]) scale([1.2, 0.8, 1.0]) sphere(r = 3.1, $fn = 12);
            }
            // Head
            translate([0, 0, 19.5]) {
                sphere(r = 2.2, $fn = 14);
                translate([0, 0, 1.4]) cylinder(r1 = 1.8, r2 = 0.6, h = 2.2, $fn = 8);
            }
            // Arms holding Sacred Palm-leaf Scripture (Pothi scroll)
            hull() {
                translate([-3.0, 0, 15.5]) sphere(r = 1.1, $fn = 8);
                translate([-1.5, 2.5, 12.0]) sphere(r = 0.9, $fn = 8);
            }
            hull() {
                translate([3.0, 0, 15.5]) sphere(r = 1.1, $fn = 8);
                translate([1.5, 2.5, 12.0]) sphere(r = 0.9, $fn = 8);
            }
            // Sacred Scripture Manuscript / Scroll (Held securely in front)
            translate([-3.5, 2.2, 11.2])
                cube([7.0, 2.2, 1.8]);
        }
    }
}

// =========================================================
// 6. DRAUPADI (EMPRESS PANCHALI IN PILGRIMAGE DRAPE)
// =========================================================
module draupadi_figure() {
    translate([0, 0, 2.5]) {
        union() {
            // Elegant Flared Saree Drape (Solid ground footprint)
            hull() {
                translate([0, 0, 0]) cylinder(r1 = 4.6, r2 = 3.0, h = 9.0, $fn = 16);
                translate([0, 0, 9.0]) cylinder(r = 2.6, h = 0.1, $fn = 14);
            }
            // Slender Torso & Saree Pallu Drape
            hull() {
                translate([0, 0, 9.0]) cylinder(r1 = 2.6, r2 = 3.0, h = 6.0, $fn = 12);
                translate([0, 0, 15.0]) scale([1.1, 0.75, 1.0]) sphere(r = 2.7, $fn = 12);
            }
            // Head & Veiled Hair Knot (Juda)
            translate([0, 0, 18.5]) {
                sphere(r = 2.0, $fn = 14);
                // Hair knot behind head
                translate([0, -1.5, 0.4]) sphere(r = 1.4, $fn = 10);
                // Ornate crownlet / Maang tikka
                translate([0, 0.5, 1.4]) cylinder(r1 = 1.2, r2 = 0.4, h = 1.4, $fn = 8);
            }
            // Hands joined in prayer (Namaste / Anjali Mudra)
            hull() {
                translate([-2.5, 0, 14.5]) sphere(r = 1.0, $fn = 8);
                translate([0, 2.0, 12.8]) sphere(r = 0.8, $fn = 8);
            }
            hull() {
                translate([2.5, 0, 14.5]) sphere(r = 1.0, $fn = 8);
                translate([0, 2.0, 12.8]) sphere(r = 0.8, $fn = 8);
            }
            // Hands
            translate([0, 2.2, 12.8])
                scale([0.8, 1.2, 1.2]) sphere(r = 0.9, $fn = 8);
        }
    }
}
