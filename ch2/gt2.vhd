----------------------------------------------------------------------------------
-- Company: aaron
-- Engineer: 
-- 
-- Create Date: 08/09/2023 09:24:54 PM
-- Design Name: 
-- Module Name: gt1 - Behavioral
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

entity gt2 is
    Port ( a : in STD_LOGIC_VECTOR(1 downto 0);
           b : in STD_LOGIC_VECTOR(1 downto 0);
           gt : out STD_LOGIC);
end gt2;

architecture Behavioral of gt2 is
    signal i0, i1, i2 : STD_LOGIC;
begin
    i0 <= a(1) and not b(1);
    i1 <= a(0) and not b(1) and not b(0);
    i2 <= a(1) and a(0) and not b(0);
    gt <= i0 or i1 or i2;
end Behavioral;
