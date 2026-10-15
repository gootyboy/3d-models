// ====================================================================
// SWARGAROHINI - MANA PANDAVAS & DHARMA DOG
// Authentic Sculptural Ensemble from Mana Village, Uttarakhand, India.
//
// Features:
//   * Heroic Sculpted Faces: Straight classical nose, nostrils,
//     cupid-bow lips, strong jawline, arched brows, tilak, ears.
//   * Authentic Hair:
//       - Yudhishthira: Short cropped ascetic hair with topknot.
//       - Bhima & Arjuna: Voluminous long hair cascading over shoulders.
//       - Nakula & Sahadeva: Handsome long heroic locks.
//       - Draupadi: Gracefully draped saree pallu veil over head.
//   * Muscular Anatomy:
//       - Bhima: Massive chiseled pectorals, defined abdominals,
//         bulging deltoids & biceps, orange neck cowl with knot.
//       - Yudhishthira: Royal orange shawl over shoulder, marigold garland.
//       - Solid pleated dhotis & sarees grounded directly into flat 2 mm base.
//   * Additive Manufacturing: 100% Solid Manifold, Supportless FDM.
// ====================================================================

$fn = 32;
base_h = 2.0;

// Figure scale: reduced by 20% per user request (0.85 * 0.80 = 0.68)
fs = 0.68;

// Figure rotation: -12 = matching dog facing direction along trail
figure_rot = -12;

char_select = "trail"; // ["trail", "dog", "yudhishthira", "bhima", "arjuna", "nakula", "sahadeva", "draupadi"]

// Core geometric helpers
module ell(c, r, f = 28) { translate(c) scale(r) sphere(r = 1, $fn = f); }
module seg(a, ra, b, rb, f = 20) {
    hull() { translate(a) sphere(r = ra, $fn = f); translate(b) sphere(r = rb, $fn = f); }
}

// ===================== HEROIC STATUE HEAD =====================
module statue_face(has_mustache = false, is_female = false) {
    // 1. Rear cranium (anatomical proportions, behind x = 0)
    hull() {
        ell([-1.2, 0, 3.4], [3.2, 3.6, 3.2]);
        ell([-1.6, 0, 0.0], [3.4, 3.8, 3.6]);
        ell([-1.2, 0, -3.2], [2.8, 3.4, 3.0]);
    }

    // 2. Forehead (smooth, rounded noble forehead)
    hull() {
        ell([0.8, 0, 3.8], [2.2, 3.0, 1.8]);
        ell([1.6, 0, 2.2], [1.8, 2.8, 1.4]);
        ell([0.0, 0, 2.6], [2.4, 3.2, 2.0]);
    }

    // 3. Sacred Tilak mark on forehead
    if (!is_female) {
        ell([2.5, 0, 2.8], [0.5, 0.3, 1.1], 16);
    } else {
        // Bindi / Maang tikka for Draupadi
        ell([2.5, 0, 2.4], [0.5, 0.5, 0.5], 16);
    }

    // 4. Arched Brow Ridge
    hull() {
        ell([2.4, 0, 1.6], [1.1, 0.9, 0.7]); // glabella
        for (s = [-1, 1]) {
            ell([2.1, s * 1.4, 1.7], [1.0, 1.2, 0.65]); // arched apex
            ell([1.4, s * 2.6, 1.3], [0.9, 1.0, 0.6]);  // soft tail
        }
    }

    // 5. Almond Eyes with subtle lids
    for (s = [-1, 1]) {
        translate([1.8, s * 1.5, 0.6]) rotate([0, 12, s * 6]) {
            ell([0, 0, 0], [0.8, 1.1, 0.6], 18); // eye volume
            translate([0.15, 0, 0.22]) ell([0, 0, 0], [0.75, 1.15, 0.35], 16); // upper lid
            translate([0.1, 0, -0.2]) ell([0, 0, 0], [0.7, 1.05, 0.3], 16); // lower lid
        }
    }

    // 6. Natural Cheeks (smooth, blended, not blocky)
    for (s = [-1, 1]) {
        hull() {
            ell([1.5, s * 2.4, 0.8], [1.1, 1.1, 0.8]);
            ell([1.8, s * 2.2, -0.2], [1.2, 1.2, 1.2]); // cheek apex
            ell([1.5, s * 1.5, -0.8], [1.3, 1.2, 1.2]); // medial cheek
            ell([1.0, s * 2.8, -1.8], [1.4, 1.1, 1.4]); // lateral cheek
            ell([0.0, s * 2.6, -1.0], [1.8, 1.2, 1.6]); // smooth into skull
        }
    }

