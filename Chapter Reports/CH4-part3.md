Chapter 4 part3 *Descriptive Statistics* Central Tendency, Spread,
Variation Commands, Random Number Generation
================
Nurrospody
5/3/2020, *Learn R for Applied Statistics : With Data Visualizations,
Regressions, and Statistics*

  - [Generating a Number Set **New Commands Used: set.seed(), rnorm(),
    hist(), qqnorm(), qqline(),
    shapiro.test()**](#generating-a-number-set-new-commands-used-set.seed-rnorm-hist-qqnorm-qqline-shapiro.test)
  - [Central Tendency, Spread, Variation Commands that DON’T require
    manual help **New Commands Used: median(), mean(), range(), diff(),
    res \<- , min(), max(), IQR(), quantile(), var(),
    sd()**](#central-tendency-spread-variation-commands-that-dont-require-manual-help-new-commands-used-median-mean-range-diff-res---min-max-iqr-quantile-var-sd)

#### Generating a Number Set **New Commands Used: set.seed(), rnorm(), hist(), qqnorm(), qqline(), shapiro.test()**

Before doing any of the excercises, I read ahead in the Basic Statistics
part of chapter 4. I noticed that most of these excercises wanted a big
number dataset, and it was helpful if the dataset was normally
distributed. So I went a bit out of order and **generated a number set**
first.

``` r
set.seed(NULL);
random <- rnorm(70, 10, 2);
print(random)
```

    ##  [1] 11.221298  8.586925 11.394484 10.010592 11.235113 12.466812  4.752301
    ##  [8]  9.144222 13.867494  7.970839 10.396648 10.333960 11.437906  9.138704
    ## [15] 10.368608 10.854784 12.278329  7.008869 11.229298 10.488534  7.875486
    ## [22] 11.708981  8.434693 11.748309 10.832150  7.321220 10.567367  8.144428
    ## [29] 10.242126  8.753871  7.473489 11.689720  9.062036  6.206962 11.778861
    ## [36]  9.701272 10.071360 10.081105  9.784233 10.813052  7.821579 11.427274
    ## [43]  8.102347 11.702759 10.607479 13.970805  8.219984  9.727955  8.702698
    ## [50]  8.647258 11.971685  7.554601 11.086237 11.542613  9.034230 12.293351
    ## [57] 11.786422  9.697702 12.507214 12.449379  8.831663 11.524664  8.556539
    ## [64] 12.579324 11.521078  9.250470 13.220820  9.921174  6.911173  7.345428

Originally I tried using system.time rather than NULL to set my seed, to
guarentee the randomness of it, but I discovered this in the
help(set.seed) documentation:

``` set
"Initially, there is no seed; a new one is created from the current time and the process ID when one is required. Hence different sessions will give different simulation results, by default. However, the seed might be restored from a previous session if a previously saved workspace is restored."
```

This means that I don’t have to manually use system.time to make
reliably random seeds, and can use NULL with good conscience. I talked
with my partner a bit about the consequences of having non-random seeds,
or duplicate-able seeds:

``` mh3u
In Monster Hunter 3 Ultimate, it was always best to set your birthday to a specific day (like January 15th or something) *because the seed for that day* had end-game drop tables that were objectively better than any other drop tables in the game.  This led to all serious players either having to live with subpar tables, or restarting their entire game to set a fake birthday.  Players with this birthday had an unfair unknown advantage over all over players, merely because of the seed they received.
```

Bad seeds cause strife in video games, but the strife they cause in the
real world is so much worse.

Whenever I knit my document, I get a new random data set (which is
wonderful) which I believe further proves that these seeds are good.
This also means that with every commit to GitHub for this report, my
values are changed.

Then I made a histogram of my random numbers, to verify randomness:

``` r
hist(random, breaks=10);
```

![](CH4-part3_files/figure-gfm/his-1.png)<!-- -->

Based on the random number set that was generated each knit, this
histogram ranges from a disastogram to being almost perfect. So I ran
some more tests to prove randomness.  
First, a **Q-Q plot**:

``` r
qqnorm(random)
qqline(random)
```

![](CH4-part3_files/figure-gfm/QQ-1.png)<!-- -->

Sometimes, this looks textbook perfect. Othertimes it’s a bit more
wobbly on the very edges.

Then I ran a Shapiro-Wilk normality test.

``` r
shapiro.test(random)
```

    ## 
    ##  Shapiro-Wilk normality test
    ## 
    ## data:  random
    ## W = 0.98362, p-value = 0.493

Between knits I’ve gotten the pleasure of seeing p-values that are low
like 0.1408, or p-values that are quite high like 0.8921. There’s also
been . . . hall of shame results with p values around 0.02.  
Assuming the ‘default’ alpha of 0.05, *most* of these p-values mean I
can reject the null hypothesis. (In this case, the null hypothesis is
that variable ‘random’ equals a non-random distribution). I am not
certain what the W represents, but it seems to gravitate between
0.97\#\#\# and 0.98\#\#\#. Hall of shame results sometimes have
0.96\#\#\# values.

Now that I have an ever changing, lovely random data set to work with,
let’s go back to th beginning of the chapter and run some more basic
commands.

#### Central Tendency, Spread, Variation Commands that DON’T require manual help **New Commands Used: median(), mean(), range(), diff(), res \<- , min(), max(), IQR(), quantile(), var(), sd()**

Medians indicate the 50% percentile and can be better than the mean for
centrality IF there are many outliers or the data is skewed, such as
American economic data.

``` r
median(random)
```

    ## [1] 10.28804

Means are the mathemetical average–sum all the data, then divide it by
N. The mean is good for centrality when data’s distribution is normal or
flat.

``` r
mean(random)
```

    ## [1] 10.07132

Range is the difference between the largest and smallest data point.
range() gives us the largest and the smallest without subtracting them.
If we want the difference, we need to specify that. Min and max values
can also be useful for finding ranges.

``` r
range(random)
```

    ## [1]  4.752301 13.970805

``` r
res <- range(random); diff(res)
```

    ## [1] 9.218504

``` r
min(random); max(random)
```

    ## [1] 4.752301

    ## [1] 13.97081

Interquartile Ranges are useful for looking at the spread of data. IQR
gives us the difference between the 75% quartile and 25% quartile–most
of the data will be here.  
We can also request the main 4 quartiles, or specify any quartile.

``` r
IQR(random)
```

    ## [1] 2.862649

``` r
quantile(random); quantile(random, 0.30)
```

    ##        0%       25%       50%       75%      100% 
    ##  4.752301  8.661118 10.288043 11.523767 13.970805

    ##     30% 
    ## 8.97346

SAMPLE variance can be found with the var() function. POPULARION
variance requires more care.

``` r
var(random)
```

    ## [1] 3.596536

SAMPLE standard deviation can be found with the sd() function.
POPULATION sd requires more care.

``` r
sd(random)
```

    ## [1] 1.896454

To continue reading the CH4 reports, select a new section:  
[Part 4 of the Chapter 4 Reports (DOES NOT EXIST
YET)](https://github.com/Nurrospody/SOURCE-Statistics-ILC/blob/master/Chapter%20Reports/CH4-part4.md)  
[Link to README to select any Chapter
Report](https://github.com/Nurrospody/SOURCE-Statistics-ILC/blob/master/README.md)
