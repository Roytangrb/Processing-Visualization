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