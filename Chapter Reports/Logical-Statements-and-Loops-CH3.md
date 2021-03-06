Logical Statements & Loops : Chapter 3 *Learn R for Applied Statistics :
With Data Visualizations, Regressions, and Statistics*
================
Nurrospody
4/21/2020

  - [Logical Statements & For Loop : Commands Used: Assign pumpkin;
    print pumpkin; **for(p in pumpkin); if(p %% 2 \!= 0); else;
    message;**. Modulus %% was learnt and used. {}s were
    used.](#logical-statements-for-loop-commands-used-assign-pumpkin-print-pumpkin-forp-in-pumpkin-ifp-2-0-else-message.-modulus-was-learnt-and-used.-s-were-used.)
  - [While loop (new command)](#while-loop-new-command)
  - [Break & Next (new commands)](#break-next-new-commands)
  - [R Functions and Calculator](#r-functions-and-calculator)

#### Logical Statements & For Loop : Commands Used: Assign pumpkin; print pumpkin; **for(p in pumpkin); if(p %% 2 \!= 0); else; message;**. Modulus %% was learnt and used. {}s were used.

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

Under each message, there is a comment about concatenating (string print
format (formating language))). This comment is remainder code from when
my partner and I did some back-and-forth on how to get the message to
print correctly with spaces, values, and all.

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

**There are other types of loops: while & repeat. Break/next are
important commands for these.**

#### While loop (new command)

The while loop is relatively straightforward; I also learned about
coding white-space and organization while making these loops. All three
of the following commands work and are functionally the same
(disregarding the variables having different names):

``` r
i<- 1;
while(i<= 10) {
  print(i); i<- i+1;
}
```

    ## [1] 1
    ## [1] 2
    ## [1] 3
    ## [1] 4
    ## [1] 5
    ## [1] 6
    ## [1] 7
    ## [1] 8
    ## [1] 9
    ## [1] 10

``` r
practice_while_loop<- 1;
while(practice_while_loop<= 10) {
  print(practice_while_loop); practice_while_loop<- practice_while_loop+1;
}
```

    ## [1] 1
    ## [1] 2
    ## [1] 3
    ## [1] 4
    ## [1] 5
    ## [1] 6
    ## [1] 7
    ## [1] 8
    ## [1] 9
    ## [1] 10

``` r
counter <- 1;
while(counter <= 10) {
    print(counter); 
    counter <- counter+1;
}
```

    ## [1] 1
    ## [1] 2
    ## [1] 3
    ## [1] 4
    ## [1] 5
    ## [1] 6
    ## [1] 7
    ## [1] 8
    ## [1] 9
    ## [1] 10

. . . But the third one is most legible and uses white-space the best of
the 3. There are spaces between the variables and their assignments, and
each of the actions that occur within the loop are tabbed. The other
code blocks don’t have as consistant spacing, and the second code block
has way too long of a variable name to be legible. i is a traditional
variable name for loops.

You can print character-based strings instead of number based strings
this way, too; the variable is still a number, but instead of printing
what the variable is, you print characters.

``` r
dog <- 0;
while(dog <= 10) {
  print("I'm a dog!!!!!"); 
  dog <- dog+1;
}
```

    ## [1] "I'm a dog!!!!!"
    ## [1] "I'm a dog!!!!!"
    ## [1] "I'm a dog!!!!!"
    ## [1] "I'm a dog!!!!!"
    ## [1] "I'm a dog!!!!!"
    ## [1] "I'm a dog!!!!!"
    ## [1] "I'm a dog!!!!!"
    ## [1] "I'm a dog!!!!!"
    ## [1] "I'm a dog!!!!!"
    ## [1] "I'm a dog!!!!!"
    ## [1] "I'm a dog!!!!!"

#### Break & Next (new commands)

The following line has a for loop, which ends if the element in counter2
equals 5.

``` r
counter2 <- c(1:10);
for(e in counter2) {
    if(e == 5) {
        break;
    }
    print(e);
}
```

    ## [1] 1
    ## [1] 2
    ## [1] 3
    ## [1] 4

I asked for more clarification about whitespace while making this break
for practice; **for** and the last **}** are on the same indent level;
then **if** and **print** are on the same indent level. **Break** lines
up after the **if** to show that it’s an if break; **if**’s **}** ends
at the same indent level as if. If I wanted to make a comment \#, the
comment should be on the line above and on the same indent level as the
thing I’m discussing.

Next, I practiced the next command.  
Originally I wanted to compound practicing next with also practicing
repeat {, but repeat is bad.  
When my initial (not displayed) repeat loop didn’t end correctly, I
discovered: when I knit in the R Code Editor, a temporary file is
created where dashes replace any spaces in the file name, since R
doesn’t like spaces. But R cannot actually knit files with dashes in
the name unless R had created it automatically and also instantly
deletes it. It also cannot knit anything if a temporary file with -
rather than spaces already exists, and if the repeat loop can’t end
properly, the file is never deleted. Then it must be manually deleted
before you can knit the file again in R\! Fun times.

``` r
for(e in counter2) {
  if(e >= 10) {
    break;
  }
    
  if(e %% 2 == 0) {
     next;
  } else {
     print(e);
  }
}
```

    ## [1] 1
    ## [1] 3
    ## [1] 5
    ## [1] 7
    ## [1] 9

#### R Functions and Calculator

The last section of chapter 3 dealt with functions; I’ve seen quite a
few functions performed the past few days so this section was mostly
review. I wanted to do something different than a calculator and instead
make a text-based tree function (that way my understanding would be
better), but I realized this would have taken a long time–time I woud
rather use moving on. This is where I got with my cat based function:

``` r
#mouse <- function(y, n) {
  ##change result to an if . . . else loop
  #res <- a + b;
  #return(res);
#}
#toy <- function(y, n) {
  #change result to an if . . . else loop
  #res <- a - b;
  #return(res);
#}
#water <- function(y, n) {
  ##change result to an if . . . else loop
  #res <- a * b;
  #return(res);
#}
#print("You see a cat; what will you give it?  Select your option : ");
#print("1. mouse");
#print("2. toy");
#print("3. water");

#opt <- as.integer(readline(prompt = "> "));
#firstNum<- as.integer(readline(prompt="The cat is looking your way.  Do you continue? "));

#res <- 0;
  #if(opt == 1) {
    #instead of adding numbers, the cat pounces on the mouse if you respond yes
#   res <- add(firstNum, secondNum);
  #} else if(opt == 2) {
    #instead of adding numbers, the cat bats at the toy if you respond yes
    #res <- subtract(firstNum, secondNum);
        #} else if(opt == 3) {
        #instead of adding numbers, the cat hates water!!! and runs away if you respond yes
          #res <- product(firstNum, secondNum);
            #} else {
              #print("The cat wanders away, bored. ");
#}
#print(res);
```

The calculator function in the book was a bit of a mess. If ran in the
console directly from the R Code section, using “Code”-\>“Run
Region”-\>“Run All”, it regurgitates everything rather than printing
what it’s supposed to, and looks rather ugly. If RScript() is used in
the Terminal, the script does not wait for user input like it’s supposed
to (Windows problem?). If \> source(filepath to the R file) is used, it
seems to work correctly and user input can be entered with only the
proper print returns. The actual script cannot be knitted here, but [it
can be found in my data\_sources folder](https://github.com/Nurrospody/SOURCE-Statistics-ILC/blob/master/data_sources/BookCalc.R). This is what it looks like when
used via souce() in the terminal:

``` r
#source('GitHub\\Statistics-ILC\\data_sources\\BookCalc.R')
#[1] "Select your option: "
#[1] "1. Add"
#[1] "2. Subtract"
#[1] "3. Product"
#[1] "4. Division"
#> 3
#Enter first number: 4
#Enter second number:
#7
#[1] 28
```
