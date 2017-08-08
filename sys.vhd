library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity sys is
	port(
		  scan  :out std_logic_vector(3 downto 0);
		  datain    :in std_logic_vector(3 downto 0);
		  clk:in std_logic;
		  slctout :out std_logic;
		  dataout:out std_logic_vector(6 downto 0)
		  );
end sys;

architecture arch_sys of sys is
	component counter is
	port(
		clkin:in std_logic;
		clkout:out std_logic_vector(1 downto 0)
	);
	end component;
	component decoder IS
	PORT (
           input:in std_logic_vector( 1 downto 0);            
			  output: out STD_LOGIC_VECTOR(3 DOWNTO 0)); 
	end component;
	component reader IS
	PORT (
           clk_in:in std_logic_vector( 1 downto 0);            
			  num_in:in std_LOGIC_VECTOR(3 downto 0);
			  num_out: out STD_LOGIC_VECTOR(3 DOWNTO 0); 
			  state_out: out std_LOGIC);
	end component;
	component display is
	PORT (
           input:in std_logic_vector( 3 downto 0);
			  state:in std_logic;
			  output: out STD_LOGIC_VECTOR(6 DOWNTO 0)); 
	end component;
	signal data:std_logic_vector(3 downto 0);
	signal count:std_LOGIC_VECTOR(1 downto 0);
	signal state:std_logic;
	signal num:std_LOGIC_VECTOR(3 downto 0);
	begin
		u0:counter port map(clk,count);
		u1:decoder port map(count,scan);
		u2:reader port map(count,datain,num,state);
		u3:display port map(num,state,dataout);
	u4:process(datain)
	begin
		slctout<='1';
	end process;
end arch_sys;