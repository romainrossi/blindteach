// Author : Romain Rossi
// Licence : Creative Common Attribution-ShareAlike 4.0 International (CC BY-SA 4.0) 

include <common.scad>
use <braille_2Dplates.scad>
use <braille_2Dshapes.scad>

// Circle Diameter
translate ( [0, 0 , 0 ] )
shape_plate_braille( "cercle", "diamètre" )
{
    circle( r=30*mm, center = true );
    square(  [ 60*mm, shape_thickness ] , center=true );
    circle( r=shape_addition_thickness, center = true );
}

// Circle Rope ?
translate ( [0, 100 , 0 ] )
shape()
{
    circle( r=40*mm, center = true );
    circle( r=1.3*shape_thickness );
    translate ([0,20,0]) square(  [ 100*mm,shape_thickness ] , center=true );
}
