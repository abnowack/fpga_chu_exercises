library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clock_test is
    port (
        clk : in std_logic;
        ja_top : out std_logic_vector(4 downto 1)
    );
end clock_test;

architecture Behavioral of clock_test is
component clk_wiz_0
port
 (-- Clock in ports
  -- Clock out ports
  clk_out1          : out    std_logic;
  clk_out2          : out    std_logic;
  clk_out3          : out    std_logic;
  clk_out4          : out    std_logic;
  clk_in1           : in     std_logic
 );
end component;


begin

clock_network : clk_wiz_0
   port map ( 
  -- Clock out ports  
   clk_out1 => ja_top(1),
   clk_out2 => ja_top(2),
   clk_out3 => ja_top(3),
   clk_out4 => ja_top(4),
   -- Clock in ports
   clk_in1 => clk
 );

end Behavioral;
