### What is Metastability 
- Asynchronous inputs must be synchonized
- Asynchronous input timing unpredictable
- Synchornization performed using flip-flop
- What if signal changes at the same time input sampled

#### Metastability MTBF
- Mean time before failure(MTBF)
- Typically

### Code 
``` vhdl
SYNC_CHAIN: process(reset, clock)
variable unsafeOutput: std_logic;
begin
  if (reset=ACTIVE) then
     safeOutput   <= not ACTIVE;
     unsafeOutput <= not ACTIVE;
  elsif (rising_edge(clock)) then
     safeOutput   <= unsafeOutput;
     unsafeOutput <= asyncInput;
 end if;
end process;

```

