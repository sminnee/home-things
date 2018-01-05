$fn=60;

dowelR = 10.2 / 2;
thickness = 2;
thin = 0.90;
height = 10;

armL = 20;

outerR = dowelR + thickness;

midR = dowelR+thickness/2;


union() {
     minkowski() { 
        difference() {
            cylinder(r=midR, h = height);
            cylinder(r=midR-0.01, h = height*2.1,center=true);
            cube([outerR*2.1,thickness+0.25,height*2.1],center=true);
        }
        cylinder(d=thickness, h=0.01, $fn=12);
    }
    
    translate([outerR + 1, -outerR,0]) cube([thin,outerR*2,height]);

/*
    translate([dowelR*2+3,0,0]) difference() {
        translate([5-thin,0,0]) cylinder(r=dowelR+5, h = height);
        cylinder(r=dowelR, h = height*2.1,center=true);
        translate([0,-20,-20]) cube(40);
        translate([-50,outerR,-1]) cube(100);
        translate([-50,-100-outerR,-1]) cube(100);
    }
*/ 
    for(y=[-outerR, dowelR])
        translate([0,y,0]) cube([armL,thickness,height]);
}