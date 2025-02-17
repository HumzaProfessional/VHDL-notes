
clock signal 
``` vhdl
system_clock: process
  begin
    clock <= not ACTIVE;
    wait <= 5 ns;
    clock <= ACTIVE;
    wait <= 5 ns;
end process;
```

reset signal 
``` vhdl
SYSTEM_RESET process
begon
    reset <= ACTIVE;
    wait for 100ns;
    reset <= not ACTIVE;
    wait;
end process;
```

counter simulation
``` vhdl
SIGNAL_DRIVE process(reset, clock)
 variable count unsigned(d downto 0),

 


```
