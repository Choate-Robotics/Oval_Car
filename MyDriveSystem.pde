class MyDriveSystem extends DriveSystem {
  int svr, svl;
  int rightSpeed, leftSpeed;
  int approach=0;
  int step;
  int mymillis;
  int standardspeed=40;
  int firstturn=5000;
  int recordsvr;
  int linejump;
  int turncoef=4;
  int secondturn=15000;
  MyDriveSystem(Car myCar) {
    super(myCar);
    mymillis=millis();
    noSense=0;
  }
  void drive() {
    svr=myCar.sensorValueRight/3;
    svl=myCar.sensorValueLeft/3;
    // followInsideLeft(svr, svl);
    //if (noSense<=0) {
    //OUTSIDE LANE
    if ((millis()-mymillis)<firstturn) {


      followInsideRight(svr, svl);
      linejump=0;
    }
    //START MERGE in
    if ((millis()-mymillis)>firstturn && (millis()-mymillis)<firstturn+2000) {
      followInsideLeft(svr, svl);
    }
    //COMPLETE MERGE in 
    if ((millis()-mymillis)>firstturn+2000 && (millis()-mymillis)<secondturn) {
      followInsideRight(svr, svl);
    }
    // start merge out
    if ((millis()-mymillis)>secondturn && (millis()-mymillis)<secondturn+2000) {
      followOutsideRight(svr, svl);
    }
    // more merge out
    if ((millis()-mymillis)>secondturn+2000 && (millis()-mymillis)<secondturn+4000) {
      followOutsideLeft(svr, svl);
    }
    if ((millis()-mymillis)>secondturn+4000 && (millis()-mymillis)<secondturn+10000) {
      followInsideRight(svr, svl);
    }
    if ((millis()-mymillis)>secondturn+10000){
      mymillis=millis();
    }
  }


  void followInsideRight(int svr, int svl) {
    //println("FollowLine");
    leftSpeed=standardspeed;
    rightSpeed=standardspeed;

    //println(millis()-mymillis);
    recordsvr=svr;
    myCar.setLeftSpeed(leftSpeed+turncoef-svr);
    myCar.setRightSpeed(rightSpeed);
  }

  void followOutsideLeft(int svr, int svl) {
    leftSpeed=standardspeed;
    rightSpeed=standardspeed;

    //println(millis()-mymillis);
    recordsvr=svr;
    myCar.setLeftSpeed(leftSpeed);
    myCar.setRightSpeed(rightSpeed+(turncoef-2)-svl);
  }

  void gostraight() {
    leftSpeed=standardspeed;
    rightSpeed=standardspeed;
    myCar.setLeftSpeed(leftSpeed);
    myCar.setRightSpeed(rightSpeed);
  }
  void followInsideLeft(int svr, int svl) {
    leftSpeed=standardspeed;
    rightSpeed=standardspeed;
    myCar.setLeftSpeed(leftSpeed);
    myCar.setRightSpeed(rightSpeed-turncoef+svl);
  }

  void followOutsideRight(int svr, int svl) {
    leftSpeed=standardspeed;
    rightSpeed=standardspeed;
    myCar.setLeftSpeed(leftSpeed-(turncoef-2)+svr);
    myCar.setRightSpeed(rightSpeed);
  }
}
//noSense--;
//constrain(noSense,0, 100000);
//}
