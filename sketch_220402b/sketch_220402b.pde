import processing.serial.*;
//float sensorVal1=0;
//float sensorVal2=0;
//float sensorVal3=0;
//float sensorVal4=0;
Serial myPort;  // Create object from Serial class
//String val;     // Data received from the serial port
int numFrames = 12;  // The number of frames in the animation
int currentFrame = 0;
PImage[] images = new PImage[numFrames];
//int num=5;
String[] curr_flowers={"0"};
String[] prev_flowers={"0"};
int[] posx={300};
int[] posy={300};
void setup()
{
  String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, "COM6", 9600);
  myPort.bufferUntil('\n');
  size(500,500);
  frameRate(24);
  background(0);
  
  //load the flowers in setup
}
void draw(){
  if ( myPort.available() > 0) {  
    //readString();
    for(int y=0;y<curr_flowers.length;y++){
      print(curr_flowers[y]);
     if(!curr_flowers[y].equals(prev_flowers[y])){
       if(curr_flowers[y].equals("1")){
         flower1();
         drawflower();
       }
       //else if(curr_flowers[y].equals("2")){
       //  flower2();
       //  drawflower();
       //}
       if(currentFrame==11){
         prev_flowers[0]=curr_flowers[0];
         //prev_flowers[1]=curr_flowers[1];
         //print("dogs");
         print(prev_flowers[y]);
       }
       
     }else{
       print("no flower pressed");
     }
   }
}
}
void serialEvent(Serial myPort){
    String inString = myPort.readStringUntil('\n');

    if (inString != null) {

      // trim off any whitespace:

      inString = trim(inString);
       float values = float(inString);
      // split the string on the commas and convert the resulting substrings into an float array:

      //float[] values = float(split(inString, ","));

      // if the array has at least three elements, you know you got the whole

      // thing.  Put the numbers in the color variables:
      
      println(values);
 
      
      //for (int j=0;j<values.length;j++){
        if(values>0){
          curr_flowers[0]="1";
        }
        //else if(values[j]>20){
        //  curr_flowers[j]="2";
        //}
        else{
          curr_flowers[0]="0";
        }
      //}
    
    }

  }
void flower1()
{
  images[0]  = loadImage("frame_01_delay-1s.gif");
  images[1]  = loadImage("frame_02_delay-1s.gif"); 
  images[2]  = loadImage("frame_03_delay-1s.gif");
  images[3]  = loadImage("frame_04_delay-1s.gif"); 
  images[4]  = loadImage("frame_05_delay-1s.gif");
  images[5]  = loadImage("frame_06_delay-1s.gif"); 
  images[6]  = loadImage("frame_07_delay-1s.gif");
  images[7]  = loadImage("frame_08_delay-1s.gif"); 
  images[8]  = loadImage("frame_09_delay-1s.gif");
  images[9]  = loadImage("frame_10_delay-1s.gif"); 
  images[10] = loadImage("frame_11_delay-1s.gif");
  images[11] = loadImage("frame_12_delay-1s.gif"); 
  
}
//void flower2()
//{
//  images[0]  = loadImage("frame_01_delay-1s.gif");
//  images[1]  = loadImage("frame_02_delay-1s.gif"); 
//  images[2]  = loadImage("frame_03_delay-1s.gif");
//  images[3]  = loadImage("frame_04_delay-1s.gif"); 
//  images[4]  = loadImage("frame_05_delay-1s.gif");
//  images[5]  = loadImage("frame_06_delay-1s.gif"); 
//  images[6]  = loadImage("frame_07_delay-1s.gif");
//  images[7]  = loadImage("frame_08_delay-1s.gif"); 
//  images[8]  = loadImage("frame_09_delay-1s.gif");
//  images[9]  = loadImage("frame_10_delay-1s.gif"); 
//  images[10] = loadImage("frame_11_delay-1s.gif");
//  images[11] = loadImage("frame_12_delay-1s.gif"); 
  
//}
void drawflower(){
  currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
  for (int x = -100; x < width; x += images[0].width) { 
       background(0);
       for(int i=0;i<curr_flowers.length;i++){
         if (curr_flowers[i].equals("1")){
                image(images[(currentFrame) % numFrames],posx[i], posy[i]);
              }
            }
          }
}
