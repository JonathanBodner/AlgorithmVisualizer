//making a sorting visualizer for learning about sorting algorithms
int headerHeight;
int startButtonX, startButtonY, startButtonSize = 50;
int arrSize, sortDelay = 10;
int arrPosX, arrPosY, arrWidth, arrHeight;
int[] exArray = {80, 14, 56, 16, 22, 44, 92, 67, 8, 33};
color white = color(255), black = color(0), green = color(32,178,170);
color red = color(255,0,0), blue = color(0,0,255), yellow = color(255,255,0);
boolean controlHovered = false;
PFont f;
float barWidth;
LiveArray test;

void setup(){
  size(800, 800);
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

  //display array
  test = new LiveArray(20, 0, width/4, height/2, width/2, height/8);
   test.dispArray();
   // //TEMP VAR ASSIGNMENT UNTIL I GET USER INPUT
   // arrSize = 20;
   // arrPosX = width/4;
   // arrPosY = height/2;
   // arrWidth = width/2;
   // arrHeight=height/6;
    
   // float[] arr1 = new float[arrSize];
   // for(int i = 0; i < arrSize; i++){
   //   arr1[i] = int(random(1)*arrHeight);
   //   print(arr1[i] + "\n");
   // }
   //barWidth = (arrWidth / arrSize) - ((arrWidth / arrSize)/6);
   ////displpay array
   //strokeWeight(4);
   ////x axis
   //line(arrPosX, arrPosY, arrPosX+arrWidth, arrPosY);
   ////y axis
   //line(arrPosX, arrPosY, arrPosX, arrPosY-arrHeight);
   //strokeWeight(2);
   //fill(green);
   //for(int i = 0; i < arrSize; i++){
   //  rect(arrPosX+(i*(arrWidth/arrSize)), arrPosY, barWidth, arr1[i]*(-1));
   //}
}

void draw(){
   boolean selSortDone = false;
  delay(10);
  if(mousePressed){
    if(!selSortDone){
      selSortDone = runSelSort();
    }
  }
  
}

void startPressed(int x, int y){
  
}

boolean runSelSort(){ 
  boolean isSorted = false;
  isSorted  = test.incSelSort();
  return isSorted;
}
