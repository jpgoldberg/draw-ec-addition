// include this file after setup and configuration

pair P, Q; // can't be calculated until other stuff is defined

// ec is the curve, and ecdx is the derivative of ec
real ec(real x, real y) { return y^2 -  (x^3 + a*x + b); }
real ecdx(pair p) { return (3*(p.x^2) + a)/(2*p.y); }

// I can't remember what about asy's type system motivated
// me to do things as follows.

typedef real realop(real); // for functions that return single valued real functions

// It appears that I could overload lineFrom based on
// type signature

// lineFrom returns a function that intersects p and has
// slope m
realop lineFrom(pair p, real m) {
  // y - y1 = m(x - x1)
  real innerFunc(real x) { return m*(x - p.x) + p.y; }
  return innerFunc;
}

// lineFrom returns a function of the line through A and B
realop lineFrom(pair A, pair B) {
  if (A.x != B.x ){
    real m = (A.y - B.y)/(A.x - B.x);
    return lineFrom(A, m);
  } else {
    real innerFunc(real x) { return inf;}
    return innerFunc;
  }
}

// tangent returns a function for the line tangent to point p
realop tangent(pair p) {
  return lineFrom(p, ecdx(p));
}

pair F(real x) { return(x, sqrt(x^3 + a*x + b)); }
pair negF(real x) { pair p = F(x); return(p.x, -p.y);}

guide[][] thegraphs = contour(ec,
      a=(-3,-3), b=(3,3), new real[] {0});
draw(thegraphs[0], curvePen);

pair addPoints(pair p, pair q) {
  // First deal with O
  // 0 + 0 = 0; p + 0 = p; q + 0 = q;
  if (p.y == inf) {return q; }
  else if (q.y == inf) {return p; }

  // Now calculate slope
  real m;
  if (p.x != q.x) {
    m = (p.y - q.y)/(p.x - q.x);
  } else if (p == q && p.y != 0) {
    m = ecdx(p);
  } else {
    // When p == -q or when y == 0
    return (inf, inf);
  }

  // And now actaully calculate the result
  real resultX = (m^2 - p.x) - q.x;
  real resultY = m*(p.x - resultX) - p.y;
  return (resultX, resultY);
}

// Now we can compute and set up all of the points
if (PyPositive)
  { P = F(Px); }
else
  { P = negF(Px); }
if (QyPositive)
  { Q = F(Qx); }
else 
  { Q = negF(Qx); }
