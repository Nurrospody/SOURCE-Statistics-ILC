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

``` r
#To experiment with making matrices, I made up a a pretend survey where 6 people were asked if they liked or disliked 3 different animals.  Making this was clunky, however . . . there must be better ways to make tables and better uses of matrices.  Row is the X axis and Column is the Y axis.  
#Entering the data goes down column one and then loops around to column two, instead of across row one and then looping to row two.
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

``` r
#These comands use row and column binding to make matrices; column binding makes the values travel down and then loop to the next column; row binding makes the values travel across the rows and then loop down to the next column.
I <- cbind(c(1,2,3), c(4,5,6)); print(I); J <- rbind(c(1,2,3), c(4,5,6)); print(J);
```

    ##      [,1] [,2]
    ## [1,]    1    4
    ## [2,]    2    5
    ## [3,]    3    6

    ##      [,1] [,2] [,3]
    ## [1,]    1    2    3
    ## [2,]    4    5    6

``` r
#Selecting different rows & columns in a matrix works similar to a vector, but if the comma is before the number it selects the relevant column.  If the comma is AFTER the number it selects the relevant row.
print(J); J[,1]; J[2,]; J[-1,]; J[2,2]
```

    ##      [,1] [,2] [,3]
    ## [1,]    1    2    3
    ## [2,]    4    5    6

    ## [1] 1 4

    ## [1] 4 5 6

    ## [1] 4 5 6

    ## [1] 5

``` r
#You can also add an additional row or column to a matrix by using rbind or cbind respectfully; the technique taught in the book technically makes a whole new variable.
K <- cbind(c("old", "old"), c("old", "old")); print(K); L <- rbind(K, c("new", "new")); print(L)
```

    ##      [,1]  [,2] 
    ## [1,] "old" "old"
    ## [2,] "old" "old"

    ##      [,1]  [,2] 
    ## [1,] "old" "old"
    ## [2,] "old" "old"
    ## [3,] "new" "new"

``` r
#I wanted to practice modifying a matrix: I think the order of [column, row] confuses me since it's going Y and then X for reading,  
#instead of X and then Y, so it's the inverse of reading a graph (kind of, this isn't meant to analogy with a graph, but figuring out why I was confused is helpful.)
J[2,3] <- 66; print(J);
```

    ##      [,1] [,2] [,3]
    ## [1,]    1    2    3
    ## [2,]    4    5   66

``` r
#With t() matrixes can be transposed--i.e. which axis each label is on is switched. 
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

I initially tried making a data.frame with the book-given command but it
proved to be quite difficult; I kept getting errors about unexpected
commas, or unexpected =. I will figure it out, but first I’ll read a
.csv into R to work with instead.

``` r
#M <- data.frame(number_of_legs(c(0, 4, 8)), animal(c("Snake", "Fox", "Spider")), Does_Riley_Like_it?(c("good", "good", "AAAAAAAA")); print(M);
#Also tried
#M <- data.frame(number_of_legs(c=0, 4, 8), animal(c="Snake", "Fox", "Spider"), Does_Riley_Like_it?(c="good", "good", "AAAAAAAA")); print(M);
```

I knew I had a few .csv files on my computer from previous statistics
projects and wanted to also learn how to find those, so I searched for
them with cmd.

``` r
#where looks in the directory; /F formats the results to have quotes around them, /R Recursive looks into ALL directories, * is a wildcard that can include anything before the .csv result.
#C:\Users\Persimmon>where /F /R %userprofile% *.csv
```

I found 8 .csv files scattered across my documents and OneDrive, and
chose one that I had made to take a single full-soundtrack video and
turn that into seperated mp3s. I had to copy the file from my OneDrive
into my Documents folder to open it properly in the Console, and I had
to make a data\_sources folder in my repository to get it to open in the
Rmd file. I discovered, also, that / and \\ work the same(ish) in
Windows devices, but \\ if typed alone is an Escape Character so using
DOUBLE \\ if using foward slash rather than backslash for addresses is
nessesary.

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

For some reason when I looked at the structure or nrow ncol of Madoka I
got 32 rows and 10 columns, but when I looked at Madoka\[0\] I got a
result that seemed to claim there were no columns in the dataset.

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
finagled with commands until I got the first 5 rows of the data.frame,
and then made that a new variable. I got a lot of hands-on experience
with trying to select a specific row/column of a variable here, doing it
with an actual .csv with many rows and columns took much more
understanding and exploration than just the small made-up data sets.

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
very perculiar happaned. Any input to \[5,3\] other than the original
input, “00:10:39” would result in an invalid factor level, and generate
an \<NA\>. If I changed it back to the original input, it worked
properly again.  
Not-pictured below: I thought that maybe the data format being ‘factor’
meant that it “factored” somehow with the other values. I don’t expect
that the program is smart enough to recognize that “xx:xx:xx” is a time
format without being specifically told that it is a time format, but I
still tried changing it so it didn’t technically contradict any
timestamps I could see. However, even changing \[5,3\] to “00:10:40”
resulted in \<NA\>.

``` r
Smallmad[5,3] <- "The angriest Madoka"; print(Smallmad); Smallmad[5,3] <- "00:10:39"; print(Smallmad);
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

Here I read ahead in the book a bit and realized how long the chapters
are–having each chapter continue to be its report is a bad idea, so I’m
ending this part of the report here.
