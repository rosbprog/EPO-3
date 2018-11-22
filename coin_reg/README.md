# coin_reg

This component takes a coordinate as input. This can be either the coordinate of Pac-Man or be the coordinate that the VC wants to print next.  
Using a signal called "write_coin" it is determined how the coordinates are interpreted: a '1' indicates it is Pac-Man (coins should dissapear if the coordinates are good and the score should at), a '0' indicates it is just the coordinates of the VC, thus it should only provide a '1' when there is a coin present or a '0' when it is not.  
The score_add signal is passed to the coin-counter (still to be made). The coin_present signal is passed on to the VC.  
The component functions through 48 flipflops with synchronous reset. A '0' indicates the coin is still present, a '1' indicates it has been eaten by Pac-Man.
