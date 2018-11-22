library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour_one_if_many_case of coin_register is

signal coin_memory, new_coin_memory : std_logic_vector (47 downto 0);
signal coin_reached : std_logic;
begin

process(clk, reset)
begin
  if(clk'event and clk = '1') then
    if(reset = '1') then
      -- all coins are reset
	coin_memory <= (others => '0');
    else
      coin_memory <= new_coin_memory;
    end if;
  end if;
end process;

coin_present <= not (coin_reached);
score_add <= write_coin and coin_present;

process(row, column, write_coin, coin_memory)
begin

if(write_coin = '1') then
  case row is 
    when "00001" => 
      case column is
	when "00011" =>
	  new_coin_memory <= coin_memory(47 downto 1) & '1';
	when "00110" =>
	  new_coin_memory <= coin_memory(47 downto 2) & '1' & coin_memory(0);
        when "10001" =>
	  new_coin_memory <= coin_memory(47 downto 3) & '1' & coin_memory(1 downto 0);
        when "10100" =>
	  new_coin_memory <= coin_memory(47 downto 4) & '1' & coin_memory(2 downto 0);
	when others =>
	  new_coin_memory <= coin_memory;
      end case; -- that is the first row

    when "00011" =>
      case column is
	when "00001" =>
	  new_coin_memory <= coin_memory(47 downto 5) & '1' & coin_memory(3 downto 0);
        when "01000" =>
	  new_coin_memory <= coin_memory(47 downto 6) & '1' & coin_memory(4 downto 0);
        when "01111" =>
	  new_coin_memory <= coin_memory(47 downto 7) & '1' & coin_memory(5 downto 0);
        when "10110" =>
	  new_coin_memory <= coin_memory(47 downto 8) & '1' & coin_memory(6 downto 0);
	when others =>
	  new_coin_memory <= coin_memory;
      end case; -- that is the second row

    when "00101" =>
      case column is
	when "00010" =>
	  new_coin_memory <= coin_memory(47 downto 9) & '1' & coin_memory(7 downto 0);
        when "00101" =>
	  new_coin_memory <= coin_memory(47 downto 10) & '1' & coin_memory(8 downto 0);
        when "10000" =>
	  new_coin_memory <= coin_memory(47 downto 11) & '1' & coin_memory(9 downto 0);
        when "10101" =>
	  new_coin_memory <= coin_memory(47 downto 12) & '1' & coin_memory(10 downto 0);
	when others =>
	  new_coin_memory <= coin_memory;
      end case; -- that is the third row

    when "00111" =>
      case column is
	when "00110" =>
	  new_coin_memory <= coin_memory(47 downto 13) & '1' & coin_memory(11 downto 0);
        when "01001" =>
	  new_coin_memory <= coin_memory(47 downto 14) & '1' & coin_memory(12 downto 0);
        when "01110" =>
	  new_coin_memory <= coin_memory(47 downto 15) & '1' & coin_memory(13 downto 0);
        when "10001" =>
	  new_coin_memory <= coin_memory(47 downto 16) & '1' & coin_memory(14 downto 0);
	when others =>
	  new_coin_memory <= coin_memory;
      end case; -- that is the fourth row

    when "01001" =>
      case column is
	when "00001" =>
	  new_coin_memory <= coin_memory(47 downto 17) & '1' & coin_memory(15 downto 0);
        when "00110" =>
	  new_coin_memory <= coin_memory(47 downto 18) & '1' & coin_memory(16 downto 0);
        when "10001" =>
	  new_coin_memory <= coin_memory(47 downto 19) & '1' & coin_memory(17 downto 0);
        when "10110" =>
	  new_coin_memory <= coin_memory(47 downto 20) & '1' & coin_memory(18 downto 0);
	when others =>
	  new_coin_memory <= coin_memory;
      end case; -- that is the fifth row

    when "01011" =>
      case column is
	when "00001" =>
	  new_coin_memory <= coin_memory(47 downto 21) & '1' & coin_memory(19 downto 0);
        when "01000" =>
	  new_coin_memory <= coin_memory(47 downto 22) & '1' & coin_memory(20 downto 0);
        when "01111" =>
	  new_coin_memory <= coin_memory(47 downto 23) & '1' & coin_memory(21 downto 0);
        when "10110" =>
	  new_coin_memory <= coin_memory(47 downto 24) & '1' & coin_memory(22 downto 0);
	when others =>
	  new_coin_memory <= coin_memory;
      end case; -- that is the sixth row: Halfway!

    when "01100" =>
      case column is
	when "00001" =>
	  new_coin_memory <= coin_memory(47 downto 25) & '1' & coin_memory(23 downto 0);
        when "01000" =>
	  new_coin_memory <= coin_memory(47 downto 26) & '1' & coin_memory(24 downto 0);
        when "01111" =>
	  new_coin_memory <= coin_memory(47 downto 27) & '1' & coin_memory(25 downto 0);
        when "10110" =>
	  new_coin_memory <= coin_memory(47 downto 28) & '1' & coin_memory(26 downto 0);
	when others =>
	  new_coin_memory <= coin_memory;
      end case; -- that is the seventh row

    when "01110" =>
      case column is
	when "00001" =>
	  new_coin_memory <= coin_memory(47 downto 29) & '1' & coin_memory(27 downto 0);
        when "00110" =>
	  new_coin_memory <= coin_memory(47 downto 30) & '1' & coin_memory(28 downto 0);
        when "10001" =>
	  new_coin_memory <= coin_memory(47 downto 31) & '1' & coin_memory(29 downto 0);
        when "10110" =>
	  new_coin_memory <= coin_memory(47 downto 32) & '1' & coin_memory(30 downto 0);
	when others =>
	  new_coin_memory <= coin_memory;
      end case; -- that is the eigth row

    when "10000" =>
      case column is
	when "00110" =>
	  new_coin_memory <= coin_memory(47 downto 33) & '1' & coin_memory(31 downto 0);
        when "01001" =>
	  new_coin_memory <= coin_memory(47 downto 34) & '1' & coin_memory(32 downto 0);
        when "01110" =>
	  new_coin_memory <= coin_memory(47 downto 35) & '1' & coin_memory(33 downto 0);
        when "10001" =>
	  new_coin_memory <= coin_memory(47 downto 36) & '1' & coin_memory(34 downto 0);
	when others =>
	  new_coin_memory <= coin_memory;
      end case; -- that is the ninth row

    when "10010" =>
      case column is
	when "00010" =>
	  new_coin_memory <= coin_memory(47 downto 37) & '1' & coin_memory(35 downto 0);
        when "00101" =>
	  new_coin_memory <= coin_memory(47 downto 38) & '1' & coin_memory(36 downto 0);
        when "10000" =>
	  new_coin_memory <= coin_memory(47 downto 39) & '1' & coin_memory(37 downto 0);
        when "10101" =>
	  new_coin_memory <= coin_memory(47 downto 40) & '1' & coin_memory(38 downto 0);
	when others =>
	  new_coin_memory <= coin_memory;
      end case; -- that is the tenth row

    when "10100" =>
      case column is
	when "00001" =>
	  new_coin_memory <= coin_memory(47 downto 41) & '1' & coin_memory(39 downto 0);
        when "01000" =>
	  new_coin_memory <= coin_memory(47 downto 42) & '1' & coin_memory(40 downto 0);
        when "01111" =>
	  new_coin_memory <= coin_memory(47 downto 43) & '1' & coin_memory(41 downto 0);
        when "10110" =>
	  new_coin_memory <= coin_memory(47 downto 44) & '1' & coin_memory(42 downto 0);
	when others =>
	  new_coin_memory <= coin_memory;
      end case; -- that is the eleventh row

    when "10110" =>
      case column is
	when "00011" =>
	  new_coin_memory <= coin_memory(47 downto 45) & '1' & coin_memory(43 downto 0);
        when "00110" =>
	  new_coin_memory <= coin_memory(47 downto 46) & '1' & coin_memory(44 downto 0);
        when "10001" =>
	  new_coin_memory <= coin_memory(47) & '1' & coin_memory(45 downto 0);
        when "10100" =>
	  new_coin_memory <= '1' & coin_memory(46 downto 0);
	when others =>
	  new_coin_memory <= coin_memory;
      end case; -- that is the twelfth row: Done!

    when others =>
      new_coin_memory <= coin_memory;

  end case;
else
  new_coin_memory <= coin_memory;
end if;

  case row is 
    when "00001" => 
      case column is
	when "00011" =>
          coin_reached <= coin_memory(0);
	when "00110" =>
          coin_reached <= coin_memory(1);
        when "10001" =>
          coin_reached <= coin_memory(2);
        when "10100" =>
	  coin_reached <= coin_memory(3);
	when others =>
	  coin_reached <= '1';
      end case; -- that is the first row

    when "00011" =>
      case column is
	when "00001" =>
          coin_reached <= coin_memory(4);
        when "01000" =>
	  coin_reached <= coin_memory(5);
        when "01111" =>
	  coin_reached <= coin_memory(6);
        when "10110" =>
	  coin_reached <= coin_memory(7);
	when others =>
	  coin_reached <= '1';
      end case; -- that is the second row

    when "00101" =>
      case column is
	when "00010" =>
          coin_reached <= coin_memory(8);
        when "00101" =>
	  coin_reached <= coin_memory(9);
        when "10000" =>
	  coin_reached <= coin_memory(10);
        when "10101" =>
	  coin_reached <= coin_memory(11);
	when others =>
	  coin_reached <= '1';
      end case; -- that is the third row

    when "00111" =>
      case column is
	when "00110" =>
          coin_reached <= coin_memory(12);
        when "01001" =>
	  coin_reached <= coin_memory(13);
        when "01110" =>
	  coin_reached <= coin_memory(14);
        when "10001" =>
	  coin_reached <= coin_memory(15);
	when others =>
	  coin_reached <= '1';
      end case; -- that is the fourth row

    when "01001" =>
      case column is
	when "00001" =>
          coin_reached <= coin_memory(16);
        when "00110" =>
	  coin_reached <= coin_memory(17);
        when "10001" =>
	  coin_reached <= coin_memory(18);
        when "10110" =>
	  coin_reached <= coin_memory(19);
	when others =>
	  coin_reached <= '1';
      end case; -- that is the fifth row

    when "01011" =>
      case column is
	when "00001" =>
          coin_reached <= coin_memory(20);
        when "01000" =>
	  coin_reached <= coin_memory(21);
        when "01111" =>
	  coin_reached <= coin_memory(22);
        when "10110" =>
	  coin_reached <= coin_memory(23);
	when others =>
	  coin_reached <= '1';
      end case; -- that is the sixth row: Halfway!

    when "01100" =>
      case column is
	when "00001" =>
          coin_reached <= coin_memory(24);
        when "01000" =>
	  coin_reached <= coin_memory(25);
        when "01111" =>
	  coin_reached <= coin_memory(26);
        when "10110" =>
	  coin_reached <= coin_memory(27);
	when others =>
	  coin_reached <= '1';
      end case; -- that is the seventh row

    when "01110" =>
      case column is
	when "00001" =>
          coin_reached <= coin_memory(28);
        when "00110" =>
	  coin_reached <= coin_memory(29);
        when "10001" =>
	  coin_reached <= coin_memory(30);
        when "10110" =>
	  coin_reached <= coin_memory(31);
	when others =>
	  coin_reached <= '1';
      end case; -- that is the eigth row

    when "10000" =>
      case column is
	when "00110" =>
          coin_reached <= coin_memory(32);
        when "01001" =>
	  coin_reached <= coin_memory(33);
        when "01110" =>
	  coin_reached <= coin_memory(34);
        when "10001" =>
	  coin_reached <= coin_memory(35);
	when others =>
	  coin_reached <= '1';
      end case; -- that is the ninth row

    when "10010" =>
      case column is
	when "00010" =>
          coin_reached <= coin_memory(36);
        when "00101" =>
	  coin_reached <= coin_memory(37);
        when "10000" =>
	  coin_reached <= coin_memory(38);
        when "10101" =>
	  coin_reached <= coin_memory(39);
	when others =>
	  coin_reached <= '1';
      end case; -- that is the tenth row

    when "10100" =>
      case column is
	when "00001" =>
          coin_reached <= coin_memory(40);
        when "01000" =>
	  coin_reached <= coin_memory(41);
        when "01111" =>
	  coin_reached <= coin_memory(42);
        when "10110" =>
	  coin_reached <= coin_memory(43);
	when others =>
	  coin_reached <= '1';
      end case; -- that is the eleventh row

    when "10110" =>
      case column is
	when "00011" =>
          coin_reached <= coin_memory(44);
        when "00110" =>
	  coin_reached <= coin_memory(45);
        when "10001" =>
	  coin_reached <= coin_memory(46);
        when "10100" =>
	  coin_reached <= coin_memory(47);
	when others =>
	  coin_reached <= '1';
      end case; -- that is the twelfth row: Done!

    when others =>
      coin_reached <= '1';
end case;
end process;
end behaviour_one_if_many_case;

