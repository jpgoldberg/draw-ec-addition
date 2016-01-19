/****
Copyright 2016 Jeffrey Goldberg <jeff@agilebits.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
****/

import graph;
size(300,300,keepAspect=true);

import contour;

pen curvePen = blue;
pen curveLabelPen = invisible;
pen axisPen = invisible;

// asymptote doesn't offer a switch statument

pen Ppen, Qpen, Rpen, iiPpen, iiiPpen, ivPpen;
pen PpPpen, PpiiPpen, PpiiiPpen, iiPpiiPpen, PpQpen;
pen PQline, PTangent;

Ppen = Qpen = Rpen = iiPpen = iiiPpen = ivPpen = invisible;
PpPpen = PpiiPpen = PpiiiPpen = iiPpiiPpen = PpQpen = invisible;
PQline = PTangent = invisible;

bool drawP, drawQ, drawR, drawiiP, drawiiiP, drawivP;
bool drawPpP, drawPpQ, drawPpiiP, drawiiPpiiP, drawPpiiiP;

bool drawAxes = false;
drawP = drawQ = drawR = drawiiP = drawiiiP = drawivP = false;

drawPpP = drawPpQ = drawPpiiP = drawiiPpiiP = drawPpiiiP = false;

void setuppens() {
if(drawAxes) {
  axisPen = gray + dashed + linewidth(0.25);
  curveLabelPen = curvePen;
}
if (drawPpQ) {
  drawP = drawQ = true;
  drawR = true;
  PQline = black;
  PpQpen = black;
}

if (drawPpP) {
  drawP = true;
  drawiiP = true;
  PTangent = black;
  PpPpen = black;
}

if (drawPpiiP) {
  drawP = drawiiP = true;
  drawiiiP = true;
  PpiiPpen = black;
}

if (drawiiPpiiP) {
  drawiiP = true;
  drawivP = true;
  iiPpiiPpen = black;
}

if (drawPpiiiP) {
  drawP = drawiiiP = true;
  drawivP = true;
  PpiiiPpen = black;
}

if (drawP) { Ppen = black; }
if (drawQ) { Qpen = black; }
if (drawR) { Rpen = black; }
if (drawiiP) { iiPpen = black; }
if (drawiiiP) { iiiPpen = black; }
if (drawivP) { ivPpen = black; }
}




/// This is where things get hand configured./ y^{2}=x^{3}+ax+b

// curve parameters
int a = -2;
int b = 2;

// Set points P and Q
real Px =-0.90; bool PyPositive = false;
real Qx = 1.2; bool QyPositive = false;

pair P, Q; // can't be calculated until other stuff is defined

// What to draw.
// drawPpP = true;
// drawP = drawQ = true; PQline = black;
// drawPpiiiP = true;
// drawiiPpiiP = true;
// drawP = drawQ = drawAxes = true;
drawP = true; PTangent = black;




setuppens();

real ec(real x, real y) { return y^2 -  (x^3 + a*x + b); }
real ecdx(pair p) { return (3*(p.x^2) + a)/(2*p.y); }

typedef real realop(real); // for functions that return single valued real functions
realop lineFrom(pair p, real m) {
  // y - y1 = m(x - x1)
  real innerFunc(real x) { return m*(x - p.x) + p.y; }
  return innerFunc;
}
realop lineFrom(pair A, pair B) {
  if (A.x != B.x ){
    real m = (A.y - B.y)/(A.x - B.x);
    return lineFrom(A, m);
  } else {
    real innerFunc(real x) { return inf;}
    return innerFunc;
  }
}
realop tangent(pair p) {
  return lineFrom(p, ecdx(p));
}

pair F(real x) { return(x, sqrt(x^3 + a*x + b)); }
pair negF(real x) { pair p = F(x); return(p.x, -p.y);}

// New we can actually set up the actual P and Q
if (PyPositive) { P = F(Px); } else { P = negF(Px); }
if (QyPositive) { Q = F(Qx); } else { Q = negF(Qx); }

guide[][] thegraphs = contour(ec,
      a=(-3,-3), b=(3,3), new real[] {0});
draw(thegraphs[0], curvePen);

xaxis(xmin=-3, xmax=3, L="$x$", axisPen);
yaxis(ymin=-3, ymax=3, L="$y$", axisPen);

pair addPoints(pair p, pair q) {
  // First deal with O
  // 0 + 0 = 0; p + 0 = p; q + 0 = q;
  if (p.y == inf && q.y == inf) {return (inf,inf);}
  else if (p.y == inf && q.y != inf) {return q; }
  else if (q.y == inf && p.y != inf) {return p; }

  // Now calculate slope
  real m;
  if (p.x != q.x) {
    m = (p.y - q.y)/(p.x - q.x);
  } else if (p == q && p.y != 0) {
    m = ecdx(p);
  } else {
    // There are when p == -q or when y == 0
    return (inf, inf);
  }

  // And now actaully calculate the result
  real resultX = (m^2 - p.x) - q.x;
  real resultY = m*(p.x - resultX) - p.y;
  return (resultX, resultY);
}
string makeECLabel(int a, int b) {
  string result = "$y^2 = x^3 ";
  if( a < 0) { result += "- " + string(-a);}
  else {result += "+ " + string(a);}
  result += "x";

  if (b < 0) { result += "- " + string(-b); }
  else { result += "+ " + string(b); }
  result += "$"; return result;
}

string curveLable = makeECLabel(a,b);
label(curveLable, F(-1.25), 2.5NNW, curveLabelPen);


dot(P, Ppen); label("$P$", P, SSE, Ppen);
dot(Q, Qpen); label("Q", Q, NNE, Qpen);

pair R = addPoints(P,Q);
dot(R, Rpen); label("$P+Q$", R,NE, Rpen);

pair twoP = addPoints(P,P);
dot(twoP, iiPpen); label("$2P$", twoP, W, iiPpen);

pair threeP = addPoints(P, twoP);
dot(threeP, iiiPpen); label("$3P$", threeP, 2S, iiiPpen);

pair fourP = addPoints(twoP, twoP);
dot(fourP, ivPpen); label("$4P$", fourP, NE, ivPpen);

draw(graph(lineFrom(P,Q), -1.6, 2.4), PQline);
dot(conj(R), PQline); draw((R -- conj(R)), PpQpen + dashed);

draw(graph(tangent(P), -2.5, 2.5), PTangent);
dot(conj(twoP), PTangent); draw((twoP -- conj(twoP)), PpPpen + dashed);

draw(graph(lineFrom(P,twoP), -1.6, 2.4), PpiiPpen);
dot(conj(threeP), PpiiPpen); draw((threeP -- conj(threeP)), PpiiPpen + dashed);

draw(graph(lineFrom(P, threeP), -2, 2.5), PpiiiPpen);
dot(conj(fourP), PpiiiPpen); draw((fourP -- conj(fourP)), PpiiiPpen+dashed);

draw(graph(tangent(twoP), fourP.x - 0.5 , twoP.x + 0.4), iiPpiiPpen);
dot(conj(fourP), iiPpiiPpen); draw((fourP -- conj(fourP)), iiPpiiPpen+dashed);
