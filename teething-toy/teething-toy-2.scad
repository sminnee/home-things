// Adjustments
$fa=1;
$fn = 50;
$fs = 1;
END_R=2.47;
HOLE_R=8;

difference() {
    // Main oval
    intersection() {
        translate([5,0,1])
            scale([1,1.5,.2])
                sphere(r=20);
        translate([-5,0,1])
            scale([1,1.5,.2])
                sphere(r=20);
    }

    // Cut handle
    translate([0,13,0])
        // Complex shape to cut rounded corners
        difference() {
            union() {
                translate([0,30,0])
                    cube([60,60,40], center=true);
                scale([1,2,1])
                    cylinder(r=HOLE_R, h=40, center=true);
            }

            translate([HOLE_R + END_R,0,0])
                cylinder(r=END_R, h=40.01, center=true, $fn=20);

            translate([-(HOLE_R + END_R),0,0])
                cylinder(r=END_R, h=40.01, center=true, $fn=20);
        }
    // Cut off bottom for flat print
    translate([-50,-50,-100])
        cube([100,100,100]);

}

