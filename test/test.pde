PImage a;
void setup() {
  size(800, 800);
  a = loadImage("tableau1.jpg");
}
void draw(){
  noStroke();
  fill(0);
rect(0, 0, 800, 800);
fill(255);
ellipse(mouseX, mouseY, 150, 150);
PImage imask = get();
a.mask(imask);
image (a,0,0);
}