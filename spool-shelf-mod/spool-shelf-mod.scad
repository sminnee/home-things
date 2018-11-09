D=28.25;

shelf();
//test();

module shelf() {
    difference() {
        rotate([0,-90,0])
            import (file = "spool-shelf-orig.stl");

        translate([80,-80,0]) cylinder(d=D, h=100,center=true);
        translate([80,80,0]) cylinder(d=D, h=100,center=true);
    }
}

module test() {
    difference() {
        cylinder(d=D+5,h=10);
        cylinder(d=D,h=10);
    }
}