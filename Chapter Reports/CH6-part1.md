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
  - [ANOVA: aov(), TukeyHSD(), aictab()
    commands](#anova-aov-tukeyhsd-aictab-commands)

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

    ## [1] Volume 1 Volume 3 Volume 1 Volume 3 Volume 2 Volume 2
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
    ## 1          5.4         3.9          1.3         0.4 setosa    
    ## 2          4.8         3.4          1.6         0.2 setosa    
    ## 3          5.2         3.4          1.4         0.2 setosa    
    ## 4          6           2.2          4           1   versicolor
    ## 5          5.1         2.5          3           1.1 versicolor
    ## 6          5.6         2.9          3.6         1.3 versicolor
    ## 7          7.2         3.2          6           1.8 virginica 
    ## 8          6.1         3            4.9         1.8 virginica 
    ## 9          6.7         3.1          5.6         2.4 virginica

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
    ## 1          5           3.4          1.6         0.4 setosa    
    ## 2          5.8         2.7          4.1         1   versicolor
    ## 3          7.1         3            5.9         2.1 virginica

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

`cov()` function  
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
`t.test()` function  
Example filled out `t.test(data$var1, mu=0.6);`  
Make data.frame, pull one /$ out of the data.frame *only*, and include
mu= to ask if the mean is equal to mu. In the example case, we’re asking
if the mean of var1 in data is equal to 0.6. Can we reject that the mean
in var1 is equal to 0.6?

**2 sample t-test** Question: are the means of these two samples the
same?  
`t.test()` function  
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
`chisq.test(data)` function  
putting data in the chi square test will spit out information about the
degrees of freedom, p-value, etc.  
*Extra important to come back to this section. The book didn’t explain
it very well*.

**Two categorical variable (Contingency Test)** Question: is there a
relationship between these two variables?  
`chisq.test(data.table)` function  
Unlike the goodness of fit test (one categorical variables), when doing
a contingency test (two categorical variables), the data needs to be
input as a TABLE. This means that before doing the
chisq.test(data.table) you need to assign your variables to a `table`.  
Example from book: `data.table <- table(data$var1, data$var2);
chisq.test(data.table);`  
Just like the last one, this use of chisq.test will also spit out a
chi-square value, degrees of freedom, and p-value.  
*This section made more sense, since the data gave itself context.*

### ANOVA: aov(), TukeyHSD(), aictab() commands

This is for testing the means of two or more different GROUPS. Are these
multiple means the same? Note: Often, an amateur mistake is thinking
multiple T-tests can be done for something, but in reality an ANOVA
needs to be done as to not muliplicatively reduce the power of a
result.  
When done by hand, Anova uses both the sample means of (everything), and
also a ‘grand mean’ which is the mean of all sample means.  
When the distribution of multiple samples overlap, their means are not
significantly different. No overlap means that there is a significant
difference. The grand mean will reflect this difference.  
Different levels of difference (between sample means) can be called
‘little discrimination’, ‘some discrimination’, or ‘large
discrimination’ in ascending order.

The more variance increases, the grater the overlap is, and then these
can be considered part of the same population. With small variances, and
no overlap, the groups are considered seperate populations, even if they
have similar means.

**One-way ANOVA**  
`aov()` function  
`summary()` function  
Example filled out: `variable <- aov(section ~ section, data =
data.frame the sections are from); summary(variable)`

I downloaded a sample dataset for using with ANOVA,
[crop.data.csv](https://github.com/Nurrospody/SOURCE-Statistics-ILC/blob/master/data_sources/crop.data.csv).
This dataset has 4 different variables about growing crops: density of
crops, which block it was in, which fertilzer was used, and what the
yield’s weight was. (no unit is offered, but probably pounds).  
Let’s test if the fertilzer that was used, has an impact on the yield
poundage. We are using an ANOVA for this, and not a T-test, because
there are 3+ fertilzers rather than 2. We are using as.factor for the
fertilzer $, because otherwise our results are incorrect and we cannot
do a future test.

``` r
one.way <- aov(yield ~ as.factor(fertilizer), data = Crop);
```

To get our results and interpret them, we need to use the summary()
function. This is why we need to assign the result of our aov() to a
variable, rather than just letting it print on its own.

``` r
summary(one.way)
```

    ##                       Df Sum Sq Mean Sq F value Pr(>F)    
    ## as.factor(fertilizer)  2   6.07  3.0340   7.863  7e-04 ***
    ## Residuals             93  35.89  0.3859                   
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

*Df* means ‘degrees of freedom’, *sum sq* is the ‘sum of the square
between the group means and overal mean’, and *mean sq* is the mean of
the sum of the squares. Earlier I made some notes about how one would do
an ANOVA long hand, and those values are relevant for long-hand and
double checking the equation, basically. **With those values**, an
*F-value* is created (ANOVA is an f-test, vs a t-test). We want our
F-value to be larger to indicate a variation that’s associated with our
independent variable, rather than random chance.  
*Pr(\>F)* is the **F-value transformed into a P-value**. I.e., the
probability that this result could have happened by chance alone.  
This P-value of 0.000207\<0.05, the typical alpha value. Thus, we can
reject the null hypothesis that there is no difference between the mean
of groups that did, or did not, have different fertilzers. The alternate
hypothesis, that fertilzer impacts the mean in a meaningful way, appears
true.

But which fertilzer, 1, 2, or 3, impacts it the most? ANOVA cannot tell
us this. We must do a

**Post-hoc test**  
`TukeyHSD()` function to figure out which fertilzer impacts the mean the
most.  
This is the test that we could not do without fertilzer being as.factor.

``` r
TukeyHSD(one.way)
```

    ##   Tukey multiple comparisons of means
    ##     95% family-wise confidence level
    ## 
    ## Fit: aov(formula = yield ~ as.factor(fertilizer), data = Crop)
    ## 
    ## $`as.factor(fertilizer)`
    ##          diff         lwr       upr     p adj
    ## 2-1 0.1761687 -0.19371896 0.5460564 0.4954705
    ## 3-1 0.5991256  0.22923789 0.9690133 0.0006125
    ## 3-2 0.4229569  0.05306916 0.7928445 0.0208735

The table result shows the variable being tested (Crop). Then it shows
the paired differences for our independent variable. In this case, we’d
already found that the crop yield is DEPENDENT on the fertilzer (but
which fertilzer we just so happen to add, is independent of what the
crop yield is in the future). The table compares fertilzer 1, 2, and 3
with each other.  
*diff* means the mean difference between the two fertilzer treatments;
*lwr/upr* are the upper and lower bounds for our confidence interval
(that the fertilzers, indeed, are different); *p adj* is the P-value, as
adjusted for this multiple pair comparison test.  
We can conclude that there is no major difference between fertilzer 2
and 1, because the confidence interval includes 0. The difference
between 3 and 1 is significant (confidence interval does not start near
1; p-value is nowhere near alpha). There is a significant difference
between 2 and 3, but because there is no significant difference between
2 and **1**, we can conclude that *fertilzer 3 positively impacts yield
the most*.

**Two-way ANOVA**  
2-way starts with the same basic formula, except you add extra
independent variables. To model your different independent variable NOT
interacting with each other, use `+`. To model your different
independent variables YES intearacting with each other, use `*`.  
Let’s create a few models, and test which is most accurate. Without
knowing what data specifically to look at, trying to interpret a 2-way
ANOVA feels like flailing in the dark. We want the model that is the
best fit for our data; the one that explains the MOST variation.

1.  Is there interaction between what fertilzer is used, what the crop
    density is, and what the final yield is? Here we use +, to predict
    that crop density does not effect the fertilzer.  
2.  The same as 1, except we use \*, to see if the crop density DOES
    affect the fertilzer (which in turn affects final yield).
3.  We add ‘block’, because the plants were planted in random blocks. Do
    the random blocks impact results? (If they do, we would probably
    consider this data contaminated.)

<!-- end list -->

``` r
two.way <- aov(yield ~ as.factor(fertilizer) + as.factor(density), data = Crop);  
fert.dens.interact <- aov(yield ~ as.factor(fertilizer) * as.factor(density), data = Crop);  
blok.fertdens <- aov(yield ~ as.factor(fertilizer) * as.factor(density) + as.factor(block), data = Crop); 
```

We want the `aictab()` function for this. It’s part of the **AICcmodavg
library**. I installed that package, but it didn’t come with all its
dependencies. It requires ‘raster’, which requires ‘Rcpp’.  
I got this error.

    ERROR: compilation failed for package 'raster'
    * removing 'C:/Users/Persimmon/Documents/R/win-library/3.6/raster'
    Warning in install.packages :
      installation of package ‘raster’ had non-zero exit status

The [information I could find about this
error](https://community.rstudio.com/t/i-can-t-install-packages-on-r-studio-non-zero-exit-status/52135/2)
~~used mac instead of windows~~ seemed to be a CRAN binary repository
corruption problem, so I’ll come back to this a bit later. Otherwise it
could be something that corrupted and I have to redownload stuff. For
now, I’ll display what should have happened without a language.

    require(AICcmodavg);
    model.set <- list(two.way, fert.dens.interact, blok.fertdens)
    model.names <- c("two.way", "fertilzer/density interaction", "block interaction")
    
    aictab(model.set, modnames = model.names)

Then it should have given me a table that listed, in descending order,
which model was the best fit; and I would have taken that model and ran
it through a Post-hoc test.

To continue reading the CH6 reports, select a new section:  
Next: [Part 2 of the Chapter 6
Reports](https://github.com/Nurrospody/SOURCE-Statistics-ILC/blob/master/Chapter%20Reports/CH6-part2.md)  
Previous: none.

[Link to README to select any Chapter
Report](https://github.com/Nurrospody/SOURCE-Statistics-ILC/blob/master/README.md)
