// All Examples Written by Casey Reas and Ben Fry
// unless otherwise stated.


int screenWidth  = 640;
int screenHeight = 480;
int framerate    = 30;

class Logo {
  color filler;
  float xpos;
  float ypos;
  int   width;
  int   height;
  float xspeed;
  float yspeed;
  int   time;

  Logo(float x, float y, int w, int h){
    xpos     = x
    ypos     = y
    width    = w
    height   = h
    filler   = 182
    xspeed   = 0.2
    yspeed   = 0.2
  }

  void draw() {
    /* text("excitement: "+excitement, 50, 90)*/
    /* text("speed: "+xspeed, 50, 50)*/
    rectMode(CENTER);
    fill(filler);
    rect(xpos, ypos, width, height);
  }

  void move() {
    throttle()
    bounce()
    xpos = xpos + xspeed;
    ypos = ypos + yspeed;
  }

  void throttle() {
    time += 1
    excitement = (0.2 + cos(time) / framerate) / 10
    xspeed += excitement + random(0.01)
    yspeed += excitement + random(0.01)
  }

  void bounce() {
    if (xpos > (screenWidth - width) || xpos < (width/2)) {
      xspeed = -xspeed;
    }
    if (ypos > (screenHeight - height) || ypos < (height/2)) {
      yspeed = -yspeed;
    }
  }
}

void setup(){
  size(screenWidth, screenHeight);
  frameRate(framerate);
  smooth();

  logo = new Logo(35, 35, 50, 50);

}

void draw(){
  // draw background
  background(0)
  logo.draw()
  logo.move()
}

