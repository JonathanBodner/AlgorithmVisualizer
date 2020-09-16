public class LiveArray{
  int size;
  int del;
  float xPos, yPos;
  int xWt, yHt;
  int a, b, minPos;
  float minVal;
  float[] array;
  float barWidth;
  
  public LiveArray(int chosenSize, int delay, int xPosition, int yPosition, int xWidth, int yHeight){
    size = chosenSize;
    del = delay;
    xPos= xPosition; 
    yPos = yPosition;
    xWt = xWidth;
    yHt = yHeight;
    //make new array with random values for each element
    array = new float[size];
    for(int i = 0; i < size; i++){
      array[i] = int(random(1)*yHt);
    }
   barWidth = (xWidth / (size)) - ((xWidth / size)/6);
   //- (9*(xWidth / (size))/10
  }
  
  public void dispArray(){
    stroke(0);
    strokeWeight(4);
    //x axis
    line(xPos-4, yPos+2, xPos+xWt, yPos+2);
    //y axis
    line(xPos-4, yPos+2, xPos-4, yPos-yHt);
    noStroke();
    strokeWeight(2);
    fill(green);
    for(int i = 0; i < size; i++){
      rect(xPos+(i*(xWt/size)), yPos, barWidth, array[i]*(-1));
    }
  }
  
  public void swapArr(int indexA, int indexB){
    float temp = array[indexA];
    array[indexA] = array[indexB];
    array[indexB] = temp;
  }
  
  public void selectionSort(){
    float minVal, minLoc;
    for(int i = 0; i< size; i++){
      minVal = array[i];
      minLoc = i;
      //highlight min in red
      fill(red);
      rect(xPos+(i*(xWt/size)), yPos, barWidth, array[i]*(-1));
      delay(50);
      //go throught sub array, highlight active element in blue
      for(int j = (i+1); j < size; j++){
       // delay(50);
        fill(blue);
        rect(xPos+(j*(xWt/size)), yPos, barWidth, array[j]*(-1));
        if(j > 1){
          fill(green);
          rect(xPos+(j*(xWt/size)), yPos, barWidth, array[j]*(-1));
        }
        if(array[j]<array[i]){
          fill(green);
          rect(xPos+(j*(xWt/size)), yPos, barWidth, array[j]*(-1));
          minVal = array[j];
          //fill(yellow);
          //rect(xPos+(j*(xWt/size)), yPos, barWidth, array[j]*(-1));
          //swapArr(i, j);
          //fill(green);
          //rect(xPos+(i*(xWt/size)), yPos, barWidth, array[i]*(-1));
          //rect(xPos+(j*(xWt/size)), yPos, barWidth, array[j]*(-1));
        }
      }
    }
    //return sorted;
  }
  public boolean incSelSort(){
    boolean sorted = false;
    
    /*************************************************************************************/
    //if a = 0, do this to the array
    /*************************************************************************************/
    if((a==0)){
      //starting case, set min and increment b
      if(b==0){
        minVal = array[a];
        minPos = a;
        fill(red);
        rect(xPos+(a*(xWt/size)), yPos, barWidth, array[a]*(-1));
        b++;
      }
      //end case, b is at end
      else if(b == (size-1)){
        if((b-1) != minPos){
            fill(green);
            rect(xPos+((b-1)*(xWt/size)), yPos, barWidth, array[b-1]*(-1));
          }
        fill(blue);
        rect(xPos+(b*(xWt/size)), yPos, barWidth, array[b-1]*(-1));
        if(array[b] < minVal){
          fill(green);
          rect(xPos+(minPos*(xWt/size)), yPos, barWidth, array[minPos]*(-1));
          minPos = b;
          minVal = array[b];
          fill(red);
          rect(xPos+(minPos*(xWt/size)), yPos, barWidth, array[minPos]*(-1));
        }
        fill(yellow);
        rect(xPos+((a)*(xWt/size)), yPos, barWidth, array[a]*(-1));
        rect(xPos+((minPos)*(xWt/size)), yPos, barWidth, array[minPos]*(-1));
        swapArr(a, minPos);
        //make the swap look good by drawing over old rects in the positions
        fill(white);
        noStroke();
        rect(xPos+((a)*(xWt/size)), yPos, barWidth, yHt*(-1));
        rect(xPos+((minPos)*(xWt/size)), yPos, barWidth, yHt*(-1));
        fill(green);
        rect(xPos+(b*(xWt/size)), yPos, barWidth, array[b-1]*(-1));
        rect(xPos+((minPos)*(xWt/size)), yPos, barWidth, array[minPos]*(-1));
        rect(xPos+((size-1)*(xWt/size)), yPos, barWidth, array[size-1]*(-1));
        fill(black);
        rect(xPos+((a)*(xWt/size)), yPos, barWidth, array[a]*(-1));
        a++;
        b=a;
      }else{
        if(b != 1){
          if((b-1) != minPos){
            fill(green);
            rect(xPos+((b-1)*(xWt/size)), yPos, barWidth, array[b-1]*(-1));
          }
        }
        fill(blue);
        rect(xPos+(b*(xWt/size)), yPos, barWidth, array[b]*(-1));
        if(array[b] < minVal){
          fill(green);
          rect(xPos+(minPos*(xWt/size)), yPos, barWidth, array[minPos]*(-1));
          minPos = b;
          minVal = array[b];
          fill(red);
          rect(xPos+(minPos*(xWt/size)), yPos, barWidth, array[minPos]*(-1));
        }
        b++;
      }
     /*************************************************************************************/
     //a is not at the final size
     /*************************************************************************************/
    }else if(a < (size-1)){
      if(b==a){
        minVal = array[a];
        minPos = a;
        fill(red);
        rect(xPos+(a*(xWt/size)), yPos, barWidth, array[a]*(-1));
        b++;
      }//end case, b is at end
      else if(b == (size-1)){
        if((b-1) != minPos){
            fill(green);
            rect(xPos+((b-1)*(xWt/size)), yPos, barWidth, array[b-1]*(-1));
          }
        fill(blue);
        rect(xPos+(b*(xWt/size)), yPos, barWidth, array[b]*(-1));
        if(array[b] < minVal){
          fill(green);
          rect(xPos+(minPos*(xWt/size)), yPos, barWidth, array[minPos]*(-1));
          minPos = b;
          minVal = array[b];
          fill(red);
          rect(xPos+(minPos*(xWt/size)), yPos, barWidth, array[minPos]*(-1));
        }
        fill(yellow);
        rect(xPos+((a)*(xWt/size)), yPos, barWidth, array[a]*(-1));
        rect(xPos+((minPos)*(xWt/size)), yPos, barWidth, array[minPos]*(-1));
        swapArr(a, minPos);
        //make the swap look good by drawing over old rects in the positions
        fill(white);
        noStroke();
        rect(xPos+((a)*(xWt/size)), yPos, barWidth, yHt*(-1));
        rect(xPos+((minPos)*(xWt/size)), yPos, barWidth, yHt*(-1));
        fill(green);
        rect(xPos+((minPos)*(xWt/size)), yPos, barWidth, array[minPos]*(-1));
        rect(xPos+((size-1)*(xWt/size)), yPos, barWidth, array[size-1]*(-1));
        fill(black);
        rect(xPos+((a)*(xWt/size)), yPos, barWidth, array[a]*(-1));
        a++;
        b=a;
      }else{
        if(b != 1){
          if((b-1) != minPos){
            fill(green);
            rect(xPos+((b-1)*(xWt/size)), yPos, barWidth, array[b-1]*(-1));
          }
        }
        fill(blue);
        rect(xPos+(b*(xWt/size)), yPos, barWidth, array[b]*(-1));
        if(array[b] < minVal){
          fill(green);
          rect(xPos+(minPos*(xWt/size)), yPos, barWidth, array[minPos]*(-1));
          minPos = b;
          minVal = array[b];
          fill(red);
          rect(xPos+(minPos*(xWt/size)), yPos, barWidth, array[minPos]*(-1));
        }
        b++;
      }
    }else if(a == (size-1)){
      fill(black);
      rect(xPos+(a*(xWt/size)), yPos, barWidth, array[a]*(-1));
    }
    return sorted;
  }
  public void bubbleSort(){
      for(int i = 0; i< size; i++){
        //array
        if(array[i] > array[i+1]){
          
        }
      }
  }
    
}
