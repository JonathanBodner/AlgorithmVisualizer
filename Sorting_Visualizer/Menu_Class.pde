public class MenuBar{
  //This class controls the menu bar for the sorting visualizer GUI
  
  static final int homeState = 0;
  int state;
  int numStates;
  int stateWidth;
  float xPos = 0, yPos;
  int xWt = width, yHt;
  color grey = color(192), green = color(32,178,170);
  String[] algNames;
  PFont f = loadFont("ProcessingSansPro-Semibold-30.vlw");
  int maxFontSize = (int)(width/10);
  
  //creates and displays the menu bar
  public MenuBar(int headerHeight, int numAlgs, String[] algs){
    //assign variables
    this.state = homeState;
    this.yPos = headerHeight;
    this.yHt = headerHeight/2;
    this.numStates = numAlgs;
    this.algNames = algs;
    //width of one button on the header
    stateWidth = xWt/numStates;
    //background menu color
    fill(grey);
    rect(xPos,yPos,xWt,yHt);
    //draws menu boxes and selects default state (0)
    changeMenu(state);
    fill(white);
    textFont(f);
    textAlign(CENTER, CENTER);
    textSize(maxFontSize/3);
    //display titles of the menu
    for(int i = 0; i < numStates; i++){
      text(algs[i], xPos+(i*stateWidth)+stateWidth/2, headerHeight+yHt/2);
    }
  }
  
  //updates the current part of the menu that is selected
  public void changeMenu(int newState){
    //update current state
    this.state = newState;
    //variable for width of box borders
    int thickness = 2;
    strokeWeight(thickness);
    //draw borders around boxes, different color for the current state
    noFill();
    for(int i = 0; i <= numStates; i++){
      if((i == newState) && (i != -1)){
        //selected state color
        stroke(green);
      }else{
        //unselected state color
        stroke(black);
      } 
      //rectangular box that is hollow
      rect(xPos+((i)*stateWidth), yPos, stateWidth-thickness, yHt);
    }
    noStroke();
    //return to regular stroke wieght
    strokeWeight(1);
  }
  
  //returns an integer with the section of the menu that the mouse is over
  public int overTab(){
    //returns what tab of the menu is hovered over, and - 1 if nothing is hovered
    float x = mouseX;
    float y = mouseY;
    if((y >= yPos) && (y <= (yPos+yHt))){
      for(int i = 0; i < numStates; i++){
        if((x >= xPos + ((i)*stateWidth)) && (x <= (xPos + ((i+1)*stateWidth)))){
          return i;
        }
      }
    }
    return -1;
  }
  
  //grey out other algorithms so they cannot change while the sort is running.
  public void sortRunning(){
    
  }
  
  public int getState(){
    return this.state;
  }
}
