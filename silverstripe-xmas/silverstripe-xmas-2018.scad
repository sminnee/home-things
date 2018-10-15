// Shape
difference() { 
translate([10,0,0])
  import (file = "Kobayashi_Fidget_Cube-v1.1.stl");


// Logo
rotate([0,0,90]) translate([0,0,21])
#    linear_extrude(height = 4, center = true, convexity = 10)
        scale([0.145,0.145,1]) translate([-102,-157.5,0])
                import (file = "sslogo5.dxf");
}