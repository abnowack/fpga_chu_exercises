----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/13/2023 01:20:01 AM
-- Design Name: 
-- Module Name: barrel_top - Behavioral
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

entity barrel_top is
    Port ( sw : in STD_LOGIC_VECTOR (7 downto 0);
           btn : in STD_LOGIC_VECTOR (3 downto 0);
           led : out STD_LOGIC_VECTOR (7 downto 0));
end barrel_top;

architecture Behavioral of barrel_top is
begin
    shift_unit : entity work.barrel_shift_lr
        port map(
            a => sw,
            amt => btn(3 downto 1),
            dir => btn(0),
            y => led
        );

    -- shift_unit : entity work.barrel_shift_lr_2
    --     port map(
    --         a => sw,
    --         amt => btn(3 downto 1),
    --         dir => btn(0),
    --         y => led
    --     );
end Behavioral;
