class MyDriveSystem extends DriveSystem {
  int svr, svl;
  int rightSpeed, leftSpeed;
  int approach=0;
  int step;
  int oldLane;
  int lane = 2;
  float millis;
  int lineCount;
  
  float seconds = 8;

  MyDriveSystem(Car myCar) {
    super(myCar);
  }
  
   void drive() {
    svr=myCar.sensorValueRight;
    svl=myCar.sensorValueLeft;
    millis=millis()%(1000*seconds);
    
    if((millis() > 100) && (millis < 20) && (0 < lane))
    {
      oldLane = lane;
      lane = 0;
      lineCount = 0;
      println(" ");
      print("switching, ");
      print(3-oldLane);
    }
    
    if (noSense<=0) {    
      switch(lane)
      {
       case 0:
        if(oldLane == 1)
        {
          leftSpeed = 62;
          rightSpeed = 60;
          if(svl > 100 && lineCount == 0)
          {
            lineCount += 1;
          }
          if(svr > 100 && lineCount == 1)
          {
            lane = 2;
            lineCount = 0;
          }
        }
        else if(oldLane == 2)
        {
          leftSpeed = 60;
          rightSpeed = 57;
          if(svr > 100 && lineCount == 0)
          {
            lineCount += 1;
          }
          if(svl > 100 && lineCount == 1)
          {
            lane = 1;
            lineCount = 0;
          }
        }   
        break;
       
       case 1:
        if(svr > 100){
          leftSpeed = 35;
          rightSpeed = 75;
        }
        else if(svl > 100)
        {
          leftSpeed = 65;
          rightSpeed = 50;
        }
        else
        {
          leftSpeed = 60;
          rightSpeed = 57;
        }
        break;
     
       case 2:        
        if(svl > 100)
        {
          leftSpeed = 75;
          rightSpeed = 35;
        }
        else if(svr > 100){
          leftSpeed = 55;
          rightSpeed = 65;
        }
        else
        {
          leftSpeed = 60;
          rightSpeed = 61;
        }
        break;
        
      }
    }
  
    myCar.setLeftSpeed(leftSpeed);
    myCar.setRightSpeed(rightSpeed);
  }
}
