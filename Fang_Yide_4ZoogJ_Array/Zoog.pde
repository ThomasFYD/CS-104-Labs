class Zoog {
  // Zoog's variables
  float x;//x position of zoog
  float y;//y position of zoog
  int w;//width of zoog
  int h;//height of zoog
  float es;//Eye Size
  // Zoog constructor
  Zoog(int xi, int yi, int wi, int hi, float esi) { //xi: x initial yi: y initial wi: w initial
    x = xi;                                       //hi: h initial esi: eye size initial
    y = yi;
    w = wi;
    h = hi;
    es = esi;
  }
  // Move Zoog
  void dodge(float speed) {
    // Change the location of Zoog randomly
    x = x + random(-1, 1)*speed;
    y = y + random(-1, 1)*speed;
    // Constrain Zoog to window
    x = constrain(x, 100, width-100);
    y = constrain(y, 100, height-100);
  }
  //Zoog
  void display() {
    ellipseMode(CENTER);
    rectMode(CENTER);
    //arms
    for (float i = y - h/3; i < y + h/2; i += 10) {
      stroke(0);
      line(x - w/4, i, x + w/4, i);
    }
    //head
    stroke(0);
    fill(255);
    ellipse(x, y - h, w, h);
    //eyes
    fill(0);
    ellipse(x - w/3, y - h, es, es*2);
    ellipse(x + w/3, y - h, es, es*2);
    //body
    stroke(0);
    fill(175);
    rect(x, y, w/6, h);
    //legs
    stroke(0);
    line(x - w/12, y + h/2, x - w/4, y + h/2 + 10);
    line(x + w/12, y + h/2, x + w/4, y + h/2 + 10);
  }
}
