Die die;
int total = 0;
boolean keepgoing = false;
boolean tempgoing = true;

//ways to color?
//set color based on value rolled
//row/col shift
//randomized

//add support for various screen sizes
//fix duplicate color/row bug at final rows/cols
//fix margins
int sizing = (int)(Math.random()*600)+301;
int reps = sizing/25;
int margin = (sizing-reps*25)/2;


//scale size to screensize?
color[] rowcolors = new color[reps];

int ones = 0, twos = 0, threes = 0, fours = 0, fives = 0, sixes = 0;
int rolls = 0;
double average;

boolean rowcol = false;
int xpos;
int ypos;

color currentrow;

void settings() {
  size(sizing, sizing+60);
}

void setup()
{
  System.out.println(margin);
  for (int i = 0; i < rowcolors.length; i++)
    rowcolors[i] = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  if (margin < 5)
    margin = 10;
}
void draw()
{
  if (keepgoing || tempgoing) {
    tempgoing = false;

    for (int i = 1; i < rowcolors.length; i++) {
      rowcolors[i-1] = rowcolors[i];
    }
    rowcolors[rowcolors.length-1] = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    background(50);

    for (int i = margin; i < sizing; i += 25) {
      currentrow = rowcolors[(i-10)/25];
      for (int j = margin; j < sizing; j += 25) {
        if (rowcol) {
          xpos = i;
          ypos = j;
        } else {
          xpos = j;
          ypos = i;
        }
        Die die = new Die(xpos, ypos, currentrow);
        die.roll();
        total += die.value;
        die.show();
        
        rolls += 1;
        if (die.value == 1)
          ones += 1;
        else if (die.value == 2)
          twos += 1;
        else if (die.value == 3)
          threes += 1;
        else if (die.value == 4)
          fours += 1;
        else if (die.value == 5)
          fives += 1;
        else
          sixes += 1;
      }
    }
    fill(255);
    average = (double)total / (double)rolls;
    text("Total: " + total, 10, sizing+10);
    text("Rolls: " + rolls, 10, sizing+30);
    text("Avg: " + average, 10, sizing+50);
    text("Ones: " + ones, 200, sizing+10);
    text("Twos: " + twos, 200, sizing+30);
    text("Threes: " + threes, 200, sizing+50);
    text("Fours: " + fours, 350, sizing+10);
    text("Fives: " + fives, 350, sizing+30);
    text("Sixes: " + sixes, 350, sizing+50);
  }
}
void mousePressed()
{
  if (mouseButton == CENTER) {
    keepgoing = !keepgoing;
  } else if (mouseButton == RIGHT) {
    rowcol = !rowcol;
  }
  //reverse direction?

  tempgoing = true;
  redraw();
}
class Die //models one single dice cube
{
  //variable declarations here
  int value, pos_x, pos_y;
  color dicecolor;
  Die(int x, int y, color coloring) //constructor
  {
    //variable initializations here
    pos_x = x;
    pos_y = y;
    dicecolor = coloring;
    roll();
  }
  void roll()
  {
    //your code here
    value = (int)(Math.random()*6)+1;
  }
  void show()
  {
    //your code here
    //background(fill);
    fill(dicecolor);
    rect(pos_x-10, pos_y-10, 20, 20, 4);

    fill(255);
    if (value == 1) {
      ellipse(pos_x, pos_y, 3, 3);
    } else if (value == 2) {
      ellipse(pos_x+3, pos_y+3, 3, 3);
      ellipse(pos_x-3, pos_y-3, 3, 3);
    } else if (value == 3) {
      ellipse(pos_x-3, pos_y-3, 3, 3);
      ellipse(pos_x, pos_y, 3, 3);
      ellipse(pos_x+3, pos_y+3, 3, 3);
    } else if (value == 4) {
      ellipse(pos_x-3, pos_y-3, 3, 3);
      ellipse(pos_x-3, pos_y+3, 3, 3);
      ellipse(pos_x+3, pos_y-3, 3, 3);
      ellipse(pos_x+3, pos_y+3, 3, 3);
    } else if (value == 5) {
      ellipse(pos_x-3, pos_y-3, 3, 3);
      ellipse(pos_x-3, pos_y+3, 3, 3);
      ellipse(pos_x+3, pos_y-3, 3, 3);
      ellipse(pos_x+3, pos_y+3, 3, 3);
      ellipse(pos_x, pos_y, 3, 3);
    } else {
      ellipse(pos_x-3, pos_y-3, 3, 3);
      ellipse(pos_x-3, pos_y, 3, 3);
      ellipse(pos_x-3, pos_y+3, 3, 3);
      ellipse(pos_x+3, pos_y-3, 3, 3);
      ellipse(pos_x+3, pos_y, 3, 3);
      ellipse(pos_x+3, pos_y+3, 3, 3);
    }
  }
}
