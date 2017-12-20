section .text:
main:
 80488f4:	55                   	push   ebp
 80488f5:	89 e5                	mov    ebp,esp
 80488f7:	83 e4 f0             	and    esp,0xfffffff0
 80488fa:	83 ec 30             	sub    esp,0x30
 80488fd:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
 8048904:	00 
 8048905:	c7 04 24 30 8d 04 08 	mov    DWORD PTR [esp],0x8048d30
 804890c:	e8 ff fd ff ff       	call   8048710 <gtk_application_new@plt>
 8048911:	89 44 24 28          	mov    DWORD PTR [esp+0x28],eax
 8048915:	b8 4c 8b 04 08       	mov    eax,0x8048b4c
 804891a:	c7 44 24 14 00 00 00 	mov    DWORD PTR [esp+0x14],0x0
 8048921:	00 
 8048922:	c7 44 24 10 00 00 00 	mov    DWORD PTR [esp+0x10],0x0
 8048929:	00 
 804892a:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
 8048931:	00 
 8048932:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
 8048936:	c7 44 24 04 41 8d 04 	mov    DWORD PTR [esp+0x4],0x8048d41
 804893d:	08 
 804893e:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
 8048942:	89 04 24             	mov    DWORD PTR [esp],eax
 8048945:	e8 a6 fe ff ff       	call   80487f0 <g_signal_connect_data@plt>
 804894a:	e8 d1 fe ff ff       	call   8048820 <g_application_get_type@plt>
 804894f:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
 8048953:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
 8048957:	89 04 24             	mov    DWORD PTR [esp],eax
 804895a:	e8 a1 fe ff ff       	call   8048800 <g_type_check_instance_cast@plt>
 804895f:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
 8048962:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
 8048966:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 8048969:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
 804896d:	89 04 24             	mov    DWORD PTR [esp],eax
 8048970:	e8 bb fe ff ff       	call   8048830 <g_application_run@plt>
 8048975:	89 44 24 2c          	mov    DWORD PTR [esp+0x2c],eax
 8048979:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
 804897d:	89 04 24             	mov    DWORD PTR [esp],eax
 8048980:	e8 cb fd ff ff       	call   8048750 <g_object_unref@plt>
 8048985:	8b 44 24 2c          	mov    eax,DWORD PTR [esp+0x2c]
 8048989:	c9                   	leave  
 804898a:	c3                   	ret    

