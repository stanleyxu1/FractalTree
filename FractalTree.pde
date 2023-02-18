private double fractionLength = .8;
public int smallestBranch = 15;
private double branchAngle = .5;
public int len = 100;
public int x = 320;
public int y = 380;



public void setup()
{

  size(640, 480);
  noLoop();
}


public void keyPressed() {
  if (key == 's')
    len-=10;
  redraw();
  if (len<=0)
    len=0;

  if (key == 'w')
    len+=10;
  redraw();
  if (len>=150)
    len = 150;
}


public void mouseDragged() {
  redraw();
}


public void draw()
{

  background(#758BA5);
  stroke(#522E2E);
  strokeWeight(4);
  line(320, 480, 320, 380);
  drawBranches(x, y, len, 3*Math.PI/2);
}
public void drawBranches(int x, int y, double branchLength, double angle)
{
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  branchLength = branchLength * fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x + (int)(Math.random()*3+4));
  int endY1 = (int)(branchLength*Math.sin(angle1) + y );
  int endX2 = (int)(branchLength*Math.cos(angle2) + x );
  int endY2 = (int)(branchLength*Math.sin(angle2) + y+ (int)(Math.random()*3+3));


  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);


  if (branchLength > smallestBranch) {
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
    
      if (Math.random() <= .9) {
      int random = (int)(Math.random()*5+8);
      ellipse(endX1, endY1, random, random);
      fill(#E3ACDD);
    }

  
  }
}
