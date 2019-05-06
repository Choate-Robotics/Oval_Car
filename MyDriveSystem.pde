class MyDriveSystem extends DriveSystem {
  int svr, svl;
  int rightSpeed, leftSpeed;
  int approach=0;
  int step;

  MyDriveSystem(Car myCar) {
    super(myCar);
    noSense=0;
  }
  void drive() {

    //if (noSense<=0) {

    svr=myCar.sensorValueRight;
    svl=myCar.sensorValueLeft;

    leftSpeed=20;
    rightSpeed=20;

    
    myCar.setLeftSpeed(leftSpeed);
    myCar.setRightSpeed(rightSpeed);
  }
}
//noSense--;
//constrain(noSense,0, 100000);
//}
