# input_system
NEW:
The folder "input system" contains the input system consisting of the following parts:
  - Input buffer
  - Input FSM
  - a structural
  
It works by taking in a 3-bit direction input for each player and spits out a 4-bit direction output for each player. It also spits out a Start signal. 

Encoding directions, the output:
  - "111" --> Start, output: Start signal '1'
  - "001" --> Right, output: "0001"
  - "010" --> Right, output: "0010"
  - "011" --> Right, output: "0100"
  - "100" --> Right, output: "1000"

On the NodeMcu ESP8266 [the "arduino"] the input vector is defined as follows:
  - Pac-Man: "D2-D1-D0" 
  - Ghost1:  "D5-D4-D3"
  - Ghost2:  "D8-D7-D6"

The inputs of the structural are:
 - clk         (1 bit vector)
 - reset       (1 bit vector)
 - dir_pacman  (3 bit vector)
 - dir_ghost1  (3 bit vector)
 - dir_ghost2  (3 bit vector)

The outputs then are
 - start       (1 bit vector) 
 - dir_out_p1  (4 bit vector) 
 - dir_out_p2  (4 bit vector)
 - dir_out_p3  (4 bit vector)


OLD:
This folder contains all files regarding the input system.
This includes:
- Input Buffer =>
the input buffer contains two cascaded flip-flops which buffer the input signal from a potential joystick.
- Input Controller =>
the input controller computes the correct output direction from the buffered input signal.
