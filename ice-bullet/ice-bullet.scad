$fa = 6;

// Ice mold for the nose cone of a projectile
// Fits onto a PVC tube

// Inputs
INNER_RADIUS = 38.6/2; // Inner dimension of pipe
WALL_THICKNESS = 2.2 + 0.3; // Thickness of pipe wall, including easing clearance
OVERLAP = 10; // The size of the press-fit overlap onto the pipe
CASING_THICKNESS = 2.2; // Thickness of material around the nose

LENGTH_MULTIPLIER = 2; // Ratio between length and radius

ALPHA = 55; // Angle of ellipsoid when it leaves base. This is calculated for a sphere

// What are you making
//size_test();
ice_mold();


// Calculated values
largeInnerRadius = INNER_RADIUS + WALL_THICKNESS;
outerRadius= largeInnerRadius + CASING_THICKNESS;
outerScale = 2; //(2 * INNER_DIAMETER) / (outerDiameter * sin(ALPHA));
totalHeight = LENGTH_MULTIPLIER * outerRadius;
baseHeight = (LENGTH_MULTIPLIER  * outerRadius) * (1-sin(ALPHA));
epsilon = 0.001; // Stops rendering errors in quick preview


// A test print of the sizes for the pipe
module size_test() {
    difference() {
        // Outer cylinder for the overlap
        cylinder(h=OVERLAP + 5, r=outerRadius);

        // Cut the inner cylinder for the overlap
        translate([0,0,5])
            cylinder(h=OVERLAP + epsilon, r=largeInnerRadius);

        // Cut the inner cylinder for the overlap
        cylinder(h=5, r=INNER_RADIUS);
    }

}

// The actual ice mold
module ice_mold() {
    difference() {
        union() {
            // Outer ellipsoid
            scale([1,1,LENGTH_MULTIPLIER])
                sphere(r = outerRadius);

            // Handle at the bottom
            translate([0,0,-totalHeight])
                cylinder(r=outerRadius, h=baseHeight);

            // Outer cylinder for the overlap
            cylinder(h=OVERLAP, r=outerRadius);
        }
        
        // Cut the inner cylinder for the overlap
        cylinder(h=OVERLAP + epsilon, r=largeInnerRadius);

        // Cut the inner ellipsoid
        scale([1,1,LENGTH_MULTIPLIER])
            sphere(r = INNER_RADIUS);
        // Remove top half
        translate([0,0,100 + OVERLAP])
            cube(size=[200,200,200], center=true);
        // Remove point of outer ellipsoid
    }
}