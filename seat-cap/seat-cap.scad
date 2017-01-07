$fa = 8;
$fs = 1;

// Extra space to add to dimension for press-fit
EASE = 0.5;

EPSILON = 0.001;

// Dimensions of cutout
W = 59+EASE;
H1 = 13+EASE;
H2 = 15.2+EASE;
DH2 = 20;

D = 10;

// Outer dimensions
OUTER_W = H1 + 13;
BOTTOM_ANG = 45;

difference() {

    // Outer block
    union() {
        // Sides
        translate([-W/2,0,0])
            cylinder(h=D, r=OUTER_W/2);
        translate([W/2,0,0])
            cylinder(h=D, r=OUTER_W/2);
        // Middle
        translate([0,0,D/2])
            cube(size=[W,OUTER_W,D], center=true);
        // Top
        translate([-W/2,0,D])
            sphere(r=OUTER_W/2);
        translate([W/2,0,D])
            sphere(r=OUTER_W/2);
        translate([-W/2,0,D]) rotate([0,90,0])
            cylinder(h=W, r=OUTER_W/2);
        // Bottom
        translate([-W/2,0,0])
            sphere(r=OUTER_W/2);
        translate([W/2,0,0])
            sphere(r=OUTER_W/2);
        translate([-W/2,0,0]) rotate([0,90,0])
            cylinder(h=W, r=OUTER_W/2);
    }

    // Crop bottom so that starting angles are 30 degrees, for printing
    translate([0,0,-50 - (OUTER_W/2)*sin(BOTTOM_ANG) ])
        cube (size=[100,100,100], center=true);

    // Cut-out for chair end
    translate([W/2,-H1/2,D]) rotate([-90,0,90])
        linear_extrude(height = W)
            polygon(points = [[0,0], [H1,0], [H2 + (H2-H1),DH2*2], [0,DH2*2]]);

}