----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/13/2023 02:04:54 AM
-- Design Name: 
-- Module Name: barrel_shift_lr - Behavioral
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

entity barrel_shift_lr is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           amt : in STD_LOGIC_VECTOR (2 downto 0);
           dir : in STD_LOGIC;
           y : out STD_LOGIC_VECTOR (7 downto 0));
end barrel_shift_lr;

architecture Behavioral of barrel_shift_lr is
    signal y_l, y_r : STD_LOGIC_VECTOR(7 downto 0);
begin
    shift_l : entity work.barrel_shift_l
        port map(
            a => a,
            amt => amt,
            y => y_l
        ); 
        
    shift_r : entity work.barrel_shift_r
        port map(
            a => a,
            amt => amt,
            y => y_r
        );
    
    y <= y_l when dir = '0' else y_r;
end Behavioral;
