library IEEE;
use IEEE.std_logic_1164.ALL;

entity game_struct is
   port(clk          : in  std_logic;
        reset        : in  std_logic;
        dir_pacman   : in  std_logic_vector(3 downto 0);
        dir_ghost1   : in  std_logic_vector(3 downto 0);
        dir_ghost2   : in  std_logic_vector(3 downto 0);
        vc_done_in      : in  std_logic;
        row_request  : in  std_logic_vector(4 downto 0);
        col_request  : in  std_logic_vector(4 downto 0);
        score_pulse  : out std_logic;
	score_reset_out  : out std_logic;
	game_over_out : out std_logic;
        cell_type    : out std_logic_vector(2 downto 0));
end game_struct;
