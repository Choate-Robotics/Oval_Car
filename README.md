# Maze Car

The goal of this challenge is to create a drive system that 
will allow the car to navigate the maze. Use the right or left hand rule 
idea of maze navigation [source](http://arcbotics.com/lessons/maze-solving-home-lessons/). 

![GIF of Robot Solving Maze](https://github.com/Choate-Robotics/Maze_Car/blob/master/Maze%20Solver.gif)

### Hints about the DriveSystem

DriveSystem is basically an abstract class that needs to be subclassed to create a strategy for how the car is to move. 

You will want the robot to act differently at different times. To do this you will need some kind of *flag* variable that tells the robot which thing to do. You can set this up by making a class variable ```flag```. Here is an example of where the robot goes forward until it hits a wall and then goes backward.

```
class MyDriveSystem extends DriveSystem{

  int approach=0;
  int svr, svl;

  MyDriveSystem(Car myCar){
    super(myCar);
  }

  void drive(){

    svr=myCar.sensorValueRight;
    svl=myCar.sensorValueLeft;

    if (approach==0){
      if (svl>100 || svr>100){
        approach==1;
      }
      myCar.setLeftSpeed(20);
      myCar.setRightSpeed(20);
    }
    else
    {
      myCar.setLeftSpeed(-20);
      myCar.setRightSpeed(-20);
    }



  }
}
```

There is one main method, ```void drive()```. Below is a sample ```drive``` method. In this case we want to have the car move 
forward and then turn to the right, and then repeat those actions.

```
void drive() {
    //override me.
    if (noSense==0) {
      if (approach==0) {
        myCar.setLeftSpeed(30);
        myCar.setRightSpeed(30);
        approach=1;
        setNoSense(40);        
      } 
      else if (approach==1) {
        myCar.setLeftSpeed(5);
        myCar.setRightSpeed(-5);
        setNoSense(30);
        approach=0;
      }
    }
    noSense--;
  }
```

The variable ```approach``` is a class variable that allows you to indicate which settings you would like to employ. 

The ```setNoSense``` method is a way to create a delay before the drive function determines another action. Basically actions are only 
taken when noSense is equal to 0.

In general you should use this template for your drive 

```
class MyDrive extends DriveSystem{

  MyDrive(Car mCar) {
    super(mCar);
  }

  void drive() {
    //override me.
    if (noSense==0) {
      if (approach==0) {
        // Put some stuff here for what to do first.

        // setNoSense to make it so that state continues for some period of time
        setNoSense(40);        
      } 
      else if (approach==1) {
        // Put some stuff here for what to do at another time indicated by approach 0.

        // setNoSense to make it so that state continues for some period of time
        setNoSense(30);

      }
    }
    noSense--;
  }
}
```

## API for the Car object

Car has the following methods that may be useful:

```Car(int x, int y, float theta)```

This constructor method allows you to place a car on the canvas pointing in the direction of ```angle```. The directions work 
with 0 as directly up and move in in a clockwise manner.

```void setLeftSpeed(int s)``` 

Set the speed of the left motor to an integer from 0 to 255. 

```void setRightSpeed(int s)``` 

Set the speed of the left motor to an integer from 0 to 255. 

```void LEDSense()```

Have the readings of the left and right sensors loaded into ```sensorValueRight``` and ```sensorValueLeft```.

```void show()``` 

Draw the car on the canvas.

```void move()```

Compute the new position of the car based on the motor settings.

# Oval Car

The goal of this challenge is to create a drive system that will allow the car to navigate a two lane system. We would like to see the car start in one lane. You can know that the car starts in the outside lane. The car must spend a few seconds in each lane and then change to the other lane.

![GIF of Robot Solving Maze](https://github.com/Choate-Robotics/Maze_Car/blob/master/Maze%20Solver.gif)

### Hints about the DriveSystem

DriveSystem is again an abstract class that needs to be subclassed to create a strategy for how the car is to move.

You will want the robot to act differently at different times. This time I suggest that you use the `millis()`to do this. You may want to record the starting time of your loop in a class variable and measure time from that start.

You should be able to avoid the `noSense` business form before by using `millis()`.

The `setNoSense` method is a way to create a delay before the drive function determines another action. Basically actions are only

taken when noSense is equal to 0.

In general you should use this template for your drive

## API for the Car object

Car has the following methods that may be useful:

`Car(int x, int y, float theta)`

This constructor method allows you to place a car on the canvas pointing in the direction of `angle`. The directions work with 0 as directly up and move in in a clockwise manner.

`void setLeftSpeed(int s)`

Set the speed of the left motor to an integer from 0 to 255.

`void setRightSpeed(int s)`

Set the speed of the left motor to an integer from 0 to 255.

`void LEDSense()`

Have the readings of the left and right sensors loaded into `sensorValueRight` and `sensorValueLeft`.

`void show()`

Draw the car on the canvas.

`void move()`

Compute the new position of the car based on the motor settings.
