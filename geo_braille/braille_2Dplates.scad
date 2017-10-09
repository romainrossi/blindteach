// Author : Romain Rossi
// Licence : Creative Common Attribution-ShareAlike 4.0 International (CC BY-SA 4.0) 

include <common.scad>

plate_to_plate_margin = 5;

module shape_grid( x, y )
{
translate ( [x*(base_plate_width + plate_to_plate_margin), y*(base_plate_heigth + plate_to_plate_margin) , 0 ] )
    children();
}

/***************************************************************************************************/
// Braille guideline
/*
    Dot diameter at base [D]: 1.44mm
    Dot height [H]: 0.48mm (rounded dome shape)
    Horizontal and vertical dot spacing from center to center of dots within a cell [S]: 2.34mm
    Character spacing (distance from center of top left dot in character N to center of top left dot in character N+1) [CS]: 6.2mm
    Line to line spacing (distance from center of top left dot in line N to top left dot in aligned cell on the next line) [LS]: 10mm
    
    mesure (6dots) :
        dist interpoints (même cellule) : 2.5mm
        diam point : 2mm à la base
        
        Taille cellule braille normalisée : 6.8mm haut / 4.2mm larg
       
*/
/***************************************************************************************************/

// First child also give outlines (will be used with intersection
module shape_plate_braille( top_caption, bottom_caption )
{
        // Base plate
        color ("lightblue")
        translate ( [0, 0, -base_plate_thickness] )
        linear_extrude( height = base_plate_thickness )
        offset( r = base_plate_rounding )
        square( [ base_plate_width - 2* base_plate_rounding, base_plate_heigth - 2* base_plate_rounding ], center = true );
        
        // Braille top_caption
        color ("green")
        translate ( [ 0 , base_plate_heigth / 2 - base_plate_margin , 0] )
        linear_extrude( height = braille_thickness )
        text( text = top_caption , halign="center", valign = "top",  font="Braille Normal:style=Regular", size = braille_font_size);

        // Braille bottom_caption
        color ("green")
        translate ( [ 0 , base_plate_margin - base_plate_heigth / 2, 0] )
        linear_extrude( height = braille_thickness )
        text( text = bottom_caption , halign="center", valign = "bottom",  font="Braille Normal:style=Regular", size = braille_font_size);

        // Shape
        color ("red")
        //union()
        {
            linear_extrude( height = shape_thickness )
            difference()
            {
                offset( r = shape_thickness ) children(0);
                children(0);
            }
            if ( $children > 1 )
            {
                for ( i = [1:$children-1] )
                {
                    intersection()
                    {
                       translate ( [0,0,-5] ) linear_extrude( height = 10 ) children(0);
                       linear_extrude( height = shape_addition_thickness ) children(i);
                    }
                }
            }
        }
}

// Circle shape
shape_grid(0,0)
shape_plate_braille( "cercle" , "" )
{
    circle( r=20, center = true );
    circle( r=shape_addition_thickness, center = true );
}

// Circle Diameter
shape_grid(0,1)
shape_plate_braille( "cercle", "diamètre" )
{
    circle( r=20, center = true );
    circle( r=shape_addition_thickness, center = true );
    dashed() square(  [ 40, shape_addition_thickness ] , center=true );
}

// Circle Radius
shape_grid(0,2)
shape_plate_braille( "cercle","rayon" )
{
    circle( r=20, center = true );
    dashed() translate([10,0,0])square(  [ 20,shape_thickness ] , center=true );
    circle( r=shape_addition_thickness, center = true );
}   
// Circle Rope ?
shape_grid(0,3)
shape_plate_braille( "cercle","corde" )
{
    circle( r=20, center = true );
    circle( r=shape_addition_thickness, center = true );
    translate( [0,15,0] ) dashed() square(  [ 30,shape_addition_thickness ] , center=true );
}

// Square shape
shape_grid(1,0)
shape_plate_braille( "carré","" )
    square( 40, center = true );

// Square shape - diagonal
shape_grid(1,1)
shape_plate_braille( "carré","diagonale" )
{
    square( 40, center = true );
    rotate( [0, 0, -45] ) dashed () square(  [ 1.45*40,shape_addition_thickness ] , center=true );
}

// Square shape - 2 diagonals
shape_grid(1,2)
shape_plate_braille( "carré","diagonales" )
{
    square( 40, center = true );
    rotate( [0, 0, -45] ) dashed() square(  [ 1.45*40,shape_addition_thickness ] , center=true );
    rotate( [0, 0, 45] ) dashed() square(  [ 1.45*40,shape_addition_thickness ] , center=true );
    circle( r=shape_addition_thickness, center = true );
}

// Square triangle
shape_grid(2,0)
shape_plate_braille( "triangle","-rectangle" )
{
    polygon(  [ [-30,-20] , [-30,20] , [30,-20] ] );
    translate([-25,-20,0]) rotate( [0, 0, 90] ) dashed() square(  [ 5,shape_addition_thickness ] , center=false );
    translate([-30,-15,0]) dashed() square(  [ 5,shape_addition_thickness ] , center=false );
}

// Isocele triangle
shape_grid(2,1)
shape_plate_braille( "triangle","-isocèle" )
    polygon(  [ [-15,-20] , [15,-20] , [0,20] ] );

// Equilateral triangle
#shape_grid(2,2)
shape_plate_braille( "triangle","-isocèle" )
    polygon(  [ [-20,-20] , [20,-20] , [0,15] ] );
