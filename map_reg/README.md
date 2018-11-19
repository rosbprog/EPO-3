# map_reg

This folder contains all components to describe the map register component.  
The map register component contains the row controller.
This component takes a 5 bit word as input representing the requested row number.
The output of the row controller is a 24 bit word representing the cells of the requested row.
A '1' means the cell contains a wall, whereas a '0' means the does not contain a wall.  
The inputs of the map register are two 5 bit words representing the row number and column number.
The 5 bit row number is fed into the row controller which in turn outputs the 24 bit word as described above.
Using the 5 bit column number, the correct bit of the 24 bit word is selected and outputted as a 1 bit signal called the "cell_value".
