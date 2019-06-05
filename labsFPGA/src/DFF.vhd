----------------------------------------------------------------------------------
-- Company: UNI
-- Engineer: Carlos Ortega
-- 
-- Create Date:    10:23:14 06/30/2015 
-- Design Name: 
-- Module Name:    DFF - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: Este componente tiene el funcionamiento de un FF Tipo D
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

entity DFF is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           set : in  STD_LOGIC;
           D : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           notQ : out  STD_LOGIC);
end DFF;

architecture Behavioral of DFF is

begin
process(clk,clr,set)
begin
	if(clr = '1') then
		q <= '0';
		notQ <= '1';
	elsif (set = '1') then
		q <= '1';
		notQ <= '0';
	elsif (rising_edge(clk)) then
		q <= D;
		notQ <= not D;
	end if;
end process;

end Behavioral;