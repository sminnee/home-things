$fs = 1;

mountGap = 34; 
mountH = 34;
mountPoleR = 6.5/2;
mountPoleH = 7; 
screwR = 3/2;

footW1 = 35;
footW2 = 60;
footL = 52;
footH = 5;

neckL = 25;
backL = 120;
backH = 5;

footAng = 19;
baseAng = footAng - 12.5;
toeH = 6.25;

// Back
backCubeL = backL-footW1/2;
difference() {
    union() {
        translate([-footW1/2, -backCubeL,0])
            cube([footW1, backCubeL, backH]);
        translate([0, -backCubeL,0])
            cylinder(d=footW1, h=backH);
    }

    translate([0,-backCubeL,backH-2]) keyhole_8g_woodscrew(h=50);
    translate([0,-40,backH-2]) keyhole_8g_woodscrew(h=50);
}

intersection() {
    // Shear off bottom of neck and foot
    rotate([-baseAng,0,0])
        translate([-500,-1000 - (footH - toeH) + sin (footAng - baseAng)*(neckL+footL),-500])
        cube(size=1000);
    translate([0,0,500]) cube(size=1000, center=true);
    
    rotate([90-footAng,0,0]) translate([0,neckL+footL/2,0]) {
        // Neck
        translate([-footW1/2,-neckL-footL/2,-100])
            cube([footW1, neckL, footH -1 + 100]);

        // Foot
        difference() {
            translate([0,0,-100]) linear_extrude(height=footH + 100)
                polygon([
                    [-footW1/2, -footL/2], [footW1/2, -footL/2],
                    [footW2/2, footL/2], [-footW2/2, footL/2] ]);

            translate([0, -mountH/2, footH+.01]) footHole();
            translate([-mountGap/2, mountH/2, footH+.01]) footHole();
            translate([mountGap/2, mountH/2, footH+.01]) footHole();

        }
    }
}

module footHole() {
    scale([1,1,-1]) {
        cylinder(r=screwR, h=130);
        cylinder(r=mountPoleR, h=mountPoleH);
        translate([0,0,mountPoleH + 2]) cylinder(r=mountPoleR, h=130);
    }
}

// Keyhole for an 8g woodscrew
// The hole will be in -ve Z and the countersink in +ve Z
module keyhole_8g_woodscrew(h) {
    d1 = 5;
    d2 = 10;
    gap = 5;

    // Dimensions of countersink
    d1CS = 8;
    hCS = 4;
    
    spread = (d1+d2)/2+gap;

    // Main hole
    scale([1,1,-1]) {
        cylinder(d=d1, h=h);
        translate([0,spread,-hCS]) cylinder(d=d2, h=h+hCS);
        translate([-d1/2,0,0]) cube([d1,spread,h]);
    }
    
    // Countersink
    translate([0,0,-.01]) cylinder(d1=d1, d2=d1CS, h=hCS);
    translate([0,0,hCS-.01]) rotate([-90,0,0]) linear_extrude(height=spread)
        polygon([[-d1/2,hCS], [d1/2,hCS], [d1CS/2,0], [-d1CS/2,0]]);
    
}