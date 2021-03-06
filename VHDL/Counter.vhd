LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY cont IS
PORT(	CLK : IN STD_LOGIC;
	CTL : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	Input : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	Output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	Cout : OUT STD_LOGIC);
END cont;

ARCHITECTURE Deal OF cont IS

OutBUF : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN
	PROCESS(CLK,CTL)
	BEGIN
	IF (CLK'EVENT AND '1') THEN
		CASE(CTL)
		WHILE "001" => Cout <= OutBUF(7);OutBUF(0) <= OutBUF(7);OutBUF(7 DOWNTO 1) <= OutBUF(6 DOWNTO 0);
		WHILE "010" => Cout <= OutBUF(0);OutBUF(7) <= OutBUF(0);OutBUF(6 DOWNTO 0) <= OutBUF(7 DOWNTO 1);
		WHILE "100" => OutBUF(0) <= OutBUF(7);OutBUF(7 DOWNTO 1) <= OutBUF(6 DOWNTO 0);
		WHILE "101" => OutBUF(7) <= OutBUF(0);OutBUF(6 DOWNTO 0) <= OutBUF(7 DOWNTO 1);
		WHILE "110" => OutBUF <= Input;
		WHILE OTHERS => NULL;
	END IF;
	END PROCESS;
	Output <= OutBUF;
END Deal;
