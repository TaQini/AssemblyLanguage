#include <gtk/gtk.h>

static void print_entry(GtkWidget * button , gpointer entry);
static void calc(const char *buf);
GObject *entry;
GObject *result;

int main(int argc, char* argv){
    GtkBuilder *builder;
    GObject *window;
    GObject *button;

	gtk_init(argc, argv);

    builder = gtk_builder_new();
    gtk_builder_add_from_file(builder , "example.ui" , NULL);

    window = gtk_builder_get_object(builder , "window");

    entry  = gtk_builder_get_object(builder , "entry");
    gtk_entry_set_text(entry, "1+2");

    button = gtk_builder_get_object(builder , "calc_expression");

    result  = gtk_builder_get_object(builder , "result");
    gtk_entry_set_text(result, "");

    g_signal_connect(button , "clicked" , G_CALLBACK(print_entry) , entry);
	gtk_main();
}

static void calc(const char *buf){
    float a, b;
    char op;
    char tmp[1024];
    // printf("%s\n",buf);
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
    gtk_entry_set_text(result, tmp);
    gtk_entry_set_text(entry, "");

}

static void print_entry(GtkWidget * button , gpointer entry)
{
    const char *entry_buf;
    entry_buf = gtk_entry_get_text( GTK_ENTRY(entry) );
    if('\0' != entry_buf[0]){
        calc(entry_buf);
    }
}


