class Mover
{
  PVector[] history;
  int h_index;
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float mass;
  float lifespan;
  
  color bodyColor;
  
  Mover(PVector l)
  {
    location = l.copy();
    history = new PVector[15];
    for(int i = 0; i < history.length; i++)
    {
      history[i]= location.copy();
    }
    h_index = 0;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    
    mass = random(1, 5);
    lifespan = 255;
    
    bodyColor = color(random(128, 255), random(128, 255), random(128, 255));
  }
  
  void run()
  {
    update();
    display();
    checkEdge(0, width, 0, height);
  }
  
  void applyForce(PVector force)
  {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void update()
  {
    for(int i = history.length - 1; i > 0; i--)
    {
      history[i] = history[i - 1].copy();
    }
    history[0] = location;
    
    velocity.add(acceleration);
    location.add(velocity);
    
    velocity.mult(0.99);
    acceleration.mult(0);
  }
  
  void display()
  {
    stroke(bodyColor);
    strokeWeight(mass);
    noFill();
    
    line(location.x, location.y, history[0].x, history[0].y);
    for(int i = 0; i < history.length - 1; i++)
    {
      stroke(bodyColor, 255 - i * 30);
      line(history[i].x, history[i].y, history[i + 1].x, history[i + 1].y);
    }
  }
  
  void checkEdge(float x_min, float x_max, float y_min, float y_max)
  {
    if(location.x > x_max)
    {
      location.x = x_min;
          for(int i = 0; i < history.length; i++)
    {
      history[i]= location.copy();
    }
      // velocity.x *= -1;
    }else if(location.x < x_min)
    {
      location.x = x_max;
          for(int i = 0; i < history.length; i++)
    {
      history[i]= location.copy();
    }
      // velocity.x *= -1;
    }
    
    if(location.y > y_max)
    {
      location.y = y_min;
          for(int i = 0; i < history.length; i++)
    {
      history[i]= location.copy();
    }
      // velocity.y *= -1;
    }else if(location.y < y_min)
    {
      location.y = y_max;
          for(int i = 0; i < history.length; i++)
    {
      history[i]= location.copy();
    }
      // velocity.y *= -1;
    }
  } 
}