    // 7. Straight Noble Classical Nose
    hull() {
        ell([2.4, 0, 1.4], [0.8, 0.55, 0.5]); // nasion
        ell([3.0, 0, 0.4], [0.85, 0.55, 0.8]); // bridge
        ell([3.5, 0, -0.8], [0.9, 0.6, 0.8]); // lower bridge
        ell([3.8, 0, -1.6], [0.85, 0.7, 0.7]); // rounded tip
    }
    // Nostrils (alar wings)
    for (s = [-1, 1]) {
        hull() {
            ell([3.2, s * 0.75, -1.65], [0.7, 0.5, 0.5]);
            ell([2.6, s * 0.95, -1.75], [0.8, 0.5, 0.5]);
        }
    }

    // 8. Philtrum & Mouth
    hull() {
        ell([2.7, 0, -2.1], [0.8, 0.7, 0.4]);
        ell([2.9, 0, -2.7], [0.8, 0.9, 0.4]);
    }
    // Upper lip (serene, noble curve)
    hull() {
        ell([3.25, 0, -2.85], [0.7, 0.4, 0.4]);
        for (s = [-1, 1]) {
            ell([3.35, s * 0.5, -2.8], [0.65, 0.4, 0.35]);
            ell([2.7, s * 1.3, -3.0], [0.6, 0.45, 0.3]);
        }
    }
    // Royal Mustache (for warrior princes)
    if (has_mustache) {
        for (s = [-1, 1]) {
            hull() {
                ell([3.3, s * 0.4, -2.65], [0.6, 0.5, 0.4]);
                ell([3.2, s * 1.3, -2.75], [0.6, 0.7, 0.35]);
                ell([2.8, s * 2.2, -3.1], [0.5, 0.5, 0.3]); // curled tip
            }
        }
    }
    // Lower lip (supported, gentle closed smile)
    hull() {
        ell([3.15, 0, -3.45], [0.8, 1.0, 0.5]);
        for (s = [-1, 1]) ell([2.7, s * 1.0, -3.35], [0.6, 0.5, 0.35]);
    }

    // 9. Handsome Chin
    hull() {
        ell([2.5, 0, -4.1], [0.8, 1.1, 0.4]); // crease
        ell([3.0, 0, -4.9], [1.0, is_female ? 1.2 : 1.4, 0.8]); // chin front
        ell([2.3, 0, -5.6], [1.1, 1.2, 0.65]); // chin base
        for (s = [-1, 1]) {
            ell([2.7, s * 0.9, -4.9], [0.9, 0.8, 0.7]);
            ell([1.8, s * 1.6, -5.2], [1.0, 0.8, 0.65]);
        }
    }

    // 10. Mandible & Jawbone
    for (s = [-1, 1]) {
        hull() {
            ell([2.7, s * 0.9, -4.9], [0.9, 0.8, 0.7]);
            ell([1.4, s * 2.2, -4.5], [1.2, 1.0, 0.85]);
            ell([-0.4, s * 3.0, -3.5], [1.3, 1.0, 1.0]); // gonion
            ell([-0.6, s * 3.0, -1.2], [1.2, 1.0, 1.2]);
        }
        // Smooth cheek to jaw transition
        hull() {
            ell([1.8, s * 2.2, -0.2], [1.2, 1.2, 1.2]);
            ell([1.4, s * 2.2, -4.5], [1.2, 1.0, 0.85]);
            ell([2.2, s * 1.2, -2.4], [0.9, 0.8, 0.8]);
        }
    }

    // 11. Sculpted Ears
    for (s = [-1, 1]) {
        translate([-0.5, s * 3.3, -0.6]) rotate([4, 6, s * 8]) {
            hull() {
                ell([0, 0, 1.0], [0.65, 0.45, 0.95]);
                ell([0.2, 0, -0.2], [0.75, 0.5, 0.95]);
                ell([0.05, 0, -1.2], [0.55, 0.45, 0.75]);
            }
        }
    }

    // 12. Muscular Neck connecting naturally into Trapezius and Torso
    hull() {
        ell([-0.3, 0, -3.2], [2.4, 2.6, 1.6]);
        ell([-0.2, 0, -5.8], [2.8, 3.0, 1.8]);
        ell([ 0.0, 0, -8.0], [3.6, 4.2, 2.0]);
        // Trapezius slope backwards and laterally
        ell([-2.0, 0, -6.5], [2.6, 3.6, 1.8]);
        ell([-2.6, 0, -9.0], [3.0, 5.4, 2.0]);
        for (s = [-1, 1]) ell([-1.2, s * 4.6, -8.5], [2.2, 2.4, 1.8]);
    }
}

