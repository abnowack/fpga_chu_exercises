----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/21/2023 07:56:09 AM
-- Design Name: 
-- Module Name: fp_gt - Behavioral
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

entity fp_gt is
    port (
        sign1, sign2 : in std_logic;
        exp1, exp2 : in std_logic_vector(3 downto 0);
        frac1, frac2 : in std_logic_vector(7 downto 0);
        gt : out std_logic
    );
end fp_gt;

architecture Behavioral of fp_gt is

begin

    process
    begin
    
        if (sign1 = '1') and (sign2 = '0') then -- 1 negative, 2 positive
            -- test if zero
            gt <= '0';
        elsif (sign1 = '0') and (sign2 = '1') then -- 1 positive, 2 negative
            -- test if zero
            if (or frac1) or (or frac2) then
                gt <= '1';
            else
                gt <= '0';
            end if;
        elsif (sign1 = '1') and (sign2 = '1') then -- both negative
            if (exp2 & frac2) > (exp1 & frac1) then
                gt <= '1';
            else
                gt <= '0';
            end if;
        else -- (sign1 = '0') and (sign2 = '0') -- both positive
            if (exp1 & frac1) > (exp2 & frac2) then
                gt <= '1';
            else
                gt <= '0';
            end if;
        end if;
    
    end process;

end Behavioral;
