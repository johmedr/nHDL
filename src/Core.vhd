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

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
use work.nMath.all; 

entity Core is
	port(A, B : out matrix; 
			C : out integer; 
			D : out matrix; 
			CLK : in STD_LOGIC);
end Core;

architecture Behavioral of Core is
		signal i, j : matrix; 
begin
	process 
	begin 
		wait until CLK'event and CLK = '1'; 
		i <= ((1, 0, 0),
				(0, 1, 0),
				(0, 0, 1));
		j <= ((1, 0, 3),
				(0, 2, 0),
				(5, 0, 1));
		A <= i; 
		B <= j;
		C<=23;
		D <= i*j;
	end process; 
	

end Behavioral;