// Yudhishthira: Short cropped hair with ascetic knot
module hair_yudhishthira() {
    hull() {
        ell([-1.0, 0, 3.2], [3.6, 3.8, 3.2]);
        ell([-1.5, 0, 0.4], [3.8, 3.9, 3.4]);
        ell([-1.4, 0, -2.6], [3.4, 3.6, 2.8]);
        ell([0.4, 0, 3.6], [3.0, 3.2, 2.0]);
    }
    // Ascetic Topknot / crown
    hull() {
        ell([-0.3, 0, 5.6], [1.7, 1.7, 1.4]);
        ell([-0.3, 0, 6.6], [1.0, 1.0, 0.9]);
    }
}

// Bhima & Arjuna: Voluminous heroic flowing hair over shoulders
module hair_flowing() {
    hair_yudhishthira();
    // Flowing mane down the back
    hull() {
        ell([-2.0, 0, -1.5], [3.2, 3.8, 3.0]);
        ell([-2.6, 0, -6.5], [3.4, 4.6, 3.4]);
        ell([-3.0, 0, -10.5], [3.4, 5.4, 3.4]);
    }
    // Flowing wavy locks over shoulders
    for (s = [-1, 1]) {
        hull() {
            ell([-0.5, s * 3.6, -2.0], [1.3, 1.2, 2.0]);
            ell([ 0.0, s * 4.2, -5.8], [1.5, 1.4, 2.4]);
            ell([ 0.5, s * 4.6, -9.5], [1.5, 1.5, 2.4]);
        }
    }
}

// Draupadi: Saree Pallu Veil draped over head and shoulders
module hair_veil() {
    hull() {
        ell([-0.8, 0, 3.6], [3.8, 4.0, 3.4]);
        ell([-1.4, 0, 0.4], [4.0, 4.2, 3.6]);
        ell([-1.6, 0, -3.0], [3.8, 4.0, 3.2]);
        ell([ 0.6, 0, 3.6], [3.2, 3.4, 2.0]);
    }
    // Veil drape falling gracefully down back and sides
    hull() {
        ell([-2.2, 0, -1.5], [3.4, 4.2, 3.2]);
        ell([-2.8, 0, -6.5], [3.6, 4.8, 3.4]);
        ell([-3.2, 0, -11.0], [3.6, 5.6, 3.4]);
    }
    for (s = [-1, 1]) {
        hull() {
            ell([-0.4, s * 3.8, -1.8], [1.4, 1.3, 2.2]);
            ell([ 0.1, s * 4.4, -5.8], [1.6, 1.5, 2.5]);
            ell([ 0.6, s * 4.8, -9.8], [1.6, 1.6, 2.5]);
        }
    }
}

module character_head(type = "yudhishthira") {
    if (type == "yudhishthira") {
        statue_face(has_mustache = true, is_female = false);
        hair_yudhishthira();
    } else if (type == "bhima") {
        statue_face(has_mustache = true, is_female = false);
        hair_flowing();
    } else if (type == "arjuna") {
        statue_face(has_mustache = false, is_female = false);
        hair_flowing();
    } else if (type == "draupadi") {
        statue_face(has_mustache = false, is_female = true);
        hair_veil();
    } else {
        statue_face(has_mustache = false, is_female = false);
        hair_flowing();
    }
}

// ===================== BODY ANATOMY =====================
// Muscular heroic torso
module athletic_torso(bulk = 1.0, is_bare = true) {
    hull() {
        ell([0.0, 0, 49.0], [6.2, 8.4 * bulk, 3.0]); // waist
        ell([0.2, 0, 57.0], [6.8, 9.6 * bulk, 4.2]); // mid ribs
        ell([0.6, 0, 66.0], [7.6, 11.6 * bulk, 5.0]); // chest
        ell([0.0, 0, 72.5], [6.2, 12.2 * bulk, 3.5]); // upper chest
    }
    // Trapezius and neck anchorage
    hull() {
        ell([-1.0, 0, 72.0], [5.0, 7.5 * bulk, 3.0]);
        ell([-0.4, 0, 76.5], [4.2, 5.0 * bulk, 2.5]);
    }
    // Smooth, realistic sculpted musculature (no isolated balls)
    if (is_bare) {
        for (s = [-1, 1]) {
            // Sculpted Pectoralis Major slab
            hull() {
                ell([4.6, s * 1.8 * bulk, 66.5], [2.2, 3.2 * bulk, 2.8]);
                ell([5.0, s * 5.0 * bulk, 65.5], [2.0, 4.0 * bulk, 3.2]);
                ell([3.6, s * 4.6 * bulk, 62.5], [1.8, 3.6 * bulk, 1.8]);
            }
            // Clavicle bone ridge
            ell([4.2, s * 3.6, 71.8], [0.9, 3.4, 0.7]);
            // Subtle anatomical abdominal pads
            for (k = [0 : 2]) {
                ell([4.8, s * 2.0 * bulk, 53.0 + k * 3.2], [1.1, 1.7 * bulk, 1.2]);
            }
        }
    }
}

