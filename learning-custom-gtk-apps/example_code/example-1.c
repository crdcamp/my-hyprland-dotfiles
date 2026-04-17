#include <gtk/gtk.h>

static void
print_hello (GtkWidget *widget,
             gpointer   data)
{
  g_print ("Learning C is quite an effort\n"); // Prints to the terminal (Not the other print statement)
}

static void
activate (GtkApplication *app,
          gpointer        user_data)
{
    GtkWidget *window;
    GtkWidget *button;

    /* The `box` variable is created to store a `GtkBox`, which is one of Gtk's ways
   of controlling the size and layout of widgets.

   The `GtkBox widget is created with `gtk_box_new()`, which takes a `GtkOrientation`
   enumeration value as parameter.

   After initializing box with the newly created `GtkBox`, the code adds the box widget
   to the window widget using `gtk_window_set_child()`*/
    GtkWidget *box;

    window = gtk_application_window_new (app);
    gtk_window_set_title (GTK_WINDOW (window), "Window");
    gtk_window_set_default_size (GTK_WINDOW (window), 200, 200);

    box = gtk_box_new (GTK_ORIENTATION_VERTICAL, 0);
    gtk_widget_set_halign (box, GTK_ALIGN_CENTER);
    gtk_widget_set_valign (box, GTK_ALIGN_CENTER);

    gtk_window_set_child (GTK_WINDOW (window), box);

    /* The `button` variable is initialized in a similar manner to the box variable.
   `gtk_button_new_with_label()` is called which returns a `GtkButton` to be stored in `button`.
   Afterwards, `button` is added to our `box`.*/
    button = gtk_button_new_with_label ("Okay... NOW I'm starting to get it a little bit more"); // The actual text that displays on the button

    /* Using `g_signal_connect()`, the button is connected to a function in our app
    called `print_hello()`, so that when the button is clicked, GTK will call this function.
    As the `print_hello()~ function doesn't use any data as input, `NULL` is passed to it

    `print_hello()` calls `g_print()` with the given sring*/
    g_signal_connect (button, "clicked", G_CALLBACK (print_hello), NULL);

    /* After connecting `print_hello()`, another signal is connected to the "clicked" state
    of the button using `g_signal_connect_swapped()`. This functions similar to a `g_signal_connect()`,
    with the difference lying in how the callback function is trated:
    `g_signal_connect_swapped()` allows you to specify what the callback function should take
    as parameter by letting you pass it as data. In this case the function being called back is
    `gtk_window_destroy()` and the `window` pointer is passed to it.*/
    g_signal_connect_swapped (button, "clicked", G_CALLBACK (gtk_window_destroy), window);

    gtk_box_append (GTK_BOX (box), button);
    gtk_window_present (GTK_WINDOW (window));
}

int
main (int argc,
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
