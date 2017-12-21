use <scad-utils/morphology.scad>

$fs = 0.5;
$fn = 120;

bowlInnerR = 45;
bowlOuterR = 50;
bowlH = 20;
bowlInnerH = 10;

innerBowlR = 17;
innerBowlAng = 51;

// The $fn values that are off by 1 are set to prevent weird OpenSCAD bugs

difference() {
    // Main bowl
    rotate_extrude($fn = 120)
        fillet(r=5, $fn = 37)
            polygon([
                 [0,0],
                 [bowlOuterR,0],
                 [bowlOuterR,bowlH],
                 [bowlInnerR,bowlH],
                 [bowlInnerR,bowlInnerH],
                 [0,bowlInnerH]
            ]);
    
    for(ang = [0,120,240])
        rotate([0,0,ang]) translate([0,bowlInnerR * 0.48,bowlInnerH+.01]) inner_bowl();
}

module inner_bowl() {
    ang = innerBowlAng;
    adjR = innerBowlR / sin(ang);

    echo(adjR * (1-cos(ang)));
    
    rotate_extrude($fn=59)
        fillet(r=10, $fn= 39)
            intersection() {
                union() {
                    translate([0,adjR * cos(ang)]) circle(r=adjR, $fn=159);
                    square([innerBowlR+2,1]);
                }
                translate([0,-99]) square(100);
            }
}