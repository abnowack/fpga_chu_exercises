----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/09/2023 10:42:44 PM
-- Design Name: 
-- Module Name: decoder_3_to_8 - Behavioral
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

entity decoder_3_to_8 is
    Port ( en : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (2 downto 0);
           bcode : out STD_LOGIC_VECTOR (7 downto 0));
end decoder_3_to_8;

architecture Behavioral of decoder_3_to_8 is
    signal en1, en2 : std_logic;
begin
    en1 <= a(2) and en;
    en2 <= not a(2) and en;
    
    decode_1 : entity work.decoder_2_to_4
        port map(
            en => en1,
            a => a(1 downto 0),
            bcode => bcode(7 downto 4)
        );
        
    decode_2 : entity work.decoder_2_to_4
        port map(
            en => en2,
            a => a(1 downto 0),
            bcode => bcode(3 downto 0)
        );

end Behavioral;
