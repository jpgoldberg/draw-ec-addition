// pre-ec includes the setup code and should be included with `include`

// When I (JPG) first wrote this in 2015, I did not comment
// the code. I am adding comments now (2022) as I figure out
// what I did.

import graph;
size(300,300,keepAspect=true);

import contour;

pen curvePen = blue;
pen curveLabelPen = invisible;
pen axisPen = invisible;

// JPG 2022-03
// It appears that back when I wrote this 7 years ago
// I couldn't figure out how to get asy to draw a sequence
// of related images. So I set it up to draw everything, but
// for any one image that I wanted, most pens were set to
// invisible. Selecting which image to draw is selecting which
// pens to make visible.
//
// There must be a better way, but I didn't succeed in finding
// one back then, so I won't bother looking now.

// asymptote doesn't offer a switch statement

// Naming scheme
//  points: P, Q, R 
//  Also points: iiP = 2P; iiiP = 3P; viP = 4P
//  point addition: PpQ is "P + Q"

// The pens for drawing points
pen Ppen, Qpen, Rpen, iiPpen, iiiPpen, ivPpen, negPpen;

// The pens for drawing addition
pen PpPpen, PpiiPpen, PpiiiPpen, iiPpiiPpen, PpQpen, negPpPpen;
pen PQline, PTangent;

// Default to points invisible
Ppen = Qpen = Rpen = iiPpen = iiiPpen = ivPpen = negPpen = invisible;

// Default to all lines invisible
PpPpen = PpiiPpen = PpiiiPpen = iiPpiiPpen = PpQpen = negPpPpen = invisible;
PQline = PTangent = invisible;

// Booleans for what to draw
bool drawP, drawQ, drawR, drawiiP, drawiiiP, drawivP, drawnegP;
bool drawPpP, drawPpQ, drawPpiiP, drawiiPpiiP, drawPpiiiP, drawnegPpP;

bool drawAxes = false;

// Drawing of any point is off by default
drawP = drawQ = drawR = drawiiP = drawiiiP = drawivP = drawnegP = false;

// Drawing any point additions is off
drawPpP = drawPpQ = drawPpiiP = drawiiPpiiP = drawPpiiiP = drawnegPpP = false;

void setuppens() {
if(drawAxes) {
  axisPen = gray + dashed + linewidth(0.25);
  curveLabelPen = curvePen;
}

// Each of the draw booleans can swich on certain sets of pens
if (drawPpQ) {
  drawP = drawQ = true;
  drawR = true;
  PQline = black;
  PpQpen = black;
}

if (drawnegPpP) {
  drawP = drawnegP = true;
  negPpPpen = black;
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
if (drawnegP) { negPpen = black; }
}

// end of included setup file