// Solid flowing dhoti with crisp surface pleats (grounded to z = 0)
module pleated_dhoti() {
    hull() {
        ell([0.0, 0, 49.0], [6.8, 9.2, 2.5]);
        ell([0.4, 0, 26.0], [7.8, 10.4, 2.0]);
        ell([0.6, 0, 0.0], [8.8, 11.5, 2.5]); // grounded
    }
    // Waistband sash
    ell([0.3, 0, 50.0], [7.2, 9.6, 1.6]);
    // Subtle crisp surface pleats
    for (i = [-5 : 5]) {
        a = i * 16;
        hull() {
            ell([0.4 + 7.4 * cos(a), 9.4 * sin(a), 47.0], [0.55, 0.55, 1.0]);
            ell([0.6 + 8.4 * cos(a), 10.8 * sin(a), 1.0], [0.65, 0.65, 1.5]);
        }
    }
    // Central cascading fan pleats (Kaccha / Patta)
    for (j = [-2 : 2]) {
        hull() {
            ell([7.6, j * 1.4, 48.0], [0.9, 0.9, 1.4]);
            ell([9.2, j * 2.2, 1.0], [1.1, 1.1, 1.6]);
        }
    }
    // Feet embedded into base
    for (s = [-1, 1]) {
        ell([8.0, s * 4.4, 1.2], [3.6, 2.4, 2.2]);
    }
}

// Draupadi's graceful saree
module draupadi_saree() {
    hull() {
        ell([0.0, 0, 46.0], [5.8, 7.8, 2.5]);
        ell([0.4, 0, 24.0], [7.0, 9.0, 2.0]);
        ell([0.6, 0, 0.0], [8.0, 10.2, 2.5]); // reaches z = 0
    }
    // Saree pleats
    for (i = [-4 : 4]) {
        a = i * 18;
        hull() {
            ell([0.3 + 6.6 * cos(a), 8.4 * sin(a), 44.0], [0.55, 0.55, 1.0]);
            ell([0.5 + 7.6 * cos(a), 9.8 * sin(a), 1.0], [0.65, 0.65, 1.4]);
        }
    }
    // Saree pallu drape wrapping around waist
    hull() {
        ell([5.6, 1.8, 47.0], [1.4, 4.2, 1.8]);
        ell([6.2, -2.4, 30.0], [1.6, 3.8, 1.8]);
        ell([7.0, -3.2, 2.0], [1.8, 4.0, 2.2]);
    }
    for (s = [-1, 1]) ell([7.4, s * 3.8, 1.2], [3.2, 2.2, 2.0]);
}

// Muscular arm with defined deltoid, bicep, and forearm to wrist W
module sculpted_arm(S, E, W, scale_arm = 1.0) {
    k = scale_arm;
    // Deltoid cap
    ell(S, [4.0 * k, 3.8 * k, 4.5 * k], 22);
    // Upper arm
    hull() {
        ell(S, [3.6 * k, 3.4 * k, 3.2 * k], 20);
        translate(S + 0.42 * (E - S) + [0.8 * k, 0, 0])
            sphere(r = 3.2 * k, $fn = 20); // bicep bulge
        translate(E) sphere(r = 2.5 * k, $fn = 20); // elbow
    }
    // Forearm
    hull() {
        translate(E) sphere(r = 2.5 * k, $fn = 20);
        translate(E + 0.35 * (W - E)) sphere(r = 2.6 * k, $fn = 20);
        translate(W) sphere(r = 1.85 * k, $fn = 18);
    }
}

// 1. Natural relaxed hand with sculpted palm and fingers (hanging at side)
module relaxed_palm_hand(W, side = -1, k = 1.0) {
    translate(W) rotate([side * 6, 12, 0]) {
        hull() {
            sphere(r = 1.85 * k, $fn = 16);
            ell([0.4 * k, 0, -2.0 * k], [1.1 * k, 1.4 * k, 1.4 * k], 16);
        }
        hull() {
            ell([0.4 * k, 0, -2.0 * k], [1.1 * k, 1.4 * k, 1.4 * k], 16);
            ell([0.7 * k, side * 0.1 * k, -4.2 * k], [0.8 * k, 1.2 * k, 1.3 * k], 16);
        }
        hull() {
            ell([0.8 * k, -side * 0.7 * k, -0.6 * k], [0.65 * k, 0.65 * k, 0.8 * k], 14);
            ell([1.1 * k, -side * 0.5 * k, -2.2 * k], [0.55 * k, 0.55 * k, 0.9 * k], 14);
        }
    }
}

