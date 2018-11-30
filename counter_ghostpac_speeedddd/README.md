The speed controller consists of two parts, the fsm which determines what speed should be taken, and the counter.
The counter outputs a 7 bit vector and the count adds 1 to the count each time the new screen is drawn. The count is then send to the FSM.
The goal of the fsm is to start the movements of the ghosts and pacman at specific times, and change the speed with which the ghosts run 
depending on how much coins have been picked up already. 

