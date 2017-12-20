%include "gtkenums.inc"
%include "equates.inc"

global  main

;GTK
extern gtk_application_new, g_signal_connect, g_application_run, g_object_unref
extern gtk_builder_new, gtk_builder_add_from_file
extern gtk_builder_get_object, gtk_application_add_window
extern gtk_entry_get_text, gtk_entry_set_text

;libc
extern sscanf, sprintf

section .text:
main: 
	push ebp
	mov ebp, esp
	lea eax, [ebp + 12]
    lea ecx, [ebp + 8]

