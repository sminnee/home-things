
//input = "Tiger_Head.stl"; fillHeight = 25; scale = 0.7;
//input = "Bear_Head.stl"; fillHeight = 18; scale = 0.85;
//input = "Horse_Head.stl"; fillHeight = 14.5; scale = 0.9;
//input = "Panda_Head_repaired.stl"; fillHeight = 16.5; scale = 0.9;

// BROKEN
//input = "untitled-Rhino_Head.stl"; fillHeight = 27; scale = 0.6;
//input = "untitled-Hippo_Head.stl"; fillHeight = 25; scale = 0.6;
//input = "Wild_Boar_Head_repaired.stl"; fillHeight = 38; scale = 0.6;


difference() {
        scale(scale) union() {
            render() translate([-100,-100,0]) import(str("src/", input), convexity=10);
            # translate([-17/2,0,0]) cube([17,fillHeight,5]);
        }
    cylinder(d=2.5, h=15, $fs=1);
}