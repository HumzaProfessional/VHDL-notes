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
