----------------------------------------------------------------------------------
-- Company: UNI
-- Engineer: Carlos Ortega
-- 
-- Create Date:    16:38:58 04/24/2015 
-- Design Name: 
-- Module Name:    Adder1b - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder1b is
port(
	A	:	in std_logic;
	B	:	in std_logic;
	Cin : in std_logic;
	Cout : out std_logic;
	S 	:out	std_logic
);
end Adder1b;

architecture Behavioral of Adder1b is

begin

Cout <= (B and Cin) or (A and Cin) or (A and B);
S <= A xor (B xor Cin);
end Behavioral;