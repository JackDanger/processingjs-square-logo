// All Examples Written by Casey Reas and Ben Fry
// unless otherwise stated.


int screenWidth  = window.innerWidth;
int screenHeight = window.innerHeight;
int logoWidth    = 400;
int logoHeight   = 400;
int framerate    = 60;
int baseAcceleration = 3;
color backgroundColor = 0;

class Logo {
  float x;
  float y;
  int   width;
  int   height;
  float xspeed;
  float yspeed;
  int   time;
  float angle;
  int   ringWidth;
  int   innerRadius;
  int   lastMousePositionX;
  int   lastMousePositionY;

  Logo(float xpos, float ypos, int w, int h){
    x        = xpos
    y        = ypos
    width    = w
    height   = h
    xspeed   = 0.2
    yspeed   = 0.2
    ringWidth    = width * 11/60
    mouldingRadius = width * 2/60
    centerRadius   = width * (8/60)
    centerCorner   = mouldingRadius
    lastMousePositionX = mouseX
    lastMousePositionY = mouseY
  }

  void draw() {
    // text("angle: "+angle, 50, 90)
    drawOuterRing()
    drawRingCorners()
    drawCenter()
  }

  void move() {
    // hit edge of screen?
    bounce();
    // set speeds
    throttle();
    // is somebody moving a mouse?
    if(mouseActive()){
      followMouse()
    } else {
      // follow previous vector
      x = x + xspeed;
      y = y + yspeed;
    }
  }

  void throttle() {

    time += 1;

    acceleration = baseAcceleration;
    // start slow
    if((time / framerate) < 5)
      acceleration = acceleration * ((time/framerate) / 5)

    // the rate of change of direction varies
    angle += (random(sin(time / framerate)) - 0.5) / 4
    // normalize angle from -180 to +180
    angle = abs(180 + (angle % 360)) - 180

    xspeed = acceleration * cos(radians(angle));
    yspeed = acceleration * sin(radians(angle));
  }

  void bounce() {
    if (x > (screenWidth  - width) || x < 0)
      angle = 180 - angle;
    if (y > (screenHeight - height) || y < 0)
      angle = 360 - angle;
  }

  bool mouseActive(){
    if(0 == mouseX && 0 == mouseY)
      return false;
    return !close(mouseX,
                  mouseY,
                  lastMousePositionX,
                  lastMousePositionY)
  }

  void followMouse(){
    yspeed = xspeed = 0.0;
    x += (mouseX - (x + 2 + width/2)) / framerate;
    y += (mouseY - (y + 2 + height/2)) / framerate;

    // maybe return to normal vectors
    if(close(mouseX,
             mouseY,
             x + width/2,
             y + height/2)) {
      time = 0
      lastMousePositionX = mouseX
      lastMousePositionY = mouseY
    }
  }

  void drawOuterRing() {
    fill(200)
    noStroke()
    ellipse(ringWidth + x,
            ringWidth + y,
            ringWidth*2,
            ringWidth*2);
    ellipse(ringWidth + x,
            height - ringWidth + y,
            ringWidth*2,
            ringWidth*2);
    ellipse(width - ringWidth + x,
            ringWidth + y,
            ringWidth*2,
            ringWidth*2);
    ellipse(width - ringWidth + x,
            height - ringWidth + y,
            ringWidth*2,
            ringWidth*2);
    rectMode(CENTER);
    rect(x + ringWidth/2,
         y + height/2,
         ringWidth,
         height - ringWidth*2);
    rect(x + width - ringWidth/2,
         y + height/2,
         ringWidth,
         height - ringWidth*2);
    rect(x + width/2,
         ringWidth/2 + y,
         height - ringWidth*2,
         ringWidth)
    rect(x + width/2,
         height - ringWidth/2 + y,
         height - ringWidth*2,
         ringWidth)
  }


  void drawRingCorners() {
    rectMode(CENTER);
    // Fill in the center with a black square
    fill(0)
    rect(x + width/2,
         y + height/2,
         width - ringWidth*2,
         height - ringWidth*2);
    fill(200)
    // Fill in the corners with patches of white
    rect(x + ringWidth + mouldingRadius/2,
         y + ringWidth + mouldingRadius/2,
         mouldingRadius,
         mouldingRadius);
    rect(x + width - (ringWidth + mouldingRadius/2),
         y + ringWidth + mouldingRadius/2,
         mouldingRadius+1,
         mouldingRadius);
    rect(x + ringWidth + mouldingRadius/2,
         y + height - (ringWidth + mouldingRadius/2),
         mouldingRadius+1,
         mouldingRadius+1);
    rect(x + width - (ringWidth + mouldingRadius/2),
         y + height - (ringWidth + mouldingRadius/2),
         mouldingRadius+1,
         mouldingRadius+1);
    // black circles give the illusion of rounded inner corners
    fill(0)
    ellipse(x + ringWidth + mouldingRadius + 1,
            y + ringWidth + mouldingRadius + 1,
            mouldingRadius*2,
            mouldingRadius*2);
    ellipse(x + width - (ringWidth + mouldingRadius),
            y + ringWidth + mouldingRadius + 1,
            mouldingRadius*2,
            mouldingRadius*2);
    ellipse(x + ringWidth + mouldingRadius + 1,
            y + height - (ringWidth + mouldingRadius + 1),
            mouldingRadius*2,
            mouldingRadius*2);
    ellipse(x + width - (ringWidth + mouldingRadius + 1),
            y + height - (ringWidth + mouldingRadius + 1),
            mouldingRadius*2,
            mouldingRadius*2);
  }

  void drawCenter() {
    fill(200)
    rect(x + width/2,
         y + height/2,
         centerRadius*2 - centerCorner,
         centerRadius*2 - centerCorner);

  }

  bool close(x1,y1,x2,y2){

    return x1 > x1 - 4 &&
           x1 < x1 + 4 &&
           y1 > y2 - 4 &&
           y1 < y2 + 4
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
  smooth()
  background(0)
  logo.draw()
  logo.move()
}

