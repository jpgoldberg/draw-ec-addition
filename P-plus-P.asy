// This is the template file that 
// 1. includes pre-ec.asy (the setup code)
// 2. Specifies what should be drawn
// 3. includes draw-ec.asy to do the drawing

include "pre-ec";

/// This is where things get hand configured.
// y^{2}=x^{3}+ax+b

// curve parameters
int a = -2;
int b = 2;

// Set points P and Q
real Px =-0.90; bool PyPositive = false;
real Qx = 1.2; bool QyPositive = false;

pair P, Q; // can't be calculated until other stuff is defined

// Uncomment one of the below to select what to draw

drawPpP = true;
// drawP = drawQ = true; PQline = black;
// drawPpiiiP = true;
// drawiiPpiiP = true;
// drawP = drawQ = drawAxes = true;
// drawP = true; PTangent = black;


include "draw-ec";

