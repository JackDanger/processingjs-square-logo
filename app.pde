// All Examples Written by Casey Reas and Ben Fry
// unless otherwise stated.


int screenWidth  = 640;
int screenHeight = 480;
int logoWidth    = 100;
int logoHeight   = 100;
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
    rectMode(CORNER);
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
    if (xpos > (screenWidth - width))
      xspeed = -(abs(xspeed));
    if (xpos < 0)
      xspeed = abs(xspeed);
    if (ypos > (screenHeight - height))
      yspeed = -abs(yspeed);
    if (ypos < 0)
      yspeed = abs(yspeed);
  }
}

void setup(){
  size(screenWidth, screenHeight);
  frameRate(framerate);
  smooth();

  logo = new Logo(screenWidth/2 - logoWidth/2,
                  screenHeight/2 - logoHeight/2,
                  logoWidth,
                  logoHeight)

}

void draw(){
  // draw background
  background(0)
  logo.draw()
  logo.move()
}

