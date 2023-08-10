----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/09/2023 11:12:53 PM
-- Design Name: 
-- Module Name: decoder_4_to_16 - Behavioral
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

entity decoder_4_to_16 is
    Port ( en : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (3 downto 0);
           bcode : out STD_LOGIC_VECTOR (15 downto 0));
end decoder_4_to_16;

architecture Behavioral of decoder_4_to_16 is
    signal en_decode : std_logic_vector(3 downto 0);
begin

    decode_en : entity work.decoder_2_to_4
        port map(
            en => en,
            a => a(3 downto 2),
            bcode => en_decode
        ); 
    
    decode_1 : entity work.decoder_2_to_4
        port map(
            en => en_decode(0),
            a => a(1 downto 0),
            bcode => bcode(3 downto 0)
        );
        
    decode_2 : entity work.decoder_2_to_4
        port map(
            en => en_decode(1),
            a => a(1 downto 0),
            bcode => bcode(7 downto 4)
        );

    decode_3 : entity work.decoder_2_to_4
        port map(
            en => en_decode(2),
            a => a(1 downto 0),
            bcode => bcode(11 downto 8)
        );
        
    decode_4 : entity work.decoder_2_to_4
        port map(
            en => en_decode(3),
            a => a(1 downto 0),
            bcode => bcode(15 downto 12)
        );


end Behavioral;
