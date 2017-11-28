int cols, rows;
//scale
int scl = 20;
//wider to fill the display board
int w = 1200;
int h = 900;
int flyCount = 0;
PImage tb;

float[][] terrain;

float flying = 0;

void setup(){
  size(500, 500, P3D);
  cols = w /scl;
  rows = h/ scl;
  //initiatino of the z value, data point
  terrain = new float[cols][rows];
  tb = loadImage("/thumbnail-terrain.png");
}

void draw(){
  background(0);
  stroke(255);
  noFill();
  frameRate(60);
  //if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height){
    if (flyCount % 2 == 0){
      fly();
    } else {
      image(tb, 0, 0);
    }
  //}
} 

void mousePressed(){
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height){
    flyCount ++;
  }
}


void fly(){
  
  flying -= 0.1;
  
  float yoff = flying;
  for (int y = 0; y < rows; y++){
    float xoff = 0;
    for (int x = 0; x < cols; x++){
        terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
        xoff += 0.2;
        //random(-10, 10);
    }
    yoff += 0.2;
  }
  
  translate(width/2, height/2);
  rotateX(PI/3);
  //translate the centre of the grid back to the centre of the screen
  translate(-w/2, -h/2);
  //terrain use processing triangel_strip
  //to draw row by row the triangle mash, y (col index) to be in the outter loop
  for (int y = 0; y < rows - 1; y++){
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++){
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      //rect(x*scl, y*scl, scl, scl);
    }
    endShape();
  }
}
//use perlin noise to get smooth random numbers
//to make the tertain more nature like
//noise function