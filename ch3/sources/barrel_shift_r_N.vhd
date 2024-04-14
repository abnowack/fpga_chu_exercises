library IEEE;
  use IEEE.STD_LOGIC_1164.all;

entity barrel_shift_r_N is
  generic (
    N : natural := 3
  );
  port (a   : in  STD_LOGIC_VECTOR(2**N-1 downto 0);
        amt : in  STD_LOGIC_VECTOR(N-1 downto 0);
        y   : out STD_LOGIC_VECTOR(2**N-1 downto 0));
end entity;

architecture Behavioral of barrel_shift_r_N is
  type s_arr_t is array(natural range <>) of std_logic_vector;
  signal s : s_arr_t(N downto 0)(2**N-1 downto 0);
begin
  s(0) <= a;
  s_gen: for i in 0 to N-1 generate
    s(i+1) <= s(i)(2**i-1 downto 0) & s(i)(2**N-1 downto 2**i) when amt(i) = '1' else s(i);
  end generate;
--  s(1) <= s(0) & s(0)(7 downto 1) when amt(0) = '1' else s(0);
--  s(2) <= s(1)(1 downto 0) & s(1)(7 downto 2) when amt(1) = '1' else s(1);
--  s(3) <= s(2)(3 downto 0) & s(2)(7 downto 4) when amt(2) = '1' else s(2);
  y  <= s(N);
end architecture;
