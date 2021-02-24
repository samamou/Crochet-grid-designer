/*  Author: Sarah Al Mamoun
    Crochet Pattern Designer 
    When the user runs the code an empty grid can be found at the beginning
    Press 'p' on your keyboard to start designing your pattern 
    Press 'd' on your keyboard to delete a box entry to fix your mistake.
    Happy designing!
*/

Canvas c; 
boolean isColored = false; 
char button;
Box b; 

final int rows = 30; 
final int cols = 40; 
int rectSize = 20; 
boolean [][] Pink = new boolean [cols][rows]; 
//boolean [][] Red = new boolean [cols][rows]; 
boolean [][] Delete = new boolean [cols][rows];
boolean [][] fill = new boolean [cols][rows]; 

color colour;

void setup() {
  size(1000, 1000); 
  c = new Canvas(); 
  b = new Box();
  background(255, 250, 250);
}

void draw() {
  b.setColour(button);  
  PFont.list();
  c.createCanvas(height, width);  
  if (isColored) {
    c.dot(b.getColour(), mouseX, mouseY, height, width);
  }
}

public void keyPressed() {
  button = key; 
  isColored = true; 
}


public class Box { 
   //more colors could be set here 
   public void setColour(char c) {
     if (c == 'p'){
       colour = #ff4a6a;
   }   
   //   if (c == 'r'){
   //    colour = #ffff00;
   //}   
     else if (c == 'd'){ 
       colour = #ffffff;
     }          
  }
   public color getColour() {
     return colour; 
  }
}

public class Canvas 
{
  public void createCanvas(float h, float w) 
  {
    for (int i = 0; i < fill.length; i++) {
      for (int j = 0; j < fill[i].length; j++) {
        float x = w/9 +(i*rectSize);
        float y = h/9 +(j*rectSize);
        
        if((Pink[i][j])) {
          fill(#ff4a6a);
        }
        else if (Delete[i][j]) {
          fill(#ffffff);
        }
        else
        fill(255); 
        rect(x,y,rectSize,rectSize); //big rect
       }
     }
  }

  public void dot(color c, float mouseX, float mouseY, float h, float w){
     for (int i = 0; i < Pink.length; i++){
        for (int j = 0; j < Pink[i].length; j++){
            float x = w/9 +(i*rectSize);
            float y = h/9 +(j*rectSize);
            if( (mouseX > x && mouseX < x + rectSize && mouseY > y && mouseY < y + rectSize && mousePressed && c == #ff4a6a)) {
                  Pink[i][j] = true;
                  Delete[i][j] = false;
                } 
            //        if( (mouseX > x && mouseX < x + rectSize && mouseY > y && mouseY < y + rectSize && mousePressed && c == #ff4a6a)) {
            //  Red[i][j] = true;
            //  Delete[i][j] = false;
            //} 
            else if( (mouseX > x && mouseX < x + rectSize && mouseY > y && mouseY < y + rectSize && mousePressed && c == #ffffff)){
                  Pink[i][j] = false;
                  Delete[i][j] = true;
            } 
        }  
     }
   } 
}
