// ====================================================================
// [PRINT 10] 3D-Printable Alpine Tower Mast Column
// 
// Features:
// - Sits 100% flat on its lower plug at Z = 0.00 mm.
// - Total Height: 228 mm (Fits easily in FLSUN T1's 330 mm build height).
// - Lower Tenon (20mm) locks into Tower Base ([09]).
// - Upper Tenon (20mm) locks into Station Head A ([06]) or B ([07]).
// - 4x Stiffening Ribs withstand high horizontal cable tension.
// - 10mm Central Hollow Conduit allows Phase 2 motor wires to run inside.
// - 45° Diamond Windows reduce filament and require ZERO SUPPORTS!
// 
// (Print 2 of this file: one for Tower A, one for Tower B).
// ====================================================================

use <tower_base_and_stand.scad>;

$fn = 50;

// Centered on bed at Z = 0
tower_mast(column_h = 180);
