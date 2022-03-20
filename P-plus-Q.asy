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

// Uncomment one of the below to select what to draw

// drawPpP = true;
// drawP = drawQ = true; PQline = black;
drawPpQ = true;
// drawPpiiiP = true;
// drawiiPpiiP = true;
// drawP = drawQ = drawAxes = true;
//drawP = true; PTangent = black;


include "post-config";

dot(P); label("$P$", P, SSE);
dot(Q); label("Q", Q, NNE);
dot(R); label("$P+Q$", R,NE);

draw(graph(lineFrom(P,Q), -1.6, 2.4));
dot(conj(R)); draw((R -- conj(R)), dashed);
