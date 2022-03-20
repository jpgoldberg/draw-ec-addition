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

dot(P); label("$P$", P, SSE);
dot(twoP); label("$2P$", twoP, W);
dot(threeP); label("$3P$", threeP, 2S);


draw(graph(lineFrom(P,twoP), -1.6, 2.4));
dot(conj(threeP)); draw((threeP -- conj(threeP)), dashed);
