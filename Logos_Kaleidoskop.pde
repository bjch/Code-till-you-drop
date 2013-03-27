import processing.pdf.*;  // import pdf library to work with pdf
boolean record = false;          // make boolean to control screenshot properties

PImage img;              // variable for storing the image
int divisions = 5;       // initial divisions of Kaleidoskop 
float radius = 400;      // size for Kaleidoskop


void setup() {
  size(1000, 800, P3D);
  img = loadImage("FedEx.jpg");      // load image into variable
  noStroke();
  noFill();
  smooth(8);
}

void draw() {
  
  
    
   //start recording screenshot
  if (record) {
    beginRecord(PDF, "logo-####.pdf"); 
  }

  
  background(0);

  

  // part to do reflections, copied by A3_RegularPolygon (Equal Divisions of the Circle)By Anne-Laure Guiot and Richard Difford
  // --------------------------------------------------------------------

  int ref=1;
  //to store alternating reflection 1=no reflection, -1=reflected
  float radAngle=PI/divisions;

  float nRefs=floor(PI/(2*radAngle));
  println("Reflection Depth = "+nRefs);
  float rotation=0;


  //translate(mouseX,mouseY);
  translate(width/2, height/2);



  for (int r=0; r<=nRefs; r++)

  {
    pushMatrix();
    rotate(rotation);
    triDraw(mouseX, mouseY, radius, radAngle, ref);
    popMatrix();

    pushMatrix();
    rotate(-rotation);
    triDraw(mouseX, mouseY, radius, radAngle, ref);
    popMatrix();

    ref*=-1;
    rotation+=2*radAngle;
  }

  // --------------------------------------------------------------------

  

  // end recording screenshot
  if(record) {
    endRecord();
    record = false;
  }
  
  

}

void keyPressed() {
  
  if (key == 'q') {
    record = true;
  }
  
  if (keyCode == UP) {
    divisions++;
  }
  if (keyCode == DOWN) {
    divisions--;
  }
  divisions= constrain(divisions, 3, 200); // constrains the min & max of divisions parameter
}