calc:
 804898b:	55                   	push   ebp
 804898c:	89 e5                	mov    ebp,esp
 804898e:	81 ec 48 04 00 00    	sub    esp,0x448
 8048994:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 8048997:	89 85 e4 fb ff ff    	mov    DWORD PTR [ebp-0x41c],eax
 804899d:	65 a1 14 00 00 00    	mov    eax,gs:0x14
 80489a3:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 80489a6:	31 c0                	xor    eax,eax
 80489a8:	b8 4a 8d 04 08       	mov    eax,0x8048d4a
 80489ad:	8d 95 ec fb ff ff    	lea    edx,[ebp-0x414]
 80489b3:	89 54 24 10          	mov    DWORD PTR [esp+0x10],edx
 80489b7:	8d 95 f3 fb ff ff    	lea    edx,[ebp-0x40d]
 80489bd:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
 80489c1:	8d 95 e8 fb ff ff    	lea    edx,[ebp-0x418]
 80489c7:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
 80489cb:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
 80489cf:	8b 85 e4 fb ff ff    	mov    eax,DWORD PTR [ebp-0x41c]
 80489d5:	89 04 24             	mov    DWORD PTR [esp],eax
 80489d8:	e8 83 fd ff ff       	call   8048760 <__isoc99_sscanf@plt>
 80489dd:	0f b6 85 f3 fb ff ff 	movzx  eax,BYTE PTR [ebp-0x40d]
 80489e4:	3c 2b                	cmp    al,0x2b
 80489e6:	75 2e                	jne    8048a16 <calc+0x8b>
 80489e8:	d9 85 e8 fb ff ff    	fld    DWORD PTR [ebp-0x418]
 80489ee:	d9 85 ec fb ff ff    	fld    DWORD PTR [ebp-0x414]
 80489f4:	de c1                	faddp  st(1),st
 80489f6:	b8 51 8d 04 08       	mov    eax,0x8048d51
 80489fb:	dd 5c 24 08          	fstp   QWORD PTR [esp+0x8]
 80489ff:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
 8048a03:	8d 85 f4 fb ff ff    	lea    eax,[ebp-0x40c]
 8048a09:	89 04 24             	mov    DWORD PTR [esp],eax
 8048a0c:	e8 0f fd ff ff       	call   8048720 <sprintf@plt>
 8048a11:	e9 bb 00 00 00       	jmp    8048ad1 <calc+0x146>
 8048a16:	0f b6 85 f3 fb ff ff 	movzx  eax,BYTE PTR [ebp-0x40d]
 8048a1d:	3c 2d                	cmp    al,0x2d
 8048a1f:	75 2e                	jne    8048a4f <calc+0xc4>
 8048a21:	d9 85 e8 fb ff ff    	fld    DWORD PTR [ebp-0x418]
 8048a27:	d9 85 ec fb ff ff    	fld    DWORD PTR [ebp-0x414]
 8048a2d:	de e9                	fsubrp st(1),st
 8048a2f:	b8 51 8d 04 08       	mov    eax,0x8048d51
 8048a34:	dd 5c 24 08          	fstp   QWORD PTR [esp+0x8]
 8048a38:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
 8048a3c:	8d 85 f4 fb ff ff    	lea    eax,[ebp-0x40c]
 8048a42:	89 04 24             	mov    DWORD PTR [esp],eax
 8048a45:	e8 d6 fc ff ff       	call   8048720 <sprintf@plt>
 8048a4a:	e9 82 00 00 00       	jmp    8048ad1 <calc+0x146>
 8048a4f:	0f b6 85 f3 fb ff ff 	movzx  eax,BYTE PTR [ebp-0x40d]
 8048a56:	3c 2a                	cmp    al,0x2a
 8048a58:	75 2b                	jne    8048a85 <calc+0xfa>
 8048a5a:	d9 85 e8 fb ff ff    	fld    DWORD PTR [ebp-0x418]
 8048a60:	d9 85 ec fb ff ff    	fld    DWORD PTR [ebp-0x414]
 8048a66:	de c9                	fmulp  st(1),st
 8048a68:	b8 51 8d 04 08       	mov    eax,0x8048d51
 8048a6d:	dd 5c 24 08          	fstp   QWORD PTR [esp+0x8]
 8048a71:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
 8048a75:	8d 85 f4 fb ff ff    	lea    eax,[ebp-0x40c]
 8048a7b:	89 04 24             	mov    DWORD PTR [esp],eax
 8048a7e:	e8 9d fc ff ff       	call   8048720 <sprintf@plt>
 8048a83:	eb 4c                	jmp    8048ad1 <calc+0x146>
 8048a85:	0f b6 85 f3 fb ff ff 	movzx  eax,BYTE PTR [ebp-0x40d]
 8048a8c:	3c 2f                	cmp    al,0x2f
 8048a8e:	75 41                	jne    8048ad1 <calc+0x146>
 8048a90:	d9 85 ec fb ff ff    	fld    DWORD PTR [ebp-0x414]
 8048a96:	d9 ee                	fldz   
 8048a98:	df e9                	fucomip st,st(1)
 8048a9a:	7a 0a                	jp     8048aa6 <calc+0x11b>
 8048a9c:	d9 ee                	fldz   
 8048a9e:	df e9                	fucomip st,st(1)
 8048aa0:	dd d8                	fstp   st(0)
 8048aa2:	74 2d                	je     8048ad1 <calc+0x146>
 8048aa4:	eb 02                	jmp    8048aa8 <calc+0x11d>
 8048aa6:	dd d8                	fstp   st(0)
 8048aa8:	d9 85 e8 fb ff ff    	fld    DWORD PTR [ebp-0x418]
 8048aae:	d9 85 ec fb ff ff    	fld    DWORD PTR [ebp-0x414]
 8048ab4:	de f9                	fdivrp st(1),st
 8048ab6:	b8 51 8d 04 08       	mov    eax,0x8048d51
 8048abb:	dd 5c 24 08          	fstp   QWORD PTR [esp+0x8]
 8048abf:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
 8048ac3:	8d 85 f4 fb ff ff    	lea    eax,[ebp-0x40c]
 8048ac9:	89 04 24             	mov    DWORD PTR [esp],eax
 8048acc:	e8 4f fc ff ff       	call   8048720 <sprintf@plt>
 8048ad1:	a1 5c a0 04 08       	mov    eax,ds:0x804a05c
 8048ad6:	8d 95 f4 fb ff ff    	lea    edx,[ebp-0x40c]
 8048adc:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
 8048ae0:	89 04 24             	mov    DWORD PTR [esp],eax
 8048ae3:	e8 88 fc ff ff       	call   8048770 <gtk_entry_set_text@plt>
 8048ae8:	a1 60 a0 04 08       	mov    eax,ds:0x804a060
 8048aed:	c7 44 24 04 54 8d 04 	mov    DWORD PTR [esp+0x4],0x8048d54
 8048af4:	08 
 8048af5:	89 04 24             	mov    DWORD PTR [esp],eax
 8048af8:	e8 73 fc ff ff       	call   8048770 <gtk_entry_set_text@plt>
 8048afd:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 8048b00:	65 33 05 14 00 00 00 	xor    eax,DWORD PTR gs:0x14
 8048b07:	74 05                	je     8048b0e <calc+0x183>
 8048b09:	e8 02 fd ff ff       	call   8048810 <__stack_chk_fail@plt>
 8048b0e:	c9                   	leave  
 8048b0f:	c3                   	ret    

