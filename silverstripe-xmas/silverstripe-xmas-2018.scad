TEXT_SIZE=5.5;

toy();

/*rotate([90,0,0]) {
toy();
rotate([180,0,0]) toy();
}*/

// Shape
module toy() {
    difference() { 
        translate([10,-.15,0])
          import (file = "Kobayashi_Fidget_Cube-v1.1.stl");


        // Logo
        rotate([0,0,90]) translate([0,0,21])
        #    linear_extrude(height = 4, center = true, convexity = 10)
                scale([0.135,0.135,1]) translate([-102,-157.5,0])
                        import (file = "sslogo5.dxf");
    

        for(zRot=[0,180]) rotate([0,0,zRot]) {
            difference () {
            # translate([20, -33, 9.4]) rotate([0,90,0])
                linear_extrude(height = 1, center = true, convexity = 10)
                    text("Silver", font = "PT Sans:style=Bold", valign="center", halign="center", size=TEXT_SIZE);
            # translate([18, -31.8, 9.4+3.1]) cube([5,1,2], center=tue);    
            }
            # translate([20, 33.8, 9.4]) rotate([180,0,0]) rotate([0,90,0])
                linear_extrude(height = 1, center = true, convexity = 10)
                    text("Stripe", font = "PT Sans:style=Regular", valign="center", halign="center", size=TEXT_SIZE);
        }
    }  
}