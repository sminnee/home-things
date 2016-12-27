woodWidth=12.3 + 0.4;
thickness=5;
woodSupport=75;
wallSupport=80;

mobile_hanger();
//mobile_hook();

module mobile_hook() {
    difference() {
        offset=9;
           
        rounded_rect(x=woodWidth+2*thickness,y=offset+woodWidth+2*thickness,z=10, r=5);
        translate([0,offset/2,0])
            cube(size = [woodWidth,woodWidth,10+0.01], center=true );
        for(dX=[-5,5]) {
            translate([dX,-offset,0])
                cylinder(r=3,h=8,center=true, $fs=1);
            translate([dX,-offset,5])
                cylinder(r1=3, r2=4, h=2.01, center=true, $fs=1);
            translate([dX,-offset,-5])
                cylinder(r1=4, r2=3, h=2.01,center=true, $fs=1);
        }
    }
}    

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
    d2=4;
    union() {
        translate([0,0,-d1/2])
        cylinder(h=d1, r=r1, center=true, $fs=1);
        translate([0,0,-d2/2+0.001])
            cylinder(h=d2, r=r2, center=true, $fs=1);
    }
}    
        