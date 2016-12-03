// Battery geometry - measured
BATT_WIDTH = 65.4 + 0.1;
BATT_LENGTH = 151.0 + 0.1;
BATT_NARROW_WIDTH = 61.2 + 0.1;
BATT_NARROW_LENGTH = 147.2 + 0.1;
BATT_NARROW_HEIGHT = 7;
BATT_HEIGHT = 93.2;

LIP_HEIGHT = 14;
LIP_DEPTH = 2;
LIP_TO_INSERT = 7.25;
CORNER_WIDTH = 20 + 5;
CORNER_LENGTH = 20.7 + 3;

// VA meter geometry
VA_WIDTH = 45;
VA_HEIGHT = 26;

// Switch geometry
SW_WIDTH = 12;
SW_HEIGHT = 19;

// Design settings
THICKNESS  =2;
AIR_GAP = 35;

// Inferred
bnwLedge = (BATT_WIDTH - BATT_NARROW_WIDTH)/2;
bnlLedge = (BATT_LENGTH - BATT_NARROW_LENGTH)/2;

scale([1,1,-1])

difference() {
    // Solid cover
    cube(size = [
        BATT_WIDTH + 2*THICKNESS,
        BATT_LENGTH + 2*THICKNESS, 
        THICKNESS + AIR_GAP
    ]);
    
    // Subtract narrow void
    translate([THICKNESS + bnwLedge,THICKNESS + bnlLedge,-0.001])
        cube(size = [
            BATT_NARROW_WIDTH,
            BATT_NARROW_LENGTH,
            AIR_GAP
        ]);

    // Subtract wide void
    translate([THICKNESS,THICKNESS,-0.001])
        cube(size = [
            BATT_WIDTH,
            BATT_LENGTH,
            BATT_NARROW_HEIGHT
        ]);

    // Subtract corners
    translate([THICKNESS,BATT_LENGTH-CORNER_LENGTH+THICKNESS,-0.001])
        cube(size = [
            CORNER_WIDTH,
            CORNER_LENGTH,
            LIP_HEIGHT
        ]);
    translate([
        BATT_WIDTH - CORNER_WIDTH  + THICKNESS,
        BATT_LENGTH-CORNER_LENGTH+THICKNESS,-0.001])
        cube(size = [
            CORNER_WIDTH,
            CORNER_LENGTH,
            LIP_HEIGHT
        ]);
        
     // Subtract component holes
     translate([10, 10, AIR_GAP-5])
        cube(size = [VA_HEIGHT, VA_WIDTH, 10]);
     translate([10 + (VA_HEIGHT-SW_HEIGHT)/2, 20 + VA_WIDTH, AIR_GAP-5])
        cube(size = [SW_HEIGHT, SW_WIDTH, 10]);
        
     // Substract hole for JST cords
     translate([50,0,LIP_HEIGHT+10])
         rotate([0,90,90])
            cylinder(r=4,h=10, center=true);
}