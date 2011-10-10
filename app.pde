// All Examples Written by Casey Reas and Ben Fry
// unless otherwise stated.


int screenWidth  = 1680;
int screenHeight = 1050;
int logoWidth    = 400;
int logoHeight   = 400;
int framerate    = 30;
color backgroundColor = 0;

class Logo {
  float x;
  float y;
  int   width;
  int   height;
  float xspeed;
  float yspeed;
  int   time;
  int   ringWidth;
  int   innerRadius;

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
  }

  void draw() {
    /* text("excitement: "+excitement, 50, 90)*/
    /* text("speed: "+xspeed, 50, 50)*/
    outerRing()
    ringCorners()
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


  void ringCorners() {
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

  void center() {
    fill(200)
    rect(x + width/2,
         y + height/2,
         centerRadius*2 - centerCorner,
         centerRadius*2 - centerCorner);

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

