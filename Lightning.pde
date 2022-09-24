void setup()
{
  size(600,600);
  //frameRate(15);
  background(#050505);
}

boolean launchstate = false;
int startx = 300;
int starty = 600;
int oldtime = 0;
  
void drawRocket(int rx, int ry){
  //rx = 300
  //ry = 600
  //rocket moving up in y direction
  
  noStroke();
    fill(#CECCCC);
  triangle(rx, ry - 50, rx - 35, ry, rx + 35, ry);
    fill(#BEF7F2);
  rect(rx - 20, ry - 80, 40, 80);
  triangle(rx, ry - 120, rx - 30, ry - 80, rx + 30, ry - 80);
    fill(#020303);
  ellipse(rx, ry - 60, 27, 27);
    fill(#FFFFFF);
  ellipse(rx, ry - 60, 25, 25);
}
  
//stars
  
void drawBackground(){
  //fill(#050505);
  //rect(0,0,600,600);
  background(#050505);
}  
  
void drawFire(int sx, int sy) {
  //lightning downward
  int x = sx;
  int y = sy;
  int xDistance = 0;
  int yDistance = 0;
  int red = 0;
  int green = 0;
  int blue = 0;
  int intensity = 2;
  int counter = 0;
  
  //Color random of lightining between yellow & red
     while (counter < 20){
       red = (int)(Math.random() * 100) + 150;
       green = (int)(Math.random() * 50) + 75;
       blue = (int)(Math.random() * 50) + 50;
       
      while (y < 600) {
        yDistance = (int)(Math.random() * 20);
        xDistance = (int)(Math.random() * 20) - 10;
        stroke(red, green, blue);
        strokeWeight(3);
        line(x, y, x + xDistance, y + yDistance); 
        
      //increasing red and green=more yellow towards end
      red = red + intensity;
      green = green + intensity;
      x = x + xDistance;
      y = y + yDistance; 
    } 
    x = sx;
    y = sy;
    counter++;
  }
}
  
void draw(){
  
 // Draw the rocket on the ground, not moving if not launched
 if (launchstate == false) {
      drawRocket(300,600);
 }
  
  int newtime = millis();
  // if launched, and more than 10 milliseconds have passed, then draw the new rocket at the new position
  while (  (starty > 0) && (launchstate) && ((newtime - oldtime) >10 ) ) {
    drawBackground();
    drawRocket(startx,starty);
    drawFire(startx,starty);
    starty--;
    oldtime = newtime;
  }
  
  // if the rocket is off the screen, reset the position and launch state so it can go again
  if (starty < 1) {
      launchstate = false;
      starty = 600;
  }
}

void mousePressed()
{
 launchstate = true;
 oldtime = millis();

}



