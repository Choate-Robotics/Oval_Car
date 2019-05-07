class MyDriveSystem extends DriveSystem {
  int svr, svl;
  int smoothsize;
  int rawsvr, rawsvl;
  int leftSpeed, rightSpeed;
  int mymillis;
  int standardspeed=32;
  int firstturn=5000;
  int turncoef=5;
  int secondturn=15000;
  MyDriveSystem(Car myCar) {
    super(myCar);
    mymillis=millis();
    smoothsize=0;
  }
  void drive() {
    rawsvr=myCar.sensorValueRight/3;
    rawsvl=myCar.sensorValueLeft/3;
    smoothing(rawsvr, rawsvl);
    // followInsideLeft(svr, svl);
    //if (noSense<=0) {
    //OUTSIDE LANE
    if ((millis()-mymillis)<firstturn) {
      followInsideRight(svr, svl);
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
    if ((millis()-mymillis)>secondturn+2000 && (millis()-mymillis)<secondturn+5000) {
      followOutsideLeft(svr, svl);
    }
    if ((millis()-mymillis)>secondturn+5000 && (millis()-mymillis)<secondturn+10000) {
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
    myCar.setLeftSpeed(leftSpeed+turncoef-svr);
    myCar.setRightSpeed(rightSpeed);
  }

  void followOutsideLeft(int svr, int svl) {
    leftSpeed=standardspeed;
    rightSpeed=standardspeed;
    myCar.setLeftSpeed(leftSpeed);
    myCar.setRightSpeed(rightSpeed+(turncoef-2)-svl);
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
  
  void smoothing(int rawsvr, int rawsvl){
     smoothsize=min(6,smoothsize+1);
     
       svr=(int)(svr*(smoothsize-1)/float(smoothsize)+rawsvr/float(smoothsize));
       svl=(int)(svl*(smoothsize-1)/float(smoothsize)+rawsvl/float(smoothsize));
     
  }
}