// 2. Muscular clenched fist (Bhima right hand at belly)
module clenched_fist(W, k = 1.16) {
    translate(W) rotate([0, -10, 35]) {
        hull() {
            sphere(r = 1.85 * k, $fn = 16);
            ell([1.2 * k, 0, 0.2 * k], [1.8 * k, 1.5 * k, 1.6 * k], 18);
        }
        hull() {
            ell([1.4 * k, -0.7 * k, 0.2 * k], [1.0 * k, 0.8 * k, 1.4 * k], 16);
            ell([1.4 * k,  0.7 * k, 0.2 * k], [1.0 * k, 0.8 * k, 1.4 * k], 16);
        }
        hull() {
            ell([0.5 * k, 1.3 * k, 0.6 * k], [0.85 * k, 0.8 * k, 0.8 * k], 14);
            ell([1.4 * k, 0.5 * k, 0.7 * k], [0.75 * k, 0.85 * k, 0.7 * k], 14);
        }
    }
}

// 3. Anchored palm resting on hip (Bhima left hand)
module hip_resting_hand(W, k = 1.16) {
    translate(W) rotate([18, -12, -22]) {
        hull() {
            sphere(r = 1.85 * k, $fn = 16);
            ell([0.8 * k, -0.6 * k, -0.8 * k], [1.5 * k, 1.2 * k, 1.4 * k], 18);
        }
        hull() {
            ell([0.8 * k, -0.6 * k, -0.8 * k], [1.5 * k, 1.2 * k, 1.4 * k], 18);
            ell([1.2 * k, -1.2 * k, -2.4 * k], [1.2 * k, 0.9 * k, 1.3 * k], 16);
        }
        hull() {
            ell([-0.3 * k, 0.7 * k, 0.2 * k], [0.75 * k, 0.85 * k, 0.7 * k], 14);
            ell([-0.7 * k, 1.4 * k, -0.6 * k], [0.65 * k, 0.75 * k, 0.7 * k], 14);
        }
    }
}

// 4. Gripping hand with curled palm and fingers (holding sash drape)
module grip_drape_hand(W, k = 1.0) {
    translate(W) rotate([8, -18, 22]) {
        hull() {
            sphere(r = 1.85 * k, $fn = 16);
            ell([0.9 * k, -0.4 * k, -0.5 * k], [1.4 * k, 1.5 * k, 1.2 * k], 18);
        }
        hull() {
            ell([0.9 * k, -0.4 * k, -0.5 * k], [1.4 * k, 1.5 * k, 1.2 * k], 18);
            ell([1.5 * k, -0.8 * k, -1.9 * k], [1.1 * k, 1.2 * k, 1.1 * k], 16);
        }
        hull() {
            ell([0.3 * k, 0.9 * k, 0.6 * k], [0.75 * k, 0.75 * k, 0.7 * k], 14);
            ell([1.2 * k, 0.4 * k, 0.4 * k], [0.65 * k, 0.75 * k, 0.65 * k], 14);
        }
    }
}

// 5. Beautiful joined Namaste palms (Anjali mudra) at chest
module namaste_palms(pos = [9.2, 0, 60.5], k = 0.92) {
    translate(pos) {
        for (s = [-1, 1]) {
            hull() {
                ell([0, s * 0.95 * k, 0], [1.4 * k, 0.75 * k, 1.8 * k], 16);
                ell([0.5 * k, s * 0.7 * k, 2.2 * k], [1.2 * k, 0.65 * k, 1.6 * k], 16);
            }
            hull() {
                ell([0.5 * k, s * 0.7 * k, 2.2 * k], [1.2 * k, 0.65 * k, 1.6 * k], 16);
                ell([0.9 * k, s * 0.35 * k, 4.8 * k], [0.85 * k, 0.38 * k, 1.5 * k], 16);
            }
            hull() {
                ell([0.9 * k, s * 0.35 * k, 4.8 * k], [0.85 * k, 0.38 * k, 1.5 * k], 16);
                ell([1.0 * k, s * 0.15 * k, 6.2 * k], [0.55 * k, 0.22 * k, 0.9 * k], 14);
            }
            hull() {
                ell([-0.5 * k, s * 1.05 * k, 0.7 * k], [0.75 * k, 0.65 * k, 0.75 * k], 14);
                ell([-0.2 * k, s * 0.85 * k, 2.4 * k], [0.55 * k, 0.55 * k, 1.0 * k], 14);
            }
        }
    }
}

// 6. Reverent open palm on chest/heart (Sahadeva)
module reverent_chest_palm(W, k = 0.92) {
    translate(W) rotate([-12, 22, -18]) {
        hull() {
            sphere(r = 1.85 * k, $fn = 16);
            ell([0.2 * k, -0.2 * k, 1.8 * k], [0.8 * k, 1.3 * k, 1.5 * k], 16);
        }
        hull() {
            ell([0.2 * k, -0.2 * k, 1.8 * k], [0.8 * k, 1.3 * k, 1.5 * k], 16);
            ell([0.4 * k, -0.3 * k, 3.8 * k], [0.6 * k, 1.0 * k, 1.1 * k], 14);
        }
        hull() {
            ell([0.3 * k, 0.8 * k, 0.5 * k], [0.55 * k, 0.55 * k, 0.65 * k], 14);
            ell([0.4 * k, 0.6 * k, 1.7 * k], [0.45 * k, 0.55 * k, 0.65 * k], 14);
        }
    }
}


