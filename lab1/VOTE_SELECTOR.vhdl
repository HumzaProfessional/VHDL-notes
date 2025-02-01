library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity VoteSelect is
  port(
    head_ref: in std_logic; -- all 
    ref_1 : in std_logic;
    ref_2 : in std_logic;
    ref_3: in std_logic;
    vote: out std_logic
    );

end VoteSelect;

architecture Behavioral_ARCH of VoteSelect is
    signal votes: std_logic_vector(3 downto 0);
begin
    votes <= head_ref & ref_1 & ref_2 & ref_3; -- each vote is assigned to each bit of votes vector.

  
    with votes select
        vote <= '0' when "0000",  -- 0 '1's: Majority '0'
                '0' when "0001",  --
                '0' when "0010",  
                head_ref when "0011", -- 2 '1's: Tie, use head_ref's vote
                '0' when "0100", 
                head_ref when "0101", -- 2 '1's: Tie
                head_ref when "0110", -- 2 '1's: Tie
                '1' when "0111",  
                '0' when "1000",  
                head_ref when "1001", -- 2 '1's: Tie
                head_ref when "1010", -- 2 '1's: Tie
                '1' when "1011",  -- 
                head_ref when "1100", -- 2 '1's: Tie
                '1' when "1101",  
                '1' when "1110",  
                '1' when "1111",  -- 4 '1's: Majority '1'
                'X' when others;    -- Undefined case
end Behavioral_ARCH;
  
  

    
