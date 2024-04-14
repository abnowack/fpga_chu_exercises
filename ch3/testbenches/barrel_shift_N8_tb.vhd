library IEEE;
  use IEEE.STD_LOGIC_1164.all;
  use IEEE.std_logic_textio.all;
  use IEEE.numeric_std.all;

entity barrel_shift_N8_tb is
  generic (
    CLOCK_PERIOD : time := 2 ns
  );
end entity;

architecture Behavioral of barrel_shift_N8_tb is
  signal input  : std_logic_vector(7 downto 0) := (others => '0');
  signal amt    : std_logic_vector(2 downto 0) := (others => '0');
  signal dir    : std_logic                    := '0';
  signal output : std_logic_vector(7 downto 0) := (others => '0');
  
  procedure TestShift(
    signal input  : in std_logic_vector(7 downto 0);
    signal amt    : in std_logic_vector(2 downto 0);
    signal dir    : in std_logic;
    signal output : in std_logic_vector(7 downto 0)) is
    variable true_answer : std_logic_vector(7 downto 0) := (others => '1');
  begin
    wait for CLOCK_PERIOD;
    true_answer := input rol to_integer(unsigned(amt)) when dir = '0' else
                   input ror to_integer(unsigned(amt));
    wait for CLOCK_PERIOD;
    report "DIR: " & to_string(dir) & 
           " | AMT : " & to_string(amt) & 
           " | Input: " & to_string(input) & 
           " | Output: " & to_string(output) & 
           " (" & to_string(true_answer) & ")";
    assert output = true_answer report "MISMATCH" severity error;
  end procedure;
  
begin
  shift_unit: entity work.barrel_shift_lr_N
    generic map ( N => 3 )
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
    dir <= '0';
    TestShift(input, amt, dir, output);
    
    input <= "00100111";
    amt <= "000";
    dir <= '1';
    TestShift(input, amt, dir, output);
    
    input <= "00100111";
    amt <= "001";
    dir <= '0';
    TestShift(input, amt, dir, output);
    
    input <= "00100111";
    amt <= "001";
    dir <= '1';
    TestShift(input, amt, dir, output);

    input <= "00100111";
    amt <= "011";
    dir <= '0';
    TestShift(input, amt, dir, output);
    
    input <= "00100111";
    amt <= "011";
    dir <= '1';
    TestShift(input, amt, dir, output);

    input <= "00100111";
    amt <= "101";
    dir <= '0';
    TestShift(input, amt, dir, output);
    
    input <= "00100111";
    amt <= "101";
    dir <= '1';
    TestShift(input, amt, dir, output);
    
    report "Simulation Finished." severity failure;

  end process;
end architecture;
