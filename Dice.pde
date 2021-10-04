Die die;
int total = 0;
boolean keepgoing = false;
boolean tempgoing = true;

//ways to color?
//set color based on value rolled
//row/col shift, reverse direction?
//randomized

color row1 = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
color row2 = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
color row3 = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
color row4 = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
color row5 = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
color row6 = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
color row7 = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
color row8 = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
color row9 = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
color row10 = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
color row11 = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
color row12 = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
color row13 = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
color row14 = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
color row15 = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
color row16 = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
color row17 = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
color row18 = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
color row19 = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
color row20 = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));

int ones = 0, twos = 0, threes = 0, fours = 0, fives = 0, sixes = 0;
int rolls = 0;
double average;

boolean rowcol = false;
int xpos;
int ypos;

color currentrow;

void setup()
{
  size(495, 555);
}
void draw()
{
  if (keepgoing || tempgoing){
    tempgoing = false;
    row1 = row2;
    row2 = row3;
    row3 = row4;
    row4 = row5;
    row5 = row6;
    row6 = row7;
    row7 = row8;
    row8 = row9;
    row9 = row10;
    row10 = row11;
    row11 = row12;
    row12 = row13;
    row13 = row14;
    row14 = row15;
    row15 = row16;
    row16 = row17;
    row17 = row18;
    row18 = row19;
    row19 = row20;
    row20 = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    background(50);
    
    for (int i = 10; i < 500; i += 25){
      switch (i) {
        case 10: currentrow = row1; break;
        case 35: currentrow = row2; break;
        case 60: currentrow = row3; break;
        case 85: currentrow = row4; break;
        case 110: currentrow = row5; break;
        case 135: currentrow = row6; break;
        case 160: currentrow = row7; break;
        case 185: currentrow = row8; break;
        case 210: currentrow = row9; break;
        case 235: currentrow = row10; break;
        case 260: currentrow = row11; break;
        case 285: currentrow = row12; break;
        case 310: currentrow = row13; break;
        case 335: currentrow = row14; break;
        case 360: currentrow = row15; break;
        case 395: currentrow = row16; break;
        case 410: currentrow = row17; break;
        case 435: currentrow = row18; break;
        case 460: currentrow = row19; break;
        case 485: currentrow = row20;
      }
      for (int j = 10; j < 500; j += 25){
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
        
        die.show();
      }
    }
    fill(255);
    average = (double)total / (double)rolls;
    text("Total: " + total, 10, 510);
    text("Rolls: " + rolls, 10, 530);
    text("Avg: " + average, 10, 550);
    text("Ones: " + ones, 200, 510);
    text("Twos: " + twos, 200, 530);
    text("Threes: " + threes, 200, 550);
    text("Fours: " + fours, 350, 510);
    text("Fives: " + fives, 350, 530);
    text("Sixes: " + sixes, 350, 550);
  }
}
void mousePressed()
{
  if (mouseButton == CENTER) {
    keepgoing = !keepgoing;
  } else if (mouseButton == RIGHT) {
    rowcol = !rowcol;
  }
  
  tempgoing = true;
  redraw();
}
class Die //models one single dice cube
{
  //variable declarations here
  int value, pos_x, pos_y;
  color dicecolor;
  Die(int x, int y,  color coloring) //constructor
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
