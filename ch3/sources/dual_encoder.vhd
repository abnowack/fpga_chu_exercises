----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/02/2023 10:49:13 PM
-- Design Name: 
-- Module Name: dual_encoder - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dual_encoder is
  Port (
    req : in std_logic_vector(11 downto 0);
    first : out std_logic_vector(3 downto 0);
    second : out std_logic_vector(3 downto 0)
   );
end dual_encoder;

architecture Behavioral of dual_encoder is
    signal priority_a, priority_b : unsigned(1 downto 0);
    signal code_a, code_b : std_logic_vector(3 downto 0);
begin
    code_a <= req(11 downto 8);
    code_b <= req(7 downto 4);
    priority_a <= unsigned(req(3 downto 2));
    priority_b <= unsigned(req(1 downto 0));
    
    first <= code_a when priority_a >= priority_b else code_b;
    second <= code_b when priority_a >= priority_b else code_a;
end Behavioral;
