----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/09/2023 10:30:21 PM
-- Design Name: 
-- Module Name: decoder_top - Behavioral
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

entity decoder_top is
  Port ( 
    sw : in std_logic_vector(15 downto 0);
    led : out std_logic_vector(15 downto 0)
  );
end decoder_top;

architecture Behavioral of decoder_top is

begin
    decoder_entity : entity work.decoder_4_to_16
        port map(
            en => sw(15),
            a => sw(3 downto 0),
            bcode => led(15 downto 0)
        );
end Behavioral;
