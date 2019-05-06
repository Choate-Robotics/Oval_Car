class MyDriveSystem extends DriveSystem {
  int svr, svl;
  int rightSpeed, leftSpeed;
  int approach=0;
  int step;
  int mymillis;
  MyDriveSystem(Car myCar) {
    super(myCar);
    mymillis=millis();
    noSense=0;
  }
  void drive() {

    //if (noSense<=0) {

    svr=myCar.sensorValueRight;
    svl=myCar.sensorValueLeft;

    leftSpeed=20;
    rightSpeed=20;

    
    myCar.setLeftSpeed(leftSpeed+15-svr);
    myCar.setRightSpeed(rightSpeed);
    if ((millis()-mymillis)>10000 && (millis()-mymillis)<11000){
      leftSpeed=25;
      rightSpeed=20;
      myCar.setLeftSpeed(leftSpeed);
    myCar.setRightSpeed(rightSpeed);
    }
  }
}
//noSense--;
//constrain(noSense,0, 100000);
//}
