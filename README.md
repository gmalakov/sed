# sed
Sed clone task

# cd test
1. dart sed.dart 's/<version>/13.4' download.template
#### WILL PRINT TO CONSOLE RESULT OF REPLACEMENT
#### OR
2. dart sed.dart -i 's/<version>/13.4' download.template
#### WILL PUT REPLACEMENT INTO FIRST FILE
#### OR
3. dart sed.dart 's/<version>/13.4' download.template download.sh
#### WILL PUT REPLACEMENT INTO SECOND FILE
