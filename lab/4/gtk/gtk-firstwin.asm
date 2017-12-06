%include "gtkenums.inc"
%include "equates.inc"

global  main

;GTK
extern  gtk_init, gtk_window_new, gtk_button_new_with_label
extern  gtk_container_add, gtk_widget_show, gtk_main, gtk_main_quit
extern  gtk_container_set_border_width, gtk_widget_destroy
extern  gtk_window_set_position, gtk_window_set_default_size
extern  gtk_window_set_title, gtk_fixed_new, gtk_widget_set_size_request
extern  gtk_fixed_put, gtk_widget_show_all, gtk_message_dialog_new
extern  gtk_dialog_run, gtk_widget_destroy

;GLib
extern  g_signal_connect_data, g_print

SECTION .data
szPushMe            db  "Push Me!", 0
szItWorks           db  "Your first GTK window, it works!!!!!", 10 ,0
szReally            db  "Why do you want to leave me?", 0
szSad               db  "Are you sure you want to leave me?", 10
                    db  "Really?  I am sad that you are leaving me!", 10, 0
szPoof              db  "Go POOF!", 0
szTitle             db  "GTK using NASM!", 0

szevent_delete      db  "delete-event", 0
szevent_destroy     db  "destroy", 0
szevent_clicked     db  "clicked", 0  

SECTION .bss
lpBuffer    resb    12
hMain       resd    1
hButton     resd    1
hExit       resd    1
hFrame      resd    1

SECTION .text
;~ int main( int   argc,
          ;~ char *argv[] )
main:
    push    ebp
    mov     ebp, esp

    lea     eax, [ebp + 12]
    lea     ecx, [ebp + 8] 
    push    eax
    push    ecx
    call    gtk_init
    add     esp, 4 * 2

    push    GTK_WINDOW_TOPLEVEL
    call    gtk_window_new
    add     esp, 4 * 1
    mov     [hMain], eax

    push    150
    push    300
    push    eax
    call    gtk_window_set_default_size
    add     esp, 4 * 3
    
    push    GTK_WIN_POS_CENTER
    push    dword [hMain]
    call    gtk_window_set_position
    add     esp, 4 * 2
    
    push    szTitle
    push    dword [hMain]
    call    gtk_window_set_title
    add     esp, 4 * 2
    
    call    gtk_fixed_new
    mov     [hFrame], eax
    
    push    eax
    push    dword [hMain]
    call    gtk_container_add
    add     esp, 4 * 2
    
    ; Push me button
    push    szPushMe
    call    gtk_button_new_with_label
    add     esp, 4 * 1
    mov     [hButton], eax
    
    push    35
    push    80
    push    eax
    call    gtk_widget_set_size_request
    add     esp, 4 * 3
    
    push    20
    push    100
    push    dword [hButton]
    push    dword [hFrame]
    call    gtk_fixed_put
    add     esp, 4 * 4

    ; Exit button
    push    szPoof
    call    gtk_button_new_with_label
    add     esp, 4 * 1
    mov     [hExit], eax
    
    push    35
    push    80
    push    eax
    call    gtk_widget_set_size_request
    add     esp, 4 * 3
    
    push    90
    push    100
    push    dword [hExit]
    push    dword [hFrame]
    call    gtk_fixed_put
    add     esp, 4 * 4
    
    ; Signals
    push    NULL
    push    NULL
    push    NULL
    push    event_delete
    push    szevent_delete
    push    dword [hMain]
    call    g_signal_connect_data
    add     esp, 4 * 6
    
    push    NULL
    push    NULL
    push    NULL
    push    event_destroy
    push    szevent_destroy
    push    dword [hMain]
    call    g_signal_connect_data
    add     esp, 4 * 6
        
    push    NULL
    push    NULL
    push    NULL
    push    event_clicked
    push    szevent_clicked
    push    dword [hButton]
    call    g_signal_connect_data
    add     esp, 4 * 6

    push    NULL
    push    NULL
    push    NULL
    push    event_delete
    push    szevent_clicked
    push    dword [hExit]
    call    g_signal_connect_data
    add     esp, 4 * 6
    
    push    dword [hMain]
    call    gtk_widget_show_all
    add     esp, 4 * 1
    
    call    gtk_main
    
    mov     esp, ebp
    pop     ebp
    ret

;~ gboolean event_delete( GtkWidget *widget,
                        ;~ GdkEvent  *event,
                        ;~ gpointer   data )
event_delete:
    push    dword [hMain]
    call    show_dialog
    cmp     eax, GTK_RESPONSE_NO
    jne      .bye
    mov     eax, TRUE
    ret
    
.bye:
    call    gtk_main_quit
    mov     eax, FALSE
    ret     
    
;~ void event_destroy( GtkWidget *widget,
                    ;~ gpointer   data )
event_destroy:    
    call    gtk_main_quit
    ret
    
;~ void event_clicked( GtkWidget *widget,
                    ;~ gpointer   data )
event_clicked:
    push    szItWorks
    call    g_print
    add     esp, 4 * 1
    ret
    
;~ void show_dialog(gpointer window)
show_dialog:
    push    ebp
    mov     ebp, esp
    push    esi
    
    push    szSad
    push    GTK_BUTTONS_YES_NO
    push    GTK_MESSAGE_QUESTION
    push    GTK_DIALOG_DESTROY_WITH_PARENT
    push    dword [ebp + 8]
    call    gtk_message_dialog_new
    add     esp, 4 * 5
    xchg    eax, esi

    push    szReally
    push    esi
    call    gtk_window_set_title
    add     esp, 4 * 2
    
    push    esi
    call    gtk_dialog_run
    add     esp, 4 * 1
    
    push    eax
    
    push    esi
    call    gtk_widget_destroy
    add     esp, 4 * 1
    
    pop     eax
    pop     esi
    mov     esp, ebp
    pop     ebp
    
    ret     4 * 1
