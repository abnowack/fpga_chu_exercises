library IEEE;
  use IEEE.STD_LOGIC_1164.all;
  use IEEE.numeric_std.all;

entity hex_to_sseg_test is
  port (
    clk  : in  std_logic;
    sw   : in  std_logic_vector(7 downto 0);
    an   : out std_logic_vector(3 downto 0);
    sseg : out std_logic_vector(7 downto 0)
  );
end entity;

architecture Behavioral of hex_to_sseg_test is
  signal inc        : std_logic_vector(7 downto 0);
  signal led1, led0 : std_logic_vector(7 downto 0);
  signal led3, led2 : std_logic_vector(7 downto 0);
begin

  inc <= std_logic_vector(unsigned(sw) + 1);

  sseg_unit_0: entity work.hex_to_sseg
    port map (
      hex  => sw(3 downto 0),
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
      hex  => inc(3 downto 0),
      dp   => '1',
      sseg => led2
    );

  sseg_unit_3: entity work.hex_to_sseg
    port map (
      hex  => inc(7 downto 4),
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

end architecture;