print_entry:
 8048b10:	55                   	push   ebp
 8048b11:	89 e5                	mov    ebp,esp
 8048b13:	83 ec 28             	sub    esp,0x28
 8048b16:	e8 c5 fc ff ff       	call   80487e0 <gtk_entry_get_type@plt>
 8048b1b:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
 8048b1f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 8048b22:	89 04 24             	mov    DWORD PTR [esp],eax
 8048b25:	e8 d6 fc ff ff       	call   8048800 <g_type_check_instance_cast@plt>
 8048b2a:	89 04 24             	mov    DWORD PTR [esp],eax
 8048b2d:	e8 5e fc ff ff       	call   8048790 <gtk_entry_get_text@plt>
 8048b32:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 8048b35:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 8048b38:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 8048b3b:	84 c0                	test   al,al
 8048b3d:	74 0b                	je     8048b4a <print_entry+0x3a>
 8048b3f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 8048b42:	89 04 24             	mov    DWORD PTR [esp],eax
 8048b45:	e8 41 fe ff ff       	call   804898b <calc>
 8048b4a:	c9                   	leave  
 8048b4b:	c3                   	ret    

activate:
 8048b4c:	55                   	push   ebp
 8048b4d:	89 e5                	mov    ebp,esp
 8048b4f:	83 ec 38             	sub    esp,0x38
 8048b52:	e8 79 fc ff ff       	call   80487d0 <gtk_builder_new@plt>
 8048b57:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
 8048b5a:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
 8048b61:	00 
 8048b62:	c7 44 24 04 55 8d 04 	mov    DWORD PTR [esp+0x4],0x8048d55
 8048b69:	08 
 8048b6a:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 8048b6d:	89 04 24             	mov    DWORD PTR [esp],eax
 8048b70:	e8 bb fb ff ff       	call   8048730 <gtk_builder_add_from_file@plt>
 8048b75:	c7 44 24 04 60 8d 04 	mov    DWORD PTR [esp+0x4],0x8048d60
 8048b7c:	08 
 8048b7d:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 8048b80:	89 04 24             	mov    DWORD PTR [esp],eax
 8048b83:	e8 28 fc ff ff       	call   80487b0 <gtk_builder_get_object@plt>
 8048b88:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 8048b8b:	e8 30 fc ff ff       	call   80487c0 <gtk_window_get_type@plt>
 8048b90:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
 8048b94:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 8048b97:	89 04 24             	mov    DWORD PTR [esp],eax
 8048b9a:	e8 61 fc ff ff       	call   8048800 <g_type_check_instance_cast@plt>
 8048b9f:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
 8048ba3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 8048ba6:	89 04 24             	mov    DWORD PTR [esp],eax
 8048ba9:	e8 f2 fb ff ff       	call   80487a0 <gtk_application_add_window@plt>
 8048bae:	c7 44 24 04 67 8d 04 	mov    DWORD PTR [esp+0x4],0x8048d67
 8048bb5:	08 
 8048bb6:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 8048bb9:	89 04 24             	mov    DWORD PTR [esp],eax
 8048bbc:	e8 ef fb ff ff       	call   80487b0 <gtk_builder_get_object@plt>
 8048bc1:	a3 60 a0 04 08       	mov    ds:0x804a060,eax
 8048bc6:	a1 60 a0 04 08       	mov    eax,ds:0x804a060
 8048bcb:	c7 44 24 04 6d 8d 04 	mov    DWORD PTR [esp+0x4],0x8048d6d
 8048bd2:	08 
 8048bd3:	89 04 24             	mov    DWORD PTR [esp],eax
 8048bd6:	e8 95 fb ff ff       	call   8048770 <gtk_entry_set_text@plt>
 8048bdb:	c7 44 24 04 71 8d 04 	mov    DWORD PTR [esp+0x4],0x8048d71
 8048be2:	08 
 8048be3:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 8048be6:	89 04 24             	mov    DWORD PTR [esp],eax
 8048be9:	e8 c2 fb ff ff       	call   80487b0 <gtk_builder_get_object@plt>
 8048bee:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 8048bf1:	c7 44 24 04 81 8d 04 	mov    DWORD PTR [esp+0x4],0x8048d81
 8048bf8:	08 
 8048bf9:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 8048bfc:	89 04 24             	mov    DWORD PTR [esp],eax
 8048bff:	e8 ac fb ff ff       	call   80487b0 <gtk_builder_get_object@plt>
 8048c04:	a3 5c a0 04 08       	mov    ds:0x804a05c,eax
 8048c09:	a1 5c a0 04 08       	mov    eax,ds:0x804a05c
 8048c0e:	c7 44 24 04 54 8d 04 	mov    DWORD PTR [esp+0x4],0x8048d54
 8048c15:	08 
 8048c16:	89 04 24             	mov    DWORD PTR [esp],eax
 8048c19:	e8 52 fb ff ff       	call   8048770 <gtk_entry_set_text@plt>
 8048c1e:	8b 15 60 a0 04 08    	mov    edx,DWORD PTR ds:0x804a060
 8048c24:	b8 10 8b 04 08       	mov    eax,0x8048b10
 8048c29:	c7 44 24 14 00 00 00 	mov    DWORD PTR [esp+0x14],0x0
 8048c30:	00 
 8048c31:	c7 44 24 10 00 00 00 	mov    DWORD PTR [esp+0x10],0x0
 8048c38:	00 
 8048c39:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
 8048c3d:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
 8048c41:	c7 44 24 04 88 8d 04 	mov    DWORD PTR [esp+0x4],0x8048d88
 8048c48:	08 
 8048c49:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 8048c4c:	89 04 24             	mov    DWORD PTR [esp],eax
 8048c4f:	e8 9c fb ff ff       	call   80487f0 <g_signal_connect_data@plt>
 8048c54:	c9                   	leave  
 8048c55:	c3                   	ret    
