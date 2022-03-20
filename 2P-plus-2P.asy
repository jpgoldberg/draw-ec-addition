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

include "post-config";

dot(twoP); label("$2P$", twoP, W);
dot(fourP); label("$4P$", fourP, NE);

draw(graph(tangent(twoP), fourP.x - 0.5 , twoP.x + 0.4));
dot(conj(fourP), iiPpiiPpen); draw((fourP -- conj(fourP)), dashed);