// Royal orange shawl draped over one shoulder
module royal_shawl_shoulder(side = -1) {
    s = side;
    // Shoulder drape
    hull() {
        ell([-0.5, s * 11.2, 71.5], [5.6, 6.4, 4.5]);
        ell([-0.5, 0, 75.0], [4.8, 7.6, 2.2]);
        ell([1.5, s * 4.8, 63.0], [7.0, 7.4, 8.0]);
    }
    // Hanging cape at back
    hull() {
        ell([-4.8, s * 7.2, 67.0], [2.6, 7.4, 7.5]);
        ell([-5.2, s * 10.0, 48.0], [2.6, 5.8, 10.5]);
    }
    // Diagonal chest fall
    hull() {
        ell([1.5, s * 4.8, 63.0], [7.0, 7.4, 8.0]);
        ell([2.2, -s * 2.8, 51.0], [6.6, 5.2, 3.6]);
    }
}

// Royal orange shawl over both shoulders (Nakula / Sahadeva)
module royal_shawl_both() {
    hull() {
        for (s = [-1, 1]) ell([-0.5, s * 10.8, 71.0], [5.6, 6.4, 4.5]);
        ell([-0.5, 0, 75.0], [4.8, 7.6, 2.2]);
        ell([1.6, 0, 63.0], [7.4, 11.0, 8.5]);
    }
    hull() {
        ell([-4.8, 0, 67.0], [2.6, 10.5, 7.5]);
        ell([-5.2, 0, 49.0], [2.6, 9.5, 10.5]);
    }
}

// Orange neck cowl with knotted tie (Bhima)
module bhima_scarf_cowl() {
    difference() {
        ell([-0.2, 0, 74.5], [5.6, 6.5, 2.6]);
        ell([-0.2, 0, 74.5], [3.2, 3.4, 5.0]);
    }
    // Knot & tie
    ell([5.6, 0, 73.0], [1.9, 2.1, 1.7], 18);
    for (s = [-1, 1]) {
        hull() {
            ell([5.6, s * 0.85, 72.2], [1.3, 1.7, 0.9], 16);
            ell([7.0, s * 2.1, 63.0], [1.2, 1.9, 0.85], 16);
        }
    }
}

// Yellow marigold garland (Yudhishthira)
module marigold_garland() {
    N = 36;
    for (i = [0 : N]) {
        t = -1 + 2 * i / N;
        a = t * 85;
        z = 72.5 - 10.5 * pow(max(0, 1 - t * t), 1.1);
        ell([8.4 - 6.5 * t * t, 6.8 * sin(a), z], [1.2, 1.2, 1.2], 14);
    }
    ell([9.2, 0, 60.5], [1.5, 1.4, 2.0], 14);
}

// Hanging cloth sash held in hand
module cloth_drape(y = 6.0, ztop = 50.0, zbot = 32.0, w = 3.4) {
    hull() {
        ell([8.2, y, ztop], [1.4, w, 1.1], 16);
        ell([8.5, y, zbot], [1.5, w * 1.1, 1.1], 16);
    }
    for (k = [-1, 0, 1]) {
        hull() {
            ell([9.1, y + k * w * 0.6, ztop - 1], [0.9, 0.75, 0.9], 12);
            ell([9.4, y + k * w * 0.65, zbot + 1], [0.9, 0.75, 0.9], 12);
        }
    }
}

// ===================== INDIVIDUAL CHARACTERS =====================

// 1. Yudhishthira - Righteous King
module yudhishthira() {
    athletic_torso(1.0, true);
    pleated_dhoti();
    royal_shawl_shoulder(-1);
    marigold_garland();
    sculpted_arm([0, -11.0, 71.0], [-0.5, -12.5, 53.5], [1.0, -11.4, 37.0], 1.0);
    relaxed_palm_hand([1.0, -11.4, 37.0], -1, 1.0);
    sculpted_arm([0,  11.0, 71.0], [-0.5,  13.0, 54.5], [7.8,   7.2, 51.5], 1.0);
    grip_drape_hand([7.8,   7.2, 51.5], 1.0);
    cloth_drape(6.0, 50.0, 32.0);
    translate([0.4, 0, 81.5]) rotate([0, 4, 0]) character_head("yudhishthira");
}

