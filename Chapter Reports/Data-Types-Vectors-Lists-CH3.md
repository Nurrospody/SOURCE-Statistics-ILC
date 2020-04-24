Data Types, Vectors, & Lists: Chapter 3 *Learn R for Applied Statistics
: With Data Visualizations, Regressions, and Statistics*
================
Nurrospody
Week 3 Monday-ish

  - [Data Types *Commands Used* - (class()), (is.datatype),
    (as.datatype)](#data-types-commands-used---class-is.datatype-as.datatype)
  - [Vectors *Commands Used* c(), typeof(), class(), length(), :
    operator, print(), \[\] brackets for retrieving vectors, modify a
    vector with
    -\>](#vectors-commands-used-c-typeof-class-length-operator-print-brackets-for-retrieving-vectors-modify-a-vector-with--)
  - [Lists *Non-duplicate Commands Used* list(), str(), \[\[sublist\]\],
    NULL](#lists-non-duplicate-commands-used-list-str-sublist-null)

#### Data Types *Commands Used* - (class()), (is.datatype), (as.datatype)

In case the data type for a variable isn’t known for some reason,
(class()) or (is.datatype) can be used. “datatype” in is.datatype gets
replaced by any of the types of data.

``` r
#Determine the data type of variable A.
A <- 1; print(class(A)); print(is.numeric(A)); print(is.character(A)); print(is.logical(A))
```

    ## [1] "numeric"

    ## [1] TRUE

    ## [1] FALSE

    ## [1] FALSE

In specific cases, datatypes can be converted, such as the following
case:

``` r
C <- 7;
D <- "7"; 
#C + D results in a *"Line 74 Error in C + D : non-numberic argument to binary operator Calls"* and halts the Excecution.
```

D must be used as.numeric:

``` r
D <- as.numeric(D);
C + D;
```

    ## [1] 14

#### Vectors *Commands Used* c(), typeof(), class(), length(), : operator, print(), \[\] brackets for retrieving vectors, modify a vector with -\>

Let’s make a new variable, E, as a vector, then investigate it

``` r
E <- c(5,6,7,8,9); print(E); typeof(E); class(E); length(E);
```

    ## [1] 5 6 7 8 9

    ## [1] "double"

    ## [1] "numeric"

    ## [1] 5

Let’s test a short logical excercise. There are only 5 values in E, but
I typed out 6 true/false values, so the last one is NA.

``` r
E[c(FALSE, TRUE, FALSE, TRUE, FALSE, TRUE)];
```

    ## [1]  6  8 NA

Let’s look at E one last time. What happens if we modify a vector? If we
modify the third value, it gets REPLACED, not ADDED IN.

``` r
print(E);
```

    ## [1] 5 6 7 8 9

``` r
E[3] <- 9;
print(E);
```

    ## [1] 5 6 9 8 9

Next let’s make another new variable, F, as another larger vector for
some additional excercises. What is the fifth value inside of this
vector? What about the fifth AND ninth? All the values without the
fifth?

``` r
F <- 4:20; print(F);
```

    ##  [1]  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20

``` r
F[5]; F[c(5,9)]; F[-5];
```

    ## [1] 8

    ## [1]  8 12

    ##  [1]  4  5  6  7  9 10 11 12 13 14 15 16 17 18 19 20

Let’s test using the less than sign to retrieve an element from the
vector. There is nothing \<4, but there is something \<5.

``` r
F[F<4]; F[F < 5];
```

    ## integer(0)

    ## [1] 4

### Lists *Non-duplicate Commands Used* list(), str(), \[\[sublist\]\], NULL

This section used a lot of duplicate commands from the Vector section,
so only the new ones are shown.

``` r
#Here we're making a new variable G, as a list; it has both character and numeric data types inside of it (something a vector cannot do).
G <- list("fox", "phoenix", "water", 9); print(G); str(G);
```

    ## [[1]]
    ## [1] "fox"
    ## 
    ## [[2]]
    ## [1] "phoenix"
    ## 
    ## [[3]]
    ## [1] "water"
    ## 
    ## [[4]]
    ## [1] 9

    ## List of 4
    ##  $ : chr "fox"
    ##  $ : chr "phoenix"
    ##  $ : chr "water"
    ##  $ : num 9

According to \[\[string\]\], there seems to be a difference between a
list and a sublist; I’ll have to figure the practical use of this
difference with supplementary material.

``` r
G[1]; G[[1]];
```

    ## [[1]]
    ## [1] "fox"

    ## [1] "fox"

NULL (caps sensitive?) is a new command for assigning NULL to part of a
list, I presume it would work for a vector as well..

``` r
G[[4]] <- NULL; print(G)
```

    ## [[1]]
    ## [1] "fox"
    ## 
    ## [[2]]
    ## [1] "phoenix"
    ## 
    ## [[3]]
    ## [1] "water"
