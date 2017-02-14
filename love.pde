Human[] people = new Human[100];
float width = 1200;
float height = 700;
int interaction = 1;
float lovePeopleRate = 0.5;

void setup() {
  size(1200, 700);
  background(0);
  frameRate(30);
  
  for (int i = 0; i < people.length; i++) {
    if (i < people.length * lovePeopleRate) {
      people[i] = new Human(random(0, width), random(0, height), true);
    } else {
      people[i] = new Human(random(0, width), random(0, height), false);
    }
  }
}

void draw() {
  darkenScreen();
  for (int i = 0; i < people.length; i++) {
    people[i].move();
    people[i].checkContact();
    people[i].draw();
  }
  //uncomment to record
//  saveFrame(filename + "/######.tif");
}

void darkenScreen() {
  fill(0, 50);
  noStroke();
  rect(0, 0, width, height);
}