
Mover[] movers;
PVector preMousePosition;

void setup()
{
  size(1080, 1080);
  background(0);
  
  movers = new Mover[1024];
  for(int i = 0; i < movers.length; i++)
  {
    movers[i] = new Mover(new PVector(random(width), random(height)));
  }
  
  preMousePosition = new PVector(mouseX, mouseY);
}

void draw()
{
  background(0);
  for(Mover m : movers)
  {
    m.applyForce(new PVector(random(-4, 4), random(-4, 4)));
    m.run(); //<>// //<>//
  }
}

void mouseMoved()
{
  PVector MousePosition = new PVector(mouseX, mouseY);
  PVector MouseForce = PVector.sub(MousePosition, preMousePosition);
  MouseForce.normalize();
  
  for(Mover m : movers)
  {
    m.applyForce(MouseForce);
  }
  
  preMousePosition = MousePosition;
}