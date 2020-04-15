Chapter 3 Basic Syntax Report for Book *Learn R for Applied Statistics :
With Data Visualizations, Regressions, and Statistics* (Week 2 Monday-)
================
Nurrospody
4/6/2020

  - [Notable Vocabulary](#notable-vocabulary)
  - [Writing in R Console - Basic Mathematics *Comands Used* :
    subraction, addition, division, multiplication, cosine, sine,
    tangent, standard deviation, mean, min, max,
    plot](#writing-in-r-console---basic-mathematics-comands-used-subraction-addition-division-multiplication-cosine-sine-tangent-standard-deviation-mean-min-max-plot)
  - [Making a basic script](#making-a-basic-script)
  - [Data Types *Commands Used* - (class), (is.datatype),
    (as.datatype)](#data-types-commands-used---class-is.datatype-as.datatype)
  - [Vectors *Commands Used* c(), typeof(), class(), length(), :
    operator, print(), \[\] brackets for retrieving vectors, modify a
    vector with
    -\>](#vectors-commands-used-c-typeof-class-length-operator-print-brackets-for-retrieving-vectors-modify-a-vector-with--)
  - [Lists *Non-duplicate Commands Used* list(), str(), \[\[sublist\]\],
    NULL](#lists-non-duplicate-commands-used-list-str-sublist-null)
  - [Matrix *Non-Duplicate Comands Used* matrix(), nrow, ncol, dimnames,
    attributes(), colnames(), rownames(), cbind(), rbind(),
    t()](#matrix-non-duplicate-comands-used-matrix-nrow-ncol-dimnames-attributes-colnames-rownames-cbind-rbind-t)
  - [Data Frames *Commands Used*
    data.frame()](#data-frames-commands-used-data.frame)

Still in Progress, this currently has a version in SOURCE but not
REPORTS (it will be in REPORTS once it is finished). ‘dog’ is
placeholder vocabulary definition because otherwise my formatting
breaks; many of these vocabulary terms are so simple that explaining
them is a bit difficult, so I’ll spend time doing that once I’ve
fihnished the rest of the chapter.

### Notable Vocabulary

**CRISP-DM** - dog  
**R Objects** - dog  
**Variables** - AKA. Variable is variable (python), something that is
defined and then can be used in the console.  
**Data Types** - What a data’s classification is–numeric, character,
TRUE/FALSE.  
**Lists** - Like a vector, a list can store a set of values, but it can
store values of multiple data types in a single list.  
**Vectors** - A data structure for storing a SET of data values of the
same type. The most basic and common data structure.  
**Matrix** - Like a vector, but in a table–a vector with ‘two
dimensions’ for the data. All data must of the same type.  
**Data Frames** - Usually stores data from EXCEL or .csv. these are like
matrices that contain multiple data types. They may look like charts
with both ‘names’ and numbers to go with those ‘names’.  
**Conditional Statements** - dog  
**Loops** - dog  
**Functions** - dog  
**\<-** - “Assign”

| Data Types        | Example Values                         |
| ----------------- | -------------------------------------- |
| Logical (Boolean) | TRUE/FALSE (CAPS sensitive command)    |
| Numeric           | 1(integer), 1.0(double), 0.33(double)  |
| Character         | “This is a bat” (quotes are mandatory) |

### Writing in R Console - Basic Mathematics *Comands Used* : subraction, addition, division, multiplication, cosine, sine, tangent, standard deviation, mean, min, max, plot

I discovered that if I use semi-colons to mark the end of a line
delimiter but DON’T break the line wtih ENTER, it compiles the
information in a way that is more legible for an RMarkdown report.

``` r
47-50; 89+6; 5 * 8; 54/870
```

    ## [1] -3

    ## [1] 95

    ## [1] 40

    ## [1] 0.06206897

``` r
cos(96); sin(96); tan(96)
```

    ## [1] -0.1804304

    ## [1] 0.9835877

    ## [1] -5.45134

Before solving for the standard deviation as-per the book’s example, I
noticed that a ‘c’ was part of the formula, but wasn’t sure why. I
experimented a bit with not including it, and realized it only took the
first value without c; c appears to be ‘concatenate’, to ‘combine’
something into a Vector; a list. The help() page called it a ‘Primitive’
function.

``` r
sd(c(7,81,4,53,82,11,90, na.rm = FALSE)); mean(c(111, 65, 78, 93, 299)); min(c(9, 4, 7, 2)); max(c(9, 7, 2, 5))
```

    ## [1] 39.51853

    ## [1] 129.2

    ## [1] 2

    ## [1] 9

``` r
plot(c(77, 45, 99, 88, 33))
```

![](Chapter-3-Report_files/figure-gfm/math%20contined-1.png)<!-- -->

### Making a basic script

Using information from the sections ‘Using the Code Editor’ and ‘Adding
Comments to the Code’ I made the following simple RScript. \#Can be used
to add a comment to a script, which has quickly become a favourite thing
for me in this report\! The first part of the script assigns variables
and then some math uses those assigned variables.  
I discovered that you can use = instead of \<-, but apparently \<- works
on all levels of coding and = only works in the first level of code? Not
sure what code levels mean yet, but using \<- for R seems generally god
practice.

``` r
#Create Variable "A" with a value of "1"
A <- 1;
#Create Variable "B" with a value of "2"
B <- 2;

#Do mathematical functions with variables "A" & "B" (division, multiplication, addition, subtraction)
A/B; A * B; A + B; A - B;
```

    ## [1] 0.5

    ## [1] 2

    ## [1] 3

    ## [1] -1

``` r
#Square variables "A" and "B" on two seperate lines
A^2; B^2;
```

    ## [1] 1

    ## [1] 4

### Data Types *Commands Used* - (class), (is.datatype), (as.datatype)

In case the data type for a variable isn’t known for some reason,
(class) or (is.datatype) can be used. Boolean can not be found as a
function. “datatype” in is.datatype gets replaced by any of the types of
data.

``` r
#Determine the data type of a variable
print(class(A)); print(is.numeric(A)); print(is.character(A)); print(is.logical(A))
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
```

C + D results in a Line 74 Error in C + D : non-numberic argument to
binary operator Calls and halts the Excecution. D must be used
as.numeric:

``` r
D <- as.numeric(D);
C + D;
```

    ## [1] 14

### Vectors *Commands Used* c(), typeof(), class(), length(), : operator, print(), \[\] brackets for retrieving vectors, modify a vector with -\>

``` r
#Making a new variable, E, as a vector, then investigating it
E <- c(5,6,7,8,9); print(E); typeof(E); class(E); length(E);
```

    ## [1] 5 6 7 8 9

    ## [1] "double"

    ## [1] "numeric"

    ## [1] 5

``` r
#Making another new variable, F, as another larger vector for sokme additional excercises
F <- 4:20; print(F);
```

    ##  [1]  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20

``` r
#What is the fifth value inside of this vector?  What about the fifth AND ninth?  All the values without the fifth?
F[5]; F[c(5,9)]; F[-5];
```

    ## [1] 8

    ## [1]  8 12

    ##  [1]  4  5  6  7  9 10 11 12 13 14 15 16 17 18 19 20

``` r
#Using E again, to test a shorter logical excercise: there are only 5 values in E, but I typed out 6 logical values, so the latst one is NA.
E[c(FALSE, TRUE, FALSE, TRUE, FALSE, TRUE)];
```

    ## [1]  6  8 NA

``` r
#Back to Variable F.  Let's test using the less than sign to retrieve an element from the vector.  There is nothing <4, but there is something <5.
F[F<4]; F[F < 5];
```

    ## integer(0)

    ## [1] 4

``` r
#Let's look at E one last time.  What happens if we modify a vector?  If we modify the third value, it gets REPLACED, not ADDED IN.
print(E);
```

    ## [1] 5 6 7 8 9

``` r
E[3] <- 9;
print(E);
```

    ## [1] 5 6 9 8 9

### Lists *Non-duplicate Commands Used* list(), str(), \[\[sublist\]\], NULL

This section used a lot of duplicate commands from the Vector section,
so only the new ones are shown.

``` r
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

``` r
#There seems to be a difference between a list and a sublist; I'll have to figure the practical use of this difference with supplementary material.  
G[1]; G[[1]];
```

    ## [[1]]
    ## [1] "fox"

    ## [1] "fox"

``` r
#NULL (caps sensitive?) is a new command for assigning NULL to part of a list, I presume it would work for a vector as well..
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

### Matrix *Non-Duplicate Comands Used* matrix(), nrow, ncol, dimnames, attributes(), colnames(), rownames(), cbind(), rbind(), t()

``` r
#To experiment with making matrices, I made up a a pretend survey where 6 people were asked if they liked or disliked 3 different animals.  Making this was clunky, however . . . there must be better ways to make tables and better uses of matrices.  Row is the X axis and Column is the Y axis.  
#Entering the data goes down column one and then loops around to column two, instead of across row one and then looping to row two.
H <- matrix(c(1,4,5,5,2,1), nrow=3, ncol=2, dimnames=list(c("Spider", "Fox", "Dog"), c("Likes the Animal", "Dislikes the Animal"))); print(H)
```

    ##        Likes the Animal Dislikes the Animal
    ## Spider                1                   5
    ## Fox                   4                   2
    ## Dog                   5                   1

``` r
#These are some commands to investigate the matrix.
attributes(H); colnames(H); rownames(H);
```

    ## $dim
    ## [1] 3 2
    ## 
    ## $dimnames
    ## $dimnames[[1]]
    ## [1] "Spider" "Fox"    "Dog"   
    ## 
    ## $dimnames[[2]]
    ## [1] "Likes the Animal"    "Dislikes the Animal"

    ## [1] "Likes the Animal"    "Dislikes the Animal"

    ## [1] "Spider" "Fox"    "Dog"

``` r
#These comands use row and column binding to make matrices; column binding makes the values travel down and then loop to the next column; row binding makes the values travel across the rows and then loop down to the next column.
I <- cbind(c(1,2,3), c(4,5,6)); print(I); J <- rbind(c(1,2,3), c(4,5,6)); print(J);
```

    ##      [,1] [,2]
    ## [1,]    1    4
    ## [2,]    2    5
    ## [3,]    3    6

    ##      [,1] [,2] [,3]
    ## [1,]    1    2    3
    ## [2,]    4    5    6

``` r
#Selecting different rows & columns in a matrix works similar to a vector, but if the comma is before the number it selects the relevant column.  If the comma is AFTER the number it selects the relevant row.
print(J); J[,1]; J[2,]; J[-1,]; J[2,2]
```

    ##      [,1] [,2] [,3]
    ## [1,]    1    2    3
    ## [2,]    4    5    6

    ## [1] 1 4

    ## [1] 4 5 6

    ## [1] 4 5 6

    ## [1] 5

``` r
#You can also add an additional row or column to a matrix by using rbind or cbind respectfully; the technique taught in the book technically makes a whole new variable.
K <- cbind(c("old", "old"), c("old", "old")); print(K); L <- rbind(K, c("new", "new")); print(L)
```

    ##      [,1]  [,2] 
    ## [1,] "old" "old"
    ## [2,] "old" "old"

    ##      [,1]  [,2] 
    ## [1,] "old" "old"
    ## [2,] "old" "old"
    ## [3,] "new" "new"

``` r
#I wanted to practice modifying a matrix: I think the order of [column, row] confuses me since it's going Y and then X for reading,  
#instead of X and then Y, so it's the inverse of reading a graph (kind of, this isn't meant to analogy with a graph, but figuring out why I was confused is helpful.)
J[2,3] <- 66; print(J);
```

    ##      [,1] [,2] [,3]
    ## [1,]    1    2    3
    ## [2,]    4    5   66

``` r
#With t() matrixes can be transposed--i.e. which axis each label is on is switched. 
print(L); L <- t(L);print(L)
```

    ##      [,1]  [,2] 
    ## [1,] "old" "old"
    ## [2,] "old" "old"
    ## [3,] "new" "new"

    ##      [,1]  [,2]  [,3] 
    ## [1,] "old" "old" "new"
    ## [2,] "old" "old" "new"

### Data Frames *Commands Used* data.frame()

I tried making an initial data.frame that had number of legs (0, 4, 8),
animal name (snake, fox, spider), and Does Riley like it? (good, good,
AAAAAAAA) but it proved to be quite difficult; I kept getting errors
about unexpected commas, or unexpected =. I had to look around for a
while. Note to self: I might take what I have right now and bring it to
the QUASR and instead figure out how to import a .csv and work with that
instead to practice.

``` r
#Making this silly dataframe was more difficult than it should have been.  Extra =s, extra commas. . .
#M <- data.frame(number_of_legs(c(0, 4, 8)), animal(c("Snake", "Fox", "Spider")), Does_Riley_Like_it?(c(("good", "good", "AAAAAAAA")); print(M);
```
