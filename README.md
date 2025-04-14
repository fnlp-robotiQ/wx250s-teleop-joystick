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
> [!NOTE]
> This will launch the teleop node for wx250s robot arm with Xbox 360 controller. You can change the `controller` argument to `ps3` or `ps4` if you are using a PS3 or PS4 controller, respectively.
