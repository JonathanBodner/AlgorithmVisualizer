public class LiveArray{
  int size;
  int del;
  float xPos, yPos;
  float xWt, yHt; 
  int bufferPixels;
  float[] array;
  float barWidth;
  
  //Selection sort variables
  int a, b, minPos;
  float minVal;
  
  //bubble sort variables
  int sortSize, sortIndex;
  
  //Creates a new array object
  public LiveArray(int chosenSize, int delay, float xPosition, float yPosition, float xWidth, float yHeight){
    this.size = chosenSize;
    this.del = delay;
    this.xPos= xPosition; 
    this.yPos = yPosition;
    this.xWt = xWidth;
    this.yHt = yHeight;
    //make new array with given size 
    this.array = new float[size];
    //assign a random value to each value in the array
    for(int i = 0; i < size; i++){
      this.array[i] = int(random(1)*this.yHt);
    }
    //determine the width of each bar based on the array size
   this.barWidth = (xWt / size) - ((xWt / size)/6);
   //buffer pixels prevent strange 1px wide bars appearing
   this.bufferPixels = (int)(xWt/(size*8));
   //print(bufferPixels);
   this.sortSize = size;
  }
  
  //Displays the current array as is 
  public void dispArray(){
    //draws both axis of the array in black
    stroke(black);
    strokeWeight(4);
    //x axis
    line(xPos-(4*bufferPixels), yPos+2, xPos+xWt+(bufferPixels*4), yPos+2);
    //y axis
    line(xPos-(4*bufferPixels), yPos+2, xPos-(4*bufferPixels), yPos-yHt);
    //reset stroke variables
    noStroke();
    strokeWeight(1);
    //draws each bar of the array as rectangles in the specified color 
    fill(green);
    for(int i = 0; i < size; i++){
      rect(xPos+(i*(xWt/size)), yPos, barWidth, array[i]*(-1));
    }
  }
  
  //swaps two values of the array given their index
  public void swapArr(int indexA, int indexB){
    float temp = array[indexA];
    array[indexA] = array[indexB];
    array[indexB] = temp;
    //maybe draw rectangles here instead??? TBD
  }
  
  //draw rectangle
  public void drawRect(color col, float xPos, float yHt, float rectWidth, float rectHeight){
    fill(col);
    rect(xPos, yHt, rectWidth, rectHeight);
  }
  
  //performs one step in the selection sort algorithm based on the current position 
  //variable a is the starting index of the unsorted component of the array
  //variable b increments from a to the end of the array and looks for the minimum value
  //after b has reached the end, the min is swapped with the value at a, and then a is incremented
  public boolean selectionSort(){
    boolean sorted = false;
    delay(this.del);
    //while a=0
    if((a==0)){
      //starting case, set min and increment b
      if(b==0){
        minVal = array[a];
        minPos = a;
        //drawRect(red, xPos+(a*(xWt/size)) 
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
        rect(xPos+((a)*(xWt/size)) - bufferPixels, yPos, barWidth+(2*bufferPixels), yHt*(-1));
        rect(xPos+((minPos)*(xWt/size)), yPos, barWidth+bufferPixels, yHt*(-1));
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
        rect(xPos+((a)*(xWt/size))- bufferPixels, yPos, barWidth+(2*bufferPixels), yHt*(-1));
        rect(xPos+((minPos)*(xWt/size))- bufferPixels, yPos, barWidth+(2*bufferPixels), yHt*(-1));
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
      sorted = true;
    }
    return sorted;
  }
  
  public boolean bubbleSort(){
    boolean sorted = false;
    delay(this.del);
    //Sort size starts at the size of the array, and decreases by one every time the index reaches the end
    //The index increments by 1 every iteration, if the value at the index is larger than the value at index+1, they are swapped
    //This eventually will bring the largest value to the end of the array, then 
    if(sortSize != 1){
        if(array[sortIndex] > array[sortIndex + 1]){
          //swap the thingys
          //white rectangles to clear
          drawRect(white,xPos+((sortIndex)*(xWt/size))- bufferPixels, yPos, barWidth+(2*bufferPixels), yHt*(-1));
          drawRect(white,xPos+((sortIndex+1)*(xWt/size))- bufferPixels, yPos, barWidth+(2*bufferPixels), yHt*(-1));
          //swap the mins
          swapArr(sortIndex, sortIndex+1);
          //draw swapped values
          drawRect(green, xPos+(sortIndex*(xWt/size)), yPos, barWidth, array[sortIndex]*(-1));
          drawRect(green, xPos+((sortIndex+1)*(xWt/size)), yPos, barWidth, array[sortIndex+1]*(-1));
        }
        //increment index
        sortIndex++;
        //
        if(sortIndex+1 == sortSize){
           drawRect(black, xPos+((sortSize-1)*(xWt/size)), yPos, barWidth, array[sortSize-1]*(-1));
           sortSize--;
           sortIndex = 0;
        }
    }else{
      drawRect(black, xPos+((sortSize-1)*(xWt/size)), yPos, barWidth, array[sortSize-1]*(-1));
      sorted = true;
    }
    return sorted;    
  }
  
  
 
  
  //To be deleted? unless we want a fast forward option
  public void instSelectionSort(){
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
}
