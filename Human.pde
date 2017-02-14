class Human {
  int life;
  float x, y, r, move;
  boolean hasLove;

  Human(float _x, float _y, boolean _hasLove) {
    x = _x;
    y = _y;
    life = 10;
    move = 1;  
    hasLove = _hasLove;
  }

  void move() {
    x += random(-move, move);
    y += random(-move, move);

    //Move to the opposite side
    if (x < 0) { x = width; }
    if (x > width) { x = 0; }
    if (y < 0) { y = height; }
    if (y > height) { y = 0;}
  }

  void draw() {
    r = life * 0.1;
    if (hasLove) {
       fill(255, 0, 0, 5);
       stroke(255, random(100, 255), random(0, 255));
    } else {
       fill(0, 0, 255, 5);
       stroke(random(0, 255), random(100, 255), 255);
    }
    ellipse(x, y, r * 2, r * 2 );
  }

  void love(Human somebody) {
    this.life += interaction;
    somebody.life += interaction;
  }

  void steal(Human somebody) {
    this.life += interaction;
    somebody.life -= (interaction * 2);
  }

  void checkContact() {
    for (int i = 0; i < people.length; i++) {
      Human somebody = people[i];
      //if somebody's life is 0, he can't interact.
      if (this == somebody || somebody.life <= 0 || this.life <= 0) {
        continue;
      }
      
      float dist = dist(x, y, somebody.x, somebody.y);
      if ((dist - this.r - somebody.r) < 0) {
        if (hasLove) { love(somebody);} 
        else {steal(somebody); }
      }
    } 
  }
}