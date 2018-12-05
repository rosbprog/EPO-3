library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all;

entity game_struct is
   port(clk             : in  std_logic;
        reset           : in  std_logic;
	vc_done_in		: in  std_logic;
        dir_in_p        : in  std_logic_vector(3 downto 0);
        dir_in_g1    			: in  std_logic_vector(3 downto 0);
        dir_in_g2       : in  std_logic_vector(3 downto 0);
	row_number_requested : in std_logic_vector(4 downto 0);
	column_number_requested : in std_logic_vector(4 downto 0);
	score_reset : out std_logic;
	score_add: out std_logic;
        cell_type : out std_logic_vector (2 downto 0));
end game_struct;

