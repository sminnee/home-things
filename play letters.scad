use <scad-utils/morphology.scad>

board("RUBY", 138);
//board("ABC", 106);

module letters() {
    linear_extrude(height=10)
        text("RUBYAC", size=40, font="Impact");
}

module board(text, width) {
    difference() {
       z_rounded_cube([width,60,5], r=5);
        translate([6,8,2]) linear_extrude(height=3.01)
            outset(d=2) text(text, size=40, font="Impact", spacing=1.1);
    }
}

module z_rounded_cube(size, r=1) {
    linear_extrude(height=size[2])
        rounding(r=r)
            polygon([ [0,0], [size[0],0], [size[0],size[1]], [0,size[1]] ]);
}
