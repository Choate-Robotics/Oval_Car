class MyDriveSystem extends DriveSystem {
  int svr, svl;
  int rightSpeed, leftSpeed;
  int approach=0;
  int step;
  int robotTime;

  MyDriveSystem(Car myCar) {
    super(myCar);
    noSense=0;
    robotTime = millis(); //millis is how many milliseconds since one moment
  }
  void drive() {

    int elapsedTime = millis() - robotTime; //counts how much time has passed

    if (elapsedTime < 3000) {// if the time that has passed is less than 3 seconds
      follow();
    }
    if ((elapsedTime > 3000) && (elapsedTime < 4200)) { //interval entering inner lane
      myCar.setLeftSpeed(33);
      myCar.setRightSpeed(30);
    }
    if ((elapsedTime > 4200) && (elapsedTime <7200)) { //interval between going back and forth between lanes
      follow();
    }
    if ((elapsedTime > 7200) && (elapsedTime < 8450)) { //interval exiting inner lane
      myCar.setLeftSpeed(27);
      myCar.setRightSpeed(30);
    }
    if (elapsedTime > 8450) {
      robotTime = millis();//elapsed time now gets smaller because robot time is getting bigger
    }
  }

  void follow() {
    svr=myCar.sensorValueRight; 
    svl=myCar.sensorValueLeft;

    leftSpeed=20; //speed variables
    rightSpeed=20;

    myCar.setLeftSpeed(leftSpeed);
    myCar.setRightSpeed(rightSpeed);

    if (svr <100 && svl <100) { //both on black
      myCar.setLeftSpeed(54);
      myCar.setRightSpeed(49);
    } else if (svr >100 && svl <100) { //right on white
      myCar.setLeftSpeed(20);
      myCar.setRightSpeed(int(map(svl, 0, 160, 50, 30)));
    }
    if (svr <100 && svl >100){ //left on white
      myCar.setLeftSpeed(10);
      myCar.setRightSpeed(0);
    }
  }
}










//noSense--;
//constrain(noSense,0, 100000);
//}

//>100 = white is a large number




//if (savedTime < 5000);
//{
//  follow();
//}
//if (savedTime > 5000 && savedTime <10000);
//{
//  myCar.setLeftSpeed(0);
//  myCar.setRightSpeed(0);
//}
//if (savedTime > 10000);{
//savedTime = millis();
//}
