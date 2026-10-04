// ====================================================================
// [PRINT 06] Tower Head Station A (Drive-Ready Station)
// Laid completely flat on its rear motor plate at Z = 0 (100% adhesion).
// Pre-drilled standard NEMA 17 holes print vertically through the face.
// ZERO SUPPORTS NEEDED!
// ====================================================================

use <tower_head_station_a.scad>;

$fn = 50;

// Centered on bed, resting flat on rear face of motor plate at Z = 0
translate([0, 3.0, 0])
    rotate([-90, 0, 0])
        tower_head_a();
