--*****************************************************************************
--*
--* Name: MirroredSegments
--* Designer: Scott Tippens
--*
--*     This component will drive a seven-segment LED in one of two
--*     possible modes:
--*
--*         (1) Normal
--*         (2) Mirrored
--*
--*     When in normal mode, the 4-bit binary Switch input will cause
--*     the 7-segment LEDs to display the corresponding hexidecimal
--*     number. In mirrored mode the LEDs will display the mirror image
--*     of the hexidecimal number.
--*
--*     Modes are selected with a mode signal. When active (HIGH) we
--*     are in mirrored mode. When released we are in normal mode.
--*
--*     The design is divided into three functional blocks. The first
--*     two blocks convert the input into either a normal or mirrored
--*     7-segment representation. The third functional block uses the
--*     mode signal to select between the two representations.
--*
--*****************************************************************************
library ieee;
use ieee.std_logic_1164.all;


entity MirroredSegments is
    port(
        value:    in  std_logic_vector(3 downto 0);
        mode:     in  std_logic;                    -- HIGH = mirror mode
        sevenSeg: out std_logic_vector(6 downto 0)  -- MSB=a: LSB=g
    );
end MirroredSegments;



architecture MirroredSegments_ARCH of MirroredSegments is

    ----mode----------------------------------------------------------CONSTANTS
    constant MIRROR_MODE: std_logic := '1';

    ----normal-seven-segment-display----------------------------------CONSTANTS
    constant BLANK_7SEG: std_logic_vector(6 downto 0) := "1111111";
    constant ZERO_7SEG:  std_logic_vector(6 downto 0) := "0000001";
    constant ONE_7SEG:   std_logic_vector(6 downto 0) := "1001111";
    constant TWO_7SEG:   std_logic_vector(6 downto 0) := "0010010";
    constant THREE_7SEG: std_logic_vector(6 downto 0) := "0000110";
    constant FOUR_7SEG:  std_logic_vector(6 downto 0) := "1001100";
    constant FIVE_7SEG:  std_logic_vector(6 downto 0) := "0100100";
    constant SIX_7SEG:   std_logic_vector(6 downto 0) := "0100000";
    constant SEVEN_7SEG: std_logic_vector(6 downto 0) := "0001111";
    constant EIGHT_7SEG: std_logic_vector(6 downto 0) := "0000000";
    constant NINE_7SEG:  std_logic_vector(6 downto 0) := "0001100";
    constant A_7SEG:     std_logic_vector(6 downto 0) := "0001000";
    constant B_7SEG:     std_logic_vector(6 downto 0) := "1100000";
    constant C_7SEG:     std_logic_vector(6 downto 0) := "0110001";
    constant D_7SEG:     std_logic_vector(6 downto 0) := "1000010";
    constant E_7SEG:     std_logic_vector(6 downto 0) := "0110000";
    constant F_7SEG:     std_logic_vector(6 downto 0) := "0111000";

    ----mirror-seven-segment-display----------------------------------CONSTANTS
    constant ZERO_7SEG_MIRROR:  std_logic_vector(6 downto 0) := "0000001";
    constant ONE_7SEG_MIRROR:   std_logic_vector(6 downto 0) := "1111001";
    constant TWO_7SEG_MIRROR:   std_logic_vector(6 downto 0) := "0100100";
    constant THREE_7SEG_MIRROR: std_logic_vector(6 downto 0) := "0110000";
    constant FOUR_7SEG_MIRROR:  std_logic_vector(6 downto 0) := "1011000";
    constant FIVE_7SEG_MIRROR:  std_logic_vector(6 downto 0) := "0010010";
    constant SIX_7SEG_MIRROR:   std_logic_vector(6 downto 0) := "0000010";
    constant SEVEN_7SEG_MIRROR: std_logic_vector(6 downto 0) := "0111001";
    constant EIGHT_7SEG_MIRROR: std_logic_vector(6 downto 0) := "0000000";
    constant NINE_7SEG_MIRROR:  std_logic_vector(6 downto 0) := "0011000";
    constant A_7SEG_MIRROR:     std_logic_vector(6 downto 0) := "0001000";
    constant B_7SEG_MIRROR:     std_logic_vector(6 downto 0) := "1000010";
    constant C_7SEG_MIRROR:     std_logic_vector(6 downto 0) := "0000111";
    constant D_7SEG_MIRROR:     std_logic_vector(6 downto 0) := "1100000";
    constant E_7SEG_MIRROR:     std_logic_vector(6 downto 0) := "0000110";
    constant F_7SEG_MIRROR:     std_logic_vector(6 downto 0) := "0001110";

    ----internal-connections--------------------------------------------SIGNALS
    signal normalSegs: std_logic_vector(6 downto 0);
    signal mirrorSegs: std_logic_vector(6 downto 0);


begin
    --*************************************************************************
    --* NORMAL_SEGS                                                           *
    --*     Convert switch input into normal 7-segement representation        *
    --*************************************************************************
    with value select
        normalSegs <= ZERO_7SEG  when "0000",
                      ONE_7SEG   when "0001",
                      TWO_7SEG   when "0010",
                      THREE_7SEG when "0011",
                      FOUR_7SEG  when "0100",
                      FIVE_7SEG  when "0101",
                      SIX_7SEG   when "0110",
                      SEVEN_7SEG when "0111",
                      EIGHT_7SEG when "1000",
                      NINE_7SEG  when "1001",
                      A_7SEG     when "1010",
                      B_7SEG     when "1011",
                      C_7SEG     when "1100",
                      D_7SEG     when "1101",
                      E_7SEG     when "1110",
                      F_7SEG     when others;


    --*************************************************************************
    --* MIRROR_SEGS                                                           *
    --*     Convert switch input into mirror 7-segement representation        *
    --*************************************************************************
    with value select
        mirrorSegs <= ZERO_7SEG_MIRROR  when "0000",
                      ONE_7SEG_MIRROR   when "0001",
                      TWO_7SEG_MIRROR   when "0010",
                      THREE_7SEG_MIRROR when "0011",
                      FOUR_7SEG_MIRROR  when "0100",
                      FIVE_7SEG_MIRROR  when "0101",
                      SIX_7SEG_MIRROR   when "0110",
                      SEVEN_7SEG_MIRROR when "0111",
                      EIGHT_7SEG_MIRROR when "1000",
                      NINE_7SEG_MIRROR  when "1001",
                      A_7SEG_MIRROR     when "1010",
                      B_7SEG_MIRROR     when "1011",
                      C_7SEG_MIRROR     when "1100",
                      D_7SEG_MIRROR     when "1101",
                      E_7SEG_MIRROR     when "1110",
                      F_7SEG_MIRROR     when others;


    --*************************************************************************
    --* SEVEN_SEG                                                             *
    --*     Drive the 7-segment display with the appropriate signals          *
    --*     depending upon the mode selected.                                 *
    --*************************************************************************
    with mode select
        sevenSeg <= mirrorSegs when MIRROR_MODE,
                    normalSegs when others;


end MirroredSegments_ARCH;
