# wx250s teleop with joystick

```bash
# in your host machine
git clone https://github.com/jingjing-gong/wx250s-teleop-joystick.git
cd wx250s-teleop-joystick/docker
make
```
> [!NOTE]
> This will pull the public image automatically and build your private image if not exist, then it will take you to the container shell.

```bash
# in your docker container shell
ros2 launch interbotix_xsarm_joy xsarm_joy.launch.py robot_model:=wx250s controller:=xbox360
```

>if you don't have a wx250s robot arm, you can use the simulation mode. The following command will launch the teleop node for wx250s robot arm with Xbox 360 controller in Rviz simulation.
>```bash
># in your docker container shell
>ros2 launch interbotix_xsarm_joy xsarm_joy.launch.py robot_model:=wx250s controller:=xbox360 use_sim:=true
>```

> [!NOTE]
> This will launch the teleop node for wx250s robot arm with Xbox 360 controller. You can change the `controller` argument to `ps3` or `ps4` if you are using a PS3 or PS4 controller, respectively.


> For completeness, the following content is copied from the archived [interbotix/interbotix_ros_arms](https://github.com/Interbotix/interbotix_ros_arms/tree/master/interbotix_examples/interbotix_joy_control) repository.

| Argument | Description | Default Value |
| -------- | ----------- | :-----------: |
| robot_name | name of a robot (ex. 'wx200') | "" |
| use_default_rviz | 'true' if Rviz should be displayed; 'false' otherwise | true |
| threshold | value from 0 to 1 defining joystick sensitivity; a larger number means the joystick should be less sensitive | 0.75 |
| controller | type of controller ('ps3', 'ps4', or 'xbox360') | ps4 |
| arm_run | 'true' if the *arm_run.launch* file should be launched - set to 'false' if you would like to run your own version of this file separately | true |

To understand how the joystick buttons map to controlling the robot, look at the diagram and table below. Note that while the Xbox360 has a slightly different naming convention, the button placement is essentially the same:

![ps3](images/ps3.jpg)

| Button | Action |
| ------ | ------ |
| START/OPTIONS | move robot arm to its Home pose |
| SELECT/SHARE | move robot arm to its Sleep pose |
| R2 | rotate the 'waist' joint clockwise |
| L2 | rotate the 'waist' joint counterclockwise |
| Triangle | increase gripper PWM in 25 step increments (max is 350) |
| X | decrease gripper PWM in 25 step increments (min is 150) |
| O | open gripper |
| Square | close gripper |
| D-pad Up | increase arm speed in 0.25 step increments (max is 3.00) |
| D-pad Down | decrease arm speed in 0.25 step increments (min is 1.00) |
| D-pad Left | 'Coarse' control - sets arm speed to a user-preset 'fast' speed |
| D-pad Right | 'Fine' control - sets arm speed to a user-preset 'slow' speed |
| Right stick Up/Down | Increase/Decrease pitch of the end-effector |
| Right stick Left/Right | Increase/Decrease roll of the end-effector |
| R3 | reverses the Right stick Left/Right control |
| Left stick Up/Down | move the end-effector (defined at 'ee_gripper_link') vertically in Cartesian space |
| Left stick Left/Right | move the end-effector (defined at 'ee_gripper_link') horizontally in Cartesian space |
| L3 | reverses the Left stick Left/Right control |
