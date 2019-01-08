library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture vga_behavioral of vga_controll is

signal hcount, vcount, new_hcount, new_vcount: unsigned(9 downto 0);
signal in_h_sync, in_v_sync, new_h_sync, new_v_sync, in_red, new_red, in_blue, new_blue, in_green, new_green, in_calc_start_game, new_calc_start_game: std_logic;

begin

L1:		process(clk, reset)				
		begin
		if (rising_edge(clk)) then
			if (reset = '1') then
				hcount <= (others => '0');
				vcount <= (others => '0');	
				in_h_sync <= '0'; 
				in_v_sync <= '0';
				in_red <= '0';
				in_green <= '0';
				in_blue <= '0';
				in_calc_start_game <='0';
			else 
				hcount <= new_hcount;
				vcount <= new_vcount;
				in_h_sync <= new_h_sync;
				in_v_sync <= new_v_sync;
				in_red <= new_red;
				in_green <= new_green;
				in_blue <= new_blue;
				in_calc_start_game<=new_calc_start_game;
			end if;
		end if;
		end process; 

L2:		process(hcount, vcount)
		begin
			if(hcount = 399) then --end_h
				new_hcount <= (others => '0');
			else
				new_hcount <= hcount + 1;
			end if;

			if(hcount = 349) then --inc_v
				if(vcount = 524) then --end_v
					new_vcount <= (others => '0');
				else
					new_vcount <= vcount + 1;
				end if;
			else
				new_vcount <= vcount;
			end if;
		end process;
		
L31:		process( hcount, vcount, in_h_sync, in_v_sync)
		begin
			if (hcount=375) then
				new_h_sync <= '1';
			elsif(hcount=327) then
				new_h_sync <= '0';
			else 
				new_h_sync <= in_h_sync;
			end if;
			if (vcount=491) then
				new_v_sync <= '1';
			elsif(vcount=489) then
				new_v_sync <= '0';
			else 
				new_v_sync <= in_v_sync;
			end if;
				
				
			if (enable_sync='1') then
				go_pixel_sync<='0';
				if(hcount=64 and (vcount >= 32 and vcount<=47)) then
					score_pixel_sync <= '1';
				else
					score_pixel_sync <= '0';
				end if;
				if(hcount=64 and (vcount >= 48 and vcount<=431)) then
					pixel_sync <= '1';
				else
					pixel_sync <= '0';
				end if;
			else
				pixel_sync<='0';
				score_pixel_sync<='0';
				if(hcount=64 and (vcount >= 224 and vcount<=255)) then
					go_pixel_sync <= '1';
				else
					go_pixel_sync <= '0';
				end if;
			end if;
					
			
			if (vcount = 480 and hcount = 0) then
				new_calc_start_game <= '1';
			elsif(vcount = 524 and hcount = 399) then
				new_calc_start_game <= '0';
			else
				new_calc_start_game<=in_calc_start_game;
			end if; 
			if (vcount = 480 and hcount = 0) then
				calc_start <= '1';
			else 
				calc_start <= '0';
			end if;
		end process;

L4:		process(hcount,vcount,rgb)
		begin
			if (hcount<=318 and vcount<=478)then
				new_red <= rgb(2);
				new_green <= rgb(1);
				new_blue <= rgb(0);
			else 
				new_red <= '0';
				new_green <= '0';
				new_blue <= '0';
			end if;
		end process;

		h_sync <= in_h_sync;
		v_sync <= in_v_sync;
		red <= in_red;
		green <= in_green;
		blue <= in_blue;
		calc_start_game <= in_calc_start_game;
		
end architecture vga_behavioral;		

