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
dot(Q); label("Q", Q, NNE);

draw(graph(lineFrom(P,Q), -1.6, 2.4));
