difference() {
    // Main oval
    translate([0,0,1])
        scale([1,1.5,.2])
            sphere(r=20);

    // Cut handle
    translate([0,13,0])
        cylinder(r=10, h=40, center=true);

    // Cut off bottom for flat print
    translate([-50,-50,-100])
        cube([100,100,100]);

}