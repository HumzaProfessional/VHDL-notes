library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity VOTE_SELECT is
  port(
    head_ref: in std_logic;
    ref_1 : in std_logic;
    ref_2 : in std_logic;
    ref_2: in std_logic;
    vote: out std_logic

    );

end VOTE_SELECT

 architecture Behavioral of VOTE_SELECT is
    signal vote_count : integer range 0 to 4;
    signal votes      : std_logic_vector(3 downto 0);
begin
    votes <= head_ref & ref_1 & ref_2 & ref_3;

    -- Count the number of '1's
  process(votes)
     begin
        vote_count <= to_integer(unsigned(votes(0))) +
                     to_integer(unsigned(votes(1))) +
                     to_integer(unsigned(votes(2))) +
                     to_integer(unsigned(votes(3)));
     end process;


    -- Alternatively, manually count
    -- 
    -- Determine the outcome using with-select
    with vote_count select
        vote <= '1' when 3 | 4,                -- Majority '1'
                head_ref when 2,               -- Tie: head_ref's vote
                '0' when 0 | 1,                -- Majority '0'
                'X' when others;               -- Undefined (shouldn't occur)
end Behavioral;
  
 
    
