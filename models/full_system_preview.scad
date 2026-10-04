// ====================================================================
// Master Assembly Preview (Christmas Gondola System - Phase 1)
// Open this file in OpenSCAD and press F5 to view the complete setup!
// ====================================================================

use <tower_base_and_stand.scad>;
use <tower_head_station_a.scad>;
use <tower_head_station_b.scad>;
use <tower_sheave.scad>;
use <trolley_carriage.scad>;
use <trolley_wheel.scad>;
use <gondola_cabin.scad>;

$fn = 30;

// Preview parameters
span_distance = 320; // Visual preview span (mm)
tower_height  = 160; // Visual preview mast height (mm)
gondola_pos   = 0.45; // Position along span (0.0 to 1.0)

// 1. Tower A (Drive-Ready Station)
translate([-span_distance / 2, 0, 0]) {
    color("darkslategray") tower_base();
    color("silver") translate([0, 0, 30]) cylinder(d = 20, h = tower_height - 30);
    color("crimson") translate([0, 0, tower_height]) tower_head_a();
    color("gold") translate([0, 9, tower_height + 28]) rotate([90, 0, 0]) tower_sheave();
}

// 2. Tower B (Tension Station)
translate([span_distance / 2, 0, 0]) {
    color("darkslategray") tower_base();
    color("silver") translate([0, 0, 30]) cylinder(d = 20, h = tower_height - 30);
    color("forestgreen") translate([0, 0, tower_height + 12]) tower_head_b();
    color("gold") translate([15, 0, tower_height + 12]) rotate([90, 0, 0]) tower_sheave();
}

// 3. Track Cable (Visualized in black)
cable_z = tower_height + 28;
color("black")
    translate([0, 0, cable_z])
        rotate([0, 90, 0])
            cylinder(d = 1.6, h = span_distance + 20, center = true);

// 4. Gondola & Trolley Carriage
gondola_x = -span_distance / 2 + (span_distance * gondola_pos);

translate([gondola_x, 0, cable_z]) {
    // Trolley carriage
    color("firebrick") trolley_carriage();
    
    // Trolley wheels
    color("gold") {
        translate([19, 0, 2]) rotate([90, 0, 0]) trolley_wheel();
        translate([-19, 0, 2]) rotate([90, 0, 0]) trolley_wheel();
    }
    
    // Hanger arm (top eyelet pins directly into trolley lower clevis)
    color("snow")
        translate([0, -6, -85])
            hanger_arm();
                
    // Gondola Roof (clevis bracket accepts hanger lower tab)
    color("darkred")
        translate([0, 0, -99])
            cabin_roof();
            
    // Gondola Cabin Body (plugs into underside of roof)
    color("crimson")
        translate([0, 0, -149])
            cabin_body();
}
