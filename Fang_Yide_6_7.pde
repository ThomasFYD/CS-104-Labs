void setup() {
  size(1000, 600);
  background(0);
} 

int x = (int) (random(20, 980) + 0.5);//circle x position
int y = (int) (random(20, 100) + 0.5);//circle y postion
int d = (int) (random(1, 2) + 0.5);//use to do random direction
int vx;//xspeed
int vy;//yspeed
int px;//paddle length
int count = 0;//track your point
int rl;//left range of paddle
int rr;//right range of paddle

boolean dc = true;//switch of start or stop of the draw loop
boolean go = false;//gameover control variable
//boolean rs = false;//restart control variable

void draw() {
  instruction();
  gameing();
  gameover();
}
//instruction of the pong game
void instruction() {
  if (dc && !go) {
    //color
    //title
    textAlign(CENTER, BOTTOM);
    textSize(100);
    fill(255);
    text("PONG GAME", width/2, height/3);
    //instructions
    textAlign(CENTER, CENTER);
    textSize(25);
    fill(255);
    text("Using Mouse to choose the level of your game.\n Higher level means you have larger paddle and faster speed of your ball.\nOnce you choose the level, the game will start immiediately", width/2, 250);
    //easymode
    rectMode(CENTER);
    noFill();
    stroke(255);
    rect(380, 335, 60, 32);
    textAlign(CENTER, CENTER);
    textSize(25);
    fill(255);
    text("Easy", 380, 330);
    //hard mode
    noFill();
    stroke(255);
    rect(500, 335, 60, 32);
    textAlign(CENTER, CENTER);
    textSize(25);
    fill(255);
    text("Hard", 500, 330);
    //nightmare mode
    noFill();
    stroke(255);
    rect(640, 335, 130, 32);
    textAlign(CENTER, CENTER);
    textSize(25);
    fill(255);
    text("Nightmare", 640, 330);
    textAlign(CENTER, CENTER);
    textSize(90);
    fill(255);
    text("Choose Your Mode", width/2, 2*height/3);
    //author name
    textAlign(CENTER, TOP);
    textSize(100);
    fill(255);
    text("YIED(THOMAS) FANG", width/2, 3*height/4);
  }
}
//the game part
void gameing() {
  if (!dc && !go) {
    //crazy rainbow ball
    if (mousePressed) {
    } else {
      background(0);
    }
    //point track
    textAlign(CENTER, BOTTOM);
    textSize(40);
    fill(255);
    text("Point:", 900, 50);
    text(count, 975, 50);
    //color circle
    float c1 = random(0, 255);
    float c2 = random(0, 255);
    float c3 = random(0, 255);
    fill(c1, c2, c3);
    //y speed 0f the ball

    //draw circle
    circle(x, y, 20);
    //draw paddle
    fill(255);
    rectMode(CENTER);
    //color of paddle
    float c4 = random(0, 256);
    float c5 = random(0, 256);
    float c6 = random(0, 256);
    float b = random(0, 256);
    //color of stroke
    float c7 = random(0, 256);
    float c8 = random(0, 256);
    float c9 = random(0, 256);
    //draw paddle
    stroke(c7, c8, c9);
    

    //paddle control
    int paddleX = constrain(mouseX, 0+px/2, 1000-px/2);
    rect(paddleX, 560, px, 20);
    for(int i =paddleX-px/2; i<= paddleX+px/2; i+=5){
        for(int j = 550; j<=570; j+=5){
          fill(random(0, 255),random(0, 255),random(0, 255));
          rect(i,j,5,5);
        }
      }
    //gameover control
    if (y+10 >= height) {
      go = true;
    }
      
    y += vy;
    //random direction
    if (d >1.5) {
      x += vx;
    } else {
      x -= vx;
    }
    //edges
    //left & right
    if ((x-10) <= 0 || (x+10) >= 1000) {
      vx *= -1;
    }
    //top
    if ((y-10) <= 0 && vy < 0) {
      vy *= -1;
    }
    //paddle reflect
    if ((y+10) >= 550 - 10 && y + 10 <= 550 + 10  && x >= paddleX-px/2 && x <= paddleX+px/2 && vy > 0) {
      vy *= -1;
      vy *= 1.2;
      vx *= 1.2;
      count += 1;
    }
  }
}

//game over
void gameover() {
  if (go && !dc) {
    background(0);
    textAlign(CENTER, CENTER);
    textSize(100);
    fill(255, 0, 0);
    text("Game Over", width/2, height/3);
    textSize(80);
    fill(255);
    text("Press Any Key to Restart", width/2, 400);
  }
}
//mode choose
void mouseClicked() {
  if (dc && !go) {
    if ( mouseX>=350 && mouseX<=410 && mouseY>=319 && mouseY<=351 ) {
      dc = false;
      vx = 2;
      vy = 2;
      px = 100;
      rl = mouseX-px/2;
      rr = mouseX+px/2;
    } else if ( mouseX>=470 && mouseX<=530 && mouseY>=319 && mouseY<=351 ) {
      dc = false;
      vx = 3;
      vy = 3;
      px = 200;
      rl = mouseX-px/2;
      rr = mouseX+px/2;
    } else if ( mouseX>=575 && mouseX<=705 && mouseY>=319 && mouseY<=351) {
      dc = false;
      vx = 10;
      vy = 10;
      px = 300;
      rl = mouseX-px/2;
      rr = mouseX+px/2;
    }
  }
}

//Keyboard Listenning
void keyPressed() {
  if (go && !dc) {
    background(0);
    dc = true;
    go = false;
    x = (int) (random(20, 980) + 0.5);//circle x position
    y = (int) (random(20, 100) + 0.5);//circle y postion
    d = (int) (random(1, 2) + 0.5);
  }
}
