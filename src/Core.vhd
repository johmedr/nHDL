----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:20:18 12/03/2016 
-- Design Name: 
-- Module Name:    Core - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL; 
use IEEE.STD_LOGIC_ARITH.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
--use UNISIM.VComponents.all;
--use work.nMath.all; 

entity Core is

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
	port(	D : out matrix; 
			CLK : in STD_LOGIC);
end Core;

architecture Behavioral of Core is
		signal i, j: matrix; 
begin
	i <= ((3, 4),
			(6, 7));
	j <= ((1, -1),
			(0, 1));
			 
	D <= i * j when CLK'event and CLK='1'; 
		
end Behavioral;

