#include <gtk/gtk.h>

static void activate(GtkApplication *app , gpointer data);
static void print_entry(GtkWidget * button , gpointer entry);
static void calc(const char *buf);
GObject *entry;
GObject *result;

int main(int argc , char **argv)
{
    GtkApplication *app;
    int app_status;

    app = gtk_application_new("org.rain.example" , G_APPLICATION_FLAGS_NONE);
    g_signal_connect(app , "activate" , G_CALLBACK(activate) , NULL);
    app_status = g_application_run(G_APPLICATION(app) , argc , argv);

    g_object_unref(app);
    return app_status;
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
    //获取输入框的内容，返回一个 const gchar 指针 , gchar 即是 char
    entry_buf = gtk_entry_get_text( GTK_ENTRY(entry) );
    if('\0' != entry_buf[0]){
		calc(entry_buf);
	}
}

static void activate(GtkApplication *app , gpointer data)
{
    GtkBuilder *builder;
    GObject *window;
    GObject *button;

    //创建一个 GtkBuilder 。
    builder = gtk_builder_new();
    //将描述 UI 的文件添加到 Builder 中。
    gtk_builder_add_from_file(builder , "example.ui" , NULL);

    //可以用该函数获取 Builder 创建的对象，根据 example.ui 文件中设置的 object 的 id 来获取。
    window = gtk_builder_get_object(builder , "window");
    gtk_application_add_window(app , GTK_WINDOW(window));


    //获取输入框对象。
    entry  = gtk_builder_get_object(builder , "entry");
    gtk_entry_set_text(entry, "1+2");

    button = gtk_builder_get_object(builder , "calc_expression");
    // gtk_button_set_label ( GTK_BUTTON (button) , "Calc Expression");
	
	result  = gtk_builder_get_object(builder , "result");
    gtk_entry_set_text(result, "");

    //调用 print_entry 时传递用户参数 entry 。
    g_signal_connect(button , "clicked" , G_CALLBACK(print_entry) , entry);
    
}
