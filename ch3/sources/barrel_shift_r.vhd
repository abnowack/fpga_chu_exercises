library IEEE;
  use IEEE.STD_LOGIC_1164.all;

entity barrel_shift_r is
  port (a   : in  STD_LOGIC_VECTOR(7 downto 0);
        amt : in  STD_LOGIC_VECTOR(2 downto 0);
        y   : out STD_LOGIC_VECTOR(7 downto 0));
end entity;

architecture Behavioral of barrel_shift_r is
  signal s0, s1, s2 : std_logic_vector(7 downto 0);
begin
  s0 <= a(0) & a(7 downto 1) when amt(0) = '1' else a;
  s1 <= s0(1 downto 0) & s0(7 downto 2) when amt(1) = '1' else s0;
  s2 <= s1(3 downto 0) & s1(7 downto 4) when amt(2) = '1' else s1;
  y  <= s2;
end architecture;
