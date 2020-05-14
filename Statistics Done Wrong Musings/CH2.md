Chapter 2 Statistics Gone Wrong Musings
================
Nurrospody
5/14/2020

Another *Statistics Done Wrong* chapter; another Musings.

This chapter, Chapter 2, talks about *Statistical Power and Underpowered
Statistics*.

The basic premise of statistical Power is, ‘based on *n*, you are only
x% likely to actually find the change you’re looking for if it exists’.
Alternatively, ‘based on *n*, you must find x% of a difference before
your statistical tests can actually detect that a significant difference
exists’.

This means that if you want to do any kind of hypothesis test, you
shouldn’t even start until you know how much data you want. Otherwise
you’re just wasting your time and funding, because you probably won’t be
able to detect what you’re looking for and are doomed from the start.

There are graphs called ‘power curves’ which look like an upside-down
bellcurve that’s on a “True Probability” X-axis and “Power” Y-axis. The
tip of the bellcurve travels down to 0.5 probability and rests at 0.05
power (you are 5% likely to get a result which actually says something
does not happen 50% of the time, when it actually does happen 50% of the
time), and the rest of the curve has a steeper or shallow-er curve
depending on how much data you have. With a shallow curve, you’re not
likely to prove anything unless there’s *very extreme deviation from
random chance* going on; with a steep curve, you can detect smaller
nuances.

For purely practical reasons like trying to prove if someone’s die is
misbalanced for a tabletop game, you’re basically never going to get
enough data to statistically prove whether it’s actually a bad die or
not, unless the die is *extremely biased*, because you don’t want to try
rolling their dice a thousand times. Even if you rolled their die a
hundred times, you’d only find a difference if it was *extremely* biased
and not just slightly.

But for scientific discoveries that shape how we see the world, we
should be getting that much data.

. . . except we’re not. Apparently less than 3% of articles published in
prestigious journals like Science calculate their power beforehand. In a
sample of studies made between 1975 and 1990, more than four-fifths of
them didn’t have a big enough control group that if whatever they were
studying made a 25% difference from the control . . . they lacked the
sufficient data to actually reach that conclusion. Two-thirds of them
couldn’t even detect a 50% difference\! Suffice to say, my skepticism
level has gone way up.

We need larger n for research. This is a problem for trying to prove
anything that requires biological life as a subject, since IACUCs often
recommend reducing the number of animals before they approve of
experiments. Finding enough human volunteers is also difficult. But if
you can only find 100 humans, or you can only kill 200 mice, it’s not
worth it to approve of the study at all. 200 mice die for no reason,
2000 mice die to actually find an answer. Having a statistician and a
veterinarian on the same IACUC would certainly be a conversation to see.

Power calculation isn’t often mentioned in intro stat courses, so its
existence isn’t widely known. I only got one paragraph to read and no
assigned practice problems about Power in my Triola 13th Edition stats
book.

Having some programing experience and using technology like R can help
improve power *without* increasing n (like in the case of animal
studies) by simulating thousands of artificial datasets. But a
specialist needs to know what they are doing and you especially don’t
want to overblow underpowered data this way. Underpowered data are data
from experiments that were too small in n, but found extreme results.
Rather than assuming a small experiment with big results found something
impressive, it’s better to assume they just didn’t have a big enough n
and the difference would have been smaller and less dramatic (or not
detectable at all) with more subjects. In a competitive field,
researchers are often pushed to publish these underpowered studies with
‘impressive results’ because they want to get something exciting into
the paper before the next person. More mild results from future studies
tend to be more accurate.

OTHER THAN POWER, confidence intervals (CI) can be useful as well.
Confidence intervals tell us that ‘within this margin, we are x% certain
that the true mean of the data lies here’. If that margin is enormous,
then there probably needs to be more data. If that margin is tiny, then
the difference is small and it might not be important afterall.
Confidence intervals are very informative for the state of our
experiment and can inform whether the result of a hypothsis test might
be a type 1 or 2 error.

Look at your data. If you see a pattern in your data that indicates a
difference, but the hypothesis test reports no significant difference—is
there still a PRACTICAL difference? If you think so, consider getting a
larger n or including this analysis in your report. This is what
happened when the United States legalized turning right on red lights;
all experiments DID SEE an increase in accidents when turning on red was
allowed, but it wasn’t deemed significant because of the hypothesis test
and a low n. If the data from all these experiments was combined, it
would have shown a statistically significant increase—and it did; the
change came with 20% more collisions, 60% more pedestrian run-overs, and
twice as many bicycle hits.
