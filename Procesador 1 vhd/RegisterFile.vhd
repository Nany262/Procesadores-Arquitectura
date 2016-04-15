----------------------------------------------------------------------------------
-- Company: UTP
-- Engineer: Vanessa Penagos & Daniela Zuluaga
-- 
-- Create Date:    17:05:24 04/01/2016 
-- Module Name:    Sumador - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RegisterFile is
    Port ( Rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Rsd : in  STD_LOGIC_VECTOR (4 downto 0);
           DataToWrite : in  STD_LOGIC_VECTOR (31 downto 0);
           Crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Crs2 : out  STD_LOGIC_VECTOR (31 downto 0);
			  rst: in STD_LOGIC);
end RegisterFile;

architecture Behavioral of RegisterFile is 

    type ram_type is array (0 to 39) of std_logic_vector (31 downto 0);                 
    signal RAM : ram_type := ("00000000000000000000000000011111", "00000000000000000000000000000010", "00000000000000000000000000000011", "00000000000000000000000000000100", "00000000000000000000000000000101", "00000000000000000000000000000111",
                             "00000000000000000000000000001000", "00000000000000000000000000001001", "00000000000000000000000000001010", "10000000000000000000000000001010", "00000000000000000000000000001011", "00000000000000000000000000001100",
									  "00000000000000000000000000001101", "00000000000000000000000000001110", "00000000000000000000000000001111", "00000000000000000000000000010000", "00000000000000000000000000010001", "00000000000000000000000000010010",
									  "00000000000000000000000000010011", "00000000000000000000000000010100", "00000000000000000000000000010101", "00000000000000000000000000010111", "00000000000000000000000000011000", "00000000000000000000000000011001",
									  "00000000000000000000000000011010", "00000000000000000000000000011011", "00000000000000000000000000011100", "00000000000000000000000000011101", "00000000000000000000000000011110", "00000000000000000000000000011111",
									  "00000000000000000000000000001000", "00000000000000000000000000001001","00000000000000000000000000001010", "00000000000000000000000000001010", "00000000000000000000000000001011", "00000000000000000000000000001001",
									  "00000000000000000000000000001010", "00000000000000000000000000001010", "00000000000000000000000000001011", "00000000000000000000000000001011");                        	
begin

		process(Rs1,Rs2,Rsd,DataToWrite,rst)
			begin	
					if(rst = '1')then
						Crs1 <= (others => '0');
						Crs2 <= (others => '0');
					else
						Crs1 <= RAM(conv_integer(Rs1));
						Crs2 <= RAM(conv_integer(Rs2));
						if (rsd /= "00000")then
								RAM(conv_integer(Rsd))<= DataToWrite;
						end if;
					end if;
		end process;
end Behavioral;

