----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/13/2023 01:44:07 AM
-- Design Name: 
-- Module Name: barrel_shift_l - Behavioral
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

entity barrel_shift_l is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           amt : in STD_LOGIC_VECTOR (2 downto 0);
           y : out STD_LOGIC_VECTOR (7 downto 0));
end barrel_shift_l;

architecture Behavioral of barrel_shift_l is
    signal s0, s1 : std_logic_vector(7 downto 0);
begin
    s0 <= a(6 downto 0) & a(7) when amt(0) = '1' else a; 
    s1 <= s0(5 downto 0) & s0(7 downto 6) when amt(1) = '1' else s0;
    y <= s1(3 downto 0) & s1(7 downto 4) when amt(2) = '1' else s1;
end Behavioral;
