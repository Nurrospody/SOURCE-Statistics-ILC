A Look into Resampling
================
Nurrospody
9/1/2020

  - [Resampling Intro](#resampling-intro)
      - [Resampling instead of validation
        method](#resampling-instead-of-validation-method)
      - [Using MSE to show that validation model may not work and we
        need
        resampling](#using-mse-to-show-that-validation-model-may-not-work-and-we-need-resampling)
  - [Leave-One-Out Cross-Validation
    Resampling](#leave-one-out-cross-validation-resampling)

### Resampling Intro

I’m using a [github.io resampling R
tutorial](https://uc-r.github.io/resampling_methods) for this report, as
my book does not cover the subject. See {r setup, include=FALSE} block
inside of the (Rmd)\[\] for information on new packages used in this
report.

When we resample, we take one sample that we’ve gathered already (a
“training” set) and then repeatedly refit a model of interest to it.
When we refit this model multiple times, we get slightly different
models–and we can compare how different these models are to investigate
the extent that test results can differ. With resampling, we can get
more information than we can with just taking one sample. Often we pair
resampling with linear regression models.

#### Resampling instead of validation method

Resampling is an ‘alternative’ to something called the *validation* or
*hold out* approach, where data is split into a “training set” and
“testing/validation set”. In The validation approach, data is divided
equally in half to these two different sets.

When plotting our data, we want to know what model it fits best to. We
can use a loop test to test out 10 different models, from linear to 10th
degree polynomial. Then what we look for, when we plot this test, is
when our test error (MSE) flatlines after decreasing. When a test
flatlines, we see that adding extra polynomial degrees does not improve
the model preformance, and we want to stop there.

#### Using MSE to show that validation model may not work and we need resampling

The MSE is dependent on what particular data is in our training and
validation samples. For some datasets, it’s not important nessesarily
which data is in which sets; but for other datasets, it’s *very*
important. If we use the Auto dataset from the ISLR package, and do the
MSE test 10 times, we can see a problematically wide range of MSE
estimates when we use the validation test.

![](https://uc-r.github.io/public/images/analytics/resampling/unnamed-chunk-4-1.png)
This plot, from the source I’m using as my tutorial, displays how wide
the MSE for the `Auto` dataset varies based on what’s in and what’s not
in each different sample set. Thus, we decide to use resampling methods
instead.

### Leave-One-Out Cross-Validation Resampling
