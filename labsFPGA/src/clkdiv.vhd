----------------------------------------------------------------------------------
-- Company: UNI
-- Engineer: Ing. Carlos Ortega
-- 
-- Create Date:    13:24:21 01/24/2017 
-- Design Name: 
-- Module Name:    clkdiv - Behavioral 
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

entity clkdiv is
    Port ( clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           clk25 : out  STD_LOGIC;
           clk190 : out  STD_LOGIC;
           clk3 : out  STD_LOGIC);
end clkdiv;

architecture Behavioral of clkdiv is
signal q : std_logic_vector(23 downto 0);

begin
process(clk,clr)
	begin
		if clr = '1' then
			q <= X"000000";
		elsif rising_edge(clk) then
			q <= q + 1;
		end if;
end process;
	clk25 <= q(0);
	clk190 <= q(17);
	clk3 <= q(23);
end Behavioral;

