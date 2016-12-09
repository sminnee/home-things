woodWidth=12.3 + 0.1;
thickness=5;
woodSupport=80;
wallSupport=80;

// Wood support
translate([0,0,woodSupport/2]) rotate([0,10,0])
    difference() {
        cube(size = [woodWidth+2*thickness,woodWidth+2*thickness,woodSupport], center=true );
        cube(size = [woodWidth,woodWidth,woodSupport+0.001], center=true );
    }

// Wall support
difference() {
    translate([-15,0,0])
        rounded_rect(x=wallSupport + 50,y=50,z=10,r=20);
    translate([25,0,5])
        screw_hole();
    translate([25-woodSupport,0,5])
        screw_hole();
}
    
    
// Rounded rectangle, centered
module rounded_rect(x,y,z,r) {
    union() {
        cube(size=[x-r*2,y,z], center=true);
        cube(size=[x,y-r*2,z], center=true);
        for(dX = [x/2-r, -x/2+r])
            for(dY = [y/2-r, -y/2+r])
                translate([dX,dY,0])
                    cylinder(h=z, r=r, center=true);
    }
}


// Screw cutout, centered at the screw opening
module screw_hole() {
    r1=5;
    r2=10;
    d1=30;
    d2=5;
    union() {
        translate([0,0,-d1/2])
        cylinder(h=d1, r=r1, center=true);
        translate([0,0,-d2/2+0.001])
            cylinder(h=d2, r=r2, center=true);
    }
}    
        