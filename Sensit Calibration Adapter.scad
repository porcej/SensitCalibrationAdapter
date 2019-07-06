// A calibration adatpor for a Sensit MOS detector
// Joe Porcelli (joe@kt3i.com)

// Sensor Enclosure Parameters
diameter = 27;
height = 31;
inlet_diameter = 4.5;
wall_thickness = 2.5;
kurf = 0.25;
$fn = 100; // Number of angular slices

// Calculated parameters
// Adapter height
adapter_height = 1.2*height+wall_thickness;
inside_diameter = diameter + 2*kurf;


difference(){
    cylinder(h=adapter_height, d=diameter+2*(wall_thickness+kurf));     // Outside of Calibration adapter
    translate([0,0,-1]) cylinder(h=adapter_height, d=inlet_diameter);   // Inlet
    translate([0,0,wall_thickness]) cylinder(h=adapter_height, d=inside_diameter);
}
