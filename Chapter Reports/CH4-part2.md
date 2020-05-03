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
  - [Writing an SPSS File **New Commands: write.table(),
    write.foreign()**](#writing-an-spss-file-new-commands-write.table-write.foreign)
  - [Reading an SPSS File + JSON **New Commands:
    read.spss()**](#reading-an-spss-file-json-new-commands-read.spss)
  - [Basic Data Processing **New Concepts Learned: Selecting Data;
    Select Variable with $, Sort Data (accending and descending order),
    Filtering, Removing Missing Values, Remove
    Duplicates**](#basic-data-processing-new-concepts-learned-selecting-data-select-variable-with-sort-data-accending-and-descending-order-filtering-removing-missing-values-remove-duplicates)

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

#### Writing an SPSS File **New Commands: write.table(), write.foreign()**

An SPSS (Statistical Package for the Social Sciences) file actually uses
the *.sav* file extension. Reading it into R necessitates installing the
“foreign” package, requiring the foreign package, and then assigning a
variable using the read.spss command.  
I didn’t have a *.sav* file lying around, so I wrote my own.

``` wrsps
require(foreign)
library(foreign)
fur <- c("red", "brown", "grey")
eyes <- c("blue", "blue", "brown")
age <- c("7 months", "1 year", "3 years")
foxes <- data.frame(age, eyes, fur)
write.table(foxes, "spfox.txt", sep = "\t")
write.foreign(foxes, "spfox.txt", "spfox.sav", package = "SPSS")
print(foxes);
```

Rather than writing a data.frame all in one line, I assigned all the
variables *first* and then assigned it to a data.frame. This felt much
less clunky than the previous way I made a data.frame. Then I wrote that
table to a *.txt* file, and wrote that data to a *.sav* file.  
[LINK]() to the *.sav* file. It looks very satisfying with all its new
fancy headers\!

#### Reading an SPSS File + JSON **New Commands: read.spss()**

Technically reading an SPSS file should work exactly the same as an xlsx
or csv file, but I had some issues getting it to work, mostly because of
errors.

``` spss
require("foreign");
fox2 <- read.spss(file="../data_sources/spfox.sav", to data.frame = TRUE);
```

I tried read.spss using the .sav file format, .spss format, .sps format,
even the .txt format, but I always got this type of error: Error in
read.spss(file = “spfox.sav”, to.data.frame = TRUE) : file ‘spfox.sav’
is not in any supported SPSS format  
I’m not sure what’s up, especially since it knits perfectly fine in my
Rmd file. It also seems to change my .txt and .sav files to something
they’re not supposed to be:  
![](../data_sources/foxb.png) It was originally what’s in green, but
trying to fox2 \<- read.spss(file) changed both the .txt and the .sav to
what’s in the red. I’m not sure why that’s what it became. Luckily I
caught it fast enough to both fix it in-console, and catch a screenshot
of the incorrect data.  
I’ll revisit it later when it’s more important.  
I also installed the “rjason” package as per the book section. It uses
the same read and require function as everything else.

#### Basic Data Processing **New Concepts Learned: Selecting Data; Select Variable with $, Sort Data (accending and descending order), Filtering, Removing Missing Values, Remove Duplicates**

For these excercises, I used the CTF dataset I received from my partner.

``` read
> CTF <- read.csv(file=../data_sources/"ctf_performance.csv", header=TRUE, sep=',')
```

Then I **selected data** to view only the fields I was most interested
in.

``` select
CTF[, c("Value", "Time")];
```

Then I **selected a variable** with $ to view it. I discovered that I
can select multiple variables in this way, but doing so looks slightly
different than selecting data.

``` {$}
CTF$Challenge;
CTF$Challenge;CTF$Category
```

Next I **sorted the data**. By default, the data is in asccending order.
Descending can be done if it is specified TRUE.

``` sort
CTF[order(CTF$Value), ];
CTF[order(CTF$Value, decreasing = TRUE), ];
```

Data can be sorted by **multiple variables** as well, but I think it’s
pretty clear that R doesn’t by default read these time values correctly.

``` multisort
CTF[order(CTF$Value, CTF$Time, decreasing = TRUE), ];
```

Data can be **filtered with boolean expressions**. Here I filtered to
find only flags that were worth more than 10 points, only withihn the
first 19 flags earned. I was impressed to see quite a lot\! It’s also
easy to see that within the first 19, there were only 2 scores above 50.

``` filter
CTF[CTF$Value > 10 & CTF$X < 20, ];
```

I could **omit NA data**, but there is no data to omit.

``` omit
na.omit(CTF);
```

Lastly, I can **remote duplicate values**. This isn’t terribly useful
for this dataset, but we can easily see that there’s 7 different point
values.

``` dupe
CTF[!duplicated(CTF$Value), ];
```
