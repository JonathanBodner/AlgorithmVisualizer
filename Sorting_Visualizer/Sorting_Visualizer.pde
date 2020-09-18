//making a sorting visualizer for learning and displaying sorting algorithms
//Jonathan Bodner, 2020

//variables
int headerHeight;
int startX, startY, resetX, resetY, buttonSize;
int arrSize, sortDelay = 0;
int arrPosX, arrPosY, arrWidth, arrHeight;
int bufferPixels = width/10;
color white = color(255), black = color(0), green = color(32,178,170);
color red = color(255,0,0), blue = color(0,0,255), yellow = color(255,255,0);
color grey = color(192), resetColor;
boolean startHover = false, resetHover = false;
boolean running = false, reset = false;
PFont f;
float barWidth;
LiveArray arr1;
MenuBar menu;

//////////////////////////////////////////////////////////////////////////////////////////////
//SETUP
void setup(){
  size(1000, 1000);
  background(255,255,255);
  noStroke();
  //FONT CREATION
  printArray(PFont.list());
  f = loadFont("ProcessingSansPro-Semibold-30.vlw");
  textFont(f);
  
  //HEADER CREATION
  headerHeight = height/10;
  startX = height/2 - height/10;
  startY = 2*width/10;
  resetX = height/2 + height/10;
  resetY = 2*width/10;
  buttonSize = width/15;
  
  //Header background
  fill(black);
  rect(0,0,width, headerHeight);
  //Header text - title and extra info
  fill(white);
  textSize(40);
  textAlign(CENTER, CENTER);
  text("Algorithm Visualizer", width/2, headerHeight/2);
  textAlign(RIGHT, CENTER);
  textSize(10);
  text("Jonathan Bodner\n2020", width - width/20, headerHeight/2);
  
  //MENU BAR SETUP - testing
  menu = new MenuBar(headerHeight,3);
  menu.changeMenu(2);
  
  //start and reset buttons
  fill(black);
  ellipse(startX, startY, buttonSize, buttonSize);
  ellipse(resetX, resetY, buttonSize, buttonSize);
  
  //display array - testing
  arrPosX = width/8;
  arrPosY = height/2 + height/4;
  arrWidth = 3*width/4;
  arrHeight = height/2;
  arr1 = new LiveArray(30, sortDelay, arrPosX, arrPosY, arrWidth, arrHeight);
  arr1.dispArray();
 
}

void draw(){
  update(mouseX, mouseY);
  //To be done - testing
  boolean selSortDone = false;
  //start button
  if(startHover){
     fill(grey);   
  }else{
    fill(black); 
  }
  ellipse(startX, startY, buttonSize, buttonSize);
  //reset button
  if(resetHover){
     resetColor = grey;   
  }else{
     resetColor = black;   
  }
  fill(resetColor);
  ellipse(resetX, resetY, buttonSize, buttonSize);
  fill(white);
  ellipse(resetX, resetY, buttonSize/2, buttonSize/2);
  fill(resetColor);  
  ellipse(resetX, resetY, buttonSize/3, buttonSize/3);
  arc(resetX, resetY, buttonSize, buttonSize, PI+(QUARTER_PI/2), PI + HALF_PI);
  delay(sortDelay);
  
  if(reset){
    running = false;
    //draw over old array
    fill(white);
    rect(arrPosX- bufferPixels, arrPosY+ bufferPixels, arrWidth + 2*bufferPixels, -arrHeight -2*bufferPixels);
    //new array
    arr1 = new LiveArray(20, sortDelay, arrPosX, arrPosY, arrWidth, arrHeight);
    arr1.dispArray();
  }
  if(running){
    if(!selSortDone){
      selSortDone = runSelSort();
      //draw pause button
      fill(white);
      rect(startX - (buttonSize/15), startY - (buttonSize/6), -buttonSize/8, buttonSize/3 );
      rect(startX + (buttonSize/15), startY - (buttonSize/6), buttonSize/8, buttonSize/3 );
    }
    if(selSortDone){
      running = false;
    }
  }else{
    //draw play button
    fill(white);
    triangle(startX - (buttonSize/6), startY - (buttonSize/6),startX+buttonSize/4 ,startY , startX - (buttonSize/6), startY + (buttonSize/6));
  }
  print(running);
  //print(selSortDone);
  reset = false;
}

void mousePressed(){
  if(startHover){
    running = !running;
  }
  if(resetHover){
    reset = true;
  }
}

void update(int x, int y) {
  if ( overStart(startX, startY, buttonSize)){
    startHover = true;
    resetHover = false;
  } else if(overReset(resetX, resetY, buttonSize)){
    startHover = false;
    resetHover = true;
  }else {
    startHover = resetHover = false;
  }
}

boolean overStart(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

boolean overReset(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

boolean runSelSort(){ 
  boolean isSorted = false;
  isSorted  = arr1.incSelSort();
  return isSorted;
}
