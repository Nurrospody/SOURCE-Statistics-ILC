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

    ##  [1]  6.075211 11.303303 10.424199 12.360806 11.935623  6.580755  8.552948
    ##  [8]  6.860803  9.569438  7.783481  9.372788 11.436076  9.294276  8.884155
    ## [15] 10.001504  7.158850 10.309570 12.545809  9.806483  9.050677 10.918926
    ## [22]  9.571183 11.349937  7.243030 10.489110 10.749886 16.034010 10.505249
    ## [29] 12.794762  9.006275 10.808922 12.545248 10.777935  6.930930 10.700242
    ## [36]  7.871806  9.608625 10.484932  5.780759 11.578801 13.126352  7.889660
    ## [43]  9.854357  9.785254  9.370533 12.928441  8.754476  3.698259  7.434817
    ## [50] 10.410666  7.378824 11.829321 10.011721  8.480541  8.449678 12.256906
    ## [57] 10.479782  6.935147  8.013481  9.578609 11.572416 11.023688 11.313909
    ## [64]  7.944892  7.215126  7.420070 12.014897  8.309880 13.610770 12.348664

Originally I tried using system.time rather than NULL to set my seed, to
guarentee the randomness of it, but I discovered this in the
help(set.seed) documentation:

``` set
"Initially, there is no seed; a new one is created from the current time and the process ID when one is required. Hence different sessions will give different simulation results, by default. However, the seed might be restored from a previous session if a previously saved workspace is restored."
```

This means that I don’t have to manually use system.time to make
reliably random seeds, and can use NULL with good conscience. I talked
with my partner a bit about the consequences of having non-random seeds,
or duplicate-able seeds: in Monster Hunter 3 Ultimate, it was always
best to set your birthday to a specific day (like January 15th or
something) *because the seed for that day* had end-game drop tables that
were objectively better than any other drop tables in the game. This led
to all serious players either having to live with subpar tables, or
restarting their entire game to set a fake birthday. Players with this
birthday had an unfair unknown advantage over all over players, merely
because of the seed they received. Bad seeds cause strife in video
games, but the strife they cause in the real world is so much worse.

Whenever I knit my document, I get a new random data set (which is
wonderful) which I believe further proves that these seeds are good.

Then I made a histogram of my random numbers, to verify randomness:

``` r
hist(random, breaks=10);
```

![](CH4-part3_files/figure-gfm/his-1.png)<!-- --> Based on the random
number set that was generated each knit, this histogram ranges from a
disastogram to being almost perfect. So I ran some more tests to prove
randomness.  
First, a **Q-Q plot**:

``` r
qqnorm(random)
qqline(random)
```

![](CH4-part3_files/figure-gfm/QQ-1.png)<!-- --> Sometimes, this looks
textbook perfect. Othertimes it’s a bit more wobbly on the very edges.

Then I ran a Shapiro-Wilk normality test.

``` r
shapiro.test(random)
```

    ## 
    ##  Shapiro-Wilk normality test
    ## 
    ## data:  random
    ## W = 0.99081, p-value = 0.8921

Between knits I’ve gotten the pleasure of seeing p-values that are low
like 0.1408, or p-values that are quite high like 0.7505. Assuming the
‘default’ alpha of 0.05, all of these p-values mean I can reject the
null hypothesis. (In this case, the null hypothesis is that variable
‘random’ equals a non-random distribution). I am not certain what the
W represents, but it seems to gravitate between 0.97\#\#\# and
0.98\#\#\#.

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

    ## [1] 9.83042

Means are the mathemetical average–sum all the data, then divide it by
N. The mean is good for centrality when data’s distribution is normal or
flat.

``` r
mean(random)
```

    ## [1] 9.778549

Range is the difference between the largest and smallest data point.
range() gives us the largest and the smallest without subtracting them.
If we want the difference, we need to specify that. Min and max values
can also be useful for finding ranges.

``` r
range(random)
```

    ## [1]  3.698259 16.034010

``` r
res <- range(random); diff(res)
```

    ## [1] 12.33575

``` r
min(random); max(random)
```

    ## [1] 3.698259

    ## [1] 16.03401

Interquartile Ranges are useful for looking at the spread of data. IQR
gives us the difference between the 75% quartile and 25% quartile–most
of the data will be here.  
We can also request the main 4 quartiles, or specify any quartile.

``` r
IQR(random)
```

    ## [1] 3.223677

``` r
quantile(random); quantile(random, 0.30)
```

    ##        0%       25%       50%       75%      100% 
    ##  3.698259  8.087581  9.830420 11.311258 16.034010

    ##      30% 
    ## 8.531226

SAMPLE variance can be found with the var() function. POPULARION
variance requires more care.

``` r
var(random)
```

    ## [1] 4.719872

SAMPLE standard deviation can be found with the sd() function.
POPULATION sd requires more care.

``` r
sd(random)
```

    ## [1] 2.172527

To continue reading the CH4 reports, select a new section:  
[Part 4 of the Chapter 4 Reports (DOES NOT EXIST
YET)](https://github.com/Nurrospody/SOURCE-Statistics-ILC/blob/master/Chapter%20Reports/CH4-part4.md)  
[Link to README to select any Chapter
Report](https://github.com/Nurrospody/SOURCE-Statistics-ILC/blob/master/README.md)
