/* 
  * Triangle Drawing Function
  * By Anne-Laure Guiot and Richard Difford
  * Resonate 2013 - Digital Kaleidoscope
*/
 
  void triDraw(float Shape_Xcoord, float Shape_Ycoord, float Shape_radius, float Shape_angle, int Shape_reflect)
  {
  
  // Calculate radius of circumscribed circle  
  float kalTube=(radius/2)/cos(Shape_angle); 
  
//  stroke(255);
//  ellipse(0,-kalTube,kalTube*2,kalTube*2);
//  stroke(0);
  
  // Constrain origin point to stay on screen 
  Shape_Xcoord = constrain (Shape_Xcoord,kalTube,width-kalTube);
  Shape_Ycoord = constrain (Shape_Ycoord,2*kalTube,height); 
    
  // Define shape vertexes
  PVector v1, v2, v3;
  v1= new PVector (-sin(Shape_angle)*Shape_radius, -cos(Shape_angle)*Shape_radius);  
  v2= new PVector (sin(Shape_angle)*Shape_radius, -cos(Shape_angle)*Shape_radius);
  v3= new PVector (0,0);
  
  // Define texture vertexes
  PVector tv1, tv2, tv3;
  tv1= new PVector (Shape_Xcoord+v1.x,Shape_Ycoord+v1.y);
  tv2= new PVector (Shape_Xcoord+v2.x,Shape_Ycoord+v2.y);
  tv3= new PVector (Shape_Xcoord,Shape_Ycoord);
  
  // Define triangle shape and texture  
    beginShape();
    texture(img);
    vertex(v1.x*Shape_reflect,v1.y,tv1.x,tv1.y);
    vertex(v2.x*Shape_reflect,v2.y,tv2.x,tv2.y);
    vertex(v3.x,v3.y,tv3.x,tv3.y);
    endShape(CLOSE);
    
  }

