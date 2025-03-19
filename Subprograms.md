### What are Subprograms?
- Similar to procdures/functions in high levle alnguages
- Statements are sequntial
- Invoke in ocncurrent area, process, or other subprogram
- Variabele are created.intlizeed each time a subporam called


### Functions
Used as part of a larger expression
- Accepts one or more inputs
- Returns a single output value
- Has a type associated with it (return type)
- Arguments are all inputs (cannot modify)
- Can use signal keyword to access attributes
- Only used for combinational logic

``` vhdl
function rising_edge( signal s: std_logic) return boolean is
begin
return (s'event and s='1' and s'last_value='0');
end rising_edge;

```

#### Another Function
``` vhdl
function to_bcd_8bit( inputValue: integer) return std_logic_vector is 
  variable tensValue: integer;
  variable onesValue: integer;
begin
  if (inputValue < 99) then
    tensValue := inputValue / 10;
    onesValue := inputValue mod 10;
else
  tensValue := 9;
  onesValue := 9;
end if;
  return std_logic_vector(to_unsigned(tensValue, 4))
    & std_logic_vector(to_unsigned(onesValue, 4));
end to_bcd_8bit;


```

### Procedures 
- Arguments include both inputs and outputs
- Allowed mode: in, out, inout
- Parameter classes: constant(default), variable, and signal
- Can utilize wait statements (limited)

``` vhdl
procedure count_to_99 (signal reset:  in std_logic;
                       signal clock: in std_logic;
                       signal countEnable: in std_logic;
                       signal count:  inout integer) is

begin
  if rese(ACTIVE)
    COUNT <= 0;
  elsif (rising_edge(clock)) then
   if (countEnable = ACTIVE) then
    if(count>=0 and count < 99) thenn
      count <= count +1;
    else
         count <= 99;
     end if;
 end if;
end count_to_99;
```
