CH6 part 1 *Inferential Statistics & Regressions* (apply)
================
Nurrospody
7/13/2020, *Learn R for Applied Statistics : With Data Visualizations,
Regressions, and Statistics*

  - [apply(), lapply(), sapply()
    commands](#apply-lapply-sapply-commands)
  - [sample(), dplyr commands](#sample-dplyr-commands)
  - [Correlation basic notes 183-184 (revisit after
    ANOVA)](#correlation-basic-notes-183-184-revisit-after-anova)
  - [Covariance basic notes 185-186 (revisit after
    ANOVA)](#covariance-basic-notes-185-186-revisit-after-anova)
  - [Hypothesis Testing and P-Value](#hypothesis-testing-and-p-value)
  - [T-Test basic notes 187-194 (revisit after
    ANOVA)](#t-test-basic-notes-187-194-revisit-after-anova)
  - [Chi-Square Test 194-198 (Revisit after
    ANOVA)](#chi-square-test-194-198-revisit-after-anova)
  - [ANOVA](#anova)

*Inferential statistics are our gateway to understanding potential
future data, with current data.*

### apply(), lapply(), sapply() commands

**apply()** can loop a given function into a list; matrix; or array
formatted datset. It does so until it reaches the end of the data, and
then prints the results of that function for us to see.

Use it like this: `apply(dataset, margin, function)`. Margin equals
either 1 (apply function to row) or 2 (apply function to column).

**lapply()** works the same, but lapply() output is a *list*, and a row
is selected with $ when printing data rather than using the margin
argument.  
**sapply()** works the same as lapply, but sapply() output is a
*vector*.

Examples of using these functions.

``` r
apply(Smallmad, 2, Modes); 
```

    ## $name
    ## [1] "Gradus prohibitus" "Credens justitiam" "Clementia"        
    ## [4] "Desiderium"        "Conturbatio"      
    ## 
    ## $start
    ## [1] "00:00:00" "00:03:35" "00:05:31" "00:07:30" "00:09:21"
    ## 
    ## $end
    ## [1] "00:03:34" "00:05:30" "00:07:29" "00:09:11" "00:10:39"
    ## 
    ## $track..
    ## [1] "1" "2" "3" "4" "5"
    ## 
    ## $album.info
    ## [1] "Volume 1"
    ## 
    ## $X.VALUE.
    ## [1] "0:03:34" "0:01:55" "0:01:58" "0:01:41" "0:01:18"
    ## 
    ## $X
    ## [1] NA
    ## 
    ## $X.1
    ## [1] NA
    ## 
    ## $X.2
    ## [1] NA
    ## 
    ## $X.3
    ## [1] NA

``` r
apply(Smallmad, 1, Modes);
```

    ##  1  2  3  4  5 
    ## NA NA NA NA NA

``` r
lapply(Smallmad$album.info, Modes); 
```

    ## [[1]]
    ## [1] Volume 1
    ## Levels: Volume 1 Volume 2 Volume 3
    ## 
    ## [[2]]
    ## [1] Volume 1
    ## Levels: Volume 1 Volume 2 Volume 3
    ## 
    ## [[3]]
    ## [1] Volume 1
    ## Levels: Volume 1 Volume 2 Volume 3
    ## 
    ## [[4]]
    ## [1] Volume 1
    ## Levels: Volume 1 Volume 2 Volume 3
    ## 
    ## [[5]]
    ## [1] Volume 1
    ## Levels: Volume 1 Volume 2 Volume 3

``` r
sapply(Smallmad$album.info, Modes); 
```

    ## [1] Volume 1 Volume 1 Volume 1 Volume 1 Volume 1
    ## Levels: Volume 1 Volume 2 Volume 3

I’m using `Modes()` from my {r setup, include=FALSE} block, to show the
most common value(s) of the first 5 rows of the [Madoka
dataset](https://github.com/Nurrospody/SOURCE-Statistics-ILC/blob/master/data_sources/Madoka%20Magika%20Volume%201-3.csv).
(Smallmad \<- Madoka\[1:5,\]) This is just for the case of quick
exercise. What’s happening here is that:  
**apply** shows, in a vector, the Modes for EVERYTHING in the dataset.
When the margin is 2 (columns) all of our data is shown correctly; when
the margin is 1 (rows) the data is not shown correctly, presumably
because of how it’s stored.  
**lapply** shows, for each row, the Mode of each column, but for some
reason it also shows every other level?  
**sapply** simply shows a vector of what the mode of each row is,
without showing everything long hand. It also shows every level? this is
weird because these levels don’t exist within the first 5 rows of the
Madoka dataset, so it must have stored it away somewhere.

A practical use of this would be to find the mean of a gathered dataset.
I will be using apply again, with real data, when my garden dataset is
done being collected at the end of this month.

### sample(), dplyr commands

**sample()** can do **simple random sampling**.

It works like this: `sample(data$..., # of items to select, replace=TRUE
or FALSE)`.

Input your data to do simple random sampling with, notifying a specific
column with $ if applicable . . . type a numeric value to indicate how
many random samples you want to pull . . . and decide if you want to
replace values or not. Not replacing values means that each sample has a
different likeliness than the last, which can be mathematically
complicated; but it does mean you won’t get duplicate outputs.

Here’s an example for the sake of practice:

``` r
sample(Madoka$album.info, 6, FALSE)
```

    ## [1] Volume 2 Volume 1 Volume 3 Volume 1 Volume 1 Volume 2
    ## Levels: Volume 1 Volume 2 Volume 3

Here, I’m randomly selecting 6 different (no replacement) values from
the Madoka dataset. I chose album.info because it’s easy to read in a
list. (I had used start.time originally, but it wasn’t legible.)

It’s very likely that when my garden data is finished, I’ll find use for
the random sampling command.

**Install.packages(“dplyr”)** and loading the library can let you do
**stratified sampling**. Stratified sampling involves seperating smaller
groups from a bigger one (like the aromantic community, or the finsexual
community, from the overal GRSM community) and sampling randomly within
those smaller communitites.

“Iris” is a dataset that’s built into R, and I used it as an example for
stratified sampling.

``` r
iris %>%
group_by(Species) %>%
sample_n(3)
```

    ## # A tibble: 9 x 5
    ## # Groups:   Species [3]
    ##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species   
    ##          <dbl>       <dbl>        <dbl>       <dbl> <fct>     
    ## 1          4.9         3            1.4         0.2 setosa    
    ## 2          5.1         3.8          1.9         0.4 setosa    
    ## 3          4.8         3.1          1.6         0.2 setosa    
    ## 4          5.7         2.6          3.5         1   versicolor
    ## 5          5.6         2.5          3.9         1.1 versicolor
    ## 6          6.3         2.3          4.4         1.3 versicolor
    ## 7          6.5         3            5.2         2   virginica 
    ## 8          7.1         3            5.9         2.1 virginica 
    ## 9          6.7         3.3          5.7         2.1 virginica

Normally, Iris is 50 different sepal measurements from 3 different
flower species, for a total of 150 samples. This sample\_n() is taking 3
out of each group(\_by) of Species from the iris sample. %\>% continues
the dplyr command into new lines.  
`slice_sample()` is supposedly a new command used instead of
sample\_n(), but slice\_sample() has different results that don’t make
much sense since this is a basic introduction from the book and also,
slice\_sample() came from a combination with another unfamiliar command,
`sample_frac()`.

``` r
iris %>%
group_by(Species) %>%
slice_sample(6)
```

    ## # A tibble: 3 x 5
    ## # Groups:   Species [3]
    ##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species   
    ##          <dbl>       <dbl>        <dbl>       <dbl> <fct>     
    ## 1          5.1         3.5          1.4         0.3 setosa    
    ## 2          5.8         2.7          3.9         1.2 versicolor
    ## 3          6           2.2          5           1.5 virginica

### Correlation basic notes 183-184 (revisit after ANOVA)

`cor()` function  
assign variables to a data.frame; select rows in data.frame with $, use
cor(data$, data$); get number between -1 and +1.  
\-1 perfect negative coorelation; as one variable increases, the other
decreases.  
0 no coorelation between variables.  
\+1 perfect positive coorelation; as one variable increases, the other
also increases.  
If I remember right, generally a value more extreme than +-0.8 is the
threshold for ‘definitely coorelation’.

### Covariance basic notes 185-186 (revisit after ANOVA)

`cov()`  
assign variables to data.frame; select rows in data.frame with $; use
cov(data$, data$); get a negative or positive number. There is no set
range.  
Covariance is related to Correlation. Correlation is “normalized”
Covariance. It seems to me that covariance:correlation ::
variance:standard-deviation. The limited details in this book do not
mention why or when to use covariance rather than correlation.

### Hypothesis Testing and P-Value

no functions in this section. Probabilty value of less than alpha 0.05
5% means something is significant; you make alternate hypothesis and see
if you can even disprove the null hypothesis (assuming you have a large
enough sample size to have the power to disprove it anyway), the whole
nine yards. Just standard stuff.  
Type I error: reject a null hypothesis, when the null hypothesis is
actually correct.  
Type II error: fail to reject a false null hypothesis, in turn, failing
to claim that the alternate hypothesis is true.  
I remember this by thinking of ‘how far down the down’ the error
happened. Type I null, Type II alt; null comes before alt.

### T-Test basic notes 187-194 (revisit after ANOVA)

Normally distributed population. From random sample (duh).  
continuous variables/data. Hypothesis test about the means from 2
different samples. If we can disprove that they are the same, there is a
difference in the mean between the two samples.  
T tests are mathematically different if the samples are independent
(uncoorelated) or dependent/paired (correlated). If they are
uncoorelated, it might become important if their variances are
different. Emphasis on might; an ANOVA can handle variances 8x bigger
than each other and still manage to get accurate results.

**1 sample t-test** Question: is the mean of a population equal to
\_\_\_?  
`t.test()`  
Example filled out `t.test(data$var1, mu=0.6);`  
Make data.frame, pull one /$ out of the data.frame *only*, and include
mu= to ask if the mean is equal to mu. In the example case, we’re asking
if the mean of var1 in data is equal to 0.6. Can we reject that the mean
in var1 is equal to 0.6?

**2 sample t-test** Question: are the means of these two samples the
same?  
`t.test()`  
Example filled out `t.test(data$var1, data$var2, var.equal=TRUE,
paired=FALSE);` Each sample is plugged into the function; var.equal=
means if the variance is equal (or not), paired= means if the variables
are dependent or independent.  
With these arguments, you can do all varities of the 2 sample T-test.

### Chi-Square Test 194-198 (Revisit after ANOVA)

relationships between categorical variables/data (rather than continuous
data)  
uses hypothesis test null/alternate arguments.

**One categorical variable (Goodness of Fit)**  
Question: Is this one sample we have, consistent with the distribution
of the other ones?  
`chisq.test(data)`  
putting data in the chi square test will spit out information about the
degrees of freedom, p-value, etc.  
*Extra important to come back to this section. The book didn’t explain
it very well*.

**Two categorical variable (Contingency Test)** Question: is there a
relationship between these two variables?  
`chisq.test(data.table)` Unlike the goodness of fit test (one
categorical variables), when doing a contingency test (two categorical
variables), the data needs to be input as a TABLE. This means that
before doing the chisq.test(data.table) you need to assign your
variables to a `table`.  
Example from book: `data.table <- table(data$var1, data$var2);
chisq.test(data.table);`  
Just like the last one, this use of chisq.test will also spit out a
chi-square value, degrees of freedom, and p-value.  
*This section made more sense, since the data gave itself context.*

### ANOVA

To continue reading the CH6 reports, select a new section:  
Next: [Part 2 of the Chapter 6
Reports](https://github.com/Nurrospody/SOURCE-Statistics-ILC/blob/master/Chapter%20Reports/CH6-part2.md)  
Previous: none.

[Link to README to select any Chapter
Report](https://github.com/Nurrospody/SOURCE-Statistics-ILC/blob/master/README.md)
