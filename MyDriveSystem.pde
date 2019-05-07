class MyDriveSystem extends DriveSystem {
  int svr, svl;
  int rightSpeed, leftSpeed;
  int approach=0 , a=0;
  int step;


  MyDriveSystem(Car myCar) {
    super(myCar);
    noSense=0;
  }
  void drive() {

    //if (noSense<=0) {

    svr=myCar.sensorValueRight;
    svl=myCar.sensorValueLeft;
    if(approach == 0){

      if(a >= 100){
      powermotors( 35, 30);
      if(a >= 140){
      powermotors( 30, 30);
      if(svr > 120){
      powermotors( 0, 80);
      approach = 1;
      a = 0;
      }
      }
      }
      else{
      if(svr > 120){
      powermotors( 40,  50);
      }
      else{
      powermotors( 40, 20);
      }
      }
    }
    else{
      if(a >= 100){
      powermotors( 35, 41);
      if(a >= 130){
      powermotors( 30, 30);
      if(svr > 120){
      approach = 0;
      a = 0;
      }
      }
      }
      else{
      if(svr > 120)
      {
      powermotors( 40, 50);
      }
      else
      {
      powermotors( 40, 20);
      }
      }
    }
    a++;
  }
}


void powermotors( int ls, int rs)
{
  myCar.setLeftSpeed(ls);
  myCar.setRightSpeed(rs);
}
