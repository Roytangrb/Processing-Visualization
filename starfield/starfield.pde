Star[] stars = new Star[500];
//speed need to be the global variable
float speed;

void setup(){
  size (500, 500);
  
  for (int i = 0 ; i < stars.length; i ++){
    stars[i] = new Star();
  }
}

void draw(){
  speed = map(mouseX, 0, width, 0, 20);
  translate(width/2, height/2);
  background(0);
  for (int i = 0 ; i < stars.length; i ++){
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