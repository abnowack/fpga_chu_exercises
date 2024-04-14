library IEEE;
  use IEEE.STD_LOGIC_1164.all;
  use IEEE.std_logic_textio.all;
  use IEEE.numeric_std.all;

entity barrel_shift_8_tb is
  generic (
    CLOCK_PERIOD : time := 2 ns
  );
end entity;

architecture Behavioral of barrel_shift_8_tb is
  signal input  : std_logic_vector(7 downto 0) := (others => '0');
  signal amt    : std_logic_vector(2 downto 0) := (others => '0');
  signal dir    : std_logic                    := '0';
  signal output : std_logic_vector(7 downto 0) := (others => '0');

  signal true_answer : std_logic_vector(7 downto 0) := (others => '1');
begin
  shift_unit: entity work.barrel_shift_lr
    port map (
      a   => input,
      amt => amt,
      dir => dir,
      y   => output
    );

  process
  begin

    input <= "00100111";
    amt <= "000";
    wait for CLOCK_period;
    true_answer <= input rol to_integer(unsigned(amt));
    wait for CLOCK_period;
    report "AMT : " & to_string(amt) & " | Input: " & to_string(input) & " | Output: " & to_string(output) & " (" & to_string(true_answer) & ")";

    input <= "00100111";
    amt <= "001";
    wait for CLOCK_period;
    report "AMT : " & to_string(amt) & " | Input: " & to_string(input) & " | Output: " & to_string(output);

    input <= "00100111";
    amt <= "011";
    wait for CLOCK_period;
    report "AMT : " & to_string(amt) & " | Input: " & to_string(input) & " | Output: " & to_string(output);

    input <= "00100111";
    amt <= "101";
    wait for CLOCK_period;
    report "AMT : " & to_string(amt) & " | Input: " & to_string(input) & " | Output: " & to_string(output);

    report "Simulation Finished." severity failure;

  end process;
end architecture;
