// ====================================================================
// Modular Mountain Bridge - ASSEMBLED PREVIEW (50% WIDER DECK + V-PYLON)
// ====================================================================

use <01_bridge_deck.scad>
use <02_bottom_center_pillar_30mm.scad>
use <03_top_cable_pylon_tower.scad>
use <04_deck_base_clamp.scad>

module assembled_bridge() {
    color([0.28, 0.45, 0.65])
        bridge_deck_part();

    color([0.38, 0.40, 0.42])
        translate([0, 0, -30.0])
            bottom_center_pillar_part();

    color([0.88, 0.90, 0.92])
        translate([0, 0, 3.8])
            top_cable_pylon_tower_part();

    // High-Tightness Under-Deck Base Clamps (installed strictly below deck at X = +/- 25.0mm)
    for (cx = [-25.0, 25.0]) {
        color([0.85, 0.35, 0.20]) // High-visibility safety orange clamp
            translate([cx - 6.0, 0, 0]) {
                under_deck_clamp_body();
                locking_wedge_key();
            }
    }
}

assembled_bridge();
