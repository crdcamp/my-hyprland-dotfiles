# Matching

`-matching` *method*

**Default:** normal

Specify the matching algorithm used. The following methods are supported:

* **normal**: match the int string
* **regex**: match a regex input
* **glob**: match a glob pattern
* **fuzzy**: do a fuzzy match
* **prefix**: match prefix

Multiple matching methods can be specified in a comma separated list.

**Note:** Glob matching might be slow for larger lists.

`-drun-categories` *category1*,*category2*

Only show desktop files that are present in the listed categories.

`-drun-exclude-categories` *category1*,*category2*

Exclude desktop files that are present in the listed categories.

`-drun-match-fields` *field1*,*field2*,*...*

When using `drun`, match only with the specified Desktop entry fields. The different fields are:

* name: the application's name
* generic: the application's generic name
* exec: the application's executable
* categories: the application's categories
* comment: the application comment
* all: all the above

`-window-match-fields` *field1*,*field2*,*...*

When using window mode, match only with the specified fields. The different fields (for Wayland specifically) are:

* title: window's title
* app-id: Wayland Application ID or XWayland window's class
* class: same as app-id
* all: all of the above
