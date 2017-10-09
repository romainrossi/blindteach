include <common.scad>

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
        hauteur caractère complet : 7mm  
*/
/***************************************************************************************************/

// First child also give outlines (will be used with intersection)
module shape()
{
        //union()
        {
            // Base shape
            color ("lightblue")
            translate ( [0, 0, -base_plate_thickness] )
            linear_extrude( height = base_plate_thickness )
            children(0);

            // Additions
            if ( $children >= 2 )
            {
                for ( i = [1:1:$children-1] )
                {
                    color ("red")
                    translate([0,0,-0.1])
                    intersection()
                    {
                        linear_extrude( height = shape_thickness*2 ) translate([0,0,-shape_thickness]) children(i);
                        linear_extrude( height = shape_thickness ) children(0);
                    }
                }
            }
        }
}

// Circle shape
shape()
{
    circle( r=40, center = true );
    circle( r=1.3*shape_addition_thickness );
}

// Circle Diameter
translate ( [0, 100 , 0 ] )
shape()
{
    circle( r=40, center = true );
    circle( r=1.3*shape_addition_thickness );
    dashed() square(  [ 100, shape_addition_thickness ] , center=true );
}

// Circle Radius
translate ( [0, 200 , 0 ] )
shape()
{
    circle( r=40, center = true );
    circle( r=1.3*shape_addition_thickness );
    translate ([50,0,0]) dashed() square( [ 100,shape_addition_thickness ] , center=true );
}

// Circle Rope ?
translate ( [0, 300 , 0 ] )
shape()
{
    circle( r=40, center = true );
    circle( r=1.3*shape_addition_thickness );
    translate ([0,20,0]) dashed() square(  [ 100,shape_addition_thickness ] , center=true );
}

// Circle 2 Radius
translate ( [0, 400 , 0 ] )
shape()
{
    circle( r=40, center = true );
    circle( r=1.3*shape_addition_thickness );
    translate ([50,0,0]) dashed() square(  [ 100,shape_addition_thickness ] , center=true );
    rotate([0,0,50]) translate ([50,0,0]) dashed() square(  [ 100,shape_addition_thickness ] , center=true );
}

// Square shape
translate ( [150, 0 , 0 ] )
shape()
    square( 80, center = true );

// Square shape - diagonal
translate ( [150, 100 , 0 ] )
shape()
{
    square( 80, center = true );
    rotate( [0, 0, -45] ) dashed() square(  [ 2*80,shape_addition_thickness ] , center=true );
}

// Square shape - 2 diagonals
translate ( [150, 200 , 0 ] )
shape()
{
    square( 80, center = true );
    rotate( [0, 0, -45] ) dashed() square(  [ 2*80,shape_addition_thickness ] , center=true );
    rotate( [0, 0, 45] ) dashed() square(  [ 2*80,shape_addition_thickness ] , center=true );
}

// Rectangle shape
translate ( [300, 0 , 0 ] )
shape()
    square( [80, 50] , center = true );

// Square shape - diagonal
translate ( [300, 100 , 0 ] )
shape()
{
    square(  [80, 50], center = true );
    rotate( [0, 0, -32] ) dashed() square(  [ 2*80,shape_addition_thickness ] , center=true );
}

// Square shape - 2 diagonals
// p = [ [-40,-25] , [40,-25] , [40,25] , [-40,25] ];
translate ( [300, 200 , 0 ] )
shape()
{
    square(  [80, 50], center = true );
    rotate( [0, 0, -32] ) dashed() square(  [ 2*80,shape_addition_thickness ] , center=true );
    rotate( [0, 0, 32] ) dashed() square(  [ 2*80,shape_addition_thickness ] , center=true );
}

// Isosceles triangle
p0 = [ [0,0] , [80,0] , [0,80] ];
translate ( [450, 0 , 0 ] )
shape()
    polygon( p0 );

translate ( [450, 100 , 0 ] )
shape()
{
    polygon( p0 );
    rotate( [0, 0, 45] ) dashed() square(  [ 150,shape_addition_thickness ] , center=true );
}











