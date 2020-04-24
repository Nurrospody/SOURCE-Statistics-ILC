Matrices and Data.frame (Madoka.csv) : Chapter 3 *Learn R for Applied
Statistics : With Data Visualizations, Regressions, and Statistics*
================
Nurrospody
Week 3 Wednesday-Friday

  - [Matrix *Non-Duplicate Comands Used* matrix(), nrow, ncol, dimnames,
    attributes(), colnames(), rownames(), cbind(), rbind(),
    t()](#matrix-non-duplicate-comands-used-matrix-nrow-ncol-dimnames-attributes-colnames-rownames-cbind-rbind-t)
  - [Data Frames *Non-duplicate Commands Used* data.frame(), read.csv().
    *Investigated Escape Character; cmd; replacement
    weirdness*](#data-frames-non-duplicate-commands-used-data.frame-read.csv.-investigated-escape-character-cmd-replacement-weirdness)

### Matrix *Non-Duplicate Comands Used* matrix(), nrow, ncol, dimnames, attributes(), colnames(), rownames(), cbind(), rbind(), t()

To experiment with matrices, I made up a a pretend survey where 6 people
were asked if they liked or disliked 3 different animals. Making this
felt a bit clunky . . . either I need more practice, or there are better
uses for matrices than tables like this.  
When entering the data, it fills in the table like this: the data goes
all the way down column one and then loops around to column two. I had
to make sure when entering my data, that I wasn’t thinking: how many
people liked the spider; how many people disliked the spider? I had to
think: how many people liked the spider, the fox, the dog? Only once I’d
filled in my first column completely, could I then think about the
second column.

``` r
H <- matrix(c(1,4,5,5,2,1), nrow=3, ncol=2, dimnames=list(c("Spider", "Fox", "Dog"), c("Likes the Animal", "Dislikes the Animal"))); print(H)
```

    ##        Likes the Animal Dislikes the Animal
    ## Spider                1                   5
    ## Fox                   4                   2
    ## Dog                   5                   1

``` r
#These are some commands to investigate the matrix.
attributes(H); colnames(H); rownames(H);
```

    ## $dim
    ## [1] 3 2
    ## 
    ## $dimnames
    ## $dimnames[[1]]
    ## [1] "Spider" "Fox"    "Dog"   
    ## 
    ## $dimnames[[2]]
    ## [1] "Likes the Animal"    "Dislikes the Animal"

    ## [1] "Likes the Animal"    "Dislikes the Animal"

    ## [1] "Spider" "Fox"    "Dog"

Selecting different rows & columns in a matrix works similar to a
vector, but if the comma is before the number \[,n\] it selects the
relevant column. If the comma is AFTER the number it selects the
relevant row. \[n,\].

``` r
print(H); H[,1]; H[2,]; H[-1,]; H[2,2]
```

    ##        Likes the Animal Dislikes the Animal
    ## Spider                1                   5
    ## Fox                   4                   2
    ## Dog                   5                   1

    ## Spider    Fox    Dog 
    ##      1      4      5

    ##    Likes the Animal Dislikes the Animal 
    ##                   4                   2

    ##     Likes the Animal Dislikes the Animal
    ## Fox                4                   2
    ## Dog                5                   1

    ## [1] 2

This makes sense if you think about selecting position in a vector (or
data.frame) to be like reading a graph (except it’s reversed because the
data goes down, not up). Remember that a column’s NAME is on the X axis,
even though it then travels down the Y axis, and visa versa. Where the
name is, is what’s important. Because I had some trouble with this, I
also practiced replacing a value inside of a matrix until I understood
*where* in the matrix was being modified.

``` r
#oh no!  Suddenly a bunch of dog-disliking people stormed in to our animal survey!  Now our results are not very useful, because this is obviously a biased sample.
H[3,2] <- 66; print(H);
```

    ##        Likes the Animal Dislikes the Animal
    ## Spider                1                   5
    ## Fox                   4                   2
    ## Dog                   5                  66

We can add an additional row or column to a matrix by using rbind() or
cbind() respectfully. Technically, the command shown here makes an
additional variable rather than modifying an already existing one.

``` r
K <- cbind(c("old", "old"), c("old", "old")); print(K); L <- rbind(K, c("new", "new")); print(L)
```

    ##      [,1]  [,2] 
    ## [1,] "old" "old"
    ## [2,] "old" "old"

    ##      [,1]  [,2] 
    ## [1,] "old" "old"
    ## [2,] "old" "old"
    ## [3,] "new" "new"

With t() matrixes can be transposed–i.e. which axis each label is on is
switched.

``` r
print(L); L <- t(L);print(L)
```

    ##      [,1]  [,2] 
    ## [1,] "old" "old"
    ## [2,] "old" "old"
    ## [3,] "new" "new"

    ##      [,1]  [,2]  [,3] 
    ## [1,] "old" "old" "new"
    ## [2,] "old" "old" "new"

### Data Frames *Non-duplicate Commands Used* data.frame(), read.csv(). *Investigated Escape Character; cmd; replacement weirdness*

Initially I tried making a data.frame with the book-given command.
Eventually after many trials, giving up, and coming back to it a week
later when I could actually copy paste the syntax from my book, I got it
to work:

``` r
RilA <- data.frame(number_of_legs=c(0, 4, 8), animal=c("Snake", "Fox", "Spider"), Rileys_Opinion=c("good", "good", "AAAAAAAA")); print(RilA)
```

    ##   number_of_legs animal Rileys_Opinion
    ## 1              0  Snake           good
    ## 2              4    Fox           good
    ## 3              8 Spider       AAAAAAAA

Originally I kept getting errors about unexpected commas, wrong ()s, or
unexpected =, most of it was format issues. Then I learned that I can’t
put a “?” or a “’” in a string name or the code will break, and
originally the third column was “Does\_Riley\_Like\_It?” or “Riley’s
Opinion” so that explains it, too.

I didn’t have this data.frame when I actually did the excercises, so
instead I took the more practical approach of loading a *.csv* file into
R as a data.frame.

I had a few *.csv* files on my computer from previous statistics
projects, and I learned how to find them using Command Line. I’ve shown
my search and what each part of the search means below as a comment:

``` r
#where looks in the directory; /F formats the results to have quotes around them, /R Recursive looks into ALL directories, * is a wildcard that can include anything before the .csv result.
#C:\Users\Persimmon>where /F /R %userprofile% *.csv
```

I found 8 .csv files and chose one meant to take an hour-length
soundtrack video and turn that into seperated mp3s. This not only taught
me how to find and open a *.csv* but also about data pathing;  
I had to copy the file from my OneDrive into my Documents folder to open
it properly in the RConsole; and in order to knit it from my R Code
Editor, I had to place it inside of a data\_sources subdirectory in my
Git directory (where all my md and Rmd files are located).  
I also discovered that / and \\ work the same(ish) in Windows devices
for pathing, but \\ if typed alone is an Escape Character. Using DOUBLE
\\ if using backslash rather than forwardslash is neccesary, for the
sake of typing addresses or any markdown documents.

``` r
Madoka <- read.csv(file="../data_sources/Madoka Magika Volume 1-3.csv"); print(Madoka);
```

    ##                           name    start      end track.. album.info X.VALUE.  X
    ## 1            Gradus prohibitus 00:00:00 00:03:34       1   Volume 1  0:03:34 NA
    ## 2            Credens justitiam 00:03:35 00:05:30       2   Volume 1  0:01:55 NA
    ## 3                    Clementia 00:05:31 00:07:29       3   Volume 1  0:01:58 NA
    ## 4                   Desiderium 00:07:30 00:09:11       4   Volume 1  0:01:41 NA
    ## 5                  Conturbatio 00:09:21 00:10:39       5   Volume 1  0:01:18 NA
    ## 6             Puella in somnio 00:10:40 00:12:36       6   Volume 1  0:01:56 NA
    ## 7                  Umbra nigra 00:12:37 00:14:19       7   Volume 1  0:01:42 NA
    ## 8             Terror adhaerens 00:14:20 00:18:08       8   Volume 1  0:03:48 NA
    ## 9                 Scaena felix 00:18:09 00:19:59       9   Volume 1  0:01:50 NA
    ## 10              Pugna cum maga 00:20:00 00:22:13      10   Volume 1  0:02:13 NA
    ## 11                    Decretum 00:22:14 00:24:02      11   Volume 2  0:01:48 NA
    ## 12              Agmen clientum 00:24:03 00:25:47      12   Volume 2  0:01:44 NA
    ## 13              Venari strigas 00:25:48 00:28:33      13   Volume 2  0:02:45 NA
    ## 14                Signum malum 00:28:34 00:30:20      14   Volume 2  0:01:46 NA
    ## 15           Amicae carae meae 00:30:21 00:32:22      15   Volume 2  0:02:01 NA
    ## 16                    Incertus 00:32:23 00:34:02      16   Volume 2  0:01:39 NA
    ## 17                Inevitabilis 00:34:03 00:35:57      17   Volume 2  0:01:54 NA
    ## 18                  Serena ira 00:35:58 00:37:58      18   Volume 2  0:02:00 NA
    ## 19                  Anima mala 00:37:59 00:39:42      19   Volume 2  0:01:43 NA
    ## 20              Pugna infinita 00:39:43 00:41:37      20   Volume 2  0:01:54 NA
    ## 21        Vocalise Op.34 no.14 00:41:38 00:45:14      21   Volume 2  0:03:36 NA
    ## 22                   Ave Maria 00:45:15 00:50:03      22   Volume 2  0:04:48 NA
    ## 23              Numquam vincar 00:50:04 00:52:11      23   Volume 3  0:02:07 NA
    ## 24                  Quamobrem? 00:52:12 00:53:41      24   Volume 3  0:01:29 NA
    ## 25              Cor destructum 00:53:42 00:55:08      25   Volume 3  0:01:26 NA
    ## 26            Surgam identidem 00:55:09 00:58:44      26   Volume 3  0:03:35 NA
    ## 27                   Confessio 00:58:45 01:00:33      27   Volume 3  0:01:48 NA
    ## 28               Nux Walpurgis 01:00:34 01:03:07      28   Volume 3  0:02:33 NA
    ## 29             Cubilulum album 01:03:08 01:05:27      29   Volume 3  0:02:19 NA
    ## 30             Taenia memoriae 01:05:28 01:07:38      30   Volume 3  0:02:10 NA
    ## 31 La Fille aux Cheveux de Lin 01:07:39 01:10:40      31   Volume 3  0:03:01 NA
    ## 32           Symposium magarum 01:10:41 01:11:59      32   Volume 3  0:01:18 NA
    ##    X.1 X.2 X.3
    ## 1   NA  NA  NA
    ## 2   NA  NA  NA
    ## 3   NA  NA  NA
    ## 4   NA  NA  NA
    ## 5   NA  NA  NA
    ## 6   NA  NA  NA
    ## 7   NA  NA  NA
    ## 8   NA  NA  NA
    ## 9   NA  NA  NA
    ## 10  NA  NA  NA
    ## 11  NA  NA  NA
    ## 12  NA  NA  NA
    ## 13  NA  NA  NA
    ## 14  NA  NA  NA
    ## 15  NA  NA  NA
    ## 16  NA  NA  NA
    ## 17  NA  NA  NA
    ## 18  NA  NA  NA
    ## 19  NA  NA  NA
    ## 20  NA  NA  NA
    ## 21  NA  NA  NA
    ## 22  NA  NA  NA
    ## 23  NA  NA  NA
    ## 24  NA  NA  NA
    ## 25  NA  NA  NA
    ## 26  NA  NA  NA
    ## 27  NA  NA  NA
    ## 28  NA  NA  NA
    ## 29  NA  NA  NA
    ## 30  NA  NA  NA
    ## 31  NA  NA  NA
    ## 32  NA  NA  NA

When I looked at the structure or nrow ncol of Madoka I got 32 rows and
10 columns, but when I looked at Madoka\[0\] I got a result that seemed
to claim there were no columns in the dataset. I thought this was
interesting.

``` r
str(Madoka);ncol(Madoka);nrow(Madoka); Madoka[0]; Madoka[,0];
```

    ## 'data.frame':    32 obs. of  10 variables:
    ##  $ name      : Factor w/ 32 levels "Agmen clientum",..: 13 9 5 12 7 19 30 29 23 20 ...
    ##  $ start     : Factor w/ 32 levels "00:00:00","00:03:35",..: 1 2 3 4 5 6 7 8 9 10 ...
    ##  $ end       : Factor w/ 32 levels "00:03:34","00:05:30",..: 1 2 3 4 5 6 7 8 9 10 ...
    ##  $ track..   : int  1 2 3 4 5 6 7 8 9 10 ...
    ##  $ album.info: Factor w/ 3 levels "Volume 1","Volume 2",..: 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ X.VALUE.  : Factor w/ 29 levels "0:01:18","0:01:26",..: 25 13 15 5 1 14 6 28 11 20 ...
    ##  $ X         : logi  NA NA NA NA NA NA ...
    ##  $ X.1       : logi  NA NA NA NA NA NA ...
    ##  $ X.2       : logi  NA NA NA NA NA NA ...
    ##  $ X.3       : logi  NA NA NA NA NA NA ...

    ## [1] 10

    ## [1] 32

    ## data frame with 0 columns and 32 rows

    ## data frame with 0 columns and 32 rows

I didn’t want to continue printing the whole Madoka data.frame with 10
columns and 32 rows when experimenting with different commands, so I
took the first 5 rows of the data.frame and made that its own variable.
I got a lot of hands-on experience with trying to select a specific
row/column of a variable here. Doing it with an actual *.csv* with many
rows and columns took more understanding and exploration than just the
small made-up data sets.

``` r
Smallmad <- Madoka[1:5,]; print(Smallmad)
```

    ##                name    start      end track.. album.info X.VALUE.  X X.1 X.2
    ## 1 Gradus prohibitus 00:00:00 00:03:34       1   Volume 1  0:03:34 NA  NA  NA
    ## 2 Credens justitiam 00:03:35 00:05:30       2   Volume 1  0:01:55 NA  NA  NA
    ## 3         Clementia 00:05:31 00:07:29       3   Volume 1  0:01:58 NA  NA  NA
    ## 4        Desiderium 00:07:30 00:09:11       4   Volume 1  0:01:41 NA  NA  NA
    ## 5       Conturbatio 00:09:21 00:10:39       5   Volume 1  0:01:18 NA  NA  NA
    ##   X.3
    ## 1  NA
    ## 2  NA
    ## 3  NA
    ## 4  NA
    ## 5  NA

I then wanted to change one of the columns in Smallmad, but something
perculiar happaned.  
Any input to \[5,3\] other than the original input, “00:10:39” would
result in an invalid factor level, and generate an \<NA\>. If I changed
it back to the original input, it worked properly again.  
Not-pictured below: I thought that maybe the data format being ‘factor’
meant that it “factored” somehow with the other time values. I don’t
expect that the program is smart enough to recognize that “xx:xx:xx” is
a time format without being specifically told that it *is* a time
format, but I still tried changing it so it didn’t technically
contradict any timestamps I could see. However, even changing \[5,3\] to
“00:10:40” resulted in \<NA\>.

``` r
Smallmad[5,3] <- "The angriest Madoka"; print(Smallmad); Smallmad[5,3] <- "00:10:39";
```

    ## Warning in `[<-.factor`(`*tmp*`, iseq, value = "The angriest Madoka"): invalid
    ## factor level, NA generated

    ##                name    start      end track.. album.info X.VALUE.  X X.1 X.2
    ## 1 Gradus prohibitus 00:00:00 00:03:34       1   Volume 1  0:03:34 NA  NA  NA
    ## 2 Credens justitiam 00:03:35 00:05:30       2   Volume 1  0:01:55 NA  NA  NA
    ## 3         Clementia 00:05:31 00:07:29       3   Volume 1  0:01:58 NA  NA  NA
    ## 4        Desiderium 00:07:30 00:09:11       4   Volume 1  0:01:41 NA  NA  NA
    ## 5       Conturbatio 00:09:21     <NA>       5   Volume 1  0:01:18 NA  NA  NA
    ##   X.3
    ## 1  NA
    ## 2  NA
    ## 3  NA
    ## 4  NA
    ## 5  NA

I tried some additional commands with Smallmad, such as difftime which
would result the mean difference in time for all the X values (i.e. how
long the actual song is) but the result didn’t make much sense. From
this I infer the data would need to be converted into a real time
format.

``` dif
mean.difftime(Smallmad[,6]); #Time difference of 11.8 
```

Turning Smallmad into a histogram results that it’s not numeric data,
either. At a different time, I will return to Smallmad and figure out
how to convert the characters into a real formatted timestamp, but for
now it’s time to move on and go forward with learning more from the
book.
