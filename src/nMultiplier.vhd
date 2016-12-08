----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:28:42 12/08/2016 
-- Design Name: 
-- Module Name:    nMultiplier - Behavioral 
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

entity nMultiplier is
    generic (input_size : integer := 8; output_size : integer := 8); 
    Port ( A : in  STD_LOGIC_VECTOR (input_size - 1 downto 0);
           B : in  STD_LOGIC_VECTOR (input_size - 1 downto 0);
           Result : out  STD_LOGIC_VECTOR (output_size - 1 downto 0);
           CLK : in  STD_LOGIC);
end nMultiplier;

architecture Behavioral of nMultiplier is
	signal Result_buffer : STD_LOGIC_VECTOR (output_size - 1 downto 0);
begin

    mult : for i in 0 to input_size - 1 generate 
        process(A, B, CLK) 
        begin 
            if A(i) = '1' then 
                Result_buffer((input_size - 1 + i) downto i) <= Result_buffer((input_size - 1 + i) downto i) xor B(input_size - 1 downto 0); 
            end if; 
        end process; 
    end generate mult; 
    
end Behavioral;

