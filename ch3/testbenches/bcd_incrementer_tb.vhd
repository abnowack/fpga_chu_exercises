----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/20/2023 05:54:22 PM
-- Design Name: 
-- Module Name: bcd_incrementer_tb - Behavioral
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

entity bcd_incrementer_tb is
    generic (
      CLOCK_PERIOD : time := 2 ns
    );
end bcd_incrementer_tb;

architecture Behavioral of bcd_incrementer_tb is
    signal val_in_1 : std_logic_vector(3 downto 0);
    signal val_out_1 : std_logic_vector(3 downto 0);
    signal carry_1 : std_logic;
    
    signal val_in_3 : std_logic_vector(11 downto 0);
    signal val_out_3 : std_logic_vector(11 downto 0);
begin

    digit : entity work.bcd_incrementer
    port map(
        val_in => val_in_1,
        val_out => val_out_1,
        carry => carry_1
    );
    
    digit3 : entity work.bcd_incrementer_3digit
    port map(
        val_in => val_in_3,
        val_out => val_out_3
    );
 
    process
        type bcd_array_t is array (0 to 9) of std_logic_vector(3 downto 0);
        variable bcd_digits : bcd_array_t := ("0000", "0001", "0010", "0011", "0100", "0101", "0110", "0111", "1000", "1001");
        
        type test_values_t is array (natural range <>) of natural;
        variable test_values : test_values_t(0 to 4) := (259, 100, 000, 999, 899);
        variable test_digits : test_values_t(0 to 2) := (0, 0, 0);
        variable val_out_digits : test_values_t(0 to 3);
    begin
    
    for i in bcd_digits'range loop
        wait for CLOCK_PERIOD;
        val_in_1 <= bcd_digits(i);
        wait for CLOCK_PERIOD;
        report to_string(val_in_1) & "(" & to_string(to_integer(unsigned(val_in_1))) &  ") | " 
             & to_string(val_out_1) & "(" & to_string(to_integer(unsigned(val_out_1))) & ")";
    end loop;
    
    for i in test_values'range loop
        test_digits(0) := (test_values(i) / 100);
        test_digits(1) := (test_values(i) rem 100) / 10;
        test_digits(2) := test_values(i) rem 10;
        val_in_3(11 downto 8) <= std_logic_vector(to_unsigned(test_digits(0), 4));
        val_in_3(7 downto 4) <= std_logic_vector(to_unsigned(test_digits(1), 4));
        val_in_3(3 downto 0) <= std_logic_vector(to_unsigned(test_digits(2), 4));
        wait for CLOCK_PERIOD;
        val_out_digits(0) := to_integer(unsigned(val_out_3(11 downto 8)));
        val_out_digits(1) := to_integer(unsigned(val_out_3(7 downto 4)));
        val_out_digits(2) := to_integer(unsigned(val_out_3(3 downto 0)));
        report to_string(test_digits(0)) & to_string(test_digits(1)) & to_string(test_digits(2)) & " | "
             & to_string(val_out_digits(0)) & to_string(val_out_digits(1)) & to_string(val_out_digits(2));
    end loop;
    
    report "Simulation Finished." severity failure;
    end process;

end Behavioral;
