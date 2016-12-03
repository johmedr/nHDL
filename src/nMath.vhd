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
use work.nProperties.all;
package nMath is

     type vector is array (integer range <>) of integer; 
     type matrix is array (0 to matrix_dimension(0) - 1) of vector(0 to matrix_dimension(1) - 1); 
     function t (signal a : matrix) return matrix; 

     function "*" (signal a, b : vector) return integer; 
     function "*" (signal a, b : vector) return matrix; 
     function "*" (signal a, b : matrix) return matrix; 
--     
-- --     function "+" (signal a, b : vector) return vector; 
--     function "+" (signal a, b : matrix) return matrix; 
-- --     
--     function inv (signal a : matrix) return matrix; 
-- type <new_type> is
--  record
--    <type_name>        : std_logic_vector( 7 downto 0);
--    <type_name>        : std_logic;
-- end record;
--
-- Declare constants
--
-- constant <constant_name>		: time := <time_unit> ns;
-- constant <constant_name>		: integer := <value;
--
-- Declare functions and procedure
--
-- function <function_name>  (signal <signal_name> : in <type_declaration>) return <type_declaration>;
-- procedure <procedure_name> (<type_declaration> <constant_name>	: in <type_declaration>);
--

end nMath;

package body nMath is
    
    function "*"(signal a, b : vector) return integer is 
    -- a is considered as a row vector
    -- b is considered as a column vector
        variable c : integer := 0; 
    begin 
        for i in a'range loop
                c := a(i) * b(i) + c; 
        end loop; 
        return c;
    end "*"; 
    
    function "*" (signal a, b : vector) return matrix is 
    -- a is considered as a column vector
    -- b is considered as a row vector
        variable c : matrix;
    begin 
        for i in a'range loop
            for j in b'range loop 
                c(i)(j) := a(i) * b(j); 
            end loop; 
        end loop; 
		return c;
    end "*"; 
     
	   function t (signal a : matrix) return matrix is 
		variable c : matrix; 
	  begin 
		for i in a'range loop 
			for j in a(0)'range loop 
				c(i)(j) := a(j)(i);
			end loop; 
		end loop; 
		return c;
	  end t; 
	  
     function "*" (signal a, b : matrix) return matrix is
         variable c : matrix; 
			variable bt : matrix; 
     begin 
			bt := t(b) ;
         for i in a'range loop 
				for j in b'range loop 
					c(i) := a(i) * bt(i);
				end loop; 
         end loop; 
         return c; 
     end "*"; 
	  
	 
--     
-- --     function "+" (signal a, b : vector) return vector is 
-- --     -- a and b must be same dimension 
--     
--     function "+" (signal a, b : matrix) return matrix is 
--     -- a and b must have same dimensions 
--         variable c : matrix(a'range(0), b'range(0)); 
--     begin 
--         for i in a'range(0) loop 
--             for j in a'range(1) loop 
--                 c(i, j) := a(i, j) + b(i ,j); 
--             end loop;
--         end loop; 
--     end "+";
--             
     
     
--     function inv (signal a : matrix) return matrix; 
---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 
end nMath;
