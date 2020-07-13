CH6 part 1 *Inferential Statistics & Regressions* (apply)
================
Nurrospody
7/13/2020, *Learn R for Applied Statistics : With Data Visualizations,
Regressions, and Statistics*

  - [apply(), lapply(), sapply()
    commands](#apply-lapply-sapply-commands)

*Inferential statistics are our gateway to understanding potential
future data with current data.*

### apply(), lapply(), sapply() commands

**apply()** is a loop command. We can use it alongside a list, matrix,
or array, and put (almost) any function we want in the parenthesis.
Then, it applies that function to all of the data until it loops to the
end of the dataset.

Use it like this: `apply(dataset, margin, function)`. Margin equals
either 1 or 2. To apply the function to a row, use 1; to apply the
function to a column, use 2.

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

I’m using a Modes function (see {r setup, include=FALSE} block) to show
the most common value(s), and the first 5 rows of the [Madoka
dataset](https://github.com/Nurrospody/SOURCE-Statistics-ILC/blob/master/data_sources/Madoka%20Magika%20Volume%201-3.csv)
(Smallmad) as my dataset. This is just for the case of quick exercise.
What’s happening here is that  
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

To continue reading the CH6 reports, select a new section:  
Next: [Part 2 of the Chapter 6
Reports](https://github.com/Nurrospody/SOURCE-Statistics-ILC/blob/master/Chapter%20Reports/CH6-part2.md)  
Previous: none.

[Link to README to select any Chapter
Report](https://github.com/Nurrospody/SOURCE-Statistics-ILC/blob/master/README.md)
