Asynchornux or Synchronux?

### Asynchronux Reset

Advantages 
- Reset can happen whe clock no running
- Reset cicrucit not part of the data path(reduce resoruces/latency)

Disadvantages
- Metastabiliy
- Susceptilbe to glitching and external noise

### Sychronous Reset
 Advantages 
 - Solves de-assertion metastability issues
 - Does not impact data latency
 - Gltiching solved wth propee elecrtrical design
 - Myth: FPGA do not need reset

``` vhdl
RESET_SYNCHORNIZER: proces(clock, reset_raw)
  variable chain: std_logic_vector(1 downto 00;
begin
 if (reset_raw=ACTIVE_RESET) then
  chain := (others=>ACTIVE_RESET);
elsif (rising_edge(clock)) then
  chain := chain(0) & not ACTIVE_RESET;
end if;

  reset <= chain(1)
end process;

```

