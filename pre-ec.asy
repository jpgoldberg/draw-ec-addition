// pre-ec includes the setup code and should be included with `include`

// When I (JPG) first wrote this in 2015, I did not comment
// the code. I am adding comments now (2022) as I figure out
// what I did.

import graph;
size(300,300,keepAspect=true);

import contour;

pen curvePen = blue;
pen axisPen = gray + dashed + linewidth(0.25);

// JPG 2022-03

// asymptote doesn't offer a switch statement

// Naming scheme
//  points: P, Q, R 
//  Also points: iiP = 2P; iiiP = 3P; viP = 4P
//  point addition: PpQ is "P + Q"



// end of included setup file