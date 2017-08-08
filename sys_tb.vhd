LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE ieee.std_logic_unsigned.all;  
ENTITY sys_tb IS
END sys_tb;
architecture arch_sys_tb of sys_tb is
	component sys is
	port(
		  scan  :out std_logic_vector(3 downto 0);
		  datain    :in std_logic_vector(3 downto 0);
		  clk:in std_logic;
		  slctout :out std_logic;
		  dataout:out std_logic_vector(6 downto 0)
		  );
	end component;
	signal scan_n :std_logic_vector(3 downto 0);
	signal datain_n   :std_logic_vector(3 downto 0);
	signal clk_n:std_logic;
	signal slctout_n :std_logic;
	signal dataout_n:std_logic_vector(6 downto 0);
begin
	u0:sys port map(scan_n,datain_n,clk_n,slctout_n,dataout_n);
	clk_stimulus:process
	begin
		clk_n <= '0';
		wait for 10 ns;
		clk_n <= '1';
		wait for 10 ns;
	end process clk_stimulus;
	others_stimulus:process
	begin
		wait for 30 ns;
		datain_n<="0111";
		wait for 100 ns;
		datain_n<="1111";
		wait for 220 ns;
		datain_n<="1011";
		wait for 10 ns;
		datain_n<="1111";
		wait for 310 ns;
		datain_n<="1101";
		wait for 10 ns;
		datain_n<="1111";
		wait for 310 ns;
		datain_n<="1110";
		wait for 10 ns;
		datain_n<="1111";
		wait for 310 ns;
	end process;
end arch_sys_tb;
