----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/02/2023 11:20:27 PM
-- Design Name: 
-- Module Name: dual_encoder_tb - Behavioral
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
use IEEE.std_logic_textio.all;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dual_encoder_tb is
    generic (
      CLOCK_PERIOD : time := 2 ns
    );
end dual_encoder_tb;

architecture Behavioral of dual_encoder_tb is
    signal clk : std_logic := '0';
    signal req : std_logic_vector(11 downto 0);
    signal first : std_logic_vector(3 downto 0);
    signal second : std_logic_vector(3 downto 0);
begin
    clk <= not clk after CLOCK_PERIOD / 2;
    
    dual_encoder : entity work.dual_encoder
    port map
    (
        req => req,
        first => first,
        second => second
    );
    
    process
    begin
    
    req <= "0000" & "1111" & "00" & "11";
    wait for CLOCK_PERIOD;
    report to_string(req) & " | " & to_string(first) & ", " & to_string(second);
    
    req <= "0000" & "1111" & "11" & "00";
    wait for CLOCK_PERIOD;
    report to_string(req) & " | " & to_string(first) & ", " & to_string(second);
    
    report "Simulation Finished." severity failure;
    end process;

end Behavioral;
