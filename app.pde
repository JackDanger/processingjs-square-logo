// All Examples Written by Casey Reas and Ben Fry
// unless otherwise stated.

class Logo {
  float xpos;
  float ypos;
  int   width;
  int   height;
  float speed;

  Logo(float x, float y, int w, int h, float s){
    xpos   = x;
    ypos   = y;
    width  = w;
    height = h;
    speed  = s;
  }

  void display() {
    rectMode(CENTER);
    fill(c);
    rect(xpos, ypos, width, height);
  }

  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}

void setup(){
  size(640, 480);
  frameRate(60);
  fill(128);
  smooth();

  logo = new Logo();

}

void draw(){
  // draw background
  fill(0, 12);
  noStroke();
  rect(0, 0, width, height);

}

