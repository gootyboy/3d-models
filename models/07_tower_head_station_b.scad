// ====================================================================
// [PRINT 07] Tower Head Station B (Cable Tensioning Station)
// Laid completely flat on its side at Z = 0.
// 28mm horizontal tensioner track prints as a clean vertical slot.
// ZERO SUPPORTS NEEDED!
// ====================================================================

use <tower_head_station_b.scad>;

$fn = 50;

// Centered on bed, resting flat on side at Z = 0
translate([-17.5, 0, 23.0])
    rotate([90, 0, 0])
        tower_head_b();
