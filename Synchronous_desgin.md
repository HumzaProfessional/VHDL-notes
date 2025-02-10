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




```
