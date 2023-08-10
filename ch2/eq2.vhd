----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/08/2023 11:52:15 PM
-- Design Name: 
-- Module Name: eq2 - Behavioral
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

entity eq2 is
    Port ( a : in STD_LOGIC_VECTOR (1 downto 0);
           b : in STD_LOGIC_VECTOR (1 downto 0);
           aeqb : out STD_LOGIC);
end eq2;

architecture Behavioral of eq2 is
    signal e0, e1 : std_logic;
begin
    eq_bit0 : entity work.eq1
        port map(
            i0 => a(0),
            i1 => b(0),
            eq => e0
        );
    
    eq_bit1 : entity work.eq1
        port map(
            i0 => a(1),
            i1 => b(1),
            eq => e1
        );
    aeqb <= e0 and e1;
end Behavioral;
