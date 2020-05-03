SET DECIMAL=DOT.

DATA LIST FILE= "spfox.sav"  free (",")
ENCODING="Locale"
/ age (F8.0) eyes (F8.0) fur (F8.0) 
  .

VARIABLE LABELS
age "age" 
 eyes "eyes" 
 fur "fur" 
 .

VALUE LABELS
/
age 
1 "1 year" 
 2 "3 years" 
 3 "7 months" 
/
eyes 
1 "blue" 
 2 "brown" 
/
fur 
1 "brown" 
 2 "grey" 
 3 "red" 
.

EXECUTE.
