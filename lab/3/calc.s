; GTK
extern gtk_main_quit, gtk_entry_get_text, gtk_entry_set_text, gtk_init, gtk_window_new, gtk_window_set_default_size, gtk_window_set_position, gtk_container_set_border_width, gtk_fixed_new, gtk_container_add, gtk_entry_new, gtk_entry_set_text, gtk_widget_set_size_request, gtk_fixed_put, gtk_label_new, gtk_widget_set_size_request, gtk_fixed_put, gtk_button_new_with_label,   gtk_widget_set_size_request,  gtk_fixed_put, g_signal_connect_data, g_signal_connect_data, gtk_widget_show_all, gtk_main, gtk_label_set_text
; libc
extern sscanf, sprintf

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
debug:
		mov    ecx, dword [esp+0xc]
		fld	   dword [esp+0x8]  ; st0
		cmp    ecx, '+'
		je     Add
		cmp    ecx, '-'
		je     Sub
		cmp    ecx, '*'
		je     Mul
		cmp    ecx, '/'
		je     Div
		jmp    cal_done
Add:
		; fC = fA + fB
		fadd    dword [esp+0x10]
		jmp     set_buffer		
Sub:
		fsub    dword [esp+0x10]
		jmp     set_buffer		
Mul:
		fmul    dword [esp+0x10]
		jmp     set_buffer		
Div:
		fdiv    dword [esp+0x10]
set_buffer:
		; sprintf(buf, "%f", fC)
		push   0x0 ; padding
		push   0x0
		push   szfmt2  ; "%f"
		push   buffer
		fstp   qword [esp+0x8]
		call   sprintf
		add    esp, 4*4

		; gtk_label_set_text(label, buffer)
		mov    eax, [hLabel]
		push   buffer
		push   eax
		call   gtk_label_set_text
		add    esp, 4*2
cal_done:
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
        je     clean

		;sscanf(buf, "%f%c%f", &a, &op, &b);
		mov    eax, DWORD [ebp-0xc]
		push   fB
		push   op
		push   fA
		push   szfmt 
		push   eax
		call   sscanf
		add    esp, 4*5

		; calc(fA, op, fB)
		mov    eax, [fB]
		push   eax
		xor    eax, eax
		mov    al, [op]
		push   eax
		mov    eax, [fA]
		push   eax
        call   calc
		add    esp, 4*3

clean:  mov    eax,[hEntry]
        mov    DWORD [esp+0x4], NULL
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

		; button
        mov    DWORD [esp],szButton
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

		; signal delete
        mov    edx,delete_event
        mov    eax,[hWindow]
        mov    DWORD [esp+0x14],0x0
        mov    DWORD [esp+0x10],0x0
        mov    DWORD [esp+0xc],0x0
        mov    DWORD [esp+0x8],edx
        mov    DWORD [esp+0x4],szDelete
        mov    DWORD [esp],eax
        call   g_signal_connect_data

		; signal hello
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
	szHello db "clicked",0
	szfmt db "%f%c%f",0
	szfmt2 db "%f",0
	NULL   db 0
section .bss
	hEntry resd 1
	hLabel resd 1
	hButton resd 1
	hWindow resd 1
	hFrame resd 1
	fA resd 1
	fB resd 1
	fC resd 1
	op resb 1
	buffer resb 100
	
