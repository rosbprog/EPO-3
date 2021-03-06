library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structural of total_system is
   component game_struct
      port(clk          : in  std_logic;
           reset        : in  std_logic;
        dir_pacman   : in  std_logic_vector(2 downto 0);
        dir_ghost1   : in  std_logic_vector(2 downto 0);
        dir_ghost2   : in  std_logic_vector(2 downto 0);
        vc_done_in      : in  std_logic;
        row_request  : in  std_logic_vector(4 downto 0);
        col_request  : in  std_logic_vector(4 downto 0);
		start		 : out std_logic;
        score_pulse  : out std_logic;
		score_reset_out  : out std_logic;
		game_over_out : out std_logic;
        cell_type    : out std_logic_vector(2 downto 0));
   end component;

  component video_system is 
  port( clk       : in std_logic;
        reset     : in std_logic;
        cell_type : in std_logic_vector(2 downto 0);
	score_plus : in std_logic;
       	user_begin : in std_logic;
			game_over: in std_logic;
        xcoordinates : out std_logic_vector(4 downto 0);
        ycoordinates : out std_logic_vector(4 downto 0);
        red       : out std_logic;
        green     : out std_logic;
        blue      : out std_logic;
        h_sync    : out std_logic;
        v_sync    : out std_logic;
	calc_start	: out std_logic);
end component;

signal xcoordinates_int, ycoordinates_int: std_logic_vector(4 downto 0);
signal score_pulse_int, score_reset_out_int, game_over_out_int, calc_start_game_int, start_int: std_logic;
signal cell_type_int: std_logic_vector(2 downto 0);


begin
L1: game_struct port map(clk, reset, dir_pacman, dir_ghost1, dir_ghost2, calc_start_game_int, ycoordinates_int, xcoordinates_int, start_int, score_pulse_int, game_over_out_int, score_reset_out_int, cell_type_int);

L2: video_system port map(clk, reset, cell_type_int, score_pulse_int, start_int, game_over_out_int,  xcoordinates_int, ycoordinates_int, red, green, blue, h_sync, v_sync, calc_start_game_int);


--dir_ghost1_int <= "0000";
--dir_ghost2_int <= "0000";
--dir_pacman_int <= "0000";

end structural;

