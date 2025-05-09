### Overview

- Method for creating muitple instances of concurrent statement
- Generally used on components
- Two flavors: for-generate and if-generate

#### for-generate
``` vhdl
generate-label: for identifier in identifier-range generate
  {local declaration}
begin
  concurrent-statements
end genrate {generate-label};

```

#### if-generate
``` vhdl
generate-label: if expression generate
  [local delaraition]
begin
  concurrent-statements
end generate {geenrate-label]
```

#### Example:

Transform_stagL for i in 1 to 3 geenrate
begin
 crossproduct
