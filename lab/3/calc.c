#include <gtk/gtk.h>
    GtkWidget *entry;
    GtkWidget *button;
    GtkWidget *label; 
    GtkWidget *frame;
    GtkWidget *window;

static gboolean delete_event( GtkWidget *widget,
                              GdkEvent  *event,
                              gpointer   data )
{
    gtk_main_quit ();
    return TRUE;
}

static void calc(const char *buf){
    float a, b;
    char op;
    char tmp[1024];
    sscanf(buf, "%f%c%f", &a, &op, &b);
    if (op == '+'){
        sprintf(tmp, "%f",a+b);
    } else if (op == '-'){
        sprintf(tmp, "%f",a-b);
    } else if (op == '*') {
        sprintf(tmp, "%f",a*b);
    } else if (op == '/' && b){
        sprintf(tmp, "%f",a/b);
    }

	gtk_label_set_text((GtkLabel *)label, tmp);
}

static void hello( GtkWidget *widget,
                   gpointer   data )
{
    const char *entry_buf;
    entry_buf = gtk_entry_get_text((GtkEntry *)entry);
    if('\0' != entry_buf[0]){
        calc(entry_buf);
    }	
    gtk_entry_set_text((GtkEntry *)entry, "");
}

int main( int   argc,
          char *argv[] )
{
    gtk_init (&argc, &argv);
    
	// window
    window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
	gtk_window_set_default_size((GtkWindow *)window, 260, 280);
	gtk_window_set_position((GtkWindow *)window, GTK_WIN_POS_CENTER);
    //gtk_container_set_border_width (GTK_CONTAINER (window), 10);
    gtk_container_set_border_width ((GtkContainer *)window, 10);

	// frame
	frame = gtk_fixed_new ();
    gtk_container_add ((GtkContainer *)window, frame);

    // entry
	entry = gtk_entry_new ();
	gtk_entry_set_text ((GtkEntry *)entry, "1+2");
    gtk_widget_set_size_request(entry, 200, 50);
    gtk_fixed_put((GtkFixed *)frame, entry, 20, 20);

	// label
	label = gtk_label_new ("Welcome!");
	gtk_widget_set_size_request(label, 200, 50);
    gtk_fixed_put((GtkFixed *)frame, label, 20, 100);

	// buttom
    button = gtk_button_new_with_label ("Calc Expression");
    gtk_widget_set_size_request(button, 200, 50);
    gtk_fixed_put((GtkFixed *)frame, button, 20, 200);
    
 	// signal
	g_signal_connect (window, "delete-event",
		      G_CALLBACK (delete_event), NULL);

	g_signal_connect (button, "clicked",
		      G_CALLBACK (hello), NULL);
    
 	gtk_widget_show_all(window);   
    
    gtk_main ();
    
    return 0;
}
