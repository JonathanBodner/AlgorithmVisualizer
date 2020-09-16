//making a sorting visualizer for learning about sorting algorithms
//Jonathan Bodner, 2020

//variables
int headerHeight;
int startButtonX, startButtonY, startButtonSize = 50;
int arrSize, sortDelay = 10;
int arrPosX, arrPosY, arrWidth, arrHeight;
//int[] exArray = {80, 14, 56, 16, 22, 44, 92, 67, 8, 33};
color white = color(255), black = color(0), green = color(32,178,170);
color red = color(255,0,0), blue = color(0,0,255), yellow = color(255,255,0);
boolean controlHovered = false;
PFont f;
float barWidth;
LiveArray arr1;
MenuBar menu;

void setup(){
  size(1000, 1000);
  background(255,255,255);
  noStroke();
  
  //HEADER CREATION
  headerHeight = height/10;
  startButtonX = height/2;
  startButtonY = width/2;
  fill(black);
  rect(0,0,width, headerHeight);
  
  //Create font
  fill(white);
  printArray(PFont.list());
  f = loadFont("ProcessingSansPro-Semibold-30.vlw");
  textFont(f);
  textSize(40);
  textAlign(CENTER, CENTER);
  text("Algorithm Visualizer", width/2, headerHeight/2);
  textAlign(RIGHT, CENTER);
  textSize(10);
  text("Jonathan Bodner\n2020", width - width/20, headerHeight/2);
  //menu bar setup 
  menu = new MenuBar(headerHeight,3);
  menu.changeMenu(2);
  
  //display array
  arr1 = new LiveArray(50, sortDelay, width/8, height/2, 3*width/4, height/4);
  arr1.dispArray();
 
}

void draw(){
  boolean selSortDone = false;
  delay(sortDelay);
  if(mousePressed){
    if(!selSortDone){
      selSortDone = runSelSort();
    }
  }
}

void menuBar(){
}

void startPressed(int x, int y){
  
}

boolean runSelSort(){ 
  boolean isSorted = false;
  isSorted  = arr1.incSelSort();
  return isSorted;
}
