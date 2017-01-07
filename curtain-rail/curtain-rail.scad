$fa = 6;

DOWEL_R = 28/2 + 0.5;
DEPTH = 30;
HEIGHT = 100;
THICK = 5;

difference() {
    union() {
        translate([0,-(DOWEL_R),0])
            cylinder(r=DOWEL_R + THICK, h=DEPTH);
        
        // Truncated rounded backplate
        translate([-HEIGHT/2,0,0])
            truncated_rounded_cube(size=[HEIGHT, THICK, DEPTH], a=45, r=10);

        // Truncate rounded front plate
        translate([-DOWEL_R*2,-DOWEL_R*2 - THICK,0]) {
            truncated_rounded_cube(size=[DOWEL_R*2, THICK, DEPTH], a=45, r=10);
            translate([10,0,0]) cube(size=[DOWEL_R*2 - 10, THICK, DEPTH]);
        }
    }
    
    // Truncate rounded corners (this prevents unprintable overhangs)
    translate([-100,-100,-10]) cube(size=[200,200,10]);
    translate([-100,-100,DEPTH]) cube(size=[200,200,10]);
    

    // Carve the dowel cavity
    translate([0,-DOWEL_R,-0.005])
        cylinder(r=DOWEL_R, h=DEPTH + 0.01);
    translate([-100,-(DOWEL_R * 2),-0.005])
        cube(size=[100, DOWEL_R * 2, DEPTH + 0.01]);
    
    // Carve the screw holes
    translate([HEIGHT/2-15,0,DEPTH/2]) rotate([90,0,0])
        screw_hole();
    translate([-(HEIGHT/2-15),0,DEPTH/2]) rotate([90,0,0])
        screw_hole();
}

// Screw cutout, centered at the screw opening
module screw_hole() {
    r1=2.8;
    r2=5;
    d1=30;
    d2=2.5;
    union() {
        translate([0,0,-d1/2])
        cylinder(h=d1, r=r1, center=true, $fs=1);
        translate([0,0,-d2/2+0.001])
            cylinder(h=d2, r=r2, center=true, $fs=1);
    }
}

module truncated_rounded_cube(size, r, a = 45) {
    w = r * sin(a);
    
    translate([0,0,w])
        cube(size=[size[0], size[1], size[2] - 2*w]);
    translate([r,0,0])
        cube(size=[size[0] - 2*r, size[1], size[2]]);
    
    translate([r,size[1],w]) rotate([90,0,0])
        cylinder(r=r, h=size[1]);
    translate([size[0]-r,size[1],w]) rotate([90,0,0])
        cylinder(r=r, h=size[1]);
    translate([r,size[1],size[2]-w]) rotate([90,0,0])
        cylinder(r=r, h=size[1]);
    translate([size[0]-r,size[1],size[2]-w]) rotate([90,0,0])
        cylinder(r=r, h=size[1]);

}