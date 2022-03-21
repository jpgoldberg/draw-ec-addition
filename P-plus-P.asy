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

pair twoP = addPoints(P,P);

dot(P); label("$P$", P, SSE);
dot(twoP); label("$2P$", twoP, W);

draw(graph(tangent(P), -2.5, 2.5));
dot(inv(twoP)); draw((twoP -- inv(twoP)), dashed);
