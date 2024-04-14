library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.all;

package util_pkg is
    type slv_array is array(natural range <>) of std_logic_vector;
    function ceil_log2(value : natural) return natural;
end package;

package body util_pkg is
    function ceil_log2(value : natural) return natural is
    begin
        return natural(ceil(log2(real(value))));
    end function;
end util_pkg;