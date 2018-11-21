# coordinate_register

In this folder a description and testbench of the coordinate register component are given.

The coordinate register has four 5 bit input busses:  
Two of these represent the row number and the column number of the to be stored coordinate.  
The other two busses represent the reset/default value for the row and column number.
This means that when a reset of the register occurs, the stored coordinate value is set to the value at these reset busses.

Furthermore, the values at the input busses are only propagated to the output busses on a rising clock edge.
Also, the reset of this register component is synchronous.
