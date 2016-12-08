--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:46:50 12/03/2016
-- Design Name:   
-- Module Name:   /home/yop/Programmation/VHDL/Projets/nHDL/src/core_test.vhd
-- Project Name:  nHDL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Core
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.nMath.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY core_test IS
END core_test;
 
ARCHITECTURE behavior OF core_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Core
    PORT(
			D : OUT matrix; 
         CLK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';

 	--Outputs
	signal D : matrix;

   -- Clock period definitions
   constant CLK_period : time := 10ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Core PORT MAP (
			 D => D, 
          CLK => CLK
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 
		
      wait;
   end process;

END;
