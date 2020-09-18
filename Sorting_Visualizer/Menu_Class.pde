public class MenuBar{
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
    this.state = homeState;
    this.yPos = headerHeight;
    this.yHt = headerHeight/2;
    this.numStates = numAlgs;
    this.algNames = algs;
    stateWidth = xWt/numStates;
    fill(grey);
    rect(xPos,yPos,xWt,yHt);
    changeMenu(0);
    for(int i = 0; i < numStates; i++){
      fill(white);
      textSize(20);
      textFont(f);
      textAlign(CENTER, CENTER);
      text(algs[i], xPos+(i*stateWidth)+stateWidth/2, headerHeight+yHt/2);
    }
  }
  
  public void changeMenu(int newState){
    this.state = newState;
    int thickness = 2;
    strokeWeight(thickness);
    noFill();
    for(int i = 0; i <= numStates; i++){
      if((i == newState) && (i != 0)){
        stroke(green);
      }else{
        stroke(0);
      } 
       rect(xPos+((i-1)*stateWidth), yPos, stateWidth-thickness, yHt);
    }
    noStroke();
    strokeWeight(1);
  }
  
  public int overTab(){
    //returns what tab of the menu is hovered over, and 0 if nothing is hovered
    int section = 0;
    float x = mouseX;
    float y = mouseY;
    if((y >= yPos) && (y <= (yPos+yHt))){
      for(int i = 1; i <= numStates; i++){
        if((x >= xPos + ((i-1)*stateWidth)) && (x <= (xPos + (i*stateWidth)))){
          return i;
        }
      }
    }
    return section;
  }
}
