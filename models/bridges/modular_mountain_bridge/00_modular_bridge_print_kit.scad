// ====================================================================
// Modular Snap-In Mountain Bridge - COMPLETE PRINT KIT (WITH 108MM CRADLE)
// ====================================================================

use <01_bridge_deck.scad>
use <02_bottom_center_pillar_30mm.scad>
use <03_top_cable_pylon_tower.scad>
use <04_deck_base_clamp.scad>

module modular_bridge_print_kit() {
    // 1. Roadway Bridge Deck (Flat on bed at Z = 0)
    translate([0, -36.0, 0])
        bridge_deck_part();

    // 2. Full-Length 108mm Sub-Deck Truss Cradle (Flat on bed at Z = 0)
    translate([0, 0, 0])
        full_length_deck_cradle();

    // 3. Top Cable Pylon Tower (Flat on back at Z = 0)
    translate([-20.0, 36.0, 4.5])
        top_cable_pylon_tower_part();

    // 4. Bottom Center Support Pillar 30mm (Flat on bed at Z = 0)
    translate([48.0, 36.0, 0])
        bottom_center_pillar_part();
}

modular_bridge_print_kit();
