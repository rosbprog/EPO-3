library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structural of highest_level is

  component game_struct is
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
  end component;

  component video_system is
  port(clk : in std_logic;
	reset : in std_logic;
	cell_type : in std_logic_vector (2 downto 0);
	score_plus : in std_logic;
	xcoordinates : out std_logic_vector (4 downto 0);
	ycoordinates : out std_logic_vector (4 downto 0);
	red : out std_logic;
	green : out std_logic;
	blue : out std_logic;
	h_sync : out std_logic;
	v_sync : out std_logic;
	calc_start : out std_logic);
  end component;

  signal score_plus, vc_done, score_reset, game_over : std_logic;
  signal cell_type : std_logic_vector (2 downto 0);
  signal row_requested, col_requested : std_logic_vector (4 downto 0);

begin

L1: game_struct port map (clk, reset, dir_pacman, dir_ghost1, dir_ghost2, vc_done, row_requested, col_requested, score_plus, score_reset, game_over, cell_type);
L2: video_system port map (clk, reset, cell_type, score_plus, row_requested, col_requested, red, green, blue, h_sync, v_sync, vc_done);

end structural;

