Logical Statements & Loops : Chapter 3 *Learn R for Applied Statistics :
With Data Visualizations, Regressions, and Statistics*
================
Nurrospody
4/21/2020

  - [Logical Statements & Loops : Commands Used: Assign pumpkin; print
    pumpkin; **for(p in pumpkin); if(p %% 2 \!= 0); else; message;**.
    Modulus %% was learnt and used. {}s were
    used.](#logical-statements-loops-commands-used-assign-pumpkin-print-pumpkin-forp-in-pumpkin-ifp-2-0-else-message.-modulus-was-learnt-and-used.-s-were-used.)

#### Logical Statements & Loops : Commands Used: Assign pumpkin; print pumpkin; **for(p in pumpkin); if(p %% 2 \!= 0); else; message;**. Modulus %% was learnt and used. {}s were used.

On Week 4, Tuesday, I experimented with loops and logical statements. My
book presented these ideas seperately, but they really make the most
sense together.

First, I made variable “pumpkin”;

``` r
pumpkin <- c(1:13); print(pumpkin)
```

    ##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13

Next, I needed to decide what to do with pumpkin. I decided that for
each variable/element in pumpkin (each p in pumpkin), I would make a
*for* loop and check if each p in pumpkin was divisible by 2.

``` r
for (p in pumpkin) {
    #for each element/value in pumpkin, print if that value is divisible by 2 
  }
```

This loop isn’t useful on its own without a logical statement to pair
with. Our *if . . . else* statment uses modulus arithmetic, %%. If
pumpkin’s remainder after dividing by 2 IS NOT 0, it is not divisible by
zero. Elsewise, pumpkin IS divisible by 0. After determining if pumpkin
is or isn’t divisible by 0 using modulus, the statement prints a
message.

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

(Under each message, there is a comment about concatenating (string
print format (formating language))). This comment is remainder code from
when my partner and I did some back-and-forth on how to get the message
to print correctly with spaces, values, and all.

I kept one of the failed attempts, so that I could explain what went
wrong:

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
the logical statement, so the loop didn’t actually do anything. My
partner had me use Notepad++ for writing the code rather than the
console so that I could see language highlighting (writing directly into
the console is kind of awful for any lengthy code it seems) but since R
is an IDE, I can also use another R Code Workspace tab.  
I had been trying to divide pumpkin (a vector) instead of the variables
inside of pumpkin (p in pumpkin), and math functions cannot be excecuted
on an entire vector. Once these issues were fixed, I had not *told* it
that I wanted each value that did/did not divide into 2 to be displayed
next to the result, so it simply showed \[1\] by each result which
wasn’t helpful.
