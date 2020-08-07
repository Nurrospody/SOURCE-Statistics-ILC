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

To continue reading the CH6 reports, select a new section:  
Next: [Part 4 of the Chapter 6
Reports](https://github.com/Nurrospody/SOURCE-Statistics-ILC/blob/master/Chapter%20Reports/CH6-part4.md)  
Previous: [Part 2 of the Chapter 6
Reports](https://github.com/Nurrospody/SOURCE-Statistics-ILC/blob/master/Chapter%20Reports/CH6-part2.md)

[Link to README to select any Chapter
Report](https://github.com/Nurrospody/SOURCE-Statistics-ILC/blob/master/README.md)
