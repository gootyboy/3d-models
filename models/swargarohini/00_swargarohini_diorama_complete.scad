// ====================================================================
// SWARGAROHINI: COMPLETE MASTER DIORAMA
// Stairway to Heaven Entrance Portal & Ascending Pandavas Procession
// Location: Swargarohini Massif / Satopanth, Uttarakhand
// 100% Manifold Solid, Supportless FDM 3D Printable
// ====================================================================

use <01_swargarohini_stairway_entrance.scad>
use <02_pandavas_pilgrimage_figures.scad>

$fn = 28;

swargarohini_complete_diorama();

module swargarohini_complete_diorama() {
    union() {
        // --- 1. MOUNTAIN & STAIRWAY ENTRANCE PORTAL ---
        swargarohini_entrance_portal();

        // --- 2. PANDAVAS ASCENDING THE DIVINE STAIRS ---
        // Stairway parameters matching 01_swargarohini_stairway_entrance.scad:
        // stair_start_y = -52.0; num_steps = 14; pitch = 7.42mm; rise = 3.2mm; base_h = 3.0mm;
        
        // 1. Yudhishthira & Dog approaching the high celestial gate (Step 11, Y = 29.5, Z = 38.2)
        translate([0, 29.5, 38.2])
            scale([0.85, 0.85, 0.85])
                yudhishthira_and_dog();

        // 2. Bhima ascending the upper-mid stairs (Step 8, Y = 7.3, Z = 28.6)
        translate([-4.5, 7.3, 28.6])
            scale([0.85, 0.85, 0.85])
                bhima_figure();

        // 3. Arjuna climbing alongside Bhima (Step 6, Y = -7.5, Z = 22.2)
        translate([4.5, -7.5, 22.2])
            scale([0.85, 0.85, 0.85])
                arjuna_figure();

        // 4. Nakula trekking mid stairs (Step 4, Y = -22.3, Z = 15.8)
        translate([-4.0, -22.3, 15.8])
            scale([0.85, 0.85, 0.85])
                nakula_figure();

        // 5. Sahadeva ascending lower steps (Step 2, Y = -37.1, Z = 9.4)
        translate([4.0, -37.1, 9.4])
            scale([0.85, 0.85, 0.85])
                sahadeva_figure();

        // 6. Draupadi at the gateway entrance steps (Step 0, Y = -48.0, Z = 6.2)
        translate([0, -48.0, 6.2])
            scale([0.85, 0.85, 0.85])
                draupadi_figure();
    }
}
