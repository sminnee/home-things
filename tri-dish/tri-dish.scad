use <scad-utils/morphology.scad>

$fs = 0.5;
$fn = 120;

bowlInnerR = 45;
bowlOuterR = 50;
bowlH = 20;
bowlInnerH = 10;

innerBowlR = 10;
innerBowlH = 5;

// The $fn values that are off by 1 are set to prevent weird OpenSCAD bugs

difference() {
    // Main bowl
    rotate_extrude($fn = 120)
        fillet(r=5, $fn = 19)
            polygon([
                 [0,0],
                 [bowlOuterR,0],
                 [bowlOuterR,bowlH],
                 [bowlInnerR,bowlH],
                 [bowlInnerR,bowlInnerH],
                 [0,bowlInnerH]
            ]);
    
    for(ang = [0,120,240])
        rotate([0,0,ang]) translate([0,bowlInnerR * 0.46,bowlInnerH+.01]) inner_bowl();
}

module inner_bowl() {
    rotate_extrude($fn=59)
        fillet(r=5, $fn= 39)
            intersection() {
                union() {
                    scale([1,innerBowlH / innerBowlR]) circle(r=innerBowlR, $fn=59);
                    square([innerBowlR+5,1]);
                }
                translate([0,-99]) square(100);
            }
}