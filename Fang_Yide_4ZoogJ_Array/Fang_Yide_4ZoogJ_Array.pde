Zoog[] zoog = new Zoog[4];
//initialize the zoog variables
int x = 150;
int y = 500;
int w = 100;
int h = 100;
int es = 50;

void setup() {
  size(1000, 1000);
  for (int i = 0; i < zoog.length; i++) {
    zoog[i] = new Zoog(x, y, w, h, es); 
    x += 150;
  }
}
void draw() {
  background(255);
  // mouseX position controls speed
  float vfactor = constrain(mouseX/10, 0, 10);
  for (int i = 0; i < zoog.length; i++) {
    zoog[i].dodge(vfactor); 
    zoog[i].display();
  }
}
