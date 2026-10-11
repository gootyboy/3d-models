// ====================================================================
// Modular Snap-In Mountain Bridge - COMPLETE PRINT KIT (WITH DECK CLAMP)
// ====================================================================

use <01_bridge_deck.scad>
use <02_bottom_center_pillar_30mm.scad>
use <03_top_cable_pylon_tower.scad>
use <04_deck_base_clamp.scad>

module modular_bridge_print_kit() {
    translate([0, 0, 0])
        bridge_deck_part();

    translate([0, -28.0, 0])
        bottom_center_pillar_part();

    translate([0, 28.0, 4.5])
        top_cable_pylon_tower_part();

    // High-Tightness Under-Deck Clamp & Locking Wedge Set (Oriented flat on bed)
    translate([-42.0, -26.0, 0])
        rotate([0, -90, 0])
            under_deck_clamp_body();

    translate([-52.0, -26.0, 0])
        rotate([0, 0, 90])
            locking_wedge_key();
}

modular_bridge_print_kit();
