
// Logo
translate([0,0,2])
    linear_extrude(height = 4, center = true, convexity = 10)
        scale([0.5,0.5,1]) translate([-105,-158,0])
                import (file = "sslogo5.dxf");

// connector
translate([0,0,1]) rotate([0,0,34]) 
    difference() {
        cube(size=[25,10,2], center = true);
        cube(size=[25,6,3], center = true);
    }

// hook
translate([1,40,0])
    difference() {
        cylinder(h=2, r=4);
        translate([0,0,-1]) cylinder(h=5, r=3);
    }