// 2. Bhima - Colossal Warrior
module bhima() {
    athletic_torso(1.18, true);
    pleated_dhoti();
    bhima_scarf_cowl();
    sculpted_arm([0, -12.4, 71.0], [-0.5, -14.6, 55.0], [8.8, -7.2, 52.0], 1.16);
    clenched_fist([8.8, -7.2, 52.0], 1.16);
    sculpted_arm([0,  12.4, 71.0], [-1.8,  17.0, 56.0], [3.0, 11.2, 48.5], 1.16);
    hip_resting_hand([3.0, 11.2, 48.5], 1.16);
    translate([0.4, 0, 81.5]) rotate([0, 4, 0]) character_head("bhima");
}

// 3. Arjuna - Heroic Archer
module arjuna() {
    athletic_torso(0.98, true);
    pleated_dhoti();
    royal_shawl_shoulder(1);
    sculpted_arm([0, -10.6, 71.0], [-0.5, -12.2, 53.5], [1.0, -11.0, 37.0], 0.96);
    relaxed_palm_hand([1.0, -11.0, 37.0], -1, 0.96);
    sculpted_arm([0,  10.6, 71.0], [-0.5,  12.5, 54.5], [8.0,  6.0, 52.0], 0.96);
    grip_drape_hand([8.0, 6.0, 52.0], 0.96);
    cloth_drape(-5.0, 50.0, 32.0);
    translate([0.4, 0, 81.5]) rotate([0, 4, 0]) character_head("arjuna");
}

// 4. Nakula - Handsome Prince
module nakula() {
    athletic_torso(0.93, false);
    pleated_dhoti();
    royal_shawl_both();
    for (s = [-1, 1]) {
        sculpted_arm([0, s * 10.2, 70.5], [2.6, s * 11.5, 55.0], [9.0, s * 1.5, 60.5], 0.92);
    }
    namaste_palms([9.2, 0, 60.5], 0.92);
    translate([0.4, 0, 81.2]) rotate([0, 4, 0]) character_head("nakula");
}

// 5. Sahadeva - Wise Prince
module sahadeva() {
    athletic_torso(0.93, true);
    pleated_dhoti();
    royal_shawl_shoulder(-1);
    sculpted_arm([0, -10.2, 70.5], [2.0, -11.5, 54.5], [8.8, -4.2, 58.5], 0.92);
    reverent_chest_palm([8.8, -4.2, 58.5], 0.92);
    sculpted_arm([0,  10.2, 70.5], [-0.5, 12.0, 53.5], [1.0, 10.8, 37.5], 0.92);
    relaxed_palm_hand([1.0, 10.8, 37.5], 1, 0.92);
    translate([0.4, 0, 81.2]) rotate([0, 4, 0]) character_head("sahadeva");
}

// 6. Draupadi - Empress Panchali
module draupadi() {
    scale(0.94) {
        hull() {
            ell([0.0, 0, 47.0], [5.0, 6.8, 2.5]);
            ell([0.3, 0, 55.0], [5.4, 7.6, 3.5]);
            ell([0.6, 0, 64.0], [6.2, 8.8, 4.0]);
            ell([0.0, 0, 70.5], [5.2, 9.2, 3.0]);
        }
        for (s = [-1, 1]) ell([4.6, s * 3.2, 63.5], [2.5, 3.0, 2.8]); // bust
        hull() {
            ell([-0.3, 0, 72.0], [3.4, 3.6, 2.8]);
            ell([-0.2, 0, 75.5], [2.8, 3.0, 2.0]);
        }
        draupadi_saree();
        for (s = [-1, 1]) {
            sculpted_arm([0, s * 9.2, 69.5], [2.4, s * 10.2, 55.0], [8.4, s * 1.4, 60.0], 0.80);
        }
        namaste_palms([8.6, 0, 60.0], 0.80);
        translate([0.4, 0, 80.0]) rotate([0, 4, 0]) character_head("draupadi");
    }
}


