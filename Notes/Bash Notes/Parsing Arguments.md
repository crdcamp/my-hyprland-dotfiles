# Correctly Parsing Arguments

From [YouTube](https://www.youtube.com/watch?v=GanBobctt7I)

Here's the incorrect way to manage multiple arguments:

```bash
#!/usr/bin/env bash

for arg in $*; do
    wcho "<$arg>"
```

This will fail with multiple spaces in between the arguments.

Instead, we want to do this:

```bash
#!/usr/bin/env bash

for arg in "$@"; do
  echo "<$arg>"
done
```

For your Wi-Fi script, this might come in handy for passing variables as arguments when connecting to Wi-Fi.
