class MyDriveSystem extends DriveSystem {
  int svr, svl;
  int rightSpeed, leftSpeed;
  int approach=0;
  int step;

  MyDriveSystem(Car myCar) {
    super(myCar);
    noSense=0;
  }
  
  boolean[] dothestuff = {true, false, false, false};
  boolean end = false;
  float duration = 3.3; //used to be 60
  long repeatingTime;
  int repeatNum = 0;
  float spedMult = 1.5;
  
  void shift(float starttime, int turn, int num){
    long start = int(starttime*60);
    if(dothestuff[num]){
      if(repeatingTime > start && repeatingTime < start + duration){
        myCar.setRightSpeed(-30*turn);
        myCar.setLeftSpeed(30*turn);
      }else if(repeatingTime >= (start + duration)){
        myCar.setRightSpeed(int(30*spedMult));
        myCar.setLeftSpeed(int(30*spedMult));
        if(repeatingTime > start + duration*2 && myCar.sensorValueRight > 128){
          dothestuff[num] = false;
          if(dothestuff.length > num + 1){
          dothestuff[num+1] = true;
          }else{
            end = true;
          }
        }
      }else if(repeatingTime < start){
        myCar.setRightSpeed(int(25*spedMult));
        myCar.setLeftSpeed(int(map(myCar.sensorValueRight, 0, 150, 55, 25)*spedMult));
      }
    }else if(end){
        myCar.setRightSpeed(int(25*spedMult));
        myCar.setLeftSpeed(int(map(myCar.sensorValueRight, 0, 150, 55, 25)*spedMult));
    }
  }
  void drive() {
    repeatingTime = repeatingTime + 1;
    if (repeatingTime/60 > 16){
      repeatingTime = 0;
      dothestuff[0] = true;
      end = false;
    }
   shift(1, 1, 0);
   shift(5, -1, 1);
   shift(9, -1, 2);
   shift(13, 1, 3);
  }
}
