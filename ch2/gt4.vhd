----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/09/2023 10:01:16 PM
-- Design Name: 
-- Module Name: gt4 - Behavioral
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

entity gt4 is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           gt : out STD_LOGIC);
end gt4;

architecture Behavioral of gt4 is
    signal gt01, gt23, eq01 : std_logic;
begin
    gt_bit01 : entity work.gt2
        port map(
            a => a(3 downto 2),
            b => b(3 downto 2),
            gt => gt01
        );
    
    gt_bit23 : entity work.gt2
        port map(
            a => a(1 downto 0),
            b => b(1 downto 0),
            gt => gt23
        );
    
    eq_bit01 : entity work.eq2
        port map(
            a => a(3 downto 2),
            b => b(3 downto 2),
            aeqb => eq01
        );
    
    gt <= gt01 or (eq01 and gt23);

end Behavioral;
