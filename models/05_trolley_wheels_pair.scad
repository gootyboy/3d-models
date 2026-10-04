// ====================================================================
// [PRINT 05] Pair of Grooved Trolley Roller Wheels
// Deep V-groove for cable, built-in standoff hubs start flush at Z = 0.
// Print both wheels together spaced comfortably at center of bed.
// ZERO SUPPORTS NEEDED!
// ====================================================================

use <trolley_wheel.scad>;

$fn = 60;

// 2 wheels spaced 30mm apart, centered on bed at Z = 0
translate([-18, 0, 0])
    trolley_wheel();

translate([18, 0, 0])
    trolley_wheel();
