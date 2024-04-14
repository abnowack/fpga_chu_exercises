----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/20/2023 05:12:55 PM
-- Design Name: 
-- Module Name: bcd_incrementer_3digit - Behavioral
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

entity bcd_incrementer_3digit is
    port (
        val_in : in std_logic_vector(11 downto 0);
        val_out : out std_logic_vector(11 downto 0)
    );
end bcd_incrementer_3digit;

architecture Behavioral of bcd_incrementer_3digit is
    signal val_inc : std_logic_vector(11 downto 0);
    signal digit_carry : std_logic_vector(2 downto 0) := (others => '0');
begin

    digit_1 : entity work.bcd_incrementer
    port map(
        val_in => val_in(3 downto 0),
        val_out => val_inc(3 downto 0),
        carry => digit_carry(0)
    );
    
    digit_2 : entity work.bcd_incrementer
    port map(
        val_in => val_in(7 downto 4),
        val_out => val_inc(7 downto 4),
        carry => digit_carry(1)
    );
        
    digit_3 : entity work.bcd_incrementer
    port map(
        val_in => val_in(11 downto 8),
        val_out => val_inc(11 downto 8),
        carry => digit_carry(2)
    );
    
    val_out(3 downto 0) <= val_inc(3 downto 0);
    val_out(7 downto 4) <= val_inc(7 downto 4) when (digit_carry(0) = '1') else val_in(7 downto 4);
    val_out(11 downto 8) <= val_inc(11 downto 8) when (digit_carry(1) = '1') else val_in(11 downto 8);

end Behavioral;
