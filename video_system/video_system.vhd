library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity video_system is 
  port( clk       : in std_logic;
        reset     : in std_logic;
        cell_type : in std_logic_vector(2 downto 0);
        xcoordinates : out std_logic_vector(4 downto 0);
        ycoordinates : out std_logic_vector(4 downto 0);
        red       : out std_logic;
        green     : out std_logic;
        blue      : out std_logic;
        h_sync    : out std_logic;
        v_sync    : out std_logic);
end video_system;


