----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/09/2023 10:26:54 PM
-- Design Name: 
-- Module Name: decoder_2_to_4 - Behavioral
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

entity decoder_2_to_4 is
    Port ( en : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (1 downto 0);
           bcode : out STD_LOGIC_VECTOR (3 downto 0));
end decoder_2_to_4;

architecture Behavioral of decoder_2_to_4 is

begin
    bcode(0) <= en and (not a(0) and not a(1));
    bcode(1) <= en and (a(0) and not a(1));
    bcode(2) <= en and (not a(0) and a(1));
    bcode(3) <= en and (a(0) and a(1));
end Behavioral;
