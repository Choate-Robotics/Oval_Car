class MyDriveSystem extends DriveSystem {
  int laneChange = 0; //0 = STAY IN LANE, 1 = CHANGE LANES
  int currentLaneLine = 2; //car starts on lane 2 in order to change to inner lane
  //Outside Lane + Left Line = 0
  //Outside Lane + Right Line + GOING LEFT = 1, Outside Lane + Right Line + GOING RIGHT = 2
  //Inside Lane + Left Line + GOING LEFT = 3, Inside Lane + Left Line + GOING RIGHT = 4
  //Inside Lane + Right Line = 5
  int counter = 0;
  
  MyDriveSystem(Car myCar) {
    super(myCar);
    noSense=0;
  }
  void drive() {
    int svr=myCar.sensorValueRight;
    int svl=myCar.sensorValueLeft;

    if (laneChange == 0) {
      //LANE KEEPING
      if (currentLaneLine == 0 || currentLaneLine == 3 || currentLaneLine == 4) {
        //if car needs to follow left most line
        myCar.setLeftSpeed(50);
        myCar.setRightSpeed(int(map(svl, 0, 150, 55, 25)));
      } else if (currentLaneLine == 1 || currentLaneLine == 2 || currentLaneLine == 5) {
        //if car needs to follow right most line
        myCar.setRightSpeed(50);
        myCar.setLeftSpeed(int(map(svr, 0, 150, 55, 25)));
      }
      
      if (counter > 150) { //change lanes every few seconds
        counter = 0; //reset the counter function
        laneChange = 1; //begin lane change function
        println("LANE CHANGE BEGUN");
      } else {
        counter = counter + 1;
      }
      
    } else if (laneChange == 1) { 
     //LANE CHANGE
     if (currentLaneLine == 0 && counter < 30) {
       myCar.setLeftSpeed(50);
       myCar.setRightSpeed(45);
     } else if (currentLaneLine == 1 && counter < 15) {
       myCar.setLeftSpeed(49);
       myCar.setRightSpeed(50);
     } else if (currentLaneLine == 2 && counter < 33) { 
       myCar.setLeftSpeed(50);
       myCar.setRightSpeed(45);
     } else if (currentLaneLine == 3 && counter < 29) {
       myCar.setLeftSpeed(48);
       myCar.setRightSpeed(50);
     } else if (currentLaneLine == 4 && counter < 30) {
       myCar.setLeftSpeed(50);
       myCar.setRightSpeed(45);
     } else if (currentLaneLine == 5 && counter < 15) {
       myCar.setLeftSpeed(49);
       myCar.setRightSpeed(50);
     } else {
       counter = 0;
       laneChange = 0;
       
       if (currentLaneLine == 0) {
         currentLaneLine = 2;
       } else if (currentLaneLine == 1) {
         currentLaneLine = 0;
       } else if (currentLaneLine == 2) {
         currentLaneLine = 4;
       } else if (currentLaneLine == 3) {
         currentLaneLine = 1;
       } else if (currentLaneLine == 4) {
         currentLaneLine = 5;
       } else if (currentLaneLine == 5) {
         currentLaneLine = 3;
       }
     }
     counter = counter + 1;
    }
  }
}
