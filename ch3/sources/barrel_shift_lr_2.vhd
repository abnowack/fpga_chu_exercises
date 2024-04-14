----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/13/2023 02:55:44 AM
-- Design Name: 
-- Module Name: barrel_shift_lr_2 - Behavioral
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
  use IEEE.STD_LOGIC_1164.all;

  -- Uncomment the following library declaration if using
  -- arithmetic functions with Signed or Unsigned values
  --use IEEE.NUMERIC_STD.ALL;
  -- Uncomment the following library declaration if instantiating
  -- any Xilinx leaf cells in this code.
  --library UNISIM;
  --use UNISIM.VComponents.all;

entity barrel_shift_lr_2 is
  port (a   : in  STD_LOGIC_VECTOR(7 downto 0);
        amt : in  STD_LOGIC_VECTOR(2 downto 0);
        dir : in  STD_LOGIC; -- '1' = right, '0' = left
        y   : out STD_LOGIC_VECTOR(7 downto 0));
end entity;

architecture Behavioral of barrel_shift_lr_2 is
  signal a_in         : STD_LOGIC_VECTOR(7 downto 0);
  signal y_out : std_logic_vector(7 downto 0);
begin

  a_gen: for i in 0 to 7 generate
    a_in(i) <= a(7-i) when dir = '0' else a(i);
  end generate;

  shift_r: entity work.barrel_shift_r
    port map (
      a   => a_in,
      amt => amt,
      y   => y_out
    );
  
    y_gen: for i in 0 to 7 generate
      y(i) <= y_out(7-i) when dir = '0' else y_out(i);
    end generate;

end architecture;
