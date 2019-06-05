----------------------------------------------------------------------------------
-- Company: UNI
-- Engineer: Carlos Ortega
-- 
-- Create Date:    20:20:58 04/04/2015 
-- Design Name: 
-- Module Name:    X7Seg - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity X7Seg is
	port(
		a_to_g	:	out std_logic_vector(6 downto 0);
		x	:	in std_logic_vector(15 downto 0);
		clr	: in std_logic;
		an	:	out std_logic_vector(3 downto 0);
		clk : in std_logic
	);
end X7Seg;

architecture Behavioral of X7Seg is

signal s: std_logic_vector(1 downto 0);
signal digit: std_logic_vector(3 downto 0);
signal aen: std_logic_vector(3 downto 0);
signal clkdiv: std_logic_vector(19 downto 0);

begin

s <= clkdiv(19 downto 18);
aen <= "1111";

	P1: process (s,x)
	begin
		case s is
			when "00" => digit <= x(3 downto 0); 
			when "01" => digit <= x(7 downto 4);
			when "10" => digit <= x(11 downto 8);
			when others => digit <= x(15 downto 12);
		end case;		
	end process;

	P2: process(digit)
	begin
		case digit is
			when X"0" => a_to_g <= "0000001"; --0
			when X"1" => a_to_g <= "1001111"; --1
			when X"2" => a_to_g <= "0010010"; --2
			when X"3" => a_to_g <= "0000110"; --3
			when X"4" => a_to_g <= "1001100"; --4
			when X"5" => a_to_g <= "0100100"; --5
			when X"6" => a_to_g <= "0100000"; --6
			when X"7" => a_to_g <= "0001101"; --7
			when X"8" => a_to_g <= "0000000"; --8
			when X"9" => a_to_g <= "0000100"; --9
			when X"A" => a_to_g <= "0001000"; --A
			when X"B" => a_to_g <= "1100000"; --B
			when X"C" => a_to_g <= "0110001"; --C
			when X"D" => a_to_g <= "1000010"; --D
			when X"E" => a_to_g <= "0110000"; --E
			when others => a_to_g <= "0111000"; --F
		end case;
	end process;

-- Digit Select	
	P3: process(s, aen)
	begin
		an <= "1111";
		if aen(conv_integer(s)) = '1' then
			an(conv_integer(s)) <= '0';
		end if;
	end process;

-- Clock Divider
	P4: process(clk,clr)
	begin
		if clr = '1' then
			clkdiv <= (others => '0');
		elsif rising_edge(clk) then
			clkdiv <= clkdiv + 1;
		end if;
	end process;
end Behavioral;