// 7. Dharma Dog - Faithful Canine Companion
module dharma_dog() {
    scale(1.45) union() {
        for (sy = [-4.0, 4.0]) {
            hull() { ell([8.5, sy * 0.85, 15.0], [2.6, 2.6, 2.6], 16); ell([9.0, sy, 9.5], [2.0, 2.0, 2.0], 16); }
            hull() { ell([9.0, sy, 9.5], [2.0, 2.0, 2.0], 16); ell([9.5, sy, 3.2], [1.6, 1.6, 1.6], 14); }
            hull() {
                ell([9.5, sy, 3.2], [1.6, 1.6, 1.6], 14);
                ell([11.2, sy, 0.0], [2.5, 2.0, 1.4], 16);
            }
        }
        for (sy = [-4.4, 4.4]) {
            hull() { ell([-9.0, sy * 0.8, 16.0], [4.7, 3.2, 4.0], 18); ell([-10.5, sy, 10.5], [2.5, 2.5, 2.5], 16); }
            hull() { ell([-10.5, sy, 10.5], [2.5, 2.5, 2.5], 16); ell([-12.5, sy, 6.5], [1.8, 1.8, 1.8], 14); ell([-8.5, sy, 3.0], [1.5, 1.5, 1.5], 14); }
            hull() {
                ell([-8.5, sy, 3.0], [1.5, 1.5, 1.5], 14);
                ell([-7.2, sy, 0.0], [2.3, 2.0, 1.3], 16);
            }
        }
        hull() {
            ell([8.0, 0, 15.0], [6.2, 5.0, 5.6], 22);
            ell([2.0, 0, 15.5], [6.0, 4.0, 5.0], 22);
            ell([-4.5, 0, 16.0], [4.4, 3.1, 4.0], 20);
            ell([-9.0, 0, 16.5], [5.3, 3.8, 4.8], 20);
        }
        hull() { ell([7.5, 0, 15.5], [4.8, 4.8, 4.8], 20); ell([12.5, 0, 22.5], [3.8, 3.8, 3.8], 20); }
        translate([11.5, 0, 20.0]) rotate([0, 35, 0]) {
            difference() {
                cylinder(r1 = 5.2, r2 = 4.6, h = 4.2, center = true, $fn = 26);
                cylinder(r = 3.6, h = 5.0, center = true, $fn = 22);
            }
            translate([0, -4.0, -1.0]) rotate([25, 0, 15]) {
                ell([0, 0, 0], [2.8, 2.0, 2.2], 16);
                translate([0.5, -1.0, -3.2]) cylinder(r1 = 1.6, r2 = 0.8, h = 3.4, $fn = 12);
            }
        }
        hull() { ell([14.0, 0, 25.0], [4.0, 4.0, 4.0], 22); ell([16.5, 0, 24.0], [3.2, 3.2, 3.2], 20); }
        hull() { ell([16.0, 0, 24.5], [2.8, 2.8, 2.8], 18); ell([21.0, 0, 22.2], [1.8, 1.8, 1.8], 16); ell([22.8, 0, 21.8], [1.1, 1.1, 1.1], 12); }
        hull() { ell([16.5, 0, 22.2], [2.1, 2.1, 2.1], 14); ell([20.5, 0, 20.4], [1.3, 1.3, 1.3], 12); }
        for (sy = [-1, 1]) hull() {
            ell([13.5, sy * 3.4, 27.5], [1.4, 1.4, 1.4], 12);
            ell([14.8, sy * 5.0, 26.5], [1.6, 1.6, 1.6], 12);
            ell([17.2, sy * 4.6, 23.8], [1.1, 1.1, 1.1], 10);
        }
        hull() { ell([-12.0, 0, 18.0], [2.0, 2.0, 2.0], 12); ell([-15.0, 0, 21.5], [1.6, 1.6, 1.6], 12); }
        hull() { ell([-15.0, 0, 21.5], [1.6, 1.6, 1.6], 12); ell([-14.0, 0, 26.0], [1.3, 1.3, 1.3], 10); }
        hull() { ell([-14.0, 0, 26.0], [1.3, 1.3, 1.3], 10); ell([-10.5, 0, 29.0], [1.0, 1.0, 1.0], 8); }
    }
}

// ===================== SCENE ASSEMBLY =====================
module on_base(x, y = 0, rot = figure_rot, s = fs) {
    translate([x, y, base_h]) rotate([0, 0, rot]) scale(s) children();
}

module flat_base(x0, x1, w, r = 4) {
    hull() {
        for (px = [x0 + r, x1 - r], py = [-w / 2 + r, w / 2 - r]) {
            translate([px, py, 0]) cylinder(r = r, h = base_h, $fn = 28);
        }
    }
}

module trail() {
    flat_base(-100, 132, 46);
    on_base( 86.0, 0, figure_rot, 0.64) dharma_dog();
    on_base( 41.0) yudhishthira();
    on_base( 16.5) bhima();
    on_base( -8.0) arjuna();
    on_base(-32.5) nakula();
    on_base(-57.0) sahadeva();
    on_base(-81.5) draupadi();
}

module single(w = 36) {
    flat_base(-w / 2, w / 2, w);
    children();
}

// Selector
if (char_select == "trail") trail();
if (char_select == "dog") { flat_base(-40, 40, 40); translate([0, 0, base_h]) dharma_dog(); }
if (char_select == "yudhishthira") single() on_base(0, 0, 0) yudhishthira();
if (char_select == "bhima") single() on_base(0, 0, 0) bhima();
if (char_select == "arjuna") single() on_base(0, 0, 0) arjuna();
if (char_select == "nakula") single() on_base(0, 0, 0) nakula();
if (char_select == "sahadeva") single() on_base(0, 0, 0) sahadeva();
if (char_select == "draupadi") single() on_base(0, 0, 0) draupadi();
