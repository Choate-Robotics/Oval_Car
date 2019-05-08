class MyDriveSystem extends DriveSystem {
  int svr, svl;
  int rightSpeed, leftSpeed;
  int approach=0;
  int step;
  int cartime;
  int x = 0;

  MyDriveSystem(Car myCar) {
    super(myCar);
    noSense=0;
    cartime = millis();
  
  }
  void drive() {
  
      firstRound();


 

     
    
    }
    
    void follow(){
     
    if (myCar.sensorValueRight <150 && myCar.sensorValueLeft <150){
      myCar.setLeftSpeed (100);
      myCar.setRightSpeed (100); 
   }
    if (myCar.sensorValueRight < 150 && myCar.sensorValueLeft > 150){
      myCar.setLeftSpeed(10);
      myCar.setRightSpeed(30); 
   }
     if (myCar.sensorValueRight >150 && myCar.sensorValueLeft < 150){
         myCar.setLeftSpeed(30);
         myCar.setRightSpeed(10);        
   }
        if (myCar.sensorValueRight >150 && myCar.sensorValueLeft > 150){
         myCar.setLeftSpeed(30);
         myCar.setRightSpeed(80);        
   }
}
  void followOut(){
     
    
    if (myCar.sensorValueRight <150 && myCar.sensorValueLeft <150){
      myCar.setLeftSpeed (100);
      myCar.setRightSpeed (100); 
   }
    if (myCar.sensorValueRight > 150 && myCar.sensorValueLeft < 150){
      myCar.setLeftSpeed(10);
      myCar.setRightSpeed(40); 
   }
     if (myCar.sensorValueRight <150 && myCar.sensorValueLeft > 150){
         myCar.setLeftSpeed(40);
         myCar.setRightSpeed(10);        
   }
        if (myCar.sensorValueRight >150 && myCar.sensorValueLeft > 150){
         myCar.setLeftSpeed(90);
         myCar.setRightSpeed(30);        
   }
}
    void moveIn(){
         myCar.setLeftSpeed(60);
         myCar.setRightSpeed(50);           
     }
     
    void moveOut(){
         myCar.setLeftSpeed(50);
         myCar.setRightSpeed(60);      
     }
     
    void firstRound(){
    
      int elapsedTime = millis() - cartime;
 
    
        if (elapsedTime < 5000){
         follow();
        }
        if(elapsedTime > 5000 && elapsedTime < 5400){
         moveIn();
             
        }
        if (elapsedTime > 5400 && elapsedTime < 8400 ){
         follow();
         
        }
        if (elapsedTime > 8400 && elapsedTime < 8500 ){
          moveOut();
        }
        if (elapsedTime > 8500 && elapsedTime < 13000 ){
          followOut();
        }
        if (elapsedTime > 13000 && elapsedTime < 13100  ){
          moveOut();
          
        }
        if (elapsedTime > 13100 && elapsedTime < 16000){
          followOut();
     
        }
         if (elapsedTime > 16000 && elapsedTime < 16300  ){
         moveIn();
        }
         if (elapsedTime > 16300 && elapsedTime < 18000  ){
         follow();
        }
         if (elapsedTime > 18000 && elapsedTime < 18200  ){
         moveIn();
        }
         if (elapsedTime > 18200 && elapsedTime < 20000  ){
         follow();
        }
        if (elapsedTime > 18000  ){
         cartime = millis();
        }

        }
       }
     
    
   
 
        
