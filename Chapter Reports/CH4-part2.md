Chapter 4 part2 *Descriptive Statistics* Reading and Writing Excel and
SPSS Files
================
Nurrospody
4/30/2020, *Learn R for Applied Statistics : With Data Visualizations,
Regressions, and Statistics*

  - [Reading an Excel File **New Commands Used:
    read.xlsx(),**](#reading-an-excel-file-new-commands-used-read.xlsx)
  - [Writing an Excel File **New Commands Used
    write.xlsx()**](#writing-an-excel-file-new-commands-used-write.xlsx)
  - [Reading an SPSS File](#reading-an-spss-file)
  - [Writing an SPSS File](#writing-an-spss-file)

#### Reading an Excel File **New Commands Used: read.xlsx(),**

Now that I had the “xlsx” package properly unpacked and required, I
could start trying to read an .*xlsx* file. Once I fixed my working
directory to be data\_sources (I changed my default working directory to
data\_sources, since changing it manually each time was annoying; I
should figure out how projects work, though.), I could read the file.  
It looks similar to the *.csv* file when opened, key differences being
the addition of an NA column that has the number of each row . . . and
slightly wider spacing between values.

``` r
#XCTF <- read.xlsx(file="ctf_performance.xlsx", 1);
```

![](../data_sources/xctf.png)

#### Writing an Excel File **New Commands Used write.xlsx()**

``` r
#write.xlsx(data.frame(XCTF), file ="ctf_performance.xlsx", sheetName = "Riley CTF", col.names = TRUE, row.names = FALSE);
```

![](../data_sources/xctf2.png) With this command I wrote to the *.xlxs*
file. GitHub desktop then tells me the binary file has changed.
Previously the first sheet was only called Sheet1; now it is named.

#### Reading an SPSS File

An SPSS (Statistical Package for the Social Sciences) file actually uses
the *.sav* file extension. Reading it into R necessitates installing the
“foreign” package, requiring the foreign package, and then assigning a
variable using the read.spss command.

``` spss
install.packages("Foreign"); 
require("foreign");
#SCTF <- read.spss(file="ctf_performance.sav", to data.frame = TRUE);
```

The excecution is exactly the same as a *.csv* or *.xlsx* file read.

#### Writing an SPSS File
