extern gtk_main_quit, gtk_entry_get_text, gtk_entry_set_text, gtk_init, gtk_window_new, gtk_window_set_default_size, gtk_window_set_position, gtk_container_set_border_width, gtk_fixed_new, gtk_container_add, gtk_entry_new, gtk_entry_set_text, gtk_widget_set_size_request, gtk_fixed_put, gtk_label_new, gtk_widget_set_size_request, gtk_fixed_put, gtk_button_new_with_label,   gtk_widget_set_size_request,  gtk_fixed_put, g_signal_connect_data, g_signal_connect_data, gtk_widget_show_all, gtk_main

section .text
global main
delete_event:
        push   ebp
        mov    ebp,esp
        sub    esp,0x8
        call   gtk_main_quit
        mov    eax,0x1
        leave  
        ret    

calc:
        push   ebp
        mov    ebp,esp
        pop    ebp
        ret    

hello:
        push   ebp
        mov    ebp,esp
        sub    esp,0x28
        mov    eax,[hEntry]
        mov    DWORD [esp],eax
        call   gtk_entry_get_text
        mov    DWORD [ebp-0xc],eax
        mov    eax,DWORD [ebp-0xc]
        movzx  eax,BYTE [eax]
        test   al,al
        je     check
        mov    eax,DWORD [ebp-0xc]
        mov    DWORD [esp],eax
        call   calc
check:  mov    eax,[hEntry]
        mov    DWORD [esp+0x4],0x0
        mov    DWORD [esp],eax
        call   gtk_entry_set_text
        leave  
        ret    

main:
        push   ebp
        mov    ebp,esp
        and    esp,0xfffffff0
        sub    esp,0x20
        lea    eax,[ebp+0xc]
        mov    DWORD [esp+0x4],eax
        lea    eax,[ebp+0x8]
        mov    DWORD [esp],eax
        call   gtk_init
        mov    DWORD [esp],0x0
        call   gtk_window_new
        mov    [hWindow],eax
        mov    eax,[hWindow]
        mov    DWORD [esp+0x8],0x118
        mov    DWORD [esp+0x4],0x104
        mov    DWORD [esp],eax
        call   gtk_window_set_default_size
        mov    eax,[hWindow]
        mov    DWORD [esp+0x4],0x1
        mov    DWORD [esp],eax
        call   gtk_window_set_position
        mov    eax,[hWindow]
        mov    DWORD [esp+0x4],0xa
        mov    DWORD [esp],eax
        call   gtk_container_set_border_width
        call   gtk_fixed_new
        mov    [hFrame],eax
        mov    edx,DWORD [hFrame]
        mov    eax,[hWindow]
        mov    DWORD [esp+0x4],edx
        mov    DWORD [esp],eax
        call   gtk_container_add
        call   gtk_entry_new
        mov    [hEntry],eax
        mov    eax,[hEntry]
        mov    DWORD [esp+0x4],szEntry
        mov    DWORD [esp],eax
        call   gtk_entry_set_text
        mov    eax,[hEntry]
        mov    DWORD [esp+0x8],0x32
        mov    DWORD [esp+0x4],0xc8
        mov    DWORD [esp],eax
        call   gtk_widget_set_size_request
        mov    edx,DWORD [hEntry]
        mov    eax,[hFrame]
        mov    DWORD [esp+0xc],0x14
        mov    DWORD [esp+0x8],0x14
        mov    DWORD [esp+0x4],edx
        mov    DWORD [esp],eax
        call   gtk_fixed_put
        mov    DWORD [esp],szLabel
        call   gtk_label_new
        mov    [hLabel],eax
        mov    eax,[hLabel]
        mov    DWORD [esp+0x8],0x32
        mov    DWORD [esp+0x4],0xc8
        mov    DWORD [esp],eax
        call   gtk_widget_set_size_request
        mov    edx,DWORD [hLabel]
        mov    eax,[hFrame]
        mov    DWORD [esp+0xc],0x64
        mov    DWORD [esp+0x8],0x14
        mov    DWORD [esp+0x4],edx
        mov    DWORD [esp],eax
        call   gtk_fixed_put
        mov    DWORD [esp],szLabel
        call   gtk_button_new_with_label
        mov    [hButton],eax
        mov    eax,[hButton]
        mov    DWORD [esp+0x8],0x32
        mov    DWORD [esp+0x4],0xc8
        mov    DWORD [esp],eax
        call   gtk_widget_set_size_request
        mov    edx,DWORD [hButton]
        mov    eax,[hFrame]
        mov    DWORD [esp+0xc],0xc8
        mov    DWORD [esp+0x8],0x14
        mov    DWORD [esp+0x4],edx
        mov    DWORD [esp],eax
        call   gtk_fixed_put
        mov    edx,delete_event
        mov    eax,[hWindow]
        mov    DWORD [esp+0x14],0x0
        mov    DWORD [esp+0x10],0x0
        mov    DWORD [esp+0xc],0x0
        mov    DWORD [esp+0x8],edx
        mov    DWORD [esp+0x4],szDelete
        mov    DWORD [esp],eax
        call   g_signal_connect_data
        mov    edx,hello
        mov    eax,[hButton]
        mov    DWORD [esp+0x14],0x0
        mov    DWORD [esp+0x10],0x0
        mov    DWORD [esp+0xc],0x0
        mov    DWORD [esp+0x8],edx
        mov    DWORD [esp+0x4],szHello
        mov    DWORD [esp],eax
        call   g_signal_connect_data
        mov    eax,[hWindow]
        mov    DWORD [esp],eax
        call   gtk_widget_show_all
        call   gtk_main
        mov    eax,0x0
        leave  
        ret    
        nop     

section .data
	szEntry db "1+2",0
	szLabel db "Welcome!",0
	szButton db "Calc Expression",0
	szDelete db "delete-event",0
	szHello db "hello",0

section .bss
	hEntry resd 1
	hLabel resd 1
	hButton resd 1
	hWindow resd 1
	hFrame resd 1
