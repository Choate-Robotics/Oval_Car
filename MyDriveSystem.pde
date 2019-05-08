class MyDriveSystem extends DriveSystem {
  int svr, svl;
  int rightSpeed, leftSpeed;
  int approach=0;
  int step;
  int cartime;
  

  MyDriveSystem(Car myCar) {
    super(myCar);
    noSense=0;
    cartime = millis();
  }
  
  
  void drive() {

    svr=myCar.sensorValueRight;
    svl=myCar.sensorValueLeft;
    
   int pasttime = millis()- cartime;
    
   if (pasttime < 4000)
   {
    goLeftwatchLeft();
   }  
   
   if (pasttime > 4000 && pasttime < 4900)
   {
     switchup();
   }
   
   if (pasttime > 4900 && pasttime < 9000)
   {
     stradle();
   }
   
   if (pasttime > 9000 && pasttime < 9800)
    {
      switchup();
    }
    
    if (pasttime > 9800 && pasttime < 15000)
    {
      goRightwatchRight();
    }
    
    if (pasttime > 15000 && pasttime < 15800)
    {
      switchup2(); 
    }
    
    if (pasttime > 15800 && pasttime < 26500)
    {
      stradle();
      //goRightwatchRight();
    } 
    
    if (pasttime > 26500 && pasttime < 27500)
    {
      switchup2();
    } 
   
   if (pasttime > 27500)
   {
     cartime = millis();
   }
  
  }
  

  void goLeftwatchLeft(){
    
  if (myCar.sensorValueRight < 30 && myCar.sensorValueLeft < 30)
  {
      myCar.setLeftSpeed(55);
      myCar.setRightSpeed(60);      //go to left to find oval 
    }
     
    else if(myCar.sensorValueLeft > 200)
    {
      myCar.setLeftSpeed(15);
      myCar.setRightSpeed(5);      //turns left 
    }
  }
  
  void switchup ()
  {
    
    myCar.setLeftSpeed(28);
    myCar.setRightSpeed(25);
  
  }
  
  void stradle()
  {
    if (myCar.sensorValueRight < 30 && myCar.sensorValueLeft < 30)
  {
      myCar.setLeftSpeed(60);
      myCar.setRightSpeed(55);      //go to left to find oval 
    }
     
    else if(myCar.sensorValueLeft > 200)
    {
      myCar.setLeftSpeed(5);
      myCar.setRightSpeed(15);      //turns left 
    }
    
    else if (myCar.sensorValueRight > 200)
    {
      myCar.setLeftSpeed(15);
      myCar.setRightSpeed(5);       // turns right
    }
  }
  
  void goRightwatchRight()
  {
    if (myCar.sensorValueRight < 30 && myCar.sensorValueLeft < 30)
  {
      myCar.setLeftSpeed(60);
      myCar.setRightSpeed(55);      //go to left to find oval 
    }

    else if (myCar.sensorValueRight > 200)
    {
      myCar.setLeftSpeed(5);
      myCar.setRightSpeed(15);       // turns right
    }
  }
  
  void switchup2()
  {
    myCar.setLeftSpeed(26); 
    myCar.setRightSpeed(27);  
  }

  
 }
