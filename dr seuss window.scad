use <spline.scad>
use <scad-utils/lists.scad>

// Points defining the window
corners = [ [0,160], [180, 140], [150,20], [30,0] ]; 
middles = [ [90,130], [150, 80], [90,20], [30,80] ]; 
center = [80,80];

// Thickness of the wood to be intereserted into
wallThickness = 9.2;

// Diameter of edging
edgeD = 15;
// Diameter of crossbeams
crossD = 8;

// Circle detail level creating edges
circleSteps = 40;

// Show complete window
//window();

// Or show one of the two halves to print
//top_half() window();
bottom_half() window();

module window() {
    // Line-sets
    edges = [ for(i=[0 : len(corners)-1])
        [ corners[i], middles[i], corners[(i + 1) % 4] ]
    ];
    crossbeams = [ for(i=[0,1]) [ middles[i], center, middles[i+2] ] ];
    perimeter = concat(flatten([ for(edge = edges) smooth(edge, 4) ]));

    intersection() {
        union() {
            // Edges
            for(edge=edges) {
                spline_sausage(to3D(edge), diameter=edgeD, loop=false, circle_steps = circleSteps);
            }

            // Cross-beams
            for(edge=crossbeams) {
                spline_ramen(to3D(edge), diameter=crossD, loop=false, circle_steps = circleSteps);
            }
        }
        
        union() {
           translate([-10,-10,wallThickness/2]) cube(200);
           translate([-10,-10,-200-wallThickness/2]) cube(200);
           translate([0,0,-15]) linear_extrude(height=30)
                polygon(perimeter);
        }
    }
}

// Re-project a 2D point to 3D by setting Z to 0
function to3D(path) = [ for(point = path) [point.x, point.y, 0] ];

module top_half() {
    intersection() {
        translate([-200,-200,0]) cube(400);
        children();
    }
}
module bottom_half() {
    rotate([180,0,0]) intersection() {
        translate([-200,-200,-400]) cube(400);
        children();
    }
}
