# Overview

The objective here is to create a custom GTK application for a dropdown menu that's accessible through Waybar. Unfortunately, this is gonna involve a LOT of background research. So... let's begin.

# [Getting Started with GTK](https://docs.gtk.org/gtk4/getting_started.html)

"GTK is a widget toolkit. Each user interface created by GTK consists of widgets. This is implemented in C using [`GObject`](https://docs.gtk.org/gobject/class.Object.html), an object-oriented framework for C. Widgets are organized in a hierarchy. The window widget is the main container. The user interface is then built by adding buttons, drop-down menus, input fields, and other widgets to the window. If you are creating complex user interfaces it is recommended to use GtkBuilder and its GTK-specific markup description language, instead of assembling the interface manually.

GTK is event-driven. The toolkit listens for events such as a click on a button, and passes the event to your application."

# Basics

Refer to `example-0.c`.

To begin our introduction to GTK, we’ll start with a very simple application. This program will create an empty 200 × 200 pixel window.

Create a new file with the following content named `example-0.c`.

```c
#include <gtk/gtk.h>

static void
activate (GtkApplication *app,
          gpointer        user_data)
{
  GtkWidget *window;

  window = gtk_application_window_new (app);
  gtk_window_set_title (GTK_WINDOW (window), "Window");
  gtk_window_set_default_size (GTK_WINDOW (window), 200, 200);
  gtk_window_present (GTK_WINDOW (window));
}

int
main (int    argc,
      char **argv)
{
  GtkApplication *app;
  int status;

  app = gtk_application_new ("org.gtk.example", G_APPLICATION_DEFAULT_FLAGS);
  g_signal_connect (app, "activate", G_CALLBACK (activate), NULL);
  status = g_application_run (G_APPLICATION (app), argc, argv);
  g_object_unref (app);

  return status;
}
```

You can compile the program above with GCC using:

```terminal
gcc $( pkg-config --cflags gtk4 ) -o example-0 example-0.c $( pkg-config --libs gtk4 )
```

In a GTK application, the purpose of the `main()` function is to create a `GtkApplication` object and run it. In this example a `GtkApplication` pointer is named `app` and is declared and then initialized using `gtk_application_new()`.

# [Hello, World](https://docs.gtk.org/gtk4/getting_started.html#hello-world)

Refer to `example-1.c`.

From here on out, all notes can be found in the code. Links are provided by clicking headers.

# [Packing](https://docs.gtk.org/gtk4/getting_started.html#packing)

Refer to `example-2.c`.

When creating an application, you’ll want to put more than one widget inside a window. When you do so, it becomes important to control how each widget is positioned and sized. This is where packing comes in.

In other words, this is where we can start making a really rough prototype of the Waybar widgets you want to create!
