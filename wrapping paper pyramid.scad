bend = 50.4;
r = (10.2 + .25)/2 + 2;
d = 50;


difference() {
    intersection() {
        union() {
            translate([0,0,1])
            for(ang=[0,120,240])
                rotate([90-bend,0,ang])
                    cylinder(h=d,r=r);
    cylinder(h=5,r=3*sin(bend));
        }
        translate([-d,-d,0]) cube(d*2);
    }

    intersection() {
        translate([0,0,1])
            for(ang=[0,120,240])
                rotate([90-bend,0,ang])
                    cylinder(h=d+1,r=r-2);

        translate([-d,-d,2]) cube(d*2);
    }
} 


! inverse() {
    minkowski() {
        inverse() {
            intersection() {
                union() {
                    translate([0,0,1])
                    for(ang=[0,120,240])
                        rotate([90-bend,0,ang])
                            cylinder(h=d,r=r);
            cylinder(h=5,r=3*sin(bend));
                }
                translate([-d,-d,0]) cube(d*2);
            }
        }
        sphere(r=5);
    }
}


module inverse() {
    difference() {
        cube(1000,center=true);
        children();
    }
}