// ====================================================================
// [PRINT 08] Pair of Tower Sheave Wheels (54mm Snowflake Pulleys)
// High flanges for cable retention, 5mm motor D-shaft / M5 bolt bore.
// Both wheels rest flat on build plate at Z = 0 with generous clearance.
// ZERO SUPPORTS NEEDED!
// ====================================================================

use <tower_sheave.scad>;

$fn = 60;

// 2 large sheaves spaced comfortably, centered on bed at Z = 0
translate([-38, 0, 0])
    tower_sheave();

translate([38, 0, 0])
    tower_sheave();
