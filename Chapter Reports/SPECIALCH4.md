SPECIAL CH4 - Further Investigation into High Kurtosis and Normality
================
Nurrospody
5/14/2020

**Incomplete** *and on hold for now. Delving into this problem more
intimately (like this report was meant to do) relies on having a better
understanding of mathematics than I do right now–because I need to read
about what a bunch of formulae do and successfully interpret it. Also I
kept having to re-write and re-organize everything as I found new things
out, and it was kind of a mess . . .*

Data can be perfectly normally distributed but with high levels of
kurtosis. High kurtosis means that much of the variation comes from
outliers in the tails, rather than normal variation in the curve. Is
symmetry all data needs to be normal? If a curve is not biased, but
extremely steep, is it *actually* normally distributed data?

On rdocumentation.org, there is a page that [documents R functions that
do normality
tests](https://www.rdocumentation.org/packages/fBasics/versions/3011.87/topics/NormalityTests).
This is a good start, but none of these tests seem to be from the base R
package so I’d have lots of packages to find if I wanted to start here.
`jarque.test {moments} shapiro.test {stats}`

Omnibus tests may also be userful for mathematically solving this
problem. These tests solve for if the EXPLAINED variance in a dataset is
greater than the UNEXPLAINED variance, overall. The “D’Agostino-Pearson
*omnibus* test” is both a normality AND omnibus test, or at least that’s
my conclusion after looking at both [this
source](https://brownmath.com/stat/shape.htm#Normal) and other sources
like rdocumentation above, and NCSS below.

If I want to test for normality with both skew and kurtosis involved,
I’ll have to more intimately look what different normality tests do
and what they use in their equations. Alternately, I can test data with
multiple tests, and note that different results represent the data that
was or wasn’t used in each equation. (I must be careful to not fall into
the trap of running data multiple times until I get a test that does
tell me what I want).

After some browsing, my best resource seemed to be [an online pdf from
NCSS Statistical
Software](https://ncss-wpengine.netdna-ssl.com/wp-content/themes/ncss/pdf/Procedures/NCSS/Normality_Tests.pdf)
about different Normality equations. However, the explanations of each
formula are very mathematically technical, so my ability to understand
them is limited.

It appears that the shapiro test is the highest regarded of the
normality tests, being able to reliably test samples with up to n5000
(theoretically unlimited n). It does not mention kurtosis but it does
mention taking two estimates of the variance, which SEEMS very roughly
similar to me since variance is less biased than standard deviation, and
that’s what omnibus tests measure.  
I had mentioned not knowing what W was; it seems to be roughly a measure
of how straight a Q-Q plot of the same data will be. So a value closer
to 1 means a more straight Q-Q plot.

To continue reading the CH4 reports, select a new section:  
[Part 5 of the Chapter 4
Reports](https://github.com/Nurrospody/SOURCE-Statistics-ILC/blob/master/Chapter%20Reports/CH4-part5.md)  
[Link to README to select any Chapter
Report](https://github.com/Nurrospody/SOURCE-Statistics-ILC/blob/master/README.md)
