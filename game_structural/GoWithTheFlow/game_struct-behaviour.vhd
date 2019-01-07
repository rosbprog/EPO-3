library IEEE;
use IEEE.std_logic_1164.ALL;

architecture structural of game_struct is

-- Ghost structural
component ghost_struct
port(clk         : in  std_logic;
        reset       : in  std_logic;
        pos_is_wall : in  std_logic;
        ghost_start : in  std_logic;
        ghost_input : in  std_logic_vector(3 downto 0);
        row_old     : out std_logic_vector(4 downto 0);
        col_old     : out std_logic_vector(4 downto 0);
        row_new     : out std_logic_vector(4 downto 0);
        col_new     : out std_logic_vector(4 downto 0);
	row_reset	  : out std_logic_vector(4 downto 0);
	col_reset   : out std_logic_vector(4 downto 0);
        en_wall     : out std_logic;
ghost_ready : out std_logic);
end component;

component

begin
end structural;

