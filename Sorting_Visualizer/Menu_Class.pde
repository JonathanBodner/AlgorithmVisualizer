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
    //display titles of the menu
    for(int i = 0; i < numStates; i++){
      fill(white);
      textSize(20);
      textFont(f);
      textAlign(CENTER, CENTER);
      text(algs[i], xPos+(i*stateWidth)+stateWidth/2, headerHeight+yHt/2);
    }
  }
  
  public void changeMenu(int newState){
    //update current state
    this.state = newState;
    //variable for width of box borders
    int thickness = 2;
    strokeWeight(thickness);
    //draw borders around boxes, different color for the current state
    noFill();
    for(int i = 0; i <= numStates; i++){
      if((i == newState) && (i != 0)){
        //selected state color
        stroke(green);
      }else{
        //unselected state color
        stroke(0);
      } 
      //rectangular box that is hollow
      rect(xPos+((i-1)*stateWidth), yPos, stateWidth-thickness, yHt);
    }
    noStroke();
    //return to regular stroke wieght
    strokeWeight(1);
  }
  
  public int overTab(){
    //returns what tab of the menu is hovered over, and 0 if nothing is hovered
    float x = mouseX;
    float y = mouseY;
    if((y >= yPos) && (y <= (yPos+yHt))){
      for(int i = 1; i <= numStates; i++){
        if((x >= xPos + ((i-1)*stateWidth)) && (x <= (xPos + (i*stateWidth)))){
          return i;
        }
      }
    }
    return 0;
  }
}
