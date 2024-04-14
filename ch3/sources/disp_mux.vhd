library IEEE;
  use IEEE.STD_LOGIC_1164.all;
  use IEEE.numeric_std.all;

entity disp_mux is
  port (
    clk   : in  std_logic;
    reset : in  std_logic;
    in0   : in  std_logic_vector(7 downto 0);
    in1   : in  std_logic_vector(7 downto 0);
    in2   : in  std_logic_vector(7 downto 0);
    in3   : in  std_logic_vector(7 downto 0);
    an    : out std_logic_vector(3 downto 0);
    sseg  : out std_logic_vector(7 downto 0)
  );
end entity;

architecture Behavioral of disp_mux is
  constant N : integer := 10;
  signal q_reg  : unsigned(N - 1 downto 0);
  signal q_next : unsigned(N - 1 downto 0);
  signal sel    : std_logic_vector(1 downto 0);
begin
  process (clk, reset)
  begin
    if reset = '1' then
      q_reg <= (others => '0');
    elsif (clk'event and clk = '1') then
      q_reg <= q_next;
    end if;
  end process;

  q_next <= q_reg + 1;
  sel    <= std_logic_vector(q_reg(N - 1 downto N - 2));

  process (sel, in0, in1, in2, in3)
  begin
    case sel is
      when "00" =>
        an(3 downto 0) <= "1110";
        sseg <= in0;
      when "01" =>
        an(3 downto 0) <= "1101";
        sseg <= in1;
      when "10" =>
        an(3 downto 0) <= "1011";
        sseg <= in2;
      when others =>
        an(3 downto 0) <= "0111";
        sseg <= in3;
    end case;
  end process;
end architecture;
