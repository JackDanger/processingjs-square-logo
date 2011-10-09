// All Examples Written by Casey Reas and Ben Fry
// unless otherwise stated.


int screenWidth  = 640;
int screenHeight = 480;
int logoWidth    = 200;
int logoHeight   = 200;
int framerate    = 30;

class Logo {
  float x;
  float y;
  int   width;
  int   height;
  float xspeed;
  float yspeed;
  int   time;
  int   outerRadius;
  int   innerRadius;

  Logo(float xpos, float ypos, int w, int h){
    x        = xpos
    y        = ypos
    width    = w
    height   = h
    xspeed   = 0.2
    yspeed   = 0.2
    outerRadius = width / 5
    innerRadius = width / 24
  }

  void draw() {
    /* text("excitement: "+excitement, 50, 90)*/
    /* text("speed: "+xspeed, 50, 50)*/
    outerRing()
    innerRing()
    center()
  }

  void move() {
    throttle()
    bounce()
    x = x + xspeed;
    y = y + yspeed;
  }

  void throttle() {
    time += 1
    excitement = (0.2 + cos(time) / framerate) / 10
    xspeed += excitement + random(0.01)
    yspeed += excitement + random(0.01)
  }

  void bounce() {
    if (x > (screenWidth - width))
      xspeed = -(abs(xspeed));
    if (x < 0)
      xspeed = abs(xspeed);
    if (y > (screenHeight - height))
      yspeed = -abs(yspeed);
    if (y < 0)
      yspeed = abs(yspeed);
  }

  void outerRing() {
    fill(200)
    noStroke()
    ellipse(outerRadius + x,
            outerRadius + y,
            outerRadius,
            outerRadius);
    ellipse(outerRadius + x,
            height - outerRadius + y,
            outerRadius,
            outerRadius);
    ellipse(width - outerRadius + x,
            outerRadius + y,
            outerRadius,
            outerRadius);
    ellipse(width - outerRadius + x,
            height - outerRadius + y,
            outerRadius,
            outerRadius);
    rectMode(CENTER);
    rect(outerRadius + x,
         y + height/2,
         outerRadius,
         height - 2 * outerRadius);
    rect(width - outerRadius + x,
         y + height/2,
         outerRadius,
         height - 2 * outerRadius);
    rect(x + width/2,
         outerRadius + y,
         height - 2 * outerRadius,
         outerRadius)
    rect(x + width/2,
         height - outerRadius + y,
         height - 2 * outerRadius,
         outerRadius)
  }

  void innerRing() {

  }

  void center() {

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

