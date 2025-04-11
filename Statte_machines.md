## Custom Data types
- Name associted with set of values
- Use custom values or predefined values
- Very useful when creating state machines

``` vhdl
types Grades_t is {'A', 'B', 'C', "D', "F"};
types Days_t id {MON, TUE, WEB, THU, FRI, SAT, SUN}


``` vhdl
entity LedPatternScanner is
port( 
reset: in  std_logic; 
clock: in  std_logic;

leds:  out std_logic_vector(7 downto 0) 
);
end LedPatternScanner;

architecture LedPatternScanner_ARCH of LedPatternScanner is

------------------general defintions-------------------------Constants
constant ACTIVE: std_logic := '1'
costant COUNT_4Hz: integer := (100000000/4-1;

------------------------------------bar display------------------------------------Costsnts
constant BLANK_LEDS: std_vector(7 downto 0) = "00000000"'
constant INSIDE_LEDS: std_vector(7 downto 0) = "00011000"'
constant MIND_IN_LEDS: std_vector(7 downto 0) = "00100100"'
constant MID_OUT_LEDS: std_vector(7 downto 0) = "01000010"
constant OUTSIDE_LEDS: std_vector(7 downto 0) = "10000001"


-------------------------------state-machine-declarations------------------------SIGNALS
type States_t is (BLANK, CENTER, OUT1, OUT2, OUTSIDE, IN1, IN2); 
signal currentState: States_t; 
signal nextState:    States_t;

 ----other-internal-signals-------------------------------------SIGNALS 
 signal ledControl:   std_logic;


 --=================================================
 -- state register
 --===============================================
begin
STATE_REGISTER: process(reset, clock) 
begin 
if (reset=ACTIVE) 
  then currentState <= BLANK; 
elsif (rising_edge(clock)) then 
  currentState <= nextState; 
end if;
end process;

--===============================================================process
-- Stat transitions 
--==============================================================



``` 





