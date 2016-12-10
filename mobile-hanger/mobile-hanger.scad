woodWidth=12.3 + 0.1;
thickness=5;
woodSupport=75;
wallSupport=80;

mobile_hanger();

module mobile_hanger() {
    // Wood support
    translate([0,0,woodSupport/2]) rotate([0,10,0])
        difference() {
            rounded_rect(x=woodWidth+2*thickness,y=woodWidth+2*thickness,z=woodSupport, r=5);
            cube(size = [woodWidth,woodWidth,woodSupport+0.001], center=true );
        }

    // Wall support
    difference() {
        translate([-15,0,0])
            rounded_rect(x=wallSupport + 50,y=30,z=7,r=15);
        translate([35,0,4.5])
            screw_hole();
        translate([15-wallSupport,0,4.5])
            screw_hole();
    }
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
    r1=2.8;
    r2=5;
    d1=30;
    d2=5;
    union() {
        translate([0,0,-d1/2])
        cylinder(h=d1, r=r1, center=true, $fs=1);
        translate([0,0,-d2/2+0.001])
            cylinder(h=d2, r=r2, center=true, $fs=1);
    }
}    
        