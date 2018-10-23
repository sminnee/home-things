use <proxima-nova-reg.ttf>;

TEXT_SIZE=4.5;

toy();

/*
rotate([90,0,0]) {
toy();
rotate([180,0,0]) toy();
}
*/

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
            # translate([20, -34, 9.4]) rotate([0,90,0])
                linear_extrude(height = 1, center = true, convexity = 10)
                    text("SILVER", font = "PT Sans:style=Bold", valign="center", halign="center", size=TEXT_SIZE);
            # translate([20, 34, 9.4]) rotate([180,0,0]) rotate([0,90,0])
                linear_extrude(height = 1, center = true, convexity = 10)
                    text("STRIPE", font = "PT Sans:style=Regular", valign="center", halign="center", size=TEXT_SIZE);
        }
    }  
}