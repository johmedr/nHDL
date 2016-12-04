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

-- [Types definitions]

    -- [Type]:u_vector (Unconstrained vector) 
    -- Unconstrained vector type contains integers, vector is considered respectively as 
    -- a single row or as a single column, as it is needed for a mathematic operation
    type u_vector is array (integer range <>) of integer; 
    
    -- [Type]:vector 
    -- vector constrained to a size (defined in nProperties).
    subtype vector is u_vector(0 to matrix_dimension(1) - 1); 
    
    -- [Type]:matrix
    -- Matrix type define an array of vectors, and can only be a square form. 
    -- Different matrix types, with different dimensions, can be defined using the same method. Dimensions defined in nProperties.
    type matrix is array (0 to matrix_dimension(0) - 1) of u_vector(0 to matrix_dimension(1) - 1); 
    
-- [Functions definitions] 

    -- [NB]: All these functions and operators only work with signals 
	 -- So it is impossible to use multiples operations without storing temporary 
	 -- evaluated value in a signal.

    -- [Function]:zeros
    -- Create a vector filled with zeros. vector dimensions are the same as above. 
    function zeros return vector; 

    -- [Function]:zeros
    -- Create a matrix filled with zeros. Matrix dimensions are the same as above. 
    function zeros return matrix; 
    
    -- [Function]:eye
    -- Create an eye matrix with the same dimension as above. 
    function eye return matrix; 
    
    -- [Function]:ones
    -- Create a vector filled with zeros. vector dimensions are the same as above. 
    function ones return vector; 
    
    -- [Function]:ones
    -- Create a matrix filled with zeros. Matrix dimensions are the same as above. 
    function ones return matrix; 
    
    -- [Function]:t
    -- Compute the transposed matrix of the parameter. 
    function t (signal a : matrix) return matrix; 
    
    -- [Function]:"*" (dual) 
    -- Compute a scalar times vector product. 
    function "*" (signal a : integer; signal b : vector) return vector;
    
    -- [Function]:"*" (dual) 
    -- Compute a scalar times vector product. 
    function "*" (signal a : vector; signal b : integer) return vector;
    
    -- [Function]:"*" (dual) 
    -- Compute a scalar times matrix product. 
    function "*" (signal a : integer; signal b : matrix) return matrix;
    
    -- [Function]:"*" (dual)
    -- Compute a scalar times matrix product. 
    function "*" (signal a : matrix; signal b : integer) return matrix;
    
    -- [Function]:"*" 
    -- Compute a * b (row * column -> integer) 
    function "*" (signal a, b : vector) return integer; 
    
    -- [Function]:"*"
    -- Compute a * b (column * raw -> matrix)
    function "*" (signal a, b : vector) return matrix; 
    
    -- [Function]:"*"
    -- Compute a * b (matrix * matrix -> matrix) 
    function "*" (signal a, b : matrix) return matrix; 
    
    -- [Function]:"+"
    -- Compute a + b (vector + vector -> vector) 
    function "+" (signal a, b : vector) return vector; 
    
    -- [Function]:"+"
    -- Compute a + b (matrix + matrix -> matrix) 
    function "+" (signal a, b : matrix) return matrix; 

    -- [Function]:"-"
    -- Returns the opposite of a vector. 
    function "-" (signal a : vector) return vector; 
    
    -- [Function]:"-"
    -- Returns the opposite of a matrix.
    function "-" (signal a : matrix) return matrix; 
    
    -- [Function]:"-"
    -- Compute a - b (vector + vector -> vector) 
    function "-" (signal a, b : vector) return vector; 
    
    -- [Function]:"-"
    -- Compute a - b (matrix + matrix -> matrix) 
    function "-" (signal a, b : matrix) return matrix; 
    
    -- [Function]:inv
    -- Returns the invert of the matrix
    --function inv (signal a : matrix) return matrix; 


end nMath;

