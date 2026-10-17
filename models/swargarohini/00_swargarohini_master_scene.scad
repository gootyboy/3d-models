// ====================================================================
// SWARGAROHINI: MASTER SCENE - BHIM PUL, GATEWAY & PANDAVAS MARCH
// Location: Mana Village, Chamoli District, Uttarakhand, India
// Complete Diorama:
//   - Saraswati River Gorge & Monolithic Bhim Pul Bridge
//   - Swargarohini Marg Traditional Gabled Entrance Arch
//   - The Pandavas, Draupadi, and Lord Dharma crossing into the trail
// 100% Manifold Solid, Supportless FDM 3D Printable (<=45° Overhangs)
// ====================================================================

use <01_swargarohini_bhim_pul_entrance.scad>
use <03_pandavas_statues_mana.scad>

$fn = 28;

swargarohini_master_ensemble();

module swargarohini_master_ensemble() {
    union() {
        // --- 1. BHIM PUL, GORGE & SWARGAROHINI MARG GATEWAY ---
        swargarohini_trailhead_entrance();

        // --- 2. PANDAVAS CROSSING BHIM PUL & TRAILHEAD PATH ---
        // 1. Yudhishthira & Dog crossing Bhim Pul bridge over the gorge
        // (Bridge center: X = 0, Y = 12.0, Z = 24.5)
        translate([2.0, 12.0, 24.5])
            scale([0.8, 0.8, 0.8])
                yudhishthira_and_dog_model();

        // 2. Bhima standing beside the monolithic rock bridge he placed
        translate([-16.0, 10.0, 16.0])
            scale([0.8, 0.8, 0.8])
                bhima_statue_model();

        // 3. Arjuna advancing from the gateway arch
        translate([-8.0, -8.0, 16.0])
            scale([0.8, 0.8, 0.8])
                arjuna_statue_model();

        // 4. Nakula passing through the entrance gate
        translate([8.0, -18.0, 16.0])
            scale([0.8, 0.8, 0.8])
                nakula_statue_model();

        // 5. Sahadeva on the stone courtyard before the gate
        translate([-8.0, -32.0, 16.0])
            scale([0.8, 0.8, 0.8])
                sahadeva_statue_model();

        // 6. Draupadi entering the Swargarohini trail arch
        translate([6.0, -32.0, 16.0])
            scale([0.8, 0.8, 0.8])
                draupadi_statue_model();
    }
}
