CH6 part 2 *Inferential Statistics & Regressions*
================
Nurrospody
7/24/2020, *Learn R for Applied Statistics : With Data Visualizations,
Regressions, and Statistics*

  - [T-Test 187-194](#t-test-187-194)
      - [**1 sample t-test**](#sample-t-test)
      - [**2 sample t-test**](#sample-t-test-1)
  - [Chi-Square Test 194-198](#chi-square-test-194-198)
      - [**One categorical variable (Goodness of
        Fit)**](#one-categorical-variable-goodness-of-fit)
      - [**Two categorical variable (Contingency
        Test)**](#two-categorical-variable-contingency-test)

*Let’s revisit some sections that only had basic notes written down in
Chapter6 part1.*

### T-Test 187-194

#### **1 sample t-test**

Question: is the mean of a population equal to \_\_\_?  
`t.test()` function  
When gathering data, we don’t actually know what the mean of a whole
population is. But we can use a 1-way T-test to figure out if a
population mean really could be something, not based on random chance
alone.  
The following isn’t really a good application for this test, but at
least we can do it.

``` r
t.test(Crop$yield, mu=100)
```

    ## 
    ##  One Sample t-test
    ## 
    ## data:  Crop$yield
    ## t = 1135.5, df = 95, p-value < 2.2e-16
    ## alternative hypothesis: true mean is not equal to 100
    ## 95 percent confidence interval:
    ##  176.8808 177.1501
    ## sample estimates:
    ## mean of x 
    ##  177.0155

Here, we’re testing for if the mean of “Crop” ‘yield’ variable is equal
to 100.  
The probability that the real mean is actually 100, with the data we’ve
given, is obscenely low. This could mean a couple of things. 1. there’s
no way the mean is 100 (which is the case here) OR the experiment that
found a mean that wasn’t equal to 100 used a non-random sampling
method.  
A 1-way T-test is how the ideda that a human’s mean body temperature was
98.6 was disproved. I would have used that dataset for this example, but
it’s protected from use except for classes that are using the Triola
textbook. (I own that book, but this ILC technically doesn’t use it.)

#### **2 sample t-test**

Question: are the means of these two samples the same?  
I needed two datasets that were similar for this one. Even though the
sample size is not quite big enough yet, I decided to load in the
[garden dataset that I’ve been
making](https://github.com/Nurrospody/SOURCE-Statistics-ILC/blob/master/data_sources/Garden%20Practicum.xlsx).
I’ll do a more comprehensive look into it later, so it’s fine. I loaded
Sheet 1.

``` r
t.test(Garden$Pansy2, Garden$Pansy5, var.equal=TRUE, paired=FALSE)
```

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  Garden$Pansy2 and Garden$Pansy5
    ## t = 2.9729, df = 50, p-value = 0.004529
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  0.4366744 2.2556333
    ## sample estimates:
    ## mean of x mean of y 
    ##  3.730769  2.384615

I chose to look at pansy 2 and pansy 5 because they have been very
succesful at different times in the past 26 days.  
The rest results tell us that the probability that these means are the
same is 0.4%, approximately. This is much lower than alpha, 0.05 (5%),
so we reject the null hypothesis (that they are the same). We get the
added benefit of seeing what the means are at the bottom, so we can
actually tell which mean is higher than the other without having to do
extra postHoc tests like with ANOVA. If I wanted to test all 5 pansies
at once, I could use a 1-way ANOVA, but that’s a little bit unnesseary
since I’m interested in sample mean, not variance. Still, it’d be
simpler than running 20 different 2-ways.

### Chi-Square Test 194-198

relationships between categorical variables/data (rather than continuous
data)  
uses hypothesis test null/alternate arguments.

#### **One categorical variable (Goodness of Fit)**

Question: Is this one sample we have, consistent with the distribution
of the other ones?  
`chisq.test(data)` function

#### **Two categorical variable (Contingency Test)**

Question: is there a relationship between these two variables?  
`chisq.test(data.table)` function  
I decided to see if the distribution of live pansies, was consistant
with the distribution of dead pansies. The amount of dead pansies s less
than live ones on any given days, but will it see a similar pattern? I
need to review what chi-square tests are in my basic stats textbook, so
seeing the result should help.

``` r
Pansylife <- data.frame(Garden$Pansy3, Garden2$Pansy3);
Pansytable <- table(Pansylife);
Pansytable
```

    ##              Garden2.Pansy3
    ## Garden.Pansy3 0 1 2 3 6
    ##             2 6 2 2 0 0
    ##             3 9 1 0 0 0
    ##             4 4 0 0 0 1
    ##             5 0 0 0 1 0

. . . I forgot that it had to be categorical variables and not
numerical, so this result doesn’t make a lot of sense. At least that
definitely shows what a chi-square test is supposed to be for\!\! I was
thinking of a Correlation test `cor()` which I still have to revisit.

Making mistakes about what tests do what has actually been super helpful
so far for figuring out what does what, though.
