Logical Statements & Loops : Chapter 3 *Learn R for Applied Statistics :
With Data Visualizations, Regressions, and Statistics*
================
Nurrospody
4/21/2020

On Week 4, Tuesday, I experimented with loops and logical statements. My
book presented these ideas seperately, but they really make the most
sense together.  
First, I made variable “pumpkin”;

``` r
pumpkin <- c(1:13); print(pumpkin)
```

    ##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13

Next, I needed to decide what to do with pumpkin. In this case for each
variable in pumpkin, I want to *loop* *for* if the elements and/or
variables in pumpkin are divisible by 2. “p” stands for each variable in
the vector “pumpkin”.

``` r
for (p in pumpkin) {
    #for each element/value in pumpkin, print if that value is divisible by 2 
  }
```

This loop isn’t useful on its own without a logical statement to pair
with. Our *if else* statment is that if the leftoever after dividing p
by 2 is not 0 (modulus arithmetic), pumpkin does not divide into 2.

``` r
for (p in pumpkin) {
    #   for each element/value in pumpkin, print if that value is divisible by 2
    if(p %% 2 != 0) { 
        message(p, " NO, pumpkin not divisible by 2");
        #cat(sprintf("%d is not divisible by 2\n", p))
    } else {
        message(p, " YES, pumpkin divisible by 2");
        #cat(sprintf("%d is\n", p));
    }
}
```

    ## 1 NO, pumpkin not divisible by 2

    ## 2 YES, pumpkin divisible by 2

    ## 3 NO, pumpkin not divisible by 2

    ## 4 YES, pumpkin divisible by 2

    ## 5 NO, pumpkin not divisible by 2

    ## 6 YES, pumpkin divisible by 2

    ## 7 NO, pumpkin not divisible by 2

    ## 8 YES, pumpkin divisible by 2

    ## 9 NO, pumpkin not divisible by 2

    ## 10 YES, pumpkin divisible by 2

    ## 11 NO, pumpkin not divisible by 2

    ## 12 YES, pumpkin divisible by 2

    ## 13 NO, pumpkin not divisible by 2

The comments after printing each message (the cat, sssss whatever s
meant, print, format) is from when I was trying to figure out with my
partner how to print each number that did or did not divide evenly with
2.

I kept one of my failed attempts, to explain what didn’t work when
making these (the whole thing will have to be a comment, otherwise Rmd
won’t knit correctly):

``` r
#for (pumpkin in 1:13) {
     #for each element/value in pumpkin, print if that value is divisible by 2
 #}
 #if(pumpkin %% 2 != 0) { 
 #+ print("NO, pumpkin not divisible by 2");
     #+ } else {
     #+ print("YES, pumpkin divisible by 2");
```

In this attempt, the {} for the for loop didn’t correctly close around
the logical statement, so the loop didn’t actually do anything; and I
had been trying to divide pumpkin (a vector) instead of the variables
inside of pumpkin (so I needed p, not pumpkin). I also had not told it
that I wanted each value that did/did not divide into 2 to be displayed,
so when I did fix it, it simply showed \[1\] by each result which wasn’t
helpful.
