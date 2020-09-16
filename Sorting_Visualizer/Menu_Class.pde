public class MenuBar{
  static final int homeState = 0;
  int state;
  int numStates;
  int stateWidth;
  float xPos = 0, yPos;
  int xWt = width, yHt;
  color grey = color(192), green = color(32,178,170);
  
  public MenuBar(int headerHeight, int numAlgs){
    this.state = homeState;
    this.yPos = headerHeight;
    this.yHt = headerHeight/2;
    this.numStates = numAlgs;
    stateWidth = xWt/numStates;
    fill(grey);
    rect(xPos,yPos,xWt,yHt);
    changeMenu(0);
  }
  
  public void changeMenu(int newState){
    this.state = newState;
    strokeWeight(3);
    noFill();
    for(int i = 0; i < numStates; i++){
      if((i == newState) && (i != 0)){
        stroke(green);
      }else{
        stroke(0);
      } 
       rect(xPos+(i*stateWidth), yPos, stateWidth, yHt);
    }
    stroke(0);
    strokeWeight(1);
  }
}
