// Author : Romain Rossi
// Licence : Creative Common Attribution-ShareAlike 4.0 International (CC BY-SA 4.0) 

// Parameters
// Al units are mm
base_plate_width = 80;
base_plate_heigth = 60;
base_plate_thickness = 1.5;
base_plate_rounding = 3;
base_plate_margin = 1;

shape_thickness = 1; // Thickness of the base circle
shape_addition_thickness = 0.5; // Thickness of shapes additions

// The braille font is taken from : http://www.fontspace.com/philing/braille-normal
braille_thickness = 0.48; // Heigth of the extrusion of the braille font
braille_font_size = 6; // Font size to get normal braille cell size


$fn=200;


// Make "dashed" shapes
module dashed()
{
    intersection()
    {
        children();
        for(n = [-100 : 100])
        {
            translate([n,0,0]) square([ 0.5, 1000 ] );
        }
    }
}
