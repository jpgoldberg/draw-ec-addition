# draw-ec-addition
Draw examples of elliptic curve addition using [Asymptote](http://asymptote.sourceforge.net)

Note that this is more of what I used to draw a few things than a general tool.

## Usage

```
asy -f pdf ec.asy
```

will produce a PDF file with a curve and whatever points or additions you've specified

To specify which points or additions to actually draw, modify the source between
```
/**** Start Configuration here ****/
...
/**** End Configuration here ****/
```
because I'm too lazy to read the Asymptote docs to see how to specify things on the command line.

### Dependencies

You will need [Asymptote](http://asymptote.sourceforge.net) and a working LaTeX installation.
If you remove the use of LaTeX from the labels, you may be able to get away without LaTeX.

## History (and excuses)

What you see here is hardly a model of good coding.

I just wanted to draw a couple of figures for [a blog post](https://blog.agilebits.com/2016/01/21/when-back-doors-go-bad-mind-your-ps-and-qs/). I did not set out to develop a general tool for drawing elliptic curve examples. And I haven't. The result isn't a tool that can nicely be used for other curves and other points. It is really just an illustration of how I did this. There is a lot of coding by "copy/paste", leading to horrible duplication.

Additionally, the "what to draw" mechanism is terribly inefficient. I actually draw everything, but what gets configured is whether things are drawn with an invisible pen.

It should be clear that this was also a "learn Asymptote as you go" task.
