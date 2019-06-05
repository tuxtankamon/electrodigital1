----------------------------------------------------------------------------------
-- Company: UNI
-- Engineer: Carlos Ortega
-- 
-- Create Date:    10:12:01 06/05/2019 
-- Design Name: 
-- Module Name:    genericMux - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: Diseño de un Mux de forma Generica, cambiando los valores de m y n
-- se puede cambiar la cantidad de bits de entrada y de seleccion, asi mismo su 
-- tamaño
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

package my_data_types is

	constant m : integer := 8;               --  Longitud en bits de cada entrada
	type matrix is array (natural range <>) of std_logic_vector (m-1 downto 0);
	
end my_data_types;

use work.my_data_types.all;

library ieee;
use ieee.std_logic_1164.all;

entity generic_mux is 
	generic ( n : integer := 2
	);  -- Longitud en bits del selector nro_entradas = 2**n;
	
	port (input : in  matrix (0 to (2**n)-1);
			sel   : in  integer range 0 to 2**n-1;--la cantidad maxima de bits del selector
			output: out std_logic_vector (m-1 downto 0)
	);
end generic_mux;	
--------------------------------------------------------------------------------
architecture behavioral of generic_mux is
begin
		output <= input(sel);
end behavioral;
--------------------------------------------------------------------------------		