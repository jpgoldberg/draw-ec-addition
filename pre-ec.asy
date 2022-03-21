// pre-ec includes the setup code and should be included with `include`

import graph;
size(300,300,keepAspect=true);

import contour;

pen curvePen = blue;
pen axisPen = gray + dashed + linewidth(0.25);

// additive inverse on ec over the reals
pair inv(pair p) { return(p.x, -p.y); }

string makeECLabel(int a, int b) {
  string result = "$y^2 = x^3 ";
  if( a < 0) { result += "- " + string(-a);}
  else {result += "+ " + string(a);}
  result += "x";

  if (b < 0) { result += "- " + string(-b); }
  else { result += "+ " + string(b); }
  result += "$"; return result;
}
