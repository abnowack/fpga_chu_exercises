----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/03/2023 12:02:58 AM
-- Design Name: 
-- Module Name: dual_encoder_top - Behavioral
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

entity dual_encoder_top is
  Port (
    clk  : in  std_logic;
    sw   : in STD_LOGIC_VECTOR(11 downto 0);
    an   : out std_logic_vector(3 downto 0);
    sseg : out std_logic_vector(7 downto 0)
  );
end dual_encoder_top;

architecture Behavioral of dual_encoder_top is
    signal first, second : STD_LOGIC_VECTOR(3 downto 0);
    signal led1, led0 : std_logic_vector(7 downto 0);
    signal led3, led2 : std_logic_vector(7 downto 0);
begin

    dual_encoder : entity work.dual_encoder
    port map (
        req => sw,
        first => first,
        second => second
    );
    
    sseg_unit_0: entity work.hex_to_sseg
      port map (
        hex  => sw(11 downto 8),
        dp   => '0',
        sseg => led0
      );
  
    sseg_unit_1: entity work.hex_to_sseg
      port map (
        hex  => sw(7 downto 4),
        dp   => '0',
        sseg => led1
      );
  
    sseg_unit_2: entity work.hex_to_sseg
      port map (
        hex  => first,
        dp   => '1',
        sseg => led2
      );
  
    sseg_unit_3: entity work.hex_to_sseg
      port map (
        hex  => second,
        dp   => '1',
        sseg => led3
      );
    
      disp_unit: entity work.disp_mux
        port map (
          clk   => clk,
          reset => '0',
          in0   => led0,
          in1   => led1,
          in2   => led2,
          in3   => led3,
          an    => an,
          sseg  => sseg
        );

end Behavioral;
