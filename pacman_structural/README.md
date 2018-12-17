# pacman_structural

This folder contains all components for describing and testing the pacman system.  
It consists of the following components:  
- Pacman controller: this component is a FSM describing the behaviour of the pacman entity in the game.
- Coorindate multiplexer: this component is used by the Pacman controller to select which coordinate (old or new) is put in the Coorindate register.
- Coordinate adder: this component is used to calculate the new coordinates using the old coordinates and the movement direction given by the Input system.
- Coordinate register: this component is used to store the current coordinates of pacman entity.
- Input system: this component is used to buffer the player input and computes the new direction of the pacman entity.
