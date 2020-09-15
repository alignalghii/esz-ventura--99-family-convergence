import graph;
size(400);

dot("$O$", (0, 0), SW);

real mother(real t) {return  1/2 * t - 6;}
real father(real t) {return -1/2 * t + 6;}

real junior1(real t) {return -5/4 * t + 6;}
real medior1(real t) {return  2   * t - 6;}
real senior1(real t) {return -3   * t    ;}

dot("$\left(\frac{264}{85}, \frac{36}{17}\right)$", (264/85, 36/17));


dot("$\left(\frac65, -\frac{18}5\right)$", (6/5, -18/5));

real medior2(real t) {return  -2 * (t - 6/5) - 18/5;}
real senior2(real t) {return   3 * (t - 6/5) - 18/5;}

dot("$\left(\frac{48}{25}, -\frac{126}{25}\right)$", (48/25, -126/25));

real medior3(real t) {return 2 * (t - 48/25) - 126/25;}


draw(graph(mother, 0, 12));
draw(graph(father, 0, 12));

draw(graph(junior1, 0,  264/85), red  , "Junior");
draw(graph(medior1, 0,  6/5), green, "Medior");
draw(graph(senior1, 0,  6/5), blue , "Szenior");

draw(graph(medior2, 6/5, 48/25), green);
draw(graph(senior2, 6/5,  264/85), blue);

draw(graph(medior3, 48/25,  4), green);

// axes("ens","dkm");

// Axes.
xaxis( Label("$t$ [en\bf s]"), RightTicks(new real[]{4, 8, 12}, new real[]{1,2,3,5,6,7,9,10,11}), Arrow);
yaxis( Label("$s$ [dk\bf m]"), LeftTicks(new real[]{-6, -5, -4, -3, -2, -1, 1, 2, 3, 4, 5, 6}, new real[]{}), Arrow);

labelx(scale(0.6)*"(1 hxtk{\bf s})", ( 4, 0), N, gray);
labelx(scale(0.6)*"(2 hxtk{\bf s})", ( 8, 0), N, gray);
labelx(scale(0.6)*"(3 hxtk{\bf s})", (12, 0), N, gray);


label(rotate( atan(1/2)*180/pi)*shift((0,-5))*scale(1.2)*Label("$\frac12t-6$"), (6, mother(6)));
label(rotate(-atan(1/2)*180/pi)*shift((0,5))*scale(1.2)*Label("$6-\frac12t$"), (6, father(6)));
label(rotate(-atan(5/4)*180/pi)*shift((0,3))*scale(0.5)*Label("$6-\frac54t$"), (1.8, junior1(1.8)), red);
label(rotate( atan(2)*180/pi)*shift((0, 3))*scale(0.5)*Label("$2t-6$"), (0.6, medior1(0.6)), green);
label(rotate(-atan(2)*180/pi)*shift((0,-3))*scale(0.35)*Label("$-2\left(t-\frac65\right)-\frac{18}5$"), (1.58, medior2(1.58)), green);
label(rotate(-atan(3)*180/pi)*shift((0,-3))*scale(0.5)*Label("$-3t$"), (0.6, senior1(0.6)), blue);
label(rotate( atan(3)*180/pi)*shift((0,3))*scale(0.5)*Label("$3\left(t-\frac65\right)-\frac{18}5$"), (1.8, senior2(1.8)), blue);

add(legend(), point(NE));
