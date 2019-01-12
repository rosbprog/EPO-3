architecture behaviour of new_counter is

signal count, new_count : std_logic_vector (6 downto 0);

begin

lbl0: count <= new_count;

process(clk, count_reset, vc_done)
begin
  if(rising_edge(clk)) then
    if(count_reset = '1') then
      new_count <= "0000000";
    else
      if(vc_done = '1') then
	new_count <= count + 1;
      else
	new_count <= count;
      end if;
    end if;
  end if;
end process;

process(count)
begin
  if(count > "0010100") then -- this is now 20
    forty <= '1';
  else
    forty <= '0';
  end if;

  if(count > "0100010") then -- this is now 32
    sixty <= '1';
  else
    sixty <= '0';
  end if;

  if(count > "0101000") then -- this is now 40
    eighty <= '1';
  else
    eighty <= '0';
  end if;

  if(count > "0111100") then -- this is now 60
    hundredandtwenty <= '1';
  else
    hundredandtwenty <= '0';
  end if;
end process;

end architecture;