package body nMath is
-- [Functions definitions] 

    -- [Function]:zeros
    -- Create a vector filled with zeros. vector dimensions are the same as above. 
    function zeros return vector is 
        variable v : vector; 
    begin 
        for i in v'range loop 
            v(i) := 0; 
        end loop; 
        return v; 
    end zeros; 

    -- [Function]:zeros
    -- Create a matrix filled with zeros. Matrix dimensions are the same as above. 
    function zeros return matrix is 
        variable m : matrix; 
    begin 
        for i in m'range loop 
            m(i) := zeros; 
        end loop; 
        return m; 
    end zeros; 
    
    -- [Function]:eye
    -- Create an eye matrix with the same dimension as above. 
    function eye return matrix is 
        variable m : matrix := zeros; 
    begin
        for i in m'range loop 
            m(i)(i) := 1; 
        end loop; 
        return m; 
    end eye; 
    
    -- [Function]:ones
    -- Create a vector filled with zeros. vector dimensions are the same as above. 
    function ones return vector is 
        variable v : vector := zeros; 
    begin 
        for i in v'range loop 
            v(i) := 1; 
        end loop; 
        return v; 
    end ones; 
    
    -- [Function]:ones
    -- Create a matrix filmed with zeros. Matrix dimensions are the same as above. 
    function ones return matrix is 
        variable m : matrix := zeros;  
    begin
        for i in m'range loop 
            m(i) := ones; 
        end loop; 
        return m; 
    end ones; 
    
    -- [Function]:t
    -- Compute the transposed matrix of the parameter
    function t (signal a : matrix) return matrix is 
        variable c : matrix := zeros; 
    begin 
        for i in a'range loop 
            for j in a(0)'range loop 
                    c(i)(j) := a(j)(i);
            end loop; 
        end loop; 
        return c;
    end t; 
    
    -- [Function]:"*"
    -- Compute a scalar times vector product. 
    function "*" (signal a : integer; signal b : vector) return vector is
        variable v : vector := zeros; 
    begin 
        for i in b'range loop 
            v(i) := a * b(i); 
        end loop; 
        return v; 
    end "*";
    
    -- [Function]:"*"
    -- Compute a scalar times vector product. 
    function "*" (signal a : vector; signal b : integer) return vector is
        variable v : vector := zeros; 
    begin 
        for i in a'range loop 
            v(i) := a(i) * b; 
        end loop; 
        return v; 
    end "*";
    
    -- [Function]:"*"
    -- Compute a scalar times matrix product. 
    function "*" (signal a : integer; signal b : matrix) return matrix is 
        variable m : matrix := zeros; 
    begin 
        for i in b'range loop 
            m(i) := a * b(i); 
        end loop; 
        return m; 
    end "*";
    
    -- [Function]:"*"
    -- Compute a scalar times matrix product. 
    function "*" (signal a : matrix; signal b : integer) return matrix is
        variable m : matrix := zeros; 
    begin 
        for i in a'range loop 
            m(i) := a(i) * b; 
        end loop; 
        return m; 
    end "*";
    
    -- [Function]:"*" 
    -- Compute a * b (row * column -> integer) 
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
    
    -- [Function]:"*"
    -- Compute a * b (column * raw -> matrix)
    function "*" (signal a, b : vector) return matrix is 
    -- a is considered as a column vector
    -- b is considered as a row vector
        variable c : matrix := zeros;
    begin 
        for i in a'range loop
            for j in b'range loop 
                c(i)(j) := a(i) * b(j); 
            end loop; 
        end loop; 
		return c;
    end "*"; 
    
    -- [Function]:"*"
    -- Compute a * b (matrix * matrix -> matrix) 
    function "*" (signal a, b : matrix) return matrix is
        variable c : matrix := zeros;  
    begin  
        for i in a'range loop 
           for j in b'range loop 
                    for k in a(0)'range loop 
                    c(i)(j) := (a(i)(k) * b(k)(j)) + c(i)(j);
                    end loop; 
        end loop; 
        end loop; 
        return c; 
    end "*"; 

    -- [Function]:"+"
    -- Compute a + b (vector + vector -> vector) 
    function "+" (signal a, b : vector) return vector is
        variable c : vector := zeros; 
    begin
        for i in a'range loop 
            c(i) := a(i) + b(i); 
        end loop;
		  return c; 
    end "+"; 
    
    -- [Function]:"+"
    -- Compute a + b (matrix + matrix -> matrix) 
    function "+" (signal a, b : matrix) return matrix is
        variable c : matrix := zeros; 
    begin 
        for i in a'range loop
            c(i) := a(i) + b(i); 
        end loop;
		  return c;
    end "+";
      
    -- [Function]:"-"
    -- Returns the opposite of a vector. 
    function "-" (signal a : vector) return vector is 
        variable v : vector := zeros; 
    begin 
        for i in a'range loop 
            v(i) := - a(i); 
        end loop; 
        return v; 
    end "-"; 
    
    -- [Function]:"-"
    -- Returns the opposite of a matrix.
    function "-" (signal a : matrix) return matrix is 
        variable m : matrix := zeros; 
    begin 
        for i in a'range loop 
            m(i) := - a(i); 
        end loop; 
		  return m; 
    end "-"; 
    
    -- [Function]:"-"
    -- Compute a - b (vector + vector -> vector) 
    function "-" (signal a, b : vector) return vector is 
        variable v : vector := zeros; 
    begin 
        for i in a'range loop 
            v(i) := a(i) - b(i); 
        end loop; 
        return v; 
    end "-"; 
    
    -- [Function]:"-"
    -- Compute a - b (matrix + matrix -> matrix) 
    function "-" (signal a, b : matrix) return matrix is
        variable m : matrix := zeros; 
    begin   
        for i in a'range loop 
            m(i) := a(i) - b(i); 
        end loop; 
        return m;
    end "-"; 
     

end nMath;
