# Some Useful Parameters

Below are some useful parameters to add to rofi commands. There are more, but these are the ones chosen to be most relevant for your use cases.

As a general overview, here's how these parameters should be called:

```bash
rofi -[parameter] [other options] 
```

And now for our noteworthy parameters:

`-cycle`

Cycle through the result list. Default is `true`.

`-config` *filename*

Load an alternative configuration file (you'll undoubtedly need this for Wallpaper and Control Center).

`-cache-dir` *filename*

Directory that is used to place temporary files, like history.

`-scroll-method` *method*

Select the scrolling method. 0: Per page, 1: continuous.

`-show-icons`

Show application icons in `drun` and `window` modes. You'll need this when working on the main rofi configuration.
