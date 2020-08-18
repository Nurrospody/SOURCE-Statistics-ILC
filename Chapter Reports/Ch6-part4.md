CH6 part4 Linear Regressions
================
Nurrospody
8/17/2020, *Learn R for Applied Statistics : With Data Visualizations,
Regressions, and Statistics*

  - [Linear Regression (lm)](#linear-regression-lm)
      - [Testing for normality](#testing-for-normality)
      - [Spearman’s rank correlation
        test](#spearmans-rank-correlation-test)
  - [Multiple Linear Regression](#multiple-linear-regression)

### Linear Regression (lm)

With a linear regression, we can test for a linear relationship between
one independent variable and one dependent variable.  
I’m going to Arc’s friendship bonus data, and test for if `FB$Stage`
(independent variable) has any linear relationship with `FB$StagesSince`
(dependent variable). The research question is: If the Stage number is
higher, do friendship bonuses occur more often?  
The null hypothesis is that there is no linear relationship; the
alternate hypothesis is that the number of a stage has a statistically
significant effect on the stages since a friendship bonus was received.

#### Testing for normality

In a previous excercise, I had already used
`shapiro.test(FB$StagesSince[2:31])` to test for normality (I could not
find normality, presumably because of n30); I had also already used
`skewness(FB$StagesSince[2:31])` to test for normality of skew.  
However, this time I will instead use a histogram and linear plot to
test for linearity.

``` r
hist(FB$StagesSince); plot(Stage ~ StagesSince, data = FB)
```

![](Ch6-part4_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->![](Ch6-part4_files/figure-gfm/unnamed-chunk-1-2.png)<!-- -->

The histogram appears to be relatively normal; however, we can see with
the basic plot that no linear relationship exists. **We can immediately
fail to reject the null hypothesis**.

For the sake of this excercise, though, I will complete the linear
analysis so that I can use the commands.

``` r
#lm(Dependent variable ~ independent variable)
StageNum.StagesSince.lm <- lm(StagesSince ~ Stage, data = FB)
summary(StageNum.StagesSince.lm)
```

    ## 
    ## Call:
    ## lm(formula = StagesSince ~ Stage, data = FB)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -4.5471 -0.5696  0.1390  1.4143  3.6118 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  8.72046    0.88139   9.894 1.22e-10 ***
    ## Stage       -0.01444    0.01384  -1.044    0.306    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 2.184 on 28 degrees of freedom
    ##   (2 observations deleted due to missingness)
    ## Multiple R-squared:  0.03745,    Adjusted R-squared:  0.003073 
    ## F-statistic: 1.089 on 1 and 28 DF,  p-value: 0.3055

In the summary, we see our model equation, standard error, t-value, and
p-value.  
(Intercept) is the y-intercept of the regression equation, but because
there is no linear relationship it doesn’t matter here. Othewise, we
could use this data to predict where points that we don’t have may fall
within our range of variables. (Predicting outside sometimes works, but
can also be completely wrong, such as with income/happiness data.)

Our p-value for Stage is 0.306–much greater than alpha 0.05. We fail to
reject our null hypothesis that there is no linear relationship.

#### Spearman’s rank correlation test

This is the non-parametric test that can be run for data that does not
fulfil the normality requirements (or similar variance requirements aka
homoscedasticity) for the parametric linear regression test.  
We would need to `install.packages("ggpubr")`, load the library
`library("ggpubr")`, and then use the function `cor.test()` rather than
lm() which we used for the parametric test. I have inferred from the gg-
in front of the package name that this is related to the ggplot
package\!

### Multiple Linear Regression

With multiple linear regression, we can test for linear relationships
between multiple independent variables and one dependent variable.

To continue reading the CH6 reports, select a new section:  
Next: [Part 5 of the Chapter 6
Reports](https://github.com/Nurrospody/SOURCE-Statistics-ILC/blob/master/Chapter%20Reports/CH6-part5.md)  
Previous: [Part 3 of the Chapter 6
Reports](https://github.com/Nurrospody/SOURCE-Statistics-ILC/blob/master/Chapter%20Reports/Ch6-part3.md)

[Link to README to select any Chapter
Report](https://github.com/Nurrospody/SOURCE-Statistics-ILC/blob/master/README.md)
