// Author : Romain Rossi
// Licence : Creative Common Attribution-ShareAlike 4.0 International (CC BY-SA 4.0) 

include <common.scad>


// Check Braille font size : should display 6 dots in a rectangle which fits exactly font top view
color ("lightblue")
translate ( [2.9, 4.1, -base_plate_thickness] )
linear_extrude( height = base_plate_thickness )
square( [ 4.2, 6.8 ], center = true );

// Braille top_caption
color ("green")
translate ( [ 0 , 0, 0] )
linear_extrude( height = braille_thickness )
text( text = "é" , font="Braille Normal:style=Regular", size = braille_font_size);
