public class Ball {
  
  float x, y, dx, dy;
  float radius;
  boolean inAir;

  Ball(float radius) {
    this.radius = radius;
    x = width/2;
    y = height/5;
    dx = 0;
    dy = 0;
  }
  
  boolean inGoal() {
    return ((x < (float)width/20 + (float)width/200 - radius/2 || x > 19 * (float)width/20 - (float)width/200 + radius/2)
         && y > 9 * height/25 + radius);
  }
  
  void display() {
    x += dx;
    y += dy;
    fill(127);
    ellipse(x, y, radius * 2, radius * 2);
  }
  
}
