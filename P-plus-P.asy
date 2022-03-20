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

include "post-config";

dot(P, Ppen); label("$P$", P, SSE, Ppen);
dot(twoP, iiPpen); label("$2P$", twoP, W, iiPpen);

draw(graph(tangent(P), -2.5, 2.5));
dot(conj(twoP)); draw((twoP -- conj(twoP)), dashed);



