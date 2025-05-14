# PNC-R-DroneTaxi
A program that allows to use drones from PneumaticCraft: Repressurized as a teleport. Works on CC:Tweaked GPS API and Drone Interface, that integrates with drone code.

## How to use
### Server
Setting up the server is pretty easy, just run ```wget https://ebonut.github.io/PNC-R-DroneTaxi/server.lua startup```, attach a modem on top(you can change the modem in the rednet.open() function) and a Drone Interface at the right(you can change it too, in peripheral.wrap())
### Client
I recomend using a pocket computer, but technically a stationary one would still work.
Run ```wget https://ebonut.github.io/PNC-R-DroneTaxi/taxi.lua taxi``` to download it. Just add the target coords as 3 arguments and wait until you get asked for confirmation then press Enter to continue.
### Drone
The drone should have a Standby, a Teleport to its base, and a Computer Control block aimed at the Drone Interface.

## License
Since it's my first licensed project, i chose MIT License. Feel free to change the project for your needs, just don't forget about credit)

If you see this on github.io, there is the [project page](https://github.com/Ebonut/PNC-R-DroneTaxi).
