CH6 part 3 *Inferential Statistics & Regressions*
================
Nurrospody
8/7/2020, *Learn R for Applied Statistics : With Data Visualizations,
Regressions, and Statistics*

  - [MANOVA](#manova)
      - [Iris dataset summary](#iris-dataset-summary)
      - [MANOVA with all 4 dependent
        variables](#manova-with-all-4-dependent-variables)
      - [Follow-up analysis](#follow-up-analysis)
  - [Non-parametric: Wilcoxon Signed Rank Test (efficiency
    0.95)](#non-parametric-wilcoxon-signed-rank-test-efficiency-0.95)
      - [Testing for (lack of) normality and presence of
        symmetry](#testing-for-lack-of-normality-and-presence-of-symmetry)
      - [Doing the test with just X](#doing-the-test-with-just-x)
      - [Doing the test wtih X and Y](#doing-the-test-wtih-x-and-y)
      - [Wilcoxon Rank SUM test](#wilcoxon-rank-sum-test)
  - [Wilcoxon-Mann-Whitney Test](#wilcoxon-mann-whitney-test)
  - [Kruskal-Wallis Test](#kruskal-wallis-test)

### MANOVA

*While an ANOVA tests for ‘what is the effect on X based on 3+ different
variables’, MANOVA tests for ‘what is the effect of x variable on 3
different outcomes’.* MANOVA is *multi*variate analysis of variance,
rather than a (single) variate analysis of variance. It seems to be less
common, as there is less information about MANOVA than ANOVA. Even the
`help(manova)` page doesn’t have any commands and simply redirects to
the `help(aov)` page.

Despite the similar names, they’re used for very different things. I
wouldn’t be surprised if using a MANOVA on a dataset where it’s not
warranted, would result in ‘fake results’ that could be exploited for
publicity . . . because of this I don’t want to try and contort my new
n134 dataset about friendship data to fit into an ANOVA. My dataset that
I collected, doesn’t really have enough factors either, because I didn’t
collect anything about the weather or bugs or other extraneous things.
I’ll use the iris data instead.

#### Iris dataset summary

``` r
data("iris")
str(iris)
```

    ## 'data.frame':    150 obs. of  5 variables:
    ##  $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
    ##  $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
    ##  $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
    ##  $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
    ##  $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...

``` r
summary(iris)
```

    ##   Sepal.Length    Sepal.Width     Petal.Length    Petal.Width   
    ##  Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100  
    ##  1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300  
    ##  Median :5.800   Median :3.000   Median :4.350   Median :1.300  
    ##  Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199  
    ##  3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800  
    ##  Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500  
    ##        Species  
    ##  setosa    :50  
    ##  versicolor:50  
    ##  virginica :50  
    ##                 
    ##                 
    ## 

With this dataset we have one variable–species–that we can clearly
hypothesize about having an effect on the other 4 variables (sepal and
petal width/length). MANOVA doesn’t appear to use any special ‘does this
variable effect the other variables’ like ANOVA does, because that’s not
the point here. We just ask to concatenate bind some variables together,
and \~ it to another variable while specifying our data.

#### MANOVA with all 4 dependent variables

``` r
MrIris <- manova(cbind(iris$Sepal.Length, iris$Sepal.Width, iris$Petal.Length, iris$Petal.Width) ~ iris$Species, data=iris);
summary(MrIris, intercept = TRUE)
```

    ##               Df  Pillai approx F num Df den Df    Pr(>F)    
    ## (Intercept)    1 0.99313   5203.9      4    144 < 2.2e-16 ***
    ## iris$Species   2 1.19190     53.5      8    290 < 2.2e-16 ***
    ## Residuals    147                                             
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

What we can see here is that, based on coorelation between these 4
variables, they were definitely impacted by the species of flower. But
how to tell which variable was impacted by species? I can use the
summary.aov() command for that, and it’ll spit out different Responses
(1, 2, 3, 4). The numbers of the responses co-incide which what order
the variables were put into the MrIris variable. ~~he’s Mister Iris
because he’s a MANova~~

#### Follow-up analysis

``` r
summary.aov(MrIris)
```

    ##  Response 1 :
    ##               Df Sum Sq Mean Sq F value    Pr(>F)    
    ## iris$Species   2 63.212  31.606  119.26 < 2.2e-16 ***
    ## Residuals    147 38.956   0.265                      
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ##  Response 2 :
    ##               Df Sum Sq Mean Sq F value    Pr(>F)    
    ## iris$Species   2 11.345  5.6725   49.16 < 2.2e-16 ***
    ## Residuals    147 16.962  0.1154                      
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ##  Response 3 :
    ##               Df Sum Sq Mean Sq F value    Pr(>F)    
    ## iris$Species   2 437.10 218.551  1180.2 < 2.2e-16 ***
    ## Residuals    147  27.22   0.185                      
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ##  Response 4 :
    ##               Df Sum Sq Mean Sq F value    Pr(>F)    
    ## iris$Species   2 80.413  40.207  960.01 < 2.2e-16 ***
    ## Residuals    147  6.157   0.042                      
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

We can see that the p-value of all these variables is *actually* the
same. That makes sense, because a flower’s species has just as much
impact on its sepals, as its petals, as everything else. In a dataset
that wasn’t asking something basic like, how does what something is
impact how it is, or how much does the circumfrence and radius of a
circle coorelate (essentially), we would get differing p-values and that
would narrow down our focus. Othertimes, we might even get a MANOVA that
proves there is a significant difference between one group and another,
but the univariate ANOVA follow-up doesn’t accomodate for variable
coorelation. This seems to impact whether you can do a ‘contrast’ or not
with intercepts.

I found a source that discussed using ‘contrast models’ after doing an
ANOVA, but we don’t really have any data to contrast here. There are
notes about these contrasts on github
[here](https://gaopinghuang0.github.io/2017/11/20/MANOVA-notes-and-R-code).

### Non-parametric: Wilcoxon Signed Rank Test (efficiency 0.95)

We can use this test for testing if *matched pairs* have some property
where the median is equal (or not) to zero  
or for testing a claim that the population has a median equal to a
claimed value (single-t test).

We need to pair each sample with a claimed median (even if that’s just
the null hypothesis being paired with everything) so that we have
matched pairs, due to the nature of this test.  
We need a simple random sample and approximately symmetric distribution;
but we do not need a normal distribution. Use this for t-tests that do
not have a normal distribution, essentially. It’s not really important
that the distrubution is NOT normal, but if it IS normal, you’re wasting
data by using this test rather than a t-test.  
I’ve made the mistake of not checking my datasets for normality before
running them through t-tests, but I suppose I did not know how to do
non-parametrics in R beforehand anyway and it had been a little while
since I thought about it.

#### Testing for (lack of) normality and presence of symmetry

For my test I used my friendship bonus $stagessince data.  
This is because I can’t prove that the data is normally distributed. If
data is normally distributed, the p-value with a shapiro-wilk test
should be above 0.05, but here it is not–probably because n is only 30.

``` r
shapiro.test(FB$StagesSince[2:31])
```

    ## 
    ##  Shapiro-Wilk normality test
    ## 
    ## data:  FB$StagesSince[2:31]
    ## W = 0.90918, p-value = 0.01419

However, I can verify with a skewness test that the data is
approximately normally skewed. (It’s between -+0.5). It is close to
being moderately skewed towards smaller numbers, but not significantly
enough that we can’t use a wilcoxon test.

``` r
skewness(FB$StagesSince[2:31])
```

    ## [1] -0.4739936

#### Doing the test with just X

I’m going to do a “1-way t-test” replacement to check if the median (not
the mean, since this is non-parametric) is equal to 8. I know that the
mean is 8, so I wanted to see what happens. I will also test for 7 and 9
to see what happens if I ‘miss’ the mean in my paired data test.

``` r
wilcox.test(FB$StagesSince, mu=8, alternative = "two.sided", conf.int = TRUE)
```

    ## Warning in wilcox.test.default(FB$StagesSince, mu = 8, alternative =
    ## "two.sided", : cannot compute exact p-value with ties

    ## Warning in wilcox.test.default(FB$StagesSince, mu = 8, alternative =
    ## "two.sided", : cannot compute exact confidence interval with ties

    ## Warning in wilcox.test.default(FB$StagesSince, mu = 8, alternative =
    ## "two.sided", : cannot compute exact p-value with zeroes

    ## Warning in wilcox.test.default(FB$StagesSince, mu = 8, alternative =
    ## "two.sided", : cannot compute exact confidence interval with zeroes

    ## 
    ##  Wilcoxon signed rank test with continuity correction
    ## 
    ## data:  FB$StagesSince
    ## V = 124, p-value = 0.9477
    ## alternative hypothesis: true location is not equal to 8
    ## 95 percent confidence interval:
    ##  6.500028 9.000053
    ## sample estimates:
    ## (pseudo)median 
    ##       7.999986

``` r
wilcox.test(FB$StagesSince, mu=7, alternative = "two.sided", conf.int = TRUE)
```

    ## Warning in wilcox.test.default(FB$StagesSince, mu = 7, alternative =
    ## "two.sided", : cannot compute exact p-value with ties

    ## Warning in wilcox.test.default(FB$StagesSince, mu = 7, alternative =
    ## "two.sided", : cannot compute exact confidence interval with ties

    ## Warning in wilcox.test.default(FB$StagesSince, mu = 7, alternative =
    ## "two.sided", : cannot compute exact p-value with zeroes

    ## Warning in wilcox.test.default(FB$StagesSince, mu = 7, alternative =
    ## "two.sided", : cannot compute exact confidence interval with zeroes

    ## 
    ##  Wilcoxon signed rank test with continuity correction
    ## 
    ## data:  FB$StagesSince
    ## V = 292, p-value = 0.04194
    ## alternative hypothesis: true location is not equal to 7
    ## 95 percent confidence interval:
    ##  7.000047 8.999951
    ## sample estimates:
    ## (pseudo)median 
    ##       8.000001

``` r
wilcox.test(FB$StagesSince, mu=9, alternative = "two.sided", conf.int = TRUE)
```

    ## Warning in wilcox.test.default(FB$StagesSince, mu = 9, alternative =
    ## "two.sided", : cannot compute exact p-value with ties

    ## Warning in wilcox.test.default(FB$StagesSince, mu = 9, alternative =
    ## "two.sided", : cannot compute exact confidence interval with ties

    ## Warning in wilcox.test.default(FB$StagesSince, mu = 9, alternative =
    ## "two.sided", : cannot compute exact p-value with zeroes

    ## Warning in wilcox.test.default(FB$StagesSince, mu = 9, alternative =
    ## "two.sided", : cannot compute exact confidence interval with zeroes

    ## 
    ##  Wilcoxon signed rank test with continuity correction
    ## 
    ## data:  FB$StagesSince
    ## V = 71, p-value = 0.01293
    ## alternative hypothesis: true location is not equal to 9
    ## 95 percent confidence interval:
    ##  6.950047 8.949937
    ## sample estimates:
    ## (pseudo)median 
    ##        7.94996

Each test tells us what the alternate hypothesis is, so that we know
what to do with the p-value. For 8, the probability that the median is
equal to 8 is greater than 0.05; but for 7 and 9, this is not the case.
Because of the p-value we can interpret that 8 is the true location of
the median, and that 9 and 7 are not the true locations.  
`two.sided` refers to the fact that we are testing both sides of the
probability curve, because it makes equal sense that the alternate
hypothesis could result in a number above and below the null hypothesis.
we could also use `less` or `greater` if they were applicable for the
context.

#### Doing the test wtih X and Y

First, let’s generate X and Y. I’ll be using the random library to make
random numbers. In one version, PAIRED with be TRUE; in the other,
FALSE; to see what happens.

``` r
var1 <- randomNumbers(n=70, min=1, max=500, col=2);
var2 <- randomNumbers(n=70, min=1, max=500, col=2);
wilcox.test(var1, var2, mu=250, alternatives="two.sided", paired=TRUE, conf.int = TRUE)
```

    ## 
    ##  Wilcoxon signed rank test with continuity correction
    ## 
    ## data:  var1 and var2
    ## V = 179.5, p-value = 5.037e-10
    ## alternative hypothesis: true location shift is not equal to 250
    ## 95 percent confidence interval:
    ##  -13.49994  89.00001
    ## sample estimates:
    ## (pseudo)median 
    ##       37.00001

When both X and Y are given and PAIRED is FALSE, it’s for comparing two
indendent populations rather than dependent populations, which makes it
instead a:

#### Wilcoxon Rank SUM test

``` r
wilcox.test(var1, var2, mu=250, alternatives="two.sided", paired=FALSE, conf.int = TRUE)
```

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  var1 and var2
    ## W = 789.5, p-value = 4.569e-12
    ## alternative hypothesis: true location shift is not equal to 250
    ## 95 percent confidence interval:
    ##  -11.99993  87.00005
    ## sample estimates:
    ## difference in location 
    ##               36.99998

When variables are paired (correctly), coorelations are easier to find
and the confidence interval will be more narrow. Unpaired data should
not be falsely paired, however.

### Wilcoxon-Mann-Whitney Test

This is the non-parametric equivilant of a 2-way t-test, for comparing
the medians between two different variables. We can test for if there’s
a significant difference beween first variable median and second
variable median.  
Let’s use friendship bonus data; both the data I received from
LordArcanite\#1325 `(FB$StagesSince[2:31])` and from
SleepyRider\#7340`SleepyFB$FBGap[1:19]`. Sleepy’s data collection was
comphrehensive for general stage information, but in this case I will be
comparing only the StagesSince variable from Arc’s data and the FBGap
variable from Sleepy’s data (bolded only), of which there is n19.
Because n\<30 I am using a non-parametric test for the comparison of
medians for these two data sets.

``` r
wilcox.test(FB$StagesSince[2:31], SleepyFB$FBGap[1:19], correct = FALSE, conf.int = TRUE)
```

    ## Warning in wilcox.test.default(FB$StagesSince[2:31], SleepyFB$FBGap[1:19], :
    ## cannot compute exact p-value with ties

    ## Warning in wilcox.test.default(FB$StagesSince[2:31], SleepyFB$FBGap[1:19], :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test
    ## 
    ## data:  FB$StagesSince[2:31] and SleepyFB$FBGap[1:19]
    ## W = 355, p-value = 0.1451
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.0000684063  2.0000687672
    ## sample estimates:
    ## difference in location 
    ##              0.9999397

Here, we cannot disprove the null hypothesis that the true location
shift of the median is 0. We also see that the confidence variable
includes 0, meaning that we cannot be confident that one median is
either below or above the other. However, for this data, this is a good
thing\! What this means is that the median is approximately the same for
both sets of data. Of course, we must take this with a grain of salt,
because n is only 19 for one of these–but it is the expected result.

### Kruskal-Wallis Test

This is like a one-way ANOVA that does not require the samples involved
to have normal distributions or equal n, and tests for medians instead
of means because it is non-parametric. We use it to test 3+ simple
random samples that are independent (and each sample needs at least five
obsevations); the null hypothesis in this case is that samples come from
the same population. Alternate hypothesis is if the samples come from
populations with inequal medians.

Let’s use the built in R dataset `"airquality"`, and test for if the
Month that air quality was tested in (there are 4 months; 3+ so not a
t-test) impacts the amount of Ozone that was measured (independent
variable). We put the independent variable first, and the dependent
variable second since the formula is `response ~ group`.

``` r
str(airquality);
```

    ## 'data.frame':    153 obs. of  6 variables:
    ##  $ Ozone  : int  41 36 12 18 NA 28 23 19 8 NA ...
    ##  $ Solar.R: int  190 118 149 313 NA NA 299 99 19 194 ...
    ##  $ Wind   : num  7.4 8 12.6 11.5 14.3 14.9 8.6 13.8 20.1 8.6 ...
    ##  $ Temp   : int  67 72 74 62 56 66 65 59 61 69 ...
    ##  $ Month  : int  5 5 5 5 5 5 5 5 5 5 ...
    ##  $ Day    : int  1 2 3 4 5 6 7 8 9 10 ...

``` r
kruskal.test(airquality$Ozone ~ airquality$Month)
```

    ## 
    ##  Kruskal-Wallis rank sum test
    ## 
    ## data:  airquality$Ozone by airquality$Month
    ## Kruskal-Wallis chi-squared = 29.267, df = 4, p-value = 6.901e-06

What we are testing for here is how the responses are impacted by their
corresponding groups. Response is the Ozone, and Groups are the months.
Our null hypothesis is that the median for the Responses are equal to
each other, even when they are Grouped based on the month they were
collected in.  
Our p-value here is significantly small; the probability that the median
for all 3 groupss is the same is less than alpha. Thus we can reject the
null hypothesis and accept our alternate hypothesis: median ozone varies
based on the month. This is sensible based on the data. Air quality was
measured during May-September; it makes sense for Ozone to be different
for the end of Spring, the entire Summer, and the beginning of Autumn.

To continue reading the CH6 reports, select a new section:  
Next: [Part 4 of the Chapter 6
Reports](https://github.com/Nurrospody/SOURCE-Statistics-ILC/blob/master/Chapter%20Reports/CH6-part4.md)  
Previous: [Part 2 of the Chapter 6
Reports](https://github.com/Nurrospody/SOURCE-Statistics-ILC/blob/master/Chapter%20Reports/CH6-part2.md)

[Link to README to select any Chapter
Report](https://github.com/Nurrospody/SOURCE-Statistics-ILC/blob/master/README.md)
