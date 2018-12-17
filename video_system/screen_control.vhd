library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity screen_controller is
	port (clk		    : in std_logic;
		    reset		  : in std_logic;
        user      : in std_logic;
        game_over : in std_logic;
        mux_sel   : out std_logic;
        st_go_sel : out std_logic
	);
end entity screen_controller;
