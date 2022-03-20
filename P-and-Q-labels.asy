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

xaxis(xmin=-3, xmax=3, L="$x$", axisPen);
yaxis(ymin=-3, ymax=3, L="$y$", axisPen);
label(curveLabel, F(-1.25), 2.5NNW, curvePen);

