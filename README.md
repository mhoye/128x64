# Large Console Fonts 

## A console font experiment by mhoye

Linux recently introduced the possibility of larger-than-32x16 console
fonts to use on high-density screens, but the fonts to display in those
settings don't exist. This is a naive and somewhat ugly attempt to remedy
that.

As you can see in the "naive-upscale.sh" file, the technique for this
is crude but effective, a quality it shares with its author. 

The process, specifics to come soon, is straightforward. 

Using "psfc" and "psfd" from the psftools package, we start by dumping text
representations of existing 32x16 console fonts to individual files. Then, 
the naive-upscale script uses sed to quote-upscale-unquote those representations.
Finally, the intermediate representations are cleaned up and the files are 
renamed manually and zipped up.

These fonts aren't smooth or pretty - that will need to wait until smarter
people with better tools or taste than the author show up. Their main
utility is that they exist at all, and will serve as a functional stopgap
until better large console fonts are available.

Thank you to Ben Zanin (@gnomon@mastodon.social) for fixing a breaking race
condition in naive-upscale.sh that emerged when running it behind Parallel,
and Alexey Gladkov of the [kbd project](https://github.com/legionus/kbd)
for the guidance.

These files inherit their license from that of the original fonts, and
for simplicity's sake the script does as well. 



- mhoye
