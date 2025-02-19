- Definition: A system that has intrrnal state or memroy. 


### D flip-flop Asynchrpnus Reset

``` vhdl
architecture DFlipFlop_ARCH of DFlipFlop is
  constant ACTIVE: std_logic := '1';
begin
  processs(reset, clock)
  begin  
    if (reset=ACTIVE) then
      Q <= '0';
      elsif (clock= '1' and clock'event and clock'last_valur='0') then
      Q <= D;
     end if;
   end process;
end DFLIPFLOP_ARCH;
```



## Common Sychronus elements 
#### Preloadable down counter
- External std_logic signals:   reset, clock, load
- External std_logic_vector:   count, newValue
``` vhdl
DOWN_COUNTER: process(clock, reset)
variable counter: unsigned(7 downto 0);
begin 
if (reset=ACTIVE) then 
counter := (others=>'0'); 
elsif (rising_edge(clock)) then if (load=ACTIVE) then
counter <= unsigned(newValue); 
else
  counter := counter - 1; end if;
  end if;
  
  count <= std_logic_vector(counter); end process;
end process;
```


#### Enable Pulse Generator
- Separate sequential and combinational elements
- COUNT_1KHZ determined by system clock frequency
- External std_logic signals:   reset, clock, enableCount

``` vhdl
ENABLE_1KHZ: process(reset, clock)
variable count: integer range 0 to COUNT_1KHZ;
begin
----manage-count-value-----------------------------------------
if (reset = ACTIVE) then
    count := 0;
elsif (rising_edge(clock)) then
 if (count = COUNT_1KHZ) then
            count := 0;
        else
          count := count + 1;
    end if;
 end if;
--update-enable-signal------------------------------------------
if (count=COUNT_1KHZ) then
        enableCount <= ACTIVE;
 else
enableCount <= not ACTIVE;
 end if;
 end process;

```


#### Quiz question - 16-bit shift register

control 
- leadEn
- shiftEn
- shiftmode('0' - shiftleft; '1' - shiftright)
- constant LEFT_SHIFT_MODE
- constant RIGHT_SHIFT_MODE:
  
``` vhdl
SHIFT_REG process (clock, reset)

begin 
  if (reset = ACTIVE) then
     dataOUT <= (others => '0');
  elsif (risingedge(clock)) then
    if(loadEn = ACTIVE) then
      dataOUT <= dataIn;
      elsif (shiftEN = ACTIVE) then
        if (shiftMode = LEFT_MODE_MODE) then
              dataOUT <= dataOUT(14 downto 0) & '0';
          else
              dataOUT <= '0' & dataOUT(15 downto 1);
          endif
        endif
    endif
 end process;
```

