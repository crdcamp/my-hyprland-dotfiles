#include <gtk/gtk.h> // Basically the equivalent of a python import

/*
Define a function called `activate`
`static`: only visible in this file
`void`: doesn't return anything
*/
static void // `static` means "only visible in this file" while `void` means it "doesn't return anything"
// Here's a link for a better description: https://stackoverflow.com/questions/40098266/what-is-the-meaning-of-static-void-in-c

activate (GtkApplication *app, // 'GtkApplication *app: pointer to the application (the `*` means pointer). Here's a good video on pointers: https://www.youtube.com/watch?v=DplxIq0mc_Y
          gpointer        user_data) // `gpointer user_data`: extra data we can pass (we're passing NULL, so unused)
{
  GtkWidget *window;

  window = gtk_application_window_new (app); // Creates a new window and stores its pointer in `window`. The `app` argument connects with window to your application
  gtk_window_set_title (GTK_WINDOW (window), "Window"); // Simple. Sets the window title
  gtk_window_set_default_size (GTK_WINDOW (window), 200, 200); // Simple.  Sets the window's default size
  gtk_window_present (GTK_WINDOW (window)); // Show the window on screen. Without this, the window exists but isn't visible
}

// The main function: where the program starts
int // Returns an integer
main (int    argc, // argc: argument count (how man command-line arguments)
      char **argv) // argument values: array of strings
{
  GtkApplication *app; // `app`: pointer to the application object
  int status; // `status`: holds the exit code

  app = gtk_application_new ("org.gtk.example", G_APPLICATION_DEFAULT_FLAGS); // Sets a unique ID for your app and use default behavior
  g_signal_connect (app, "activate", G_CALLBACK (activate), NULL); //
  status = g_application_run (G_APPLICATION (app), argc, argv);
  g_object_unref (app);

  return status;
}
