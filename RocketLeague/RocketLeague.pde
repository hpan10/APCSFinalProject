void setup() {
  Car p1 = new Car(100,300,0);
  Car p2 = new Car(800,300,180);
  Ball b1 = new Ball(50);
}

void draw() {
  
}

void background() {
  
}

void reset() {
  
}

void move() {
  while (b1.y > 300) {
    b1.decrementy();
  }
  while (p1.y > 300) {
    p1.decrementy();
  }
  while (p2.y > 300) {
    p2.decrementy();
  }
}

void keyPressed() {
  
}

void tick() {
  
}
