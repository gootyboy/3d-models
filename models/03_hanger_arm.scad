// ====================================================================
// [PRINT 03] Rigid C-Hanger Arm
// 100% planar 2D extrusion resting completely flat on the print bed.
// Every single square millimeter touches the bed at Z = 0 like a coin.
// Layer lines run along the curve for maximum tensile strength.
// ZERO SUPPORTS NEEDED!
// ====================================================================

use <gondola_cabin.scad>;

$fn = 50;

// Centered on bed at Z = 0
translate([-13.0, -32.0, 0])
    hanger_arm_flat();
