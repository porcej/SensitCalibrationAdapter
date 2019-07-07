// A calibration adatpor for a Sensit MOS detector
// Joe Porcelli (joe@kt3i.com)

// Sensor Enclosure Parameters
diameter = 27;
height = 31;
inlet_diameter = 4.5;
wall_thickness = 2.5;
kurf = 0.25;

// Tubing Barb Parameters
tube_id = 4.8;
barb_wall_thickness = 1;
barb_count = 4;
barb_shoulder = 2;

// Quality Parameters
$fn = 100; // Number of angular slices

// Calculated parameters
adapter_height = 1.1*height+wall_thickness;
inside_diameter = diameter + 2*kurf;

difference(){
    // Outter Shell
    union(){
        enclosure_shell(d=diameter+2*(wall_thickness+kurf), h=adapter_height);  // Enclosure
        // Barbs
        translate([0,0,adapter_height+diameter/2+kurf]){
            union(){
                cylinder(h=wall_thickness, d=tube_id + barb_shoulder); // Barb Shoulder
                translate([0, 0, wall_thickness / 2]) barbs();
            }
        }    
    }
    
    // Inner Shell
    union(){
        enclosure_shell(d=inside_diameter, h=adapter_height+1);
        cylinder(h=tube_id*(barb_count+adapter_height), d=tube_id-2*barb_wall_thickness);
    }    
}

module enclosure_shell(d, h){
    translate([0,0,adapter_height]){
        rotate([0,180,0]){
            union(){
                cylinder(h=h, d=d);     // Cylinder
                sphere(d=d);            // Sphere to support barb
            }
        }
    }
}

module barbs(){
    difference(){
        union(){
            for ( i = [1:barb_count]) {
                translate([0, 0, (i-1)*tube_id*0.9]) cylinder(h=tube_id, r2=tube_id*0.85/2, r1=tube_id*1.16/2);
            }
        }
    }
}