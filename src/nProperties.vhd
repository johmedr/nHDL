--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package nProperties is
	type dimension is array (1 downto 0) of integer; 
	constant matrix_dimension : dimension := (255, 255); 

end nProperties;

package body nProperties is
 
end nProperties;
