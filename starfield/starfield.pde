Star[] stars = new Star[500];
//speed need to be the global variable
float speed;
int flyCount = 0;
PImage tb;

void setup() {
  size (500, 500);
  tb = loadImage("starfield/starfield.png");
  for (int i = 0; i < stars.length; i ++) {
    stars[i] = new Star();
  }
}

void draw() {
  background(0);
  if (flyCount % 2 == 0) {
    if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
      fly();
    }
  } else {
    image(tb, 0, 0);
  }
}

void mousePressed() {
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
    flyCount ++;
  }
}

void fly() {
  speed = map(mouseX, 0, width, 0, 20);
  translate(width/2, height/2);
  for (int i = 0; i < stars.length; i ++) {
    stars[i].update();
    stars[i].show();
  }
}

class Star {
  float x;
  float y;
  float z;

  //coordinate for the previous location
  float pz;


  Star() {
    x = random(-width, width);
    y = random(-height, height);
    z = random(width);
    pz = z;
  }

  void update() {
    z = z - speed;
    if (z < 1) {
      z = width;
      x = random(-width, width);
      y = random(-height, height);
      pz = z;
    }
  }

  void show() {
    fill(255);
    noStroke();

    float sx = map(x / z, -1, 1, -width, width);
    float sy = map(y / z, -1, 1, -height, height);

    float r = map(z, 0, width, 16, 0);
    ellipse(sx, sy, r, r);

    stroke(255);
    float px = map(x / pz, -1, 1, -width, width);
    float py = map(y / pz, -1, 1, -height, height);
    line(px, py, sx, sy);

    pz = z;
  }
}