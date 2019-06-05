----------------------------------------------------------------------------------
-- Company: UNI
-- Engineer: Ing. Carlos Ortega
-- 
-- Create Date:    09:59:11 07/08/2015 
-- Design Name: 
-- Module Name:    JKFF - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: Este componente describe la funcionalidad de un Flip Flop Tipo JK
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity JKFF is
    Port ( J : in  STD_LOGIC;
           K : in  STD_LOGIC;
           set : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Q : inout  STD_LOGIC;
           notQ : inout  STD_LOGIC);
end JKFF;

architecture Behavioral of JKFF is
begin
process(clk,clr,set)
begin
	if(clr = '1') then
		Q <= '0';
		notQ <= '1';
	elsif (set = '1') then
		Q <= '1';
		notQ <= '0';
	elsif (rising_edge(clk)) then
		if(J='0' and K='0')then
			Q <= Q;
			notQ <= not Q;
		elsif(J='0' and K='1')then
			Q <= '0';
			notQ <= '1';
		elsif(J='1' and K='0')then
			Q <= '1';
			notQ <= '0';
		else
			Q <= not Q;
			notQ <= Q;
		end if;
	end if;
end process;

end Behavioral;