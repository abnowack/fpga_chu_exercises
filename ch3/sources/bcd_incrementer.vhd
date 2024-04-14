----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/20/2023 05:02:06 PM
-- Design Name: 
-- Module Name: bcd_incrementer - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bcd_incrementer is
    port (
        val_in : in std_logic_vector(3 downto 0) := (others => '0');
        val_out : out std_logic_vector(3 downto 0) := (others => '0');
        carry : out std_logic := '0'
    );
end bcd_incrementer;

architecture Behavioral of bcd_incrementer is
    
begin

    with val_in select
        val_out <=
            "0001" when "0000", -- 1 <= 0
            "0010" when "0001", -- 2 <= 1
            "0011" when "0010", -- 3 <= 2
            "0100" when "0011", -- 4 <= 3
            "0101" when "0100", -- 5 <= 4
            "0110" when "0101", -- 6 <= 5
            "0111" when "0110", -- 7 <= 6
            "1000" when "0111", -- 8 <= 7
            "1001" when "1000", -- 9 <= 8
            "0000" when "1001", -- 0 <= 9
            "0000" when others;

    carry <= '1' when (val_in = "1001") else '0';

end Behavioral;
