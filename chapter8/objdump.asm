
os_kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <start-0xc>:
  100000:	02 b0 ad 1b 03 00    	add    dh,BYTE PTR [eax+0x31bad]
  100006:	00 00                	add    BYTE PTR [eax],al
  100008:	fb                   	sti    
  100009:	4f                   	dec    edi
  10000a:	52                   	push   edx
  10000b:	e4                   	.byte 0xe4

0010000c <start>:
  10000c:	fa                   	cli    
  10000d:	bc 03 80 00 00       	mov    esp,0x8003 ; 初始化内核栈的栈顶指针
  100012:	bd 00 00 00 00       	mov    ebp,0x0
  100017:	83 e4 f0             	and    esp,0xfffffff0 ; 使得栈地址按照16字节对齐
  10001a:	89 1d 20 b0 10 00    	mov    DWORD PTR ds:0x10b020,ebx    ; 将multiboot_t结构的指针传给全局变量glb_mboot_ptr
  100020:	e8 72 03 00 00       	call   100397 <kern_entry>  ; 将call指令之后的地址压栈，然后跳转到kern_entry函数的起始地址

00100025 <stop>:
  100025:	f4                   	hlt    
  100026:	eb fd                	jmp    100025 <stop>

00100028 <move_cursor>:
  100028:	f3 0f 1e fb          	endbr32 
  10002c:	55                   	push   ebp
  10002d:	89 e5                	mov    ebp,esp
  10002f:	53                   	push   ebx
  100030:	83 ec 14             	sub    esp,0x14
  100033:	e8 cc 1f 00 00       	call   102004 <__x86.get_pc_thunk.bx>
  100038:	81 c3 c8 2f 00 00    	add    ebx,0x2fc8
  10003e:	0f b6 83 25 80 00 00 	movzx  eax,BYTE PTR [ebx+0x8025]
  100045:	0f b6 d0             	movzx  edx,al
  100048:	89 d0                	mov    eax,edx
  10004a:	c1 e0 02             	shl    eax,0x2
  10004d:	01 d0                	add    eax,edx
  10004f:	c1 e0 04             	shl    eax,0x4
  100052:	89 c2                	mov    edx,eax
  100054:	0f b6 83 24 80 00 00 	movzx  eax,BYTE PTR [ebx+0x8024]
  10005b:	0f b6 c0             	movzx  eax,al
  10005e:	01 d0                	add    eax,edx
  100060:	66 89 45 f6          	mov    WORD PTR [ebp-0xa],ax
  100064:	83 ec 08             	sub    esp,0x8
  100067:	6a 0e                	push   0xe
  100069:	68 d4 03 00 00       	push   0x3d4
  10006e:	e8 c3 0c 00 00       	call   100d36 <outb>
  100073:	83 c4 10             	add    esp,0x10
  100076:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
  10007a:	66 c1 e8 08          	shr    ax,0x8
  10007e:	0f b6 c0             	movzx  eax,al
  100081:	83 ec 08             	sub    esp,0x8
  100084:	50                   	push   eax
  100085:	68 d5 03 00 00       	push   0x3d5
  10008a:	e8 a7 0c 00 00       	call   100d36 <outb>
  10008f:	83 c4 10             	add    esp,0x10
  100092:	83 ec 08             	sub    esp,0x8
  100095:	6a 0f                	push   0xf
  100097:	68 d4 03 00 00       	push   0x3d4
  10009c:	e8 95 0c 00 00       	call   100d36 <outb>
  1000a1:	83 c4 10             	add    esp,0x10
  1000a4:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
  1000a8:	0f b6 c0             	movzx  eax,al
  1000ab:	83 ec 08             	sub    esp,0x8
  1000ae:	50                   	push   eax
  1000af:	68 d5 03 00 00       	push   0x3d5
  1000b4:	e8 7d 0c 00 00       	call   100d36 <outb>
  1000b9:	83 c4 10             	add    esp,0x10
  1000bc:	90                   	nop
  1000bd:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  1000c0:	c9                   	leave  
  1000c1:	c3                   	ret    

001000c2 <scroll>:
  1000c2:	f3 0f 1e fb          	endbr32 
  1000c6:	55                   	push   ebp
  1000c7:	89 e5                	mov    ebp,esp
  1000c9:	53                   	push   ebx
  1000ca:	83 ec 10             	sub    esp,0x10
  1000cd:	e8 2e 1f 00 00       	call   102000 <__x86.get_pc_thunk.ax>
  1000d2:	05 2e 2f 00 00       	add    eax,0x2f2e
  1000d7:	c6 45 f7 0f          	mov    BYTE PTR [ebp-0x9],0xf
  1000db:	0f b6 55 f7          	movzx  edx,BYTE PTR [ebp-0x9]
  1000df:	c1 e2 08             	shl    edx,0x8
  1000e2:	83 ca 20             	or     edx,0x20
  1000e5:	66 89 55 f4          	mov    WORD PTR [ebp-0xc],dx
  1000e9:	0f b6 90 25 80 00 00 	movzx  edx,BYTE PTR [eax+0x8025]
  1000f0:	80 fa 18             	cmp    dl,0x18
  1000f3:	76 6a                	jbe    10015f <scroll+0x9d>
  1000f5:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
  1000fc:	eb 27                	jmp    100125 <scroll+0x63>
  1000fe:	8b 90 08 f0 ff ff    	mov    edx,DWORD PTR [eax-0xff8]
  100104:	8b 4d f8             	mov    ecx,DWORD PTR [ebp-0x8]
  100107:	83 c1 50             	add    ecx,0x50
  10010a:	01 c9                	add    ecx,ecx
  10010c:	01 ca                	add    edx,ecx
  10010e:	8b 88 08 f0 ff ff    	mov    ecx,DWORD PTR [eax-0xff8]
  100114:	8b 5d f8             	mov    ebx,DWORD PTR [ebp-0x8]
  100117:	01 db                	add    ebx,ebx
  100119:	01 d9                	add    ecx,ebx
  10011b:	0f b7 12             	movzx  edx,WORD PTR [edx]
  10011e:	66 89 11             	mov    WORD PTR [ecx],dx
  100121:	83 45 f8 01          	add    DWORD PTR [ebp-0x8],0x1
  100125:	81 7d f8 7f 07 00 00 	cmp    DWORD PTR [ebp-0x8],0x77f
  10012c:	7e d0                	jle    1000fe <scroll+0x3c>
  10012e:	c7 45 f8 80 07 00 00 	mov    DWORD PTR [ebp-0x8],0x780
  100135:	eb 18                	jmp    10014f <scroll+0x8d>
  100137:	8b 90 08 f0 ff ff    	mov    edx,DWORD PTR [eax-0xff8]
  10013d:	8b 4d f8             	mov    ecx,DWORD PTR [ebp-0x8]
  100140:	01 c9                	add    ecx,ecx
  100142:	01 d1                	add    ecx,edx
  100144:	0f b7 55 f4          	movzx  edx,WORD PTR [ebp-0xc]
  100148:	66 89 11             	mov    WORD PTR [ecx],dx
  10014b:	83 45 f8 01          	add    DWORD PTR [ebp-0x8],0x1
  10014f:	81 7d f8 cf 07 00 00 	cmp    DWORD PTR [ebp-0x8],0x7cf
  100156:	7e df                	jle    100137 <scroll+0x75>
  100158:	c6 80 25 80 00 00 18 	mov    BYTE PTR [eax+0x8025],0x18
  10015f:	90                   	nop
  100160:	83 c4 10             	add    esp,0x10
  100163:	5b                   	pop    ebx
  100164:	5d                   	pop    ebp
  100165:	c3                   	ret    

00100166 <console_clear>:
  100166:	f3 0f 1e fb          	endbr32 
  10016a:	55                   	push   ebp
  10016b:	89 e5                	mov    ebp,esp
  10016d:	83 ec 18             	sub    esp,0x18
  100170:	e8 8b 1e 00 00       	call   102000 <__x86.get_pc_thunk.ax>
  100175:	05 8b 2e 00 00       	add    eax,0x2e8b
  10017a:	c6 45 f3 0f          	mov    BYTE PTR [ebp-0xd],0xf
  10017e:	0f b6 55 f3          	movzx  edx,BYTE PTR [ebp-0xd]
  100182:	c1 e2 08             	shl    edx,0x8
  100185:	83 ca 20             	or     edx,0x20
  100188:	66 89 55 f0          	mov    WORD PTR [ebp-0x10],dx
  10018c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
  100193:	eb 18                	jmp    1001ad <console_clear+0x47>
  100195:	8b 90 08 f0 ff ff    	mov    edx,DWORD PTR [eax-0xff8]
  10019b:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
  10019e:	01 c9                	add    ecx,ecx
  1001a0:	01 d1                	add    ecx,edx
  1001a2:	0f b7 55 f0          	movzx  edx,WORD PTR [ebp-0x10]
  1001a6:	66 89 11             	mov    WORD PTR [ecx],dx
  1001a9:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
  1001ad:	81 7d f4 cf 07 00 00 	cmp    DWORD PTR [ebp-0xc],0x7cf
  1001b4:	7e df                	jle    100195 <console_clear+0x2f>
  1001b6:	c6 80 24 80 00 00 00 	mov    BYTE PTR [eax+0x8024],0x0
  1001bd:	c6 80 25 80 00 00 00 	mov    BYTE PTR [eax+0x8025],0x0
  1001c4:	e8 5f fe ff ff       	call   100028 <move_cursor>
  1001c9:	90                   	nop
  1001ca:	c9                   	leave  
  1001cb:	c3                   	ret    

001001cc <console_putc_color>:
  1001cc:	f3 0f 1e fb          	endbr32 
  1001d0:	55                   	push   ebp
  1001d1:	89 e5                	mov    ebp,esp
  1001d3:	56                   	push   esi
  1001d4:	53                   	push   ebx
  1001d5:	83 ec 20             	sub    esp,0x20
  1001d8:	e8 23 1e 00 00       	call   102000 <__x86.get_pc_thunk.ax>
  1001dd:	05 23 2e 00 00       	add    eax,0x2e23
  1001e2:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  1001e5:	88 55 e4             	mov    BYTE PTR [ebp-0x1c],dl
  1001e8:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
  1001eb:	88 55 f7             	mov    BYTE PTR [ebp-0x9],dl
  1001ee:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
  1001f1:	88 55 f6             	mov    BYTE PTR [ebp-0xa],dl
  1001f4:	0f b6 55 f7          	movzx  edx,BYTE PTR [ebp-0x9]
  1001f8:	c1 e2 04             	shl    edx,0x4
  1001fb:	89 d1                	mov    ecx,edx
  1001fd:	0f b6 55 f6          	movzx  edx,BYTE PTR [ebp-0xa]
  100201:	83 e2 0f             	and    edx,0xf
  100204:	09 ca                	or     edx,ecx
  100206:	88 55 f5             	mov    BYTE PTR [ebp-0xb],dl
  100209:	0f b6 55 f5          	movzx  edx,BYTE PTR [ebp-0xb]
  10020d:	c1 e2 08             	shl    edx,0x8
  100210:	66 89 55 f2          	mov    WORD PTR [ebp-0xe],dx
  100214:	80 7d e4 08          	cmp    BYTE PTR [ebp-0x1c],0x8
  100218:	75 20                	jne    10023a <console_putc_color+0x6e>
  10021a:	0f b6 90 24 80 00 00 	movzx  edx,BYTE PTR [eax+0x8024]
  100221:	84 d2                	test   dl,dl
  100223:	74 15                	je     10023a <console_putc_color+0x6e>
  100225:	0f b6 90 24 80 00 00 	movzx  edx,BYTE PTR [eax+0x8024]
  10022c:	83 ea 01             	sub    edx,0x1
  10022f:	88 90 24 80 00 00    	mov    BYTE PTR [eax+0x8024],dl
  100235:	e9 a0 00 00 00       	jmp    1002da <console_putc_color+0x10e>
  10023a:	80 7d e4 09          	cmp    BYTE PTR [ebp-0x1c],0x9
  10023e:	75 18                	jne    100258 <console_putc_color+0x8c>
  100240:	0f b6 90 24 80 00 00 	movzx  edx,BYTE PTR [eax+0x8024]
  100247:	83 c2 08             	add    edx,0x8
  10024a:	83 e2 f8             	and    edx,0xfffffff8
  10024d:	88 90 24 80 00 00    	mov    BYTE PTR [eax+0x8024],dl
  100253:	e9 82 00 00 00       	jmp    1002da <console_putc_color+0x10e>
  100258:	80 7d e4 0d          	cmp    BYTE PTR [ebp-0x1c],0xd
  10025c:	75 09                	jne    100267 <console_putc_color+0x9b>
  10025e:	c6 80 24 80 00 00 00 	mov    BYTE PTR [eax+0x8024],0x0
  100265:	eb 73                	jmp    1002da <console_putc_color+0x10e>
  100267:	80 7d e4 0a          	cmp    BYTE PTR [ebp-0x1c],0xa
  10026b:	75 19                	jne    100286 <console_putc_color+0xba>
  10026d:	c6 80 24 80 00 00 00 	mov    BYTE PTR [eax+0x8024],0x0
  100274:	0f b6 90 25 80 00 00 	movzx  edx,BYTE PTR [eax+0x8025]
  10027b:	83 c2 01             	add    edx,0x1
  10027e:	88 90 25 80 00 00    	mov    BYTE PTR [eax+0x8025],dl
  100284:	eb 54                	jmp    1002da <console_putc_color+0x10e>
  100286:	80 7d e4 1f          	cmp    BYTE PTR [ebp-0x1c],0x1f
  10028a:	7e 4e                	jle    1002da <console_putc_color+0x10e>
  10028c:	66 0f be 4d e4       	movsx  cx,BYTE PTR [ebp-0x1c]
  100291:	0f b7 55 f2          	movzx  edx,WORD PTR [ebp-0xe]
  100295:	89 ce                	mov    esi,ecx
  100297:	09 d6                	or     esi,edx
  100299:	8b 98 08 f0 ff ff    	mov    ebx,DWORD PTR [eax-0xff8]
  10029f:	0f b6 90 25 80 00 00 	movzx  edx,BYTE PTR [eax+0x8025]
  1002a6:	0f b6 ca             	movzx  ecx,dl
  1002a9:	89 ca                	mov    edx,ecx
  1002ab:	c1 e2 02             	shl    edx,0x2
  1002ae:	01 ca                	add    edx,ecx
  1002b0:	c1 e2 04             	shl    edx,0x4
  1002b3:	89 d1                	mov    ecx,edx
  1002b5:	0f b6 90 24 80 00 00 	movzx  edx,BYTE PTR [eax+0x8024]
  1002bc:	0f b6 d2             	movzx  edx,dl
  1002bf:	01 ca                	add    edx,ecx
  1002c1:	01 d2                	add    edx,edx
  1002c3:	01 da                	add    edx,ebx
  1002c5:	89 f1                	mov    ecx,esi
  1002c7:	66 89 0a             	mov    WORD PTR [edx],cx
  1002ca:	0f b6 90 24 80 00 00 	movzx  edx,BYTE PTR [eax+0x8024]
  1002d1:	83 c2 01             	add    edx,0x1
  1002d4:	88 90 24 80 00 00    	mov    BYTE PTR [eax+0x8024],dl
  1002da:	0f b6 90 24 80 00 00 	movzx  edx,BYTE PTR [eax+0x8024]
  1002e1:	80 fa 4f             	cmp    dl,0x4f
  1002e4:	76 17                	jbe    1002fd <console_putc_color+0x131>
  1002e6:	c6 80 24 80 00 00 00 	mov    BYTE PTR [eax+0x8024],0x0
  1002ed:	0f b6 90 25 80 00 00 	movzx  edx,BYTE PTR [eax+0x8025]
  1002f4:	83 c2 01             	add    edx,0x1
  1002f7:	88 90 25 80 00 00    	mov    BYTE PTR [eax+0x8025],dl
  1002fd:	e8 c0 fd ff ff       	call   1000c2 <scroll>
  100302:	e8 21 fd ff ff       	call   100028 <move_cursor>
  100307:	90                   	nop
  100308:	83 c4 20             	add    esp,0x20
  10030b:	5b                   	pop    ebx
  10030c:	5e                   	pop    esi
  10030d:	5d                   	pop    ebp
  10030e:	c3                   	ret    

0010030f <console_write>:
  10030f:	f3 0f 1e fb          	endbr32 
  100313:	55                   	push   ebp
  100314:	89 e5                	mov    ebp,esp
  100316:	83 ec 08             	sub    esp,0x8
  100319:	e8 e2 1c 00 00       	call   102000 <__x86.get_pc_thunk.ax>
  10031e:	05 e2 2c 00 00       	add    eax,0x2ce2
  100323:	eb 1f                	jmp    100344 <console_write+0x35>
  100325:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  100328:	8d 50 01             	lea    edx,[eax+0x1]
  10032b:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
  10032e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  100331:	0f be c0             	movsx  eax,al
  100334:	83 ec 04             	sub    esp,0x4
  100337:	6a 0f                	push   0xf
  100339:	6a 00                	push   0x0
  10033b:	50                   	push   eax
  10033c:	e8 8b fe ff ff       	call   1001cc <console_putc_color>
  100341:	83 c4 10             	add    esp,0x10
  100344:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  100347:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  10034a:	84 c0                	test   al,al
  10034c:	75 d7                	jne    100325 <console_write+0x16>
  10034e:	90                   	nop
  10034f:	90                   	nop
  100350:	c9                   	leave  
  100351:	c3                   	ret    

00100352 <console_write_color>:
  100352:	f3 0f 1e fb          	endbr32 
  100356:	55                   	push   ebp
  100357:	89 e5                	mov    ebp,esp
  100359:	83 ec 08             	sub    esp,0x8
  10035c:	e8 9f 1c 00 00       	call   102000 <__x86.get_pc_thunk.ax>
  100361:	05 9f 2c 00 00       	add    eax,0x2c9f
  100366:	eb 21                	jmp    100389 <console_write_color+0x37>
  100368:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  10036b:	8d 50 01             	lea    edx,[eax+0x1]
  10036e:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
  100371:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  100374:	0f be c0             	movsx  eax,al
  100377:	83 ec 04             	sub    esp,0x4
  10037a:	ff 75 10             	push   DWORD PTR [ebp+0x10]
  10037d:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
  100380:	50                   	push   eax
  100381:	e8 46 fe ff ff       	call   1001cc <console_putc_color>
  100386:	83 c4 10             	add    esp,0x10
  100389:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  10038c:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  10038f:	84 c0                	test   al,al
  100391:	75 d5                	jne    100368 <console_write_color+0x16>
  100393:	90                   	nop
  100394:	90                   	nop
  100395:	c9                   	leave  
  100396:	c3                   	ret    

00100397 <kern_entry>:
  100397:	f3 0f 1e fb          	endbr32 
  10039b:	55                   	push   ebp  ; 为什么一开始要先压栈呢？因为一个CPU里所有的寄存器都只有一份，当执行流程从一个函数跳转到另一个函数的时候，之前的寄存器可能保存着重要的信息。如果不保护之前的执行现场，当子函数执行完返回的时候就会出问题。
  10039c:	89 e5                	mov    ebp,esp
  10039e:	53                   	push   ebx
  10039f:	83 ec 04             	sub    esp,0x4
  1003a2:	e8 5d 1c 00 00       	call   102004 <__x86.get_pc_thunk.bx>
  1003a7:	81 c3 59 2c 00 00    	add    ebx,0x2c59
  1003ad:	e8 b4 fd ff ff       	call   100166 <console_clear>
  1003b2:	83 ec 04             	sub    esp,0x4
  1003b5:	6a 02                	push   0x2
  1003b7:	6a 00                	push   0x0
  1003b9:	8d 83 0c f0 ff ff    	lea    eax,[ebx-0xff4]
  1003bf:	50                   	push   eax
  1003c0:	e8 8d ff ff ff       	call   100352 <console_write_color>
  1003c5:	83 c4 10             	add    esp,0x10
  1003c8:	b8 00 00 00 00       	mov    eax,0x0
  1003cd:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  1003d0:	c9                   	leave  
  1003d1:	c3                   	ret    

001003d2 <init_debut>:
  1003d2:	f3 0f 1e fb          	endbr32 
  1003d6:	55                   	push   ebp
  1003d7:	89 e5                	mov    ebp,esp
  1003d9:	53                   	push   ebx
  1003da:	83 ec 14             	sub    esp,0x14
  1003dd:	e8 22 1c 00 00       	call   102004 <__x86.get_pc_thunk.bx>
  1003e2:	81 c3 1e 2c 00 00    	add    ebx,0x2c1e
  1003e8:	c7 c0 20 b0 10 00    	mov    eax,0x10b020
  1003ee:	8b 10                	mov    edx,DWORD PTR [eax]
  1003f0:	8d 45 e8             	lea    eax,[ebp-0x18]
  1003f3:	83 ec 08             	sub    esp,0x8
  1003f6:	52                   	push   edx
  1003f7:	50                   	push   eax
  1003f8:	e8 c0 09 00 00       	call   100dbd <elf_from_multiboot>
  1003fd:	83 c4 0c             	add    esp,0xc
  100400:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
  100403:	89 83 28 80 00 00    	mov    DWORD PTR [ebx+0x8028],eax
  100409:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  10040c:	89 83 2c 80 00 00    	mov    DWORD PTR [ebx+0x802c],eax
  100412:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  100415:	89 83 30 80 00 00    	mov    DWORD PTR [ebx+0x8030],eax
  10041b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  10041e:	89 83 34 80 00 00    	mov    DWORD PTR [ebx+0x8034],eax
  100424:	90                   	nop
  100425:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  100428:	c9                   	leave  
  100429:	c3                   	ret    

0010042a <print_cur_status>:
  10042a:	f3 0f 1e fb          	endbr32 
  10042e:	55                   	push   ebp
  10042f:	89 e5                	mov    ebp,esp
  100431:	53                   	push   ebx
  100432:	83 ec 14             	sub    esp,0x14
  100435:	e8 ca 1b 00 00       	call   102004 <__x86.get_pc_thunk.bx>
  10043a:	81 c3 c6 2b 00 00    	add    ebx,0x2bc6
  100440:	8c 4d f6             	mov    WORD PTR [ebp-0xa],cs
  100443:	8c 5d f4             	mov    WORD PTR [ebp-0xc],ds
  100446:	8c 45 f2             	mov    WORD PTR [ebp-0xe],es
  100449:	8c 55 f0             	mov    WORD PTR [ebp-0x10],ss
  10044c:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
  100450:	0f b7 c0             	movzx  eax,ax
  100453:	83 e0 03             	and    eax,0x3
  100456:	89 c2                	mov    edx,eax
  100458:	8b 83 38 80 00 00    	mov    eax,DWORD PTR [ebx+0x8038]
  10045e:	83 ec 04             	sub    esp,0x4
  100461:	52                   	push   edx
  100462:	50                   	push   eax
  100463:	8d 83 1f f0 ff ff    	lea    eax,[ebx-0xfe1]
  100469:	50                   	push   eax
  10046a:	e8 4c 01 00 00       	call   1005bb <printk>
  10046f:	83 c4 10             	add    esp,0x10
  100472:	0f b7 45 f6          	movzx  eax,WORD PTR [ebp-0xa]
  100476:	0f b7 d0             	movzx  edx,ax
  100479:	8b 83 38 80 00 00    	mov    eax,DWORD PTR [ebx+0x8038]
  10047f:	83 ec 04             	sub    esp,0x4
  100482:	52                   	push   edx
  100483:	50                   	push   eax
  100484:	8d 83 2e f0 ff ff    	lea    eax,[ebx-0xfd2]
  10048a:	50                   	push   eax
  10048b:	e8 2b 01 00 00       	call   1005bb <printk>
  100490:	83 c4 10             	add    esp,0x10
  100493:	0f b7 45 f4          	movzx  eax,WORD PTR [ebp-0xc]
  100497:	0f b7 d0             	movzx  edx,ax
  10049a:	8b 83 38 80 00 00    	mov    eax,DWORD PTR [ebx+0x8038]
  1004a0:	83 ec 04             	sub    esp,0x4
  1004a3:	52                   	push   edx
  1004a4:	50                   	push   eax
  1004a5:	8d 83 3d f0 ff ff    	lea    eax,[ebx-0xfc3]
  1004ab:	50                   	push   eax
  1004ac:	e8 0a 01 00 00       	call   1005bb <printk>
  1004b1:	83 c4 10             	add    esp,0x10
  1004b4:	0f b7 45 f2          	movzx  eax,WORD PTR [ebp-0xe]
  1004b8:	0f b7 d0             	movzx  edx,ax
  1004bb:	8b 83 38 80 00 00    	mov    eax,DWORD PTR [ebx+0x8038]
  1004c1:	83 ec 04             	sub    esp,0x4
  1004c4:	52                   	push   edx
  1004c5:	50                   	push   eax
  1004c6:	8d 83 4c f0 ff ff    	lea    eax,[ebx-0xfb4]
  1004cc:	50                   	push   eax
  1004cd:	e8 e9 00 00 00       	call   1005bb <printk>
  1004d2:	83 c4 10             	add    esp,0x10
  1004d5:	0f b7 45 f0          	movzx  eax,WORD PTR [ebp-0x10]
  1004d9:	0f b7 d0             	movzx  edx,ax
  1004dc:	8b 83 38 80 00 00    	mov    eax,DWORD PTR [ebx+0x8038]
  1004e2:	83 ec 04             	sub    esp,0x4
  1004e5:	52                   	push   edx
  1004e6:	50                   	push   eax
  1004e7:	8d 83 5b f0 ff ff    	lea    eax,[ebx-0xfa5]
  1004ed:	50                   	push   eax
  1004ee:	e8 c8 00 00 00       	call   1005bb <printk>
  1004f3:	83 c4 10             	add    esp,0x10
  1004f6:	8b 83 38 80 00 00    	mov    eax,DWORD PTR [ebx+0x8038]
  1004fc:	83 c0 01             	add    eax,0x1
  1004ff:	89 83 38 80 00 00    	mov    DWORD PTR [ebx+0x8038],eax
  100505:	90                   	nop
  100506:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  100509:	c9                   	leave  
  10050a:	c3                   	ret    

0010050b <panic>:
  10050b:	f3 0f 1e fb          	endbr32 
  10050f:	55                   	push   ebp
  100510:	89 e5                	mov    ebp,esp
  100512:	53                   	push   ebx
  100513:	83 ec 04             	sub    esp,0x4
  100516:	e8 e9 1a 00 00       	call   102004 <__x86.get_pc_thunk.bx>
  10051b:	81 c3 e5 2a 00 00    	add    ebx,0x2ae5
  100521:	83 ec 08             	sub    esp,0x8
  100524:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  100527:	8d 83 6a f0 ff ff    	lea    eax,[ebx-0xf96]
  10052d:	50                   	push   eax
  10052e:	e8 88 00 00 00       	call   1005bb <printk>
  100533:	83 c4 10             	add    esp,0x10
  100536:	e8 14 00 00 00       	call   10054f <print_stack_trace>
  10053b:	83 ec 0c             	sub    esp,0xc
  10053e:	8d 83 83 f0 ff ff    	lea    eax,[ebx-0xf7d]
  100544:	50                   	push   eax
  100545:	e8 71 00 00 00       	call   1005bb <printk>
  10054a:	83 c4 10             	add    esp,0x10
  10054d:	eb fe                	jmp    10054d <panic+0x42>

0010054f <print_stack_trace>:
  10054f:	f3 0f 1e fb          	endbr32 
  100553:	55                   	push   ebp
  100554:	89 e5                	mov    ebp,esp
  100556:	53                   	push   ebx
  100557:	83 ec 14             	sub    esp,0x14
  10055a:	e8 a5 1a 00 00       	call   102004 <__x86.get_pc_thunk.bx>
  10055f:	81 c3 a1 2a 00 00    	add    ebx,0x2aa1
  100565:	89 e8                	mov    eax,ebp
  100567:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  10056a:	eb 42                	jmp    1005ae <print_stack_trace+0x5f>
  10056c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  10056f:	83 c0 04             	add    eax,0x4
  100572:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  100575:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  100578:	8b 00                	mov    eax,DWORD PTR [eax]
  10057a:	83 ec 08             	sub    esp,0x8
  10057d:	8d 93 28 80 00 00    	lea    edx,[ebx+0x8028]
  100583:	52                   	push   edx
  100584:	50                   	push   eax
  100585:	e8 6c 09 00 00       	call   100ef6 <elf_lookup_symbol>
  10058a:	83 c4 10             	add    esp,0x10
  10058d:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
  100590:	8b 12                	mov    edx,DWORD PTR [edx]
  100592:	83 ec 04             	sub    esp,0x4
  100595:	50                   	push   eax
  100596:	52                   	push   edx
  100597:	8d 83 8b f0 ff ff    	lea    eax,[ebx-0xf75]
  10059d:	50                   	push   eax
  10059e:	e8 18 00 00 00       	call   1005bb <printk>
  1005a3:	83 c4 10             	add    esp,0x10
  1005a6:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  1005a9:	8b 00                	mov    eax,DWORD PTR [eax]
  1005ab:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  1005ae:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
  1005b2:	75 b8                	jne    10056c <print_stack_trace+0x1d>
  1005b4:	90                   	nop
  1005b5:	90                   	nop
  1005b6:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  1005b9:	c9                   	leave  
  1005ba:	c3                   	ret    

001005bb <printk>:
  1005bb:	f3 0f 1e fb          	endbr32 
  1005bf:	55                   	push   ebp
  1005c0:	89 e5                	mov    ebp,esp
  1005c2:	53                   	push   ebx
  1005c3:	83 ec 14             	sub    esp,0x14
  1005c6:	e8 39 1a 00 00       	call   102004 <__x86.get_pc_thunk.bx>
  1005cb:	81 c3 35 2a 00 00    	add    ebx,0x2a35
  1005d1:	8d 45 0c             	lea    eax,[ebp+0xc]
  1005d4:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  1005d7:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  1005da:	83 ec 04             	sub    esp,0x4
  1005dd:	50                   	push   eax
  1005de:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  1005e1:	8d 83 40 80 00 00    	lea    eax,[ebx+0x8040]
  1005e7:	50                   	push   eax
  1005e8:	e8 29 03 00 00       	call   100916 <vsprintf>
  1005ed:	83 c4 10             	add    esp,0x10
  1005f0:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  1005f3:	8d 93 40 80 00 00    	lea    edx,[ebx+0x8040]
  1005f9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  1005fc:	01 d0                	add    eax,edx
  1005fe:	c6 00 00             	mov    BYTE PTR [eax],0x0
  100601:	83 ec 0c             	sub    esp,0xc
  100604:	8d 83 40 80 00 00    	lea    eax,[ebx+0x8040]
  10060a:	50                   	push   eax
  10060b:	e8 ff fc ff ff       	call   10030f <console_write>
  100610:	83 c4 10             	add    esp,0x10
  100613:	90                   	nop
  100614:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  100617:	c9                   	leave  
  100618:	c3                   	ret    

00100619 <printk_color>:
  100619:	f3 0f 1e fb          	endbr32 
  10061d:	55                   	push   ebp
  10061e:	89 e5                	mov    ebp,esp
  100620:	53                   	push   ebx
  100621:	83 ec 14             	sub    esp,0x14
  100624:	e8 db 19 00 00       	call   102004 <__x86.get_pc_thunk.bx>
  100629:	81 c3 d7 29 00 00    	add    ebx,0x29d7
  10062f:	8d 45 14             	lea    eax,[ebp+0x14]
  100632:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  100635:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  100638:	83 ec 04             	sub    esp,0x4
  10063b:	50                   	push   eax
  10063c:	ff 75 10             	push   DWORD PTR [ebp+0x10]
  10063f:	8d 83 40 80 00 00    	lea    eax,[ebx+0x8040]
  100645:	50                   	push   eax
  100646:	e8 cb 02 00 00       	call   100916 <vsprintf>
  10064b:	83 c4 10             	add    esp,0x10
  10064e:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  100651:	8d 93 40 80 00 00    	lea    edx,[ebx+0x8040]
  100657:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  10065a:	01 d0                	add    eax,edx
  10065c:	c6 00 00             	mov    BYTE PTR [eax],0x0
  10065f:	83 ec 04             	sub    esp,0x4
  100662:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
  100665:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  100668:	8d 83 40 80 00 00    	lea    eax,[ebx+0x8040]
  10066e:	50                   	push   eax
  10066f:	e8 de fc ff ff       	call   100352 <console_write_color>
  100674:	83 c4 10             	add    esp,0x10
  100677:	90                   	nop
  100678:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  10067b:	c9                   	leave  
  10067c:	c3                   	ret    

0010067d <skip_atoi>:
  10067d:	f3 0f 1e fb          	endbr32 
  100681:	55                   	push   ebp
  100682:	89 e5                	mov    ebp,esp
  100684:	53                   	push   ebx
  100685:	83 ec 10             	sub    esp,0x10
  100688:	e8 73 19 00 00       	call   102000 <__x86.get_pc_thunk.ax>
  10068d:	05 73 29 00 00       	add    eax,0x2973
  100692:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
  100699:	eb 29                	jmp    1006c4 <skip_atoi+0x47>
  10069b:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
  10069e:	89 d0                	mov    eax,edx
  1006a0:	c1 e0 02             	shl    eax,0x2
  1006a3:	01 d0                	add    eax,edx
  1006a5:	01 c0                	add    eax,eax
  1006a7:	89 c3                	mov    ebx,eax
  1006a9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  1006ac:	8b 00                	mov    eax,DWORD PTR [eax]
  1006ae:	8d 48 01             	lea    ecx,[eax+0x1]
  1006b1:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  1006b4:	89 0a                	mov    DWORD PTR [edx],ecx
  1006b6:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  1006b9:	0f be c0             	movsx  eax,al
  1006bc:	01 d8                	add    eax,ebx
  1006be:	83 e8 30             	sub    eax,0x30
  1006c1:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
  1006c4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  1006c7:	8b 00                	mov    eax,DWORD PTR [eax]
  1006c9:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  1006cc:	3c 2f                	cmp    al,0x2f
  1006ce:	7e 0c                	jle    1006dc <skip_atoi+0x5f>
  1006d0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  1006d3:	8b 00                	mov    eax,DWORD PTR [eax]
  1006d5:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  1006d8:	3c 39                	cmp    al,0x39
  1006da:	7e bf                	jle    10069b <skip_atoi+0x1e>
  1006dc:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
  1006df:	83 c4 10             	add    esp,0x10
  1006e2:	5b                   	pop    ebx
  1006e3:	5d                   	pop    ebp
  1006e4:	c3                   	ret    

001006e5 <number>:
  1006e5:	f3 0f 1e fb          	endbr32 
  1006e9:	55                   	push   ebp
  1006ea:	89 e5                	mov    ebp,esp
  1006ec:	83 ec 40             	sub    esp,0x40
  1006ef:	e8 0c 19 00 00       	call   102000 <__x86.get_pc_thunk.ax>
  1006f4:	05 0c 29 00 00       	add    eax,0x290c
  1006f9:	8d 90 98 f0 ff ff    	lea    edx,[eax-0xf68]
  1006ff:	89 55 f8             	mov    DWORD PTR [ebp-0x8],edx
  100702:	8b 55 1c             	mov    edx,DWORD PTR [ebp+0x1c]
  100705:	83 e2 40             	and    edx,0x40
  100708:	85 d2                	test   edx,edx
  10070a:	74 09                	je     100715 <number+0x30>
  10070c:	8d 80 c0 f0 ff ff    	lea    eax,[eax-0xf40]
  100712:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
  100715:	8b 45 1c             	mov    eax,DWORD PTR [ebp+0x1c]
  100718:	83 e0 10             	and    eax,0x10
  10071b:	85 c0                	test   eax,eax
  10071d:	83 7d 10 01          	cmp    DWORD PTR [ebp+0x10],0x1
  100721:	7e 06                	jle    100729 <number+0x44>
  100723:	83 7d 10 24          	cmp    DWORD PTR [ebp+0x10],0x24
  100727:	7e 0a                	jle    100733 <number+0x4e>
  100729:	b8 00 00 00 00       	mov    eax,0x0
  10072e:	e9 e1 01 00 00       	jmp    100914 <number+0x22f>
  100733:	8b 45 1c             	mov    eax,DWORD PTR [ebp+0x1c]
  100736:	83 e0 01             	and    eax,0x1
  100739:	85 c0                	test   eax,eax
  10073b:	74 07                	je     100744 <number+0x5f>
  10073d:	b8 30 00 00 00       	mov    eax,0x30
  100742:	eb 05                	jmp    100749 <number+0x64>
  100744:	b8 20 00 00 00       	mov    eax,0x20
  100749:	88 45 f3             	mov    BYTE PTR [ebp-0xd],al
  10074c:	8b 45 1c             	mov    eax,DWORD PTR [ebp+0x1c]
  10074f:	83 e0 02             	and    eax,0x2
  100752:	85 c0                	test   eax,eax
  100754:	74 0f                	je     100765 <number+0x80>
  100756:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
  10075a:	79 09                	jns    100765 <number+0x80>
  10075c:	c6 45 ff 2d          	mov    BYTE PTR [ebp-0x1],0x2d
  100760:	f7 5d 0c             	neg    DWORD PTR [ebp+0xc]
  100763:	eb 1d                	jmp    100782 <number+0x9d>
  100765:	8b 45 1c             	mov    eax,DWORD PTR [ebp+0x1c]
  100768:	83 e0 04             	and    eax,0x4
  10076b:	85 c0                	test   eax,eax
  10076d:	75 0b                	jne    10077a <number+0x95>
  10076f:	8b 45 1c             	mov    eax,DWORD PTR [ebp+0x1c]
  100772:	c1 e0 02             	shl    eax,0x2
  100775:	83 e0 20             	and    eax,0x20
  100778:	eb 05                	jmp    10077f <number+0x9a>
  10077a:	b8 2b 00 00 00       	mov    eax,0x2b
  10077f:	88 45 ff             	mov    BYTE PTR [ebp-0x1],al
  100782:	80 7d ff 00          	cmp    BYTE PTR [ebp-0x1],0x0
  100786:	74 04                	je     10078c <number+0xa7>
  100788:	83 6d 14 01          	sub    DWORD PTR [ebp+0x14],0x1
  10078c:	8b 45 1c             	mov    eax,DWORD PTR [ebp+0x1c]
  10078f:	83 e0 20             	and    eax,0x20
  100792:	85 c0                	test   eax,eax
  100794:	74 16                	je     1007ac <number+0xc7>
  100796:	83 7d 10 10          	cmp    DWORD PTR [ebp+0x10],0x10
  10079a:	75 06                	jne    1007a2 <number+0xbd>
  10079c:	83 6d 14 02          	sub    DWORD PTR [ebp+0x14],0x2
  1007a0:	eb 0a                	jmp    1007ac <number+0xc7>
  1007a2:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
  1007a6:	75 04                	jne    1007ac <number+0xc7>
  1007a8:	83 6d 14 01          	sub    DWORD PTR [ebp+0x14],0x1
  1007ac:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
  1007b3:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
  1007b7:	75 3e                	jne    1007f7 <number+0x112>
  1007b9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  1007bc:	8d 50 01             	lea    edx,[eax+0x1]
  1007bf:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
  1007c2:	c6 44 05 c8 30       	mov    BYTE PTR [ebp+eax*1-0x38],0x30
  1007c7:	eb 34                	jmp    1007fd <number+0x118>
  1007c9:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  1007cc:	ba 00 00 00 00       	mov    edx,0x0
  1007d1:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
  1007d4:	f7 f1                	div    ecx
  1007d6:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
  1007d9:	89 55 ec             	mov    DWORD PTR [ebp-0x14],edx
  1007dc:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  1007df:	89 c2                	mov    edx,eax
  1007e1:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
  1007e4:	8d 0c 02             	lea    ecx,[edx+eax*1]
  1007e7:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  1007ea:	8d 50 01             	lea    edx,[eax+0x1]
  1007ed:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
  1007f0:	0f b6 11             	movzx  edx,BYTE PTR [ecx]
  1007f3:	88 54 05 c8          	mov    BYTE PTR [ebp+eax*1-0x38],dl
  1007f7:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
  1007fb:	75 cc                	jne    1007c9 <number+0xe4>
  1007fd:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  100800:	3b 45 18             	cmp    eax,DWORD PTR [ebp+0x18]
  100803:	7e 06                	jle    10080b <number+0x126>
  100805:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  100808:	89 45 18             	mov    DWORD PTR [ebp+0x18],eax
  10080b:	8b 45 18             	mov    eax,DWORD PTR [ebp+0x18]
  10080e:	29 45 14             	sub    DWORD PTR [ebp+0x14],eax
  100811:	8b 45 1c             	mov    eax,DWORD PTR [ebp+0x1c]
  100814:	83 e0 11             	and    eax,0x11
  100817:	85 c0                	test   eax,eax
  100819:	75 1b                	jne    100836 <number+0x151>
  10081b:	eb 0c                	jmp    100829 <number+0x144>
  10081d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  100820:	8d 50 01             	lea    edx,[eax+0x1]
  100823:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
  100826:	c6 00 20             	mov    BYTE PTR [eax],0x20
  100829:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
  10082c:	8d 50 ff             	lea    edx,[eax-0x1]
  10082f:	89 55 14             	mov    DWORD PTR [ebp+0x14],edx
  100832:	85 c0                	test   eax,eax
  100834:	7f e7                	jg     10081d <number+0x138>
  100836:	80 7d ff 00          	cmp    BYTE PTR [ebp-0x1],0x0
  10083a:	74 0f                	je     10084b <number+0x166>
  10083c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  10083f:	8d 50 01             	lea    edx,[eax+0x1]
  100842:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
  100845:	0f b6 55 ff          	movzx  edx,BYTE PTR [ebp-0x1]
  100849:	88 10                	mov    BYTE PTR [eax],dl
  10084b:	8b 45 1c             	mov    eax,DWORD PTR [ebp+0x1c]
  10084e:	83 e0 20             	and    eax,0x20
  100851:	85 c0                	test   eax,eax
  100853:	74 38                	je     10088d <number+0x1a8>
  100855:	83 7d 10 08          	cmp    DWORD PTR [ebp+0x10],0x8
  100859:	75 0e                	jne    100869 <number+0x184>
  10085b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  10085e:	8d 50 01             	lea    edx,[eax+0x1]
  100861:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
  100864:	c6 00 30             	mov    BYTE PTR [eax],0x30
  100867:	eb 24                	jmp    10088d <number+0x1a8>
  100869:	83 7d 10 10          	cmp    DWORD PTR [ebp+0x10],0x10
  10086d:	75 1e                	jne    10088d <number+0x1a8>
  10086f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  100872:	8d 50 01             	lea    edx,[eax+0x1]
  100875:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
  100878:	c6 00 30             	mov    BYTE PTR [eax],0x30
  10087b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  10087e:	8d 50 01             	lea    edx,[eax+0x1]
  100881:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
  100884:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
  100887:	0f b6 52 21          	movzx  edx,BYTE PTR [edx+0x21]
  10088b:	88 10                	mov    BYTE PTR [eax],dl
  10088d:	8b 45 1c             	mov    eax,DWORD PTR [ebp+0x1c]
  100890:	83 e0 10             	and    eax,0x10
  100893:	85 c0                	test   eax,eax
  100895:	75 2c                	jne    1008c3 <number+0x1de>
  100897:	eb 0f                	jmp    1008a8 <number+0x1c3>
  100899:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  10089c:	8d 50 01             	lea    edx,[eax+0x1]
  10089f:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
  1008a2:	0f b6 55 f3          	movzx  edx,BYTE PTR [ebp-0xd]
  1008a6:	88 10                	mov    BYTE PTR [eax],dl
  1008a8:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
  1008ab:	8d 50 ff             	lea    edx,[eax-0x1]
  1008ae:	89 55 14             	mov    DWORD PTR [ebp+0x14],edx
  1008b1:	85 c0                	test   eax,eax
  1008b3:	7f e4                	jg     100899 <number+0x1b4>
  1008b5:	eb 0c                	jmp    1008c3 <number+0x1de>
  1008b7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  1008ba:	8d 50 01             	lea    edx,[eax+0x1]
  1008bd:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
  1008c0:	c6 00 30             	mov    BYTE PTR [eax],0x30
  1008c3:	8b 45 18             	mov    eax,DWORD PTR [ebp+0x18]
  1008c6:	8d 50 ff             	lea    edx,[eax-0x1]
  1008c9:	89 55 18             	mov    DWORD PTR [ebp+0x18],edx
  1008cc:	39 45 f4             	cmp    DWORD PTR [ebp-0xc],eax
  1008cf:	7c e6                	jl     1008b7 <number+0x1d2>
  1008d1:	eb 16                	jmp    1008e9 <number+0x204>
  1008d3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  1008d6:	8d 50 01             	lea    edx,[eax+0x1]
  1008d9:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
  1008dc:	8d 4d c8             	lea    ecx,[ebp-0x38]
  1008df:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
  1008e2:	01 ca                	add    edx,ecx
  1008e4:	0f b6 12             	movzx  edx,BYTE PTR [edx]
  1008e7:	88 10                	mov    BYTE PTR [eax],dl
  1008e9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  1008ec:	8d 50 ff             	lea    edx,[eax-0x1]
  1008ef:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
  1008f2:	85 c0                	test   eax,eax
  1008f4:	7f dd                	jg     1008d3 <number+0x1ee>
  1008f6:	eb 0c                	jmp    100904 <number+0x21f>
  1008f8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  1008fb:	8d 50 01             	lea    edx,[eax+0x1]
  1008fe:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
  100901:	c6 00 20             	mov    BYTE PTR [eax],0x20
  100904:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
  100907:	8d 50 ff             	lea    edx,[eax-0x1]
  10090a:	89 55 14             	mov    DWORD PTR [ebp+0x14],edx
  10090d:	85 c0                	test   eax,eax
  10090f:	7f e7                	jg     1008f8 <number+0x213>
  100911:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  100914:	c9                   	leave  
  100915:	c3                   	ret    

00100916 <vsprintf>:
  100916:	f3 0f 1e fb          	endbr32 
  10091a:	55                   	push   ebp
  10091b:	89 e5                	mov    ebp,esp
  10091d:	53                   	push   ebx
  10091e:	83 ec 34             	sub    esp,0x34
  100921:	e8 de 16 00 00       	call   102004 <__x86.get_pc_thunk.bx>
  100926:	81 c3 da 26 00 00    	add    ebx,0x26da
  10092c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  10092f:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
  100932:	e9 e0 03 00 00       	jmp    100d17 <.L63+0x46>
  100937:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  10093a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  10093d:	3c 25                	cmp    al,0x25
  10093f:	74 16                	je     100957 <vsprintf+0x41>
  100941:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
  100944:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  100947:	8d 48 01             	lea    ecx,[eax+0x1]
  10094a:	89 4d ec             	mov    DWORD PTR [ebp-0x14],ecx
  10094d:	0f b6 12             	movzx  edx,BYTE PTR [edx]
  100950:	88 10                	mov    BYTE PTR [eax],dl
  100952:	e9 b7 03 00 00       	jmp    100d0e <.L63+0x3d>
  100957:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
  10095e:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100961:	83 c0 01             	add    eax,0x1
  100964:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
  100967:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  10096a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  10096d:	0f be c0             	movsx  eax,al
  100970:	83 e8 20             	sub    eax,0x20
  100973:	83 f8 10             	cmp    eax,0x10
  100976:	77 2d                	ja     1009a5 <.L49>
  100978:	c1 e0 02             	shl    eax,0x2
  10097b:	8b 84 18 e8 f0 ff ff 	mov    eax,DWORD PTR [eax+ebx*1-0xf18]
  100982:	01 d8                	add    eax,ebx
  100984:	3e ff e0             	notrack jmp eax

00100987 <.L52>:
  100987:	83 4d e4 10          	or     DWORD PTR [ebp-0x1c],0x10
  10098b:	eb d1                	jmp    10095e <vsprintf+0x48>

0010098d <.L53>:
  10098d:	83 4d e4 04          	or     DWORD PTR [ebp-0x1c],0x4
  100991:	eb cb                	jmp    10095e <vsprintf+0x48>

00100993 <.L55>:
  100993:	83 4d e4 08          	or     DWORD PTR [ebp-0x1c],0x8
  100997:	eb c5                	jmp    10095e <vsprintf+0x48>

00100999 <.L54>:
  100999:	83 4d e4 20          	or     DWORD PTR [ebp-0x1c],0x20
  10099d:	eb bf                	jmp    10095e <vsprintf+0x48>

0010099f <.L50>:
  10099f:	83 4d e4 01          	or     DWORD PTR [ebp-0x1c],0x1
  1009a3:	eb b9                	jmp    10095e <vsprintf+0x48>

001009a5 <.L49>:
  1009a5:	c7 45 e0 ff ff ff ff 	mov    DWORD PTR [ebp-0x20],0xffffffff
  1009ac:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  1009af:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  1009b2:	3c 2f                	cmp    al,0x2f
  1009b4:	7e 1b                	jle    1009d1 <.L49+0x2c>
  1009b6:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  1009b9:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  1009bc:	3c 39                	cmp    al,0x39
  1009be:	7f 11                	jg     1009d1 <.L49+0x2c>
  1009c0:	8d 45 0c             	lea    eax,[ebp+0xc]
  1009c3:	50                   	push   eax
  1009c4:	e8 b4 fc ff ff       	call   10067d <skip_atoi>
  1009c9:	83 c4 04             	add    esp,0x4
  1009cc:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
  1009cf:	eb 25                	jmp    1009f6 <.L49+0x51>
  1009d1:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  1009d4:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  1009d7:	3c 2a                	cmp    al,0x2a
  1009d9:	75 1b                	jne    1009f6 <.L49+0x51>
  1009db:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  1009de:	8d 50 04             	lea    edx,[eax+0x4]
  1009e1:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
  1009e4:	8b 00                	mov    eax,DWORD PTR [eax]
  1009e6:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
  1009e9:	83 7d e0 00          	cmp    DWORD PTR [ebp-0x20],0x0
  1009ed:	79 07                	jns    1009f6 <.L49+0x51>
  1009ef:	f7 5d e0             	neg    DWORD PTR [ebp-0x20]
  1009f2:	83 4d e4 10          	or     DWORD PTR [ebp-0x1c],0x10
  1009f6:	c7 45 dc ff ff ff ff 	mov    DWORD PTR [ebp-0x24],0xffffffff
  1009fd:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100a00:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  100a03:	3c 2e                	cmp    al,0x2e
  100a05:	75 2e                	jne    100a35 <.L49+0x90>
  100a07:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100a0a:	83 c0 01             	add    eax,0x1
  100a0d:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
  100a10:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100a13:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  100a16:	3c 2f                	cmp    al,0x2f
  100a18:	7e 33                	jle    100a4d <.L49+0xa8>
  100a1a:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100a1d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  100a20:	3c 39                	cmp    al,0x39
  100a22:	7f 29                	jg     100a4d <.L49+0xa8>
  100a24:	8d 45 0c             	lea    eax,[ebp+0xc]
  100a27:	50                   	push   eax
  100a28:	e8 50 fc ff ff       	call   10067d <skip_atoi>
  100a2d:	83 c4 04             	add    esp,0x4
  100a30:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
  100a33:	eb 18                	jmp    100a4d <.L49+0xa8>
  100a35:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100a38:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  100a3b:	3c 2a                	cmp    al,0x2a
  100a3d:	75 0e                	jne    100a4d <.L49+0xa8>
  100a3f:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  100a42:	8d 50 04             	lea    edx,[eax+0x4]
  100a45:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
  100a48:	8b 00                	mov    eax,DWORD PTR [eax]
  100a4a:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
  100a4d:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
  100a51:	79 07                	jns    100a5a <.L49+0xb5>
  100a53:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
  100a5a:	c7 45 d8 ff ff ff ff 	mov    DWORD PTR [ebp-0x28],0xffffffff
  100a61:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100a64:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  100a67:	3c 68                	cmp    al,0x68
  100a69:	74 14                	je     100a7f <.L49+0xda>
  100a6b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100a6e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  100a71:	3c 6c                	cmp    al,0x6c
  100a73:	74 0a                	je     100a7f <.L49+0xda>
  100a75:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100a78:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  100a7b:	3c 4c                	cmp    al,0x4c
  100a7d:	75 15                	jne    100a94 <.L49+0xef>
  100a7f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100a82:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  100a85:	0f be c0             	movsx  eax,al
  100a88:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
  100a8b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100a8e:	83 c0 01             	add    eax,0x1
  100a91:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
  100a94:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100a97:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  100a9a:	0f be c0             	movsx  eax,al
  100a9d:	83 e8 58             	sub    eax,0x58
  100aa0:	83 f8 20             	cmp    eax,0x20
  100aa3:	0f 87 28 02 00 00    	ja     100cd1 <.L63>
  100aa9:	c1 e0 02             	shl    eax,0x2
  100aac:	8b 84 18 2c f1 ff ff 	mov    eax,DWORD PTR [eax+ebx*1-0xed4]
  100ab3:	01 d8                	add    eax,ebx
  100ab5:	3e ff e0             	notrack jmp eax

00100ab8 <.L72>:
  100ab8:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  100abb:	83 e0 10             	and    eax,0x10
  100abe:	85 c0                	test   eax,eax
  100ac0:	75 18                	jne    100ada <.L72+0x22>
  100ac2:	eb 0c                	jmp    100ad0 <.L72+0x18>
  100ac4:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  100ac7:	8d 50 01             	lea    edx,[eax+0x1]
  100aca:	89 55 ec             	mov    DWORD PTR [ebp-0x14],edx
  100acd:	c6 00 20             	mov    BYTE PTR [eax],0x20
  100ad0:	83 6d e0 01          	sub    DWORD PTR [ebp-0x20],0x1
  100ad4:	83 7d e0 00          	cmp    DWORD PTR [ebp-0x20],0x0
  100ad8:	7f ea                	jg     100ac4 <.L72+0xc>
  100ada:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  100add:	8d 50 04             	lea    edx,[eax+0x4]
  100ae0:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
  100ae3:	8b 08                	mov    ecx,DWORD PTR [eax]
  100ae5:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  100ae8:	8d 50 01             	lea    edx,[eax+0x1]
  100aeb:	89 55 ec             	mov    DWORD PTR [ebp-0x14],edx
  100aee:	89 ca                	mov    edx,ecx
  100af0:	88 10                	mov    BYTE PTR [eax],dl
  100af2:	eb 0c                	jmp    100b00 <.L72+0x48>
  100af4:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  100af7:	8d 50 01             	lea    edx,[eax+0x1]
  100afa:	89 55 ec             	mov    DWORD PTR [ebp-0x14],edx
  100afd:	c6 00 20             	mov    BYTE PTR [eax],0x20
  100b00:	83 6d e0 01          	sub    DWORD PTR [ebp-0x20],0x1
  100b04:	83 7d e0 00          	cmp    DWORD PTR [ebp-0x20],0x0
  100b08:	7f ea                	jg     100af4 <.L72+0x3c>
  100b0a:	e9 ff 01 00 00       	jmp    100d0e <.L63+0x3d>

00100b0f <.L67>:
  100b0f:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  100b12:	8d 50 04             	lea    edx,[eax+0x4]
  100b15:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
  100b18:	8b 00                	mov    eax,DWORD PTR [eax]
  100b1a:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
  100b1d:	83 ec 0c             	sub    esp,0xc
  100b20:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
  100b23:	e8 6a 06 00 00       	call   101192 <strlen>
  100b28:	83 c4 10             	add    esp,0x10
  100b2b:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  100b2e:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
  100b32:	79 08                	jns    100b3c <.L67+0x2d>
  100b34:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  100b37:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
  100b3a:	eb 0e                	jmp    100b4a <.L67+0x3b>
  100b3c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  100b3f:	3b 45 dc             	cmp    eax,DWORD PTR [ebp-0x24]
  100b42:	7e 06                	jle    100b4a <.L67+0x3b>
  100b44:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
  100b47:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  100b4a:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  100b4d:	83 e0 10             	and    eax,0x10
  100b50:	85 c0                	test   eax,eax
  100b52:	75 1c                	jne    100b70 <.L67+0x61>
  100b54:	eb 0c                	jmp    100b62 <.L67+0x53>
  100b56:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  100b59:	8d 50 01             	lea    edx,[eax+0x1]
  100b5c:	89 55 ec             	mov    DWORD PTR [ebp-0x14],edx
  100b5f:	c6 00 20             	mov    BYTE PTR [eax],0x20
  100b62:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  100b65:	8d 50 ff             	lea    edx,[eax-0x1]
  100b68:	89 55 e0             	mov    DWORD PTR [ebp-0x20],edx
  100b6b:	39 45 f4             	cmp    DWORD PTR [ebp-0xc],eax
  100b6e:	7c e6                	jl     100b56 <.L67+0x47>
  100b70:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
  100b77:	eb 1b                	jmp    100b94 <.L67+0x85>
  100b79:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
  100b7c:	8d 42 01             	lea    eax,[edx+0x1]
  100b7f:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
  100b82:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  100b85:	8d 48 01             	lea    ecx,[eax+0x1]
  100b88:	89 4d ec             	mov    DWORD PTR [ebp-0x14],ecx
  100b8b:	0f b6 12             	movzx  edx,BYTE PTR [edx]
  100b8e:	88 10                	mov    BYTE PTR [eax],dl
  100b90:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
  100b94:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  100b97:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
  100b9a:	7c dd                	jl     100b79 <.L67+0x6a>
  100b9c:	eb 0c                	jmp    100baa <.L67+0x9b>
  100b9e:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  100ba1:	8d 50 01             	lea    edx,[eax+0x1]
  100ba4:	89 55 ec             	mov    DWORD PTR [ebp-0x14],edx
  100ba7:	c6 00 20             	mov    BYTE PTR [eax],0x20
  100baa:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  100bad:	8d 50 ff             	lea    edx,[eax-0x1]
  100bb0:	89 55 e0             	mov    DWORD PTR [ebp-0x20],edx
  100bb3:	39 45 f4             	cmp    DWORD PTR [ebp-0xc],eax
  100bb6:	7c e6                	jl     100b9e <.L67+0x8f>
  100bb8:	e9 51 01 00 00       	jmp    100d0e <.L63+0x3d>

00100bbd <.L69>:
  100bbd:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  100bc0:	8d 50 04             	lea    edx,[eax+0x4]
  100bc3:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
  100bc6:	8b 00                	mov    eax,DWORD PTR [eax]
  100bc8:	83 ec 08             	sub    esp,0x8
  100bcb:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
  100bce:	ff 75 dc             	push   DWORD PTR [ebp-0x24]
  100bd1:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
  100bd4:	6a 08                	push   0x8
  100bd6:	50                   	push   eax
  100bd7:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
  100bda:	e8 06 fb ff ff       	call   1006e5 <number>
  100bdf:	83 c4 20             	add    esp,0x20
  100be2:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
  100be5:	e9 24 01 00 00       	jmp    100d0e <.L63+0x3d>

00100bea <.L68>:
  100bea:	83 7d e0 ff          	cmp    DWORD PTR [ebp-0x20],0xffffffff
  100bee:	75 0b                	jne    100bfb <.L68+0x11>
  100bf0:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
  100bf7:	83 4d e4 01          	or     DWORD PTR [ebp-0x1c],0x1
  100bfb:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  100bfe:	8d 50 04             	lea    edx,[eax+0x4]
  100c01:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
  100c04:	8b 00                	mov    eax,DWORD PTR [eax]
  100c06:	83 ec 08             	sub    esp,0x8
  100c09:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
  100c0c:	ff 75 dc             	push   DWORD PTR [ebp-0x24]
  100c0f:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
  100c12:	6a 10                	push   0x10
  100c14:	50                   	push   eax
  100c15:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
  100c18:	e8 c8 fa ff ff       	call   1006e5 <number>
  100c1d:	83 c4 20             	add    esp,0x20
  100c20:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
  100c23:	e9 e6 00 00 00       	jmp    100d0e <.L63+0x3d>

00100c28 <.L64>:
  100c28:	83 4d e4 40          	or     DWORD PTR [ebp-0x1c],0x40

00100c2c <.L74>:
  100c2c:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  100c2f:	8d 50 04             	lea    edx,[eax+0x4]
  100c32:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
  100c35:	8b 00                	mov    eax,DWORD PTR [eax]
  100c37:	83 ec 08             	sub    esp,0x8
  100c3a:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
  100c3d:	ff 75 dc             	push   DWORD PTR [ebp-0x24]
  100c40:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
  100c43:	6a 10                	push   0x10
  100c45:	50                   	push   eax
  100c46:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
  100c49:	e8 97 fa ff ff       	call   1006e5 <number>
  100c4e:	83 c4 20             	add    esp,0x20
  100c51:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
  100c54:	e9 b5 00 00 00       	jmp    100d0e <.L63+0x3d>

00100c59 <.L71>:
  100c59:	83 4d e4 02          	or     DWORD PTR [ebp-0x1c],0x2

00100c5d <.L66>:
  100c5d:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  100c60:	8d 50 04             	lea    edx,[eax+0x4]
  100c63:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
  100c66:	8b 00                	mov    eax,DWORD PTR [eax]
  100c68:	83 ec 08             	sub    esp,0x8
  100c6b:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
  100c6e:	ff 75 dc             	push   DWORD PTR [ebp-0x24]
  100c71:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
  100c74:	6a 0a                	push   0xa
  100c76:	50                   	push   eax
  100c77:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
  100c7a:	e8 66 fa ff ff       	call   1006e5 <number>
  100c7f:	83 c4 20             	add    esp,0x20
  100c82:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
  100c85:	e9 84 00 00 00       	jmp    100d0e <.L63+0x3d>

00100c8a <.L73>:
  100c8a:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  100c8d:	8d 50 04             	lea    edx,[eax+0x4]
  100c90:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
  100c93:	8b 00                	mov    eax,DWORD PTR [eax]
  100c95:	83 ec 08             	sub    esp,0x8
  100c98:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
  100c9b:	ff 75 dc             	push   DWORD PTR [ebp-0x24]
  100c9e:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
  100ca1:	6a 02                	push   0x2
  100ca3:	50                   	push   eax
  100ca4:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
  100ca7:	e8 39 fa ff ff       	call   1006e5 <number>
  100cac:	83 c4 20             	add    esp,0x20
  100caf:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
  100cb2:	eb 5a                	jmp    100d0e <.L63+0x3d>

00100cb4 <.L70>:
  100cb4:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  100cb7:	8d 50 04             	lea    edx,[eax+0x4]
  100cba:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
  100cbd:	8b 00                	mov    eax,DWORD PTR [eax]
  100cbf:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  100cc2:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  100cc5:	2b 45 08             	sub    eax,DWORD PTR [ebp+0x8]
  100cc8:	89 c2                	mov    edx,eax
  100cca:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  100ccd:	89 10                	mov    DWORD PTR [eax],edx
  100ccf:	eb 3d                	jmp    100d0e <.L63+0x3d>

00100cd1 <.L63>:
  100cd1:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100cd4:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  100cd7:	3c 25                	cmp    al,0x25
  100cd9:	74 0c                	je     100ce7 <.L63+0x16>
  100cdb:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  100cde:	8d 50 01             	lea    edx,[eax+0x1]
  100ce1:	89 55 ec             	mov    DWORD PTR [ebp-0x14],edx
  100ce4:	c6 00 25             	mov    BYTE PTR [eax],0x25
  100ce7:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100cea:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  100ced:	84 c0                	test   al,al
  100cef:	74 13                	je     100d04 <.L63+0x33>
  100cf1:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
  100cf4:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  100cf7:	8d 48 01             	lea    ecx,[eax+0x1]
  100cfa:	89 4d ec             	mov    DWORD PTR [ebp-0x14],ecx
  100cfd:	0f b6 12             	movzx  edx,BYTE PTR [edx]
  100d00:	88 10                	mov    BYTE PTR [eax],dl
  100d02:	eb 09                	jmp    100d0d <.L63+0x3c>
  100d04:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100d07:	83 e8 01             	sub    eax,0x1
  100d0a:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
  100d0d:	90                   	nop
  100d0e:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100d11:	83 c0 01             	add    eax,0x1
  100d14:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
  100d17:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100d1a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  100d1d:	84 c0                	test   al,al
  100d1f:	0f 85 12 fc ff ff    	jne    100937 <vsprintf+0x21>
  100d25:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  100d28:	c6 00 00             	mov    BYTE PTR [eax],0x0
  100d2b:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  100d2e:	2b 45 08             	sub    eax,DWORD PTR [ebp+0x8]
  100d31:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  100d34:	c9                   	leave  
  100d35:	c3                   	ret    

00100d36 <outb>:
  100d36:	f3 0f 1e fb          	endbr32 
  100d3a:	55                   	push   ebp
  100d3b:	89 e5                	mov    ebp,esp
  100d3d:	83 ec 08             	sub    esp,0x8
  100d40:	e8 bb 12 00 00       	call   102000 <__x86.get_pc_thunk.ax>
  100d45:	05 bb 22 00 00       	add    eax,0x22bb
  100d4a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  100d4d:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
  100d50:	66 89 45 fc          	mov    WORD PTR [ebp-0x4],ax
  100d54:	89 d0                	mov    eax,edx
  100d56:	88 45 f8             	mov    BYTE PTR [ebp-0x8],al
  100d59:	0f b7 55 fc          	movzx  edx,WORD PTR [ebp-0x4]
  100d5d:	0f b6 45 f8          	movzx  eax,BYTE PTR [ebp-0x8]
  100d61:	ee                   	out    dx,al
  100d62:	90                   	nop
  100d63:	c9                   	leave  
  100d64:	c3                   	ret    

00100d65 <inb>:
  100d65:	f3 0f 1e fb          	endbr32 
  100d69:	55                   	push   ebp
  100d6a:	89 e5                	mov    ebp,esp
  100d6c:	83 ec 14             	sub    esp,0x14
  100d6f:	e8 8c 12 00 00       	call   102000 <__x86.get_pc_thunk.ax>
  100d74:	05 8c 22 00 00       	add    eax,0x228c
  100d79:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  100d7c:	66 89 45 ec          	mov    WORD PTR [ebp-0x14],ax
  100d80:	0f b7 45 ec          	movzx  eax,WORD PTR [ebp-0x14]
  100d84:	89 c2                	mov    edx,eax
  100d86:	ec                   	in     al,dx
  100d87:	88 45 ff             	mov    BYTE PTR [ebp-0x1],al
  100d8a:	0f b6 45 ff          	movzx  eax,BYTE PTR [ebp-0x1]
  100d8e:	c9                   	leave  
  100d8f:	c3                   	ret    

00100d90 <inw>:
  100d90:	f3 0f 1e fb          	endbr32 
  100d94:	55                   	push   ebp
  100d95:	89 e5                	mov    ebp,esp
  100d97:	83 ec 14             	sub    esp,0x14
  100d9a:	e8 61 12 00 00       	call   102000 <__x86.get_pc_thunk.ax>
  100d9f:	05 61 22 00 00       	add    eax,0x2261
  100da4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  100da7:	66 89 45 ec          	mov    WORD PTR [ebp-0x14],ax
  100dab:	0f b7 45 ec          	movzx  eax,WORD PTR [ebp-0x14]
  100daf:	89 c2                	mov    edx,eax
  100db1:	66 ed                	in     ax,dx
  100db3:	66 89 45 fe          	mov    WORD PTR [ebp-0x2],ax
  100db7:	0f b7 45 fe          	movzx  eax,WORD PTR [ebp-0x2]
  100dbb:	c9                   	leave  
  100dbc:	c3                   	ret    

00100dbd <elf_from_multiboot>:
  100dbd:	f3 0f 1e fb          	endbr32 
  100dc1:	55                   	push   ebp
  100dc2:	89 e5                	mov    ebp,esp
  100dc4:	53                   	push   ebx
  100dc5:	83 ec 24             	sub    esp,0x24
  100dc8:	e8 37 12 00 00       	call   102004 <__x86.get_pc_thunk.bx>
  100dcd:	81 c3 33 22 00 00    	add    ebx,0x2233
  100dd3:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100dd6:	8b 40 24             	mov    eax,DWORD PTR [eax+0x24]
  100dd9:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  100ddc:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100ddf:	8b 50 28             	mov    edx,DWORD PTR [eax+0x28]
  100de2:	89 d0                	mov    eax,edx
  100de4:	c1 e0 02             	shl    eax,0x2
  100de7:	01 d0                	add    eax,edx
  100de9:	c1 e0 03             	shl    eax,0x3
  100dec:	89 c2                	mov    edx,eax
  100dee:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  100df1:	01 d0                	add    eax,edx
  100df3:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  100df6:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
  100df9:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
  100e00:	e9 bc 00 00 00       	jmp    100ec1 <elf_from_multiboot+0x104>
  100e05:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
  100e08:	89 d0                	mov    eax,edx
  100e0a:	c1 e0 02             	shl    eax,0x2
  100e0d:	01 d0                	add    eax,edx
  100e0f:	c1 e0 03             	shl    eax,0x3
  100e12:	89 c2                	mov    edx,eax
  100e14:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  100e17:	01 d0                	add    eax,edx
  100e19:	8b 10                	mov    edx,DWORD PTR [eax]
  100e1b:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  100e1e:	01 d0                	add    eax,edx
  100e20:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
  100e23:	83 ec 08             	sub    esp,0x8
  100e26:	8d 83 b0 f1 ff ff    	lea    eax,[ebx-0xe50]
  100e2c:	50                   	push   eax
  100e2d:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
  100e30:	e8 35 02 00 00       	call   10106a <strcmp>
  100e35:	83 c4 10             	add    esp,0x10
  100e38:	85 c0                	test   eax,eax
  100e3a:	75 34                	jne    100e70 <elf_from_multiboot+0xb3>
  100e3c:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
  100e3f:	89 d0                	mov    eax,edx
  100e41:	c1 e0 02             	shl    eax,0x2
  100e44:	01 d0                	add    eax,edx
  100e46:	c1 e0 03             	shl    eax,0x3
  100e49:	89 c2                	mov    edx,eax
  100e4b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  100e4e:	01 d0                	add    eax,edx
  100e50:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  100e53:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
  100e56:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
  100e59:	89 d0                	mov    eax,edx
  100e5b:	c1 e0 02             	shl    eax,0x2
  100e5e:	01 d0                	add    eax,edx
  100e60:	c1 e0 03             	shl    eax,0x3
  100e63:	89 c2                	mov    edx,eax
  100e65:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  100e68:	01 d0                	add    eax,edx
  100e6a:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
  100e6d:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
  100e70:	83 ec 08             	sub    esp,0x8
  100e73:	8d 83 b8 f1 ff ff    	lea    eax,[ebx-0xe48]
  100e79:	50                   	push   eax
  100e7a:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
  100e7d:	e8 e8 01 00 00       	call   10106a <strcmp>
  100e82:	83 c4 10             	add    esp,0x10
  100e85:	85 c0                	test   eax,eax
  100e87:	75 34                	jne    100ebd <elf_from_multiboot+0x100>
  100e89:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
  100e8c:	89 d0                	mov    eax,edx
  100e8e:	c1 e0 02             	shl    eax,0x2
  100e91:	01 d0                	add    eax,edx
  100e93:	c1 e0 03             	shl    eax,0x3
  100e96:	89 c2                	mov    edx,eax
  100e98:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  100e9b:	01 d0                	add    eax,edx
  100e9d:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  100ea0:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
  100ea3:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
  100ea6:	89 d0                	mov    eax,edx
  100ea8:	c1 e0 02             	shl    eax,0x2
  100eab:	01 d0                	add    eax,edx
  100ead:	c1 e0 03             	shl    eax,0x3
  100eb0:	89 c2                	mov    edx,eax
  100eb2:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  100eb5:	01 d0                	add    eax,edx
  100eb7:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
  100eba:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
  100ebd:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
  100ec1:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100ec4:	8b 50 1c             	mov    edx,DWORD PTR [eax+0x1c]
  100ec7:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  100eca:	39 c2                	cmp    edx,eax
  100ecc:	0f 87 33 ff ff ff    	ja     100e05 <elf_from_multiboot+0x48>
  100ed2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  100ed5:	8b 55 d8             	mov    edx,DWORD PTR [ebp-0x28]
  100ed8:	89 10                	mov    DWORD PTR [eax],edx
  100eda:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
  100edd:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
  100ee0:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
  100ee3:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
  100ee6:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
  100ee9:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
  100eec:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  100eef:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  100ef2:	c9                   	leave  
  100ef3:	c2 04 00             	ret    0x4

00100ef6 <elf_lookup_symbol>:
  100ef6:	f3 0f 1e fb          	endbr32 
  100efa:	55                   	push   ebp
  100efb:	89 e5                	mov    ebp,esp
  100efd:	53                   	push   ebx
  100efe:	83 ec 10             	sub    esp,0x10
  100f01:	e8 fa 10 00 00       	call   102000 <__x86.get_pc_thunk.ax>
  100f06:	05 fa 20 00 00       	add    eax,0x20fa
  100f0b:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
  100f12:	e9 92 00 00 00       	jmp    100fa9 <elf_lookup_symbol+0xb3>
  100f17:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100f1a:	8b 08                	mov    ecx,DWORD PTR [eax]
  100f1c:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
  100f1f:	89 d0                	mov    eax,edx
  100f21:	01 c0                	add    eax,eax
  100f23:	01 d0                	add    eax,edx
  100f25:	c1 e0 03             	shl    eax,0x3
  100f28:	01 c8                	add    eax,ecx
  100f2a:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  100f2d:	83 e0 0f             	and    eax,0xf
  100f30:	83 f8 02             	cmp    eax,0x2
  100f33:	75 6f                	jne    100fa4 <elf_lookup_symbol+0xae>
  100f35:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100f38:	8b 08                	mov    ecx,DWORD PTR [eax]
  100f3a:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
  100f3d:	89 d0                	mov    eax,edx
  100f3f:	01 c0                	add    eax,eax
  100f41:	01 d0                	add    eax,edx
  100f43:	c1 e0 03             	shl    eax,0x3
  100f46:	01 c8                	add    eax,ecx
  100f48:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  100f4b:	39 45 08             	cmp    DWORD PTR [ebp+0x8],eax
  100f4e:	72 55                	jb     100fa5 <elf_lookup_symbol+0xaf>
  100f50:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100f53:	8b 08                	mov    ecx,DWORD PTR [eax]
  100f55:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
  100f58:	89 d0                	mov    eax,edx
  100f5a:	01 c0                	add    eax,eax
  100f5c:	01 d0                	add    eax,edx
  100f5e:	c1 e0 03             	shl    eax,0x3
  100f61:	01 c8                	add    eax,ecx
  100f63:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
  100f66:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100f69:	8b 18                	mov    ebx,DWORD PTR [eax]
  100f6b:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
  100f6e:	89 d0                	mov    eax,edx
  100f70:	01 c0                	add    eax,eax
  100f72:	01 d0                	add    eax,edx
  100f74:	c1 e0 03             	shl    eax,0x3
  100f77:	01 d8                	add    eax,ebx
  100f79:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
  100f7c:	01 c8                	add    eax,ecx
  100f7e:	39 45 08             	cmp    DWORD PTR [ebp+0x8],eax
  100f81:	73 22                	jae    100fa5 <elf_lookup_symbol+0xaf>
  100f83:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100f86:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
  100f89:	89 c3                	mov    ebx,eax
  100f8b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100f8e:	8b 08                	mov    ecx,DWORD PTR [eax]
  100f90:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
  100f93:	89 d0                	mov    eax,edx
  100f95:	01 c0                	add    eax,eax
  100f97:	01 d0                	add    eax,edx
  100f99:	c1 e0 03             	shl    eax,0x3
  100f9c:	01 c8                	add    eax,ecx
  100f9e:	8b 00                	mov    eax,DWORD PTR [eax]
  100fa0:	01 d8                	add    eax,ebx
  100fa2:	eb 25                	jmp    100fc9 <elf_lookup_symbol+0xd3>
  100fa4:	90                   	nop
  100fa5:	83 45 f8 01          	add    DWORD PTR [ebp-0x8],0x1
  100fa9:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  100fac:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  100faf:	ba ab aa aa aa       	mov    edx,0xaaaaaaab
  100fb4:	f7 e2                	mul    edx
  100fb6:	c1 ea 04             	shr    edx,0x4
  100fb9:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
  100fbc:	39 c2                	cmp    edx,eax
  100fbe:	0f 87 53 ff ff ff    	ja     100f17 <elf_lookup_symbol+0x21>
  100fc4:	b8 00 00 00 00       	mov    eax,0x0
  100fc9:	83 c4 10             	add    esp,0x10
  100fcc:	5b                   	pop    ebx
  100fcd:	5d                   	pop    ebp
  100fce:	c3                   	ret    

00100fcf <memcpy>:
  100fcf:	f3 0f 1e fb          	endbr32 
  100fd3:	55                   	push   ebp
  100fd4:	89 e5                	mov    ebp,esp
  100fd6:	e8 25 10 00 00       	call   102000 <__x86.get_pc_thunk.ax>
  100fdb:	05 25 20 00 00       	add    eax,0x2025
  100fe0:	eb 1b                	jmp    100ffd <memcpy+0x2e>
  100fe2:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
  100fe5:	8d 42 01             	lea    eax,[edx+0x1]
  100fe8:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
  100feb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  100fee:	8d 48 01             	lea    ecx,[eax+0x1]
  100ff1:	89 4d 08             	mov    DWORD PTR [ebp+0x8],ecx
  100ff4:	0f b6 12             	movzx  edx,BYTE PTR [edx]
  100ff7:	88 10                	mov    BYTE PTR [eax],dl
  100ff9:	83 6d 10 01          	sub    DWORD PTR [ebp+0x10],0x1
  100ffd:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
  101001:	75 df                	jne    100fe2 <memcpy+0x13>
  101003:	90                   	nop
  101004:	90                   	nop
  101005:	5d                   	pop    ebp
  101006:	c3                   	ret    

00101007 <memset>:
  101007:	f3 0f 1e fb          	endbr32 
  10100b:	55                   	push   ebp
  10100c:	89 e5                	mov    ebp,esp
  10100e:	83 ec 14             	sub    esp,0x14
  101011:	e8 ea 0f 00 00       	call   102000 <__x86.get_pc_thunk.ax>
  101016:	05 ea 1f 00 00       	add    eax,0x1fea
  10101b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  10101e:	88 45 ec             	mov    BYTE PTR [ebp-0x14],al
  101021:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  101024:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  101027:	eb 13                	jmp    10103c <memset+0x35>
  101029:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  10102c:	8d 50 01             	lea    edx,[eax+0x1]
  10102f:	89 55 fc             	mov    DWORD PTR [ebp-0x4],edx
  101032:	0f b6 55 ec          	movzx  edx,BYTE PTR [ebp-0x14]
  101036:	88 10                	mov    BYTE PTR [eax],dl
  101038:	83 6d 10 01          	sub    DWORD PTR [ebp+0x10],0x1
  10103c:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
  101040:	75 e7                	jne    101029 <memset+0x22>
  101042:	90                   	nop
  101043:	90                   	nop
  101044:	c9                   	leave  
  101045:	c3                   	ret    

00101046 <bzero>:
  101046:	f3 0f 1e fb          	endbr32 
  10104a:	55                   	push   ebp
  10104b:	89 e5                	mov    ebp,esp
  10104d:	e8 ae 0f 00 00       	call   102000 <__x86.get_pc_thunk.ax>
  101052:	05 ae 1f 00 00       	add    eax,0x1fae
  101057:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
  10105a:	6a 00                	push   0x0
  10105c:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  10105f:	e8 a3 ff ff ff       	call   101007 <memset>
  101064:	83 c4 0c             	add    esp,0xc
  101067:	90                   	nop
  101068:	c9                   	leave  
  101069:	c3                   	ret    

0010106a <strcmp>:
  10106a:	f3 0f 1e fb          	endbr32 
  10106e:	55                   	push   ebp
  10106f:	89 e5                	mov    ebp,esp
  101071:	e8 8a 0f 00 00       	call   102000 <__x86.get_pc_thunk.ax>
  101076:	05 8a 1f 00 00       	add    eax,0x1f8a
  10107b:	eb 30                	jmp    1010ad <strcmp+0x43>
  10107d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  101080:	0f b6 10             	movzx  edx,BYTE PTR [eax]
  101083:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  101086:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  101089:	38 c2                	cmp    dl,al
  10108b:	74 18                	je     1010a5 <strcmp+0x3b>
  10108d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  101090:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  101093:	0f be d0             	movsx  edx,al
  101096:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  101099:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  10109c:	0f be c0             	movsx  eax,al
  10109f:	29 c2                	sub    edx,eax
  1010a1:	89 d0                	mov    eax,edx
  1010a3:	eb 57                	jmp    1010fc <strcmp+0x92>
  1010a5:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
  1010a9:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
  1010ad:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  1010b0:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  1010b3:	84 c0                	test   al,al
  1010b5:	74 0a                	je     1010c1 <strcmp+0x57>
  1010b7:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  1010ba:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  1010bd:	84 c0                	test   al,al
  1010bf:	75 bc                	jne    10107d <strcmp+0x13>
  1010c1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  1010c4:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  1010c7:	84 c0                	test   al,al
  1010c9:	75 11                	jne    1010dc <strcmp+0x72>
  1010cb:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  1010ce:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  1010d1:	84 c0                	test   al,al
  1010d3:	75 07                	jne    1010dc <strcmp+0x72>
  1010d5:	b8 00 00 00 00       	mov    eax,0x0
  1010da:	eb 20                	jmp    1010fc <strcmp+0x92>
  1010dc:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  1010df:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  1010e2:	84 c0                	test   al,al
  1010e4:	75 0d                	jne    1010f3 <strcmp+0x89>
  1010e6:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  1010e9:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  1010ec:	0f be c0             	movsx  eax,al
  1010ef:	f7 d8                	neg    eax
  1010f1:	eb 09                	jmp    1010fc <strcmp+0x92>
  1010f3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  1010f6:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  1010f9:	0f be c0             	movsx  eax,al
  1010fc:	5d                   	pop    ebp
  1010fd:	c3                   	ret    

001010fe <strcpy>:
  1010fe:	f3 0f 1e fb          	endbr32 
  101102:	55                   	push   ebp
  101103:	89 e5                	mov    ebp,esp
  101105:	83 ec 10             	sub    esp,0x10
  101108:	e8 f3 0e 00 00       	call   102000 <__x86.get_pc_thunk.ax>
  10110d:	05 f3 1e 00 00       	add    eax,0x1ef3
  101112:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  101115:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  101118:	eb 17                	jmp    101131 <strcpy+0x33>
  10111a:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
  10111d:	8d 42 01             	lea    eax,[edx+0x1]
  101120:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
  101123:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  101126:	8d 48 01             	lea    ecx,[eax+0x1]
  101129:	89 4d fc             	mov    DWORD PTR [ebp-0x4],ecx
  10112c:	0f b6 12             	movzx  edx,BYTE PTR [edx]
  10112f:	88 10                	mov    BYTE PTR [eax],dl
  101131:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  101134:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  101137:	84 c0                	test   al,al
  101139:	75 df                	jne    10111a <strcpy+0x1c>
  10113b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  10113e:	c9                   	leave  
  10113f:	c3                   	ret    

00101140 <strcat>:
  101140:	f3 0f 1e fb          	endbr32 
  101144:	55                   	push   ebp
  101145:	89 e5                	mov    ebp,esp
  101147:	83 ec 10             	sub    esp,0x10
  10114a:	e8 b1 0e 00 00       	call   102000 <__x86.get_pc_thunk.ax>
  10114f:	05 b1 1e 00 00       	add    eax,0x1eb1
  101154:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  101157:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  10115a:	eb 04                	jmp    101160 <strcat+0x20>
  10115c:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
  101160:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  101163:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  101166:	84 c0                	test   al,al
  101168:	75 f2                	jne    10115c <strcat+0x1c>
  10116a:	eb 17                	jmp    101183 <strcat+0x43>
  10116c:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
  10116f:	8d 42 01             	lea    eax,[edx+0x1]
  101172:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
  101175:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  101178:	8d 48 01             	lea    ecx,[eax+0x1]
  10117b:	89 4d fc             	mov    DWORD PTR [ebp-0x4],ecx
  10117e:	0f b6 12             	movzx  edx,BYTE PTR [edx]
  101181:	88 10                	mov    BYTE PTR [eax],dl
  101183:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  101186:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  101189:	84 c0                	test   al,al
  10118b:	75 df                	jne    10116c <strcat+0x2c>
  10118d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  101190:	c9                   	leave  
  101191:	c3                   	ret    

00101192 <strlen>:
  101192:	f3 0f 1e fb          	endbr32 
  101196:	55                   	push   ebp
  101197:	89 e5                	mov    ebp,esp
  101199:	83 ec 10             	sub    esp,0x10
  10119c:	e8 5f 0e 00 00       	call   102000 <__x86.get_pc_thunk.ax>
  1011a1:	05 5f 1e 00 00       	add    eax,0x1e5f
  1011a6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  1011ad:	eb 04                	jmp    1011b3 <strlen+0x21>
  1011af:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
  1011b3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  1011b6:	8d 50 01             	lea    edx,[eax+0x1]
  1011b9:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
  1011bc:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  1011bf:	84 c0                	test   al,al
  1011c1:	75 ec                	jne    1011af <strlen+0x1d>
  1011c3:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  1011c6:	c9                   	leave  
  1011c7:	c3                   	ret    
  1011c8:	66 90                	xchg   ax,ax
  1011ca:	66 90                	xchg   ax,ax
  1011cc:	66 90                	xchg   ax,ax
  1011ce:	66 90                	xchg   ax,ax
  1011d0:	66 90                	xchg   ax,ax
  1011d2:	66 90                	xchg   ax,ax
  1011d4:	66 90                	xchg   ax,ax
  1011d6:	66 90                	xchg   ax,ax
  1011d8:	66 90                	xchg   ax,ax
  1011da:	66 90                	xchg   ax,ax
  1011dc:	66 90                	xchg   ax,ax
  1011de:	66 90                	xchg   ax,ax
  1011e0:	66 90                	xchg   ax,ax
  1011e2:	66 90                	xchg   ax,ax
  1011e4:	66 90                	xchg   ax,ax
  1011e6:	66 90                	xchg   ax,ax
  1011e8:	66 90                	xchg   ax,ax
  1011ea:	66 90                	xchg   ax,ax
  1011ec:	66 90                	xchg   ax,ax
  1011ee:	66 90                	xchg   ax,ax
  1011f0:	66 90                	xchg   ax,ax
  1011f2:	66 90                	xchg   ax,ax
  1011f4:	66 90                	xchg   ax,ax
  1011f6:	66 90                	xchg   ax,ax
  1011f8:	66 90                	xchg   ax,ax
  1011fa:	66 90                	xchg   ax,ax
  1011fc:	66 90                	xchg   ax,ax
  1011fe:	66 90                	xchg   ax,ax
  101200:	66 90                	xchg   ax,ax
  101202:	66 90                	xchg   ax,ax
  101204:	66 90                	xchg   ax,ax
  101206:	66 90                	xchg   ax,ax
  101208:	66 90                	xchg   ax,ax
  10120a:	66 90                	xchg   ax,ax
  10120c:	66 90                	xchg   ax,ax
  10120e:	66 90                	xchg   ax,ax
  101210:	66 90                	xchg   ax,ax
  101212:	66 90                	xchg   ax,ax
  101214:	66 90                	xchg   ax,ax
  101216:	66 90                	xchg   ax,ax
  101218:	66 90                	xchg   ax,ax
  10121a:	66 90                	xchg   ax,ax
  10121c:	66 90                	xchg   ax,ax
  10121e:	66 90                	xchg   ax,ax
  101220:	66 90                	xchg   ax,ax
  101222:	66 90                	xchg   ax,ax
  101224:	66 90                	xchg   ax,ax
  101226:	66 90                	xchg   ax,ax
  101228:	66 90                	xchg   ax,ax
  10122a:	66 90                	xchg   ax,ax
  10122c:	66 90                	xchg   ax,ax
  10122e:	66 90                	xchg   ax,ax
  101230:	66 90                	xchg   ax,ax
  101232:	66 90                	xchg   ax,ax
  101234:	66 90                	xchg   ax,ax
  101236:	66 90                	xchg   ax,ax
  101238:	66 90                	xchg   ax,ax
  10123a:	66 90                	xchg   ax,ax
  10123c:	66 90                	xchg   ax,ax
  10123e:	66 90                	xchg   ax,ax
  101240:	66 90                	xchg   ax,ax
  101242:	66 90                	xchg   ax,ax
  101244:	66 90                	xchg   ax,ax
  101246:	66 90                	xchg   ax,ax
  101248:	66 90                	xchg   ax,ax
  10124a:	66 90                	xchg   ax,ax
  10124c:	66 90                	xchg   ax,ax
  10124e:	66 90                	xchg   ax,ax
  101250:	66 90                	xchg   ax,ax
  101252:	66 90                	xchg   ax,ax
  101254:	66 90                	xchg   ax,ax
  101256:	66 90                	xchg   ax,ax
  101258:	66 90                	xchg   ax,ax
  10125a:	66 90                	xchg   ax,ax
  10125c:	66 90                	xchg   ax,ax
  10125e:	66 90                	xchg   ax,ax
  101260:	66 90                	xchg   ax,ax
  101262:	66 90                	xchg   ax,ax
  101264:	66 90                	xchg   ax,ax
  101266:	66 90                	xchg   ax,ax
  101268:	66 90                	xchg   ax,ax
  10126a:	66 90                	xchg   ax,ax
  10126c:	66 90                	xchg   ax,ax
  10126e:	66 90                	xchg   ax,ax
  101270:	66 90                	xchg   ax,ax
  101272:	66 90                	xchg   ax,ax
  101274:	66 90                	xchg   ax,ax
  101276:	66 90                	xchg   ax,ax
  101278:	66 90                	xchg   ax,ax
  10127a:	66 90                	xchg   ax,ax
  10127c:	66 90                	xchg   ax,ax
  10127e:	66 90                	xchg   ax,ax
  101280:	66 90                	xchg   ax,ax
  101282:	66 90                	xchg   ax,ax
  101284:	66 90                	xchg   ax,ax
  101286:	66 90                	xchg   ax,ax
  101288:	66 90                	xchg   ax,ax
  10128a:	66 90                	xchg   ax,ax
  10128c:	66 90                	xchg   ax,ax
  10128e:	66 90                	xchg   ax,ax
  101290:	66 90                	xchg   ax,ax
  101292:	66 90                	xchg   ax,ax
  101294:	66 90                	xchg   ax,ax
  101296:	66 90                	xchg   ax,ax
  101298:	66 90                	xchg   ax,ax
  10129a:	66 90                	xchg   ax,ax
  10129c:	66 90                	xchg   ax,ax
  10129e:	66 90                	xchg   ax,ax
  1012a0:	66 90                	xchg   ax,ax
  1012a2:	66 90                	xchg   ax,ax
  1012a4:	66 90                	xchg   ax,ax
  1012a6:	66 90                	xchg   ax,ax
  1012a8:	66 90                	xchg   ax,ax
  1012aa:	66 90                	xchg   ax,ax
  1012ac:	66 90                	xchg   ax,ax
  1012ae:	66 90                	xchg   ax,ax
  1012b0:	66 90                	xchg   ax,ax
  1012b2:	66 90                	xchg   ax,ax
  1012b4:	66 90                	xchg   ax,ax
  1012b6:	66 90                	xchg   ax,ax
  1012b8:	66 90                	xchg   ax,ax
  1012ba:	66 90                	xchg   ax,ax
  1012bc:	66 90                	xchg   ax,ax
  1012be:	66 90                	xchg   ax,ax
  1012c0:	66 90                	xchg   ax,ax
  1012c2:	66 90                	xchg   ax,ax
  1012c4:	66 90                	xchg   ax,ax
  1012c6:	66 90                	xchg   ax,ax
  1012c8:	66 90                	xchg   ax,ax
  1012ca:	66 90                	xchg   ax,ax
  1012cc:	66 90                	xchg   ax,ax
  1012ce:	66 90                	xchg   ax,ax
  1012d0:	66 90                	xchg   ax,ax
  1012d2:	66 90                	xchg   ax,ax
  1012d4:	66 90                	xchg   ax,ax
  1012d6:	66 90                	xchg   ax,ax
  1012d8:	66 90                	xchg   ax,ax
  1012da:	66 90                	xchg   ax,ax
  1012dc:	66 90                	xchg   ax,ax
  1012de:	66 90                	xchg   ax,ax
  1012e0:	66 90                	xchg   ax,ax
  1012e2:	66 90                	xchg   ax,ax
  1012e4:	66 90                	xchg   ax,ax
  1012e6:	66 90                	xchg   ax,ax
  1012e8:	66 90                	xchg   ax,ax
  1012ea:	66 90                	xchg   ax,ax
  1012ec:	66 90                	xchg   ax,ax
  1012ee:	66 90                	xchg   ax,ax
  1012f0:	66 90                	xchg   ax,ax
  1012f2:	66 90                	xchg   ax,ax
  1012f4:	66 90                	xchg   ax,ax
  1012f6:	66 90                	xchg   ax,ax
  1012f8:	66 90                	xchg   ax,ax
  1012fa:	66 90                	xchg   ax,ax
  1012fc:	66 90                	xchg   ax,ax
  1012fe:	66 90                	xchg   ax,ax
  101300:	66 90                	xchg   ax,ax
  101302:	66 90                	xchg   ax,ax
  101304:	66 90                	xchg   ax,ax
  101306:	66 90                	xchg   ax,ax
  101308:	66 90                	xchg   ax,ax
  10130a:	66 90                	xchg   ax,ax
  10130c:	66 90                	xchg   ax,ax
  10130e:	66 90                	xchg   ax,ax
  101310:	66 90                	xchg   ax,ax
  101312:	66 90                	xchg   ax,ax
  101314:	66 90                	xchg   ax,ax
  101316:	66 90                	xchg   ax,ax
  101318:	66 90                	xchg   ax,ax
  10131a:	66 90                	xchg   ax,ax
  10131c:	66 90                	xchg   ax,ax
  10131e:	66 90                	xchg   ax,ax
  101320:	66 90                	xchg   ax,ax
  101322:	66 90                	xchg   ax,ax
  101324:	66 90                	xchg   ax,ax
  101326:	66 90                	xchg   ax,ax
  101328:	66 90                	xchg   ax,ax
  10132a:	66 90                	xchg   ax,ax
  10132c:	66 90                	xchg   ax,ax
  10132e:	66 90                	xchg   ax,ax
  101330:	66 90                	xchg   ax,ax
  101332:	66 90                	xchg   ax,ax
  101334:	66 90                	xchg   ax,ax
  101336:	66 90                	xchg   ax,ax
  101338:	66 90                	xchg   ax,ax
  10133a:	66 90                	xchg   ax,ax
  10133c:	66 90                	xchg   ax,ax
  10133e:	66 90                	xchg   ax,ax
  101340:	66 90                	xchg   ax,ax
  101342:	66 90                	xchg   ax,ax
  101344:	66 90                	xchg   ax,ax
  101346:	66 90                	xchg   ax,ax
  101348:	66 90                	xchg   ax,ax
  10134a:	66 90                	xchg   ax,ax
  10134c:	66 90                	xchg   ax,ax
  10134e:	66 90                	xchg   ax,ax
  101350:	66 90                	xchg   ax,ax
  101352:	66 90                	xchg   ax,ax
  101354:	66 90                	xchg   ax,ax
  101356:	66 90                	xchg   ax,ax
  101358:	66 90                	xchg   ax,ax
  10135a:	66 90                	xchg   ax,ax
  10135c:	66 90                	xchg   ax,ax
  10135e:	66 90                	xchg   ax,ax
  101360:	66 90                	xchg   ax,ax
  101362:	66 90                	xchg   ax,ax
  101364:	66 90                	xchg   ax,ax
  101366:	66 90                	xchg   ax,ax
  101368:	66 90                	xchg   ax,ax
  10136a:	66 90                	xchg   ax,ax
  10136c:	66 90                	xchg   ax,ax
  10136e:	66 90                	xchg   ax,ax
  101370:	66 90                	xchg   ax,ax
  101372:	66 90                	xchg   ax,ax
  101374:	66 90                	xchg   ax,ax
  101376:	66 90                	xchg   ax,ax
  101378:	66 90                	xchg   ax,ax
  10137a:	66 90                	xchg   ax,ax
  10137c:	66 90                	xchg   ax,ax
  10137e:	66 90                	xchg   ax,ax
  101380:	66 90                	xchg   ax,ax
  101382:	66 90                	xchg   ax,ax
  101384:	66 90                	xchg   ax,ax
  101386:	66 90                	xchg   ax,ax
  101388:	66 90                	xchg   ax,ax
  10138a:	66 90                	xchg   ax,ax
  10138c:	66 90                	xchg   ax,ax
  10138e:	66 90                	xchg   ax,ax
  101390:	66 90                	xchg   ax,ax
  101392:	66 90                	xchg   ax,ax
  101394:	66 90                	xchg   ax,ax
  101396:	66 90                	xchg   ax,ax
  101398:	66 90                	xchg   ax,ax
  10139a:	66 90                	xchg   ax,ax
  10139c:	66 90                	xchg   ax,ax
  10139e:	66 90                	xchg   ax,ax
  1013a0:	66 90                	xchg   ax,ax
  1013a2:	66 90                	xchg   ax,ax
  1013a4:	66 90                	xchg   ax,ax
  1013a6:	66 90                	xchg   ax,ax
  1013a8:	66 90                	xchg   ax,ax
  1013aa:	66 90                	xchg   ax,ax
  1013ac:	66 90                	xchg   ax,ax
  1013ae:	66 90                	xchg   ax,ax
  1013b0:	66 90                	xchg   ax,ax
  1013b2:	66 90                	xchg   ax,ax
  1013b4:	66 90                	xchg   ax,ax
  1013b6:	66 90                	xchg   ax,ax
  1013b8:	66 90                	xchg   ax,ax
  1013ba:	66 90                	xchg   ax,ax
  1013bc:	66 90                	xchg   ax,ax
  1013be:	66 90                	xchg   ax,ax
  1013c0:	66 90                	xchg   ax,ax
  1013c2:	66 90                	xchg   ax,ax
  1013c4:	66 90                	xchg   ax,ax
  1013c6:	66 90                	xchg   ax,ax
  1013c8:	66 90                	xchg   ax,ax
  1013ca:	66 90                	xchg   ax,ax
  1013cc:	66 90                	xchg   ax,ax
  1013ce:	66 90                	xchg   ax,ax
  1013d0:	66 90                	xchg   ax,ax
  1013d2:	66 90                	xchg   ax,ax
  1013d4:	66 90                	xchg   ax,ax
  1013d6:	66 90                	xchg   ax,ax
  1013d8:	66 90                	xchg   ax,ax
  1013da:	66 90                	xchg   ax,ax
  1013dc:	66 90                	xchg   ax,ax
  1013de:	66 90                	xchg   ax,ax
  1013e0:	66 90                	xchg   ax,ax
  1013e2:	66 90                	xchg   ax,ax
  1013e4:	66 90                	xchg   ax,ax
  1013e6:	66 90                	xchg   ax,ax
  1013e8:	66 90                	xchg   ax,ax
  1013ea:	66 90                	xchg   ax,ax
  1013ec:	66 90                	xchg   ax,ax
  1013ee:	66 90                	xchg   ax,ax
  1013f0:	66 90                	xchg   ax,ax
  1013f2:	66 90                	xchg   ax,ax
  1013f4:	66 90                	xchg   ax,ax
  1013f6:	66 90                	xchg   ax,ax
  1013f8:	66 90                	xchg   ax,ax
  1013fa:	66 90                	xchg   ax,ax
  1013fc:	66 90                	xchg   ax,ax
  1013fe:	66 90                	xchg   ax,ax
  101400:	66 90                	xchg   ax,ax
  101402:	66 90                	xchg   ax,ax
  101404:	66 90                	xchg   ax,ax
  101406:	66 90                	xchg   ax,ax
  101408:	66 90                	xchg   ax,ax
  10140a:	66 90                	xchg   ax,ax
  10140c:	66 90                	xchg   ax,ax
  10140e:	66 90                	xchg   ax,ax
  101410:	66 90                	xchg   ax,ax
  101412:	66 90                	xchg   ax,ax
  101414:	66 90                	xchg   ax,ax
  101416:	66 90                	xchg   ax,ax
  101418:	66 90                	xchg   ax,ax
  10141a:	66 90                	xchg   ax,ax
  10141c:	66 90                	xchg   ax,ax
  10141e:	66 90                	xchg   ax,ax
  101420:	66 90                	xchg   ax,ax
  101422:	66 90                	xchg   ax,ax
  101424:	66 90                	xchg   ax,ax
  101426:	66 90                	xchg   ax,ax
  101428:	66 90                	xchg   ax,ax
  10142a:	66 90                	xchg   ax,ax
  10142c:	66 90                	xchg   ax,ax
  10142e:	66 90                	xchg   ax,ax
  101430:	66 90                	xchg   ax,ax
  101432:	66 90                	xchg   ax,ax
  101434:	66 90                	xchg   ax,ax
  101436:	66 90                	xchg   ax,ax
  101438:	66 90                	xchg   ax,ax
  10143a:	66 90                	xchg   ax,ax
  10143c:	66 90                	xchg   ax,ax
  10143e:	66 90                	xchg   ax,ax
  101440:	66 90                	xchg   ax,ax
  101442:	66 90                	xchg   ax,ax
  101444:	66 90                	xchg   ax,ax
  101446:	66 90                	xchg   ax,ax
  101448:	66 90                	xchg   ax,ax
  10144a:	66 90                	xchg   ax,ax
  10144c:	66 90                	xchg   ax,ax
  10144e:	66 90                	xchg   ax,ax
  101450:	66 90                	xchg   ax,ax
  101452:	66 90                	xchg   ax,ax
  101454:	66 90                	xchg   ax,ax
  101456:	66 90                	xchg   ax,ax
  101458:	66 90                	xchg   ax,ax
  10145a:	66 90                	xchg   ax,ax
  10145c:	66 90                	xchg   ax,ax
  10145e:	66 90                	xchg   ax,ax
  101460:	66 90                	xchg   ax,ax
  101462:	66 90                	xchg   ax,ax
  101464:	66 90                	xchg   ax,ax
  101466:	66 90                	xchg   ax,ax
  101468:	66 90                	xchg   ax,ax
  10146a:	66 90                	xchg   ax,ax
  10146c:	66 90                	xchg   ax,ax
  10146e:	66 90                	xchg   ax,ax
  101470:	66 90                	xchg   ax,ax
  101472:	66 90                	xchg   ax,ax
  101474:	66 90                	xchg   ax,ax
  101476:	66 90                	xchg   ax,ax
  101478:	66 90                	xchg   ax,ax
  10147a:	66 90                	xchg   ax,ax
  10147c:	66 90                	xchg   ax,ax
  10147e:	66 90                	xchg   ax,ax
  101480:	66 90                	xchg   ax,ax
  101482:	66 90                	xchg   ax,ax
  101484:	66 90                	xchg   ax,ax
  101486:	66 90                	xchg   ax,ax
  101488:	66 90                	xchg   ax,ax
  10148a:	66 90                	xchg   ax,ax
  10148c:	66 90                	xchg   ax,ax
  10148e:	66 90                	xchg   ax,ax
  101490:	66 90                	xchg   ax,ax
  101492:	66 90                	xchg   ax,ax
  101494:	66 90                	xchg   ax,ax
  101496:	66 90                	xchg   ax,ax
  101498:	66 90                	xchg   ax,ax
  10149a:	66 90                	xchg   ax,ax
  10149c:	66 90                	xchg   ax,ax
  10149e:	66 90                	xchg   ax,ax
  1014a0:	66 90                	xchg   ax,ax
  1014a2:	66 90                	xchg   ax,ax
  1014a4:	66 90                	xchg   ax,ax
  1014a6:	66 90                	xchg   ax,ax
  1014a8:	66 90                	xchg   ax,ax
  1014aa:	66 90                	xchg   ax,ax
  1014ac:	66 90                	xchg   ax,ax
  1014ae:	66 90                	xchg   ax,ax
  1014b0:	66 90                	xchg   ax,ax
  1014b2:	66 90                	xchg   ax,ax
  1014b4:	66 90                	xchg   ax,ax
  1014b6:	66 90                	xchg   ax,ax
  1014b8:	66 90                	xchg   ax,ax
  1014ba:	66 90                	xchg   ax,ax
  1014bc:	66 90                	xchg   ax,ax
  1014be:	66 90                	xchg   ax,ax
  1014c0:	66 90                	xchg   ax,ax
  1014c2:	66 90                	xchg   ax,ax
  1014c4:	66 90                	xchg   ax,ax
  1014c6:	66 90                	xchg   ax,ax
  1014c8:	66 90                	xchg   ax,ax
  1014ca:	66 90                	xchg   ax,ax
  1014cc:	66 90                	xchg   ax,ax
  1014ce:	66 90                	xchg   ax,ax
  1014d0:	66 90                	xchg   ax,ax
  1014d2:	66 90                	xchg   ax,ax
  1014d4:	66 90                	xchg   ax,ax
  1014d6:	66 90                	xchg   ax,ax
  1014d8:	66 90                	xchg   ax,ax
  1014da:	66 90                	xchg   ax,ax
  1014dc:	66 90                	xchg   ax,ax
  1014de:	66 90                	xchg   ax,ax
  1014e0:	66 90                	xchg   ax,ax
  1014e2:	66 90                	xchg   ax,ax
  1014e4:	66 90                	xchg   ax,ax
  1014e6:	66 90                	xchg   ax,ax
  1014e8:	66 90                	xchg   ax,ax
  1014ea:	66 90                	xchg   ax,ax
  1014ec:	66 90                	xchg   ax,ax
  1014ee:	66 90                	xchg   ax,ax
  1014f0:	66 90                	xchg   ax,ax
  1014f2:	66 90                	xchg   ax,ax
  1014f4:	66 90                	xchg   ax,ax
  1014f6:	66 90                	xchg   ax,ax
  1014f8:	66 90                	xchg   ax,ax
  1014fa:	66 90                	xchg   ax,ax
  1014fc:	66 90                	xchg   ax,ax
  1014fe:	66 90                	xchg   ax,ax
  101500:	66 90                	xchg   ax,ax
  101502:	66 90                	xchg   ax,ax
  101504:	66 90                	xchg   ax,ax
  101506:	66 90                	xchg   ax,ax
  101508:	66 90                	xchg   ax,ax
  10150a:	66 90                	xchg   ax,ax
  10150c:	66 90                	xchg   ax,ax
  10150e:	66 90                	xchg   ax,ax
  101510:	66 90                	xchg   ax,ax
  101512:	66 90                	xchg   ax,ax
  101514:	66 90                	xchg   ax,ax
  101516:	66 90                	xchg   ax,ax
  101518:	66 90                	xchg   ax,ax
  10151a:	66 90                	xchg   ax,ax
  10151c:	66 90                	xchg   ax,ax
  10151e:	66 90                	xchg   ax,ax
  101520:	66 90                	xchg   ax,ax
  101522:	66 90                	xchg   ax,ax
  101524:	66 90                	xchg   ax,ax
  101526:	66 90                	xchg   ax,ax
  101528:	66 90                	xchg   ax,ax
  10152a:	66 90                	xchg   ax,ax
  10152c:	66 90                	xchg   ax,ax
  10152e:	66 90                	xchg   ax,ax
  101530:	66 90                	xchg   ax,ax
  101532:	66 90                	xchg   ax,ax
  101534:	66 90                	xchg   ax,ax
  101536:	66 90                	xchg   ax,ax
  101538:	66 90                	xchg   ax,ax
  10153a:	66 90                	xchg   ax,ax
  10153c:	66 90                	xchg   ax,ax
  10153e:	66 90                	xchg   ax,ax
  101540:	66 90                	xchg   ax,ax
  101542:	66 90                	xchg   ax,ax
  101544:	66 90                	xchg   ax,ax
  101546:	66 90                	xchg   ax,ax
  101548:	66 90                	xchg   ax,ax
  10154a:	66 90                	xchg   ax,ax
  10154c:	66 90                	xchg   ax,ax
  10154e:	66 90                	xchg   ax,ax
  101550:	66 90                	xchg   ax,ax
  101552:	66 90                	xchg   ax,ax
  101554:	66 90                	xchg   ax,ax
  101556:	66 90                	xchg   ax,ax
  101558:	66 90                	xchg   ax,ax
  10155a:	66 90                	xchg   ax,ax
  10155c:	66 90                	xchg   ax,ax
  10155e:	66 90                	xchg   ax,ax
  101560:	66 90                	xchg   ax,ax
  101562:	66 90                	xchg   ax,ax
  101564:	66 90                	xchg   ax,ax
  101566:	66 90                	xchg   ax,ax
  101568:	66 90                	xchg   ax,ax
  10156a:	66 90                	xchg   ax,ax
  10156c:	66 90                	xchg   ax,ax
  10156e:	66 90                	xchg   ax,ax
  101570:	66 90                	xchg   ax,ax
  101572:	66 90                	xchg   ax,ax
  101574:	66 90                	xchg   ax,ax
  101576:	66 90                	xchg   ax,ax
  101578:	66 90                	xchg   ax,ax
  10157a:	66 90                	xchg   ax,ax
  10157c:	66 90                	xchg   ax,ax
  10157e:	66 90                	xchg   ax,ax
  101580:	66 90                	xchg   ax,ax
  101582:	66 90                	xchg   ax,ax
  101584:	66 90                	xchg   ax,ax
  101586:	66 90                	xchg   ax,ax
  101588:	66 90                	xchg   ax,ax
  10158a:	66 90                	xchg   ax,ax
  10158c:	66 90                	xchg   ax,ax
  10158e:	66 90                	xchg   ax,ax
  101590:	66 90                	xchg   ax,ax
  101592:	66 90                	xchg   ax,ax
  101594:	66 90                	xchg   ax,ax
  101596:	66 90                	xchg   ax,ax
  101598:	66 90                	xchg   ax,ax
  10159a:	66 90                	xchg   ax,ax
  10159c:	66 90                	xchg   ax,ax
  10159e:	66 90                	xchg   ax,ax
  1015a0:	66 90                	xchg   ax,ax
  1015a2:	66 90                	xchg   ax,ax
  1015a4:	66 90                	xchg   ax,ax
  1015a6:	66 90                	xchg   ax,ax
  1015a8:	66 90                	xchg   ax,ax
  1015aa:	66 90                	xchg   ax,ax
  1015ac:	66 90                	xchg   ax,ax
  1015ae:	66 90                	xchg   ax,ax
  1015b0:	66 90                	xchg   ax,ax
  1015b2:	66 90                	xchg   ax,ax
  1015b4:	66 90                	xchg   ax,ax
  1015b6:	66 90                	xchg   ax,ax
  1015b8:	66 90                	xchg   ax,ax
  1015ba:	66 90                	xchg   ax,ax
  1015bc:	66 90                	xchg   ax,ax
  1015be:	66 90                	xchg   ax,ax
  1015c0:	66 90                	xchg   ax,ax
  1015c2:	66 90                	xchg   ax,ax
  1015c4:	66 90                	xchg   ax,ax
  1015c6:	66 90                	xchg   ax,ax
  1015c8:	66 90                	xchg   ax,ax
  1015ca:	66 90                	xchg   ax,ax
  1015cc:	66 90                	xchg   ax,ax
  1015ce:	66 90                	xchg   ax,ax
  1015d0:	66 90                	xchg   ax,ax
  1015d2:	66 90                	xchg   ax,ax
  1015d4:	66 90                	xchg   ax,ax
  1015d6:	66 90                	xchg   ax,ax
  1015d8:	66 90                	xchg   ax,ax
  1015da:	66 90                	xchg   ax,ax
  1015dc:	66 90                	xchg   ax,ax
  1015de:	66 90                	xchg   ax,ax
  1015e0:	66 90                	xchg   ax,ax
  1015e2:	66 90                	xchg   ax,ax
  1015e4:	66 90                	xchg   ax,ax
  1015e6:	66 90                	xchg   ax,ax
  1015e8:	66 90                	xchg   ax,ax
  1015ea:	66 90                	xchg   ax,ax
  1015ec:	66 90                	xchg   ax,ax
  1015ee:	66 90                	xchg   ax,ax
  1015f0:	66 90                	xchg   ax,ax
  1015f2:	66 90                	xchg   ax,ax
  1015f4:	66 90                	xchg   ax,ax
  1015f6:	66 90                	xchg   ax,ax
  1015f8:	66 90                	xchg   ax,ax
  1015fa:	66 90                	xchg   ax,ax
  1015fc:	66 90                	xchg   ax,ax
  1015fe:	66 90                	xchg   ax,ax
  101600:	66 90                	xchg   ax,ax
  101602:	66 90                	xchg   ax,ax
  101604:	66 90                	xchg   ax,ax
  101606:	66 90                	xchg   ax,ax
  101608:	66 90                	xchg   ax,ax
  10160a:	66 90                	xchg   ax,ax
  10160c:	66 90                	xchg   ax,ax
  10160e:	66 90                	xchg   ax,ax
  101610:	66 90                	xchg   ax,ax
  101612:	66 90                	xchg   ax,ax
  101614:	66 90                	xchg   ax,ax
  101616:	66 90                	xchg   ax,ax
  101618:	66 90                	xchg   ax,ax
  10161a:	66 90                	xchg   ax,ax
  10161c:	66 90                	xchg   ax,ax
  10161e:	66 90                	xchg   ax,ax
  101620:	66 90                	xchg   ax,ax
  101622:	66 90                	xchg   ax,ax
  101624:	66 90                	xchg   ax,ax
  101626:	66 90                	xchg   ax,ax
  101628:	66 90                	xchg   ax,ax
  10162a:	66 90                	xchg   ax,ax
  10162c:	66 90                	xchg   ax,ax
  10162e:	66 90                	xchg   ax,ax
  101630:	66 90                	xchg   ax,ax
  101632:	66 90                	xchg   ax,ax
  101634:	66 90                	xchg   ax,ax
  101636:	66 90                	xchg   ax,ax
  101638:	66 90                	xchg   ax,ax
  10163a:	66 90                	xchg   ax,ax
  10163c:	66 90                	xchg   ax,ax
  10163e:	66 90                	xchg   ax,ax
  101640:	66 90                	xchg   ax,ax
  101642:	66 90                	xchg   ax,ax
  101644:	66 90                	xchg   ax,ax
  101646:	66 90                	xchg   ax,ax
  101648:	66 90                	xchg   ax,ax
  10164a:	66 90                	xchg   ax,ax
  10164c:	66 90                	xchg   ax,ax
  10164e:	66 90                	xchg   ax,ax
  101650:	66 90                	xchg   ax,ax
  101652:	66 90                	xchg   ax,ax
  101654:	66 90                	xchg   ax,ax
  101656:	66 90                	xchg   ax,ax
  101658:	66 90                	xchg   ax,ax
  10165a:	66 90                	xchg   ax,ax
  10165c:	66 90                	xchg   ax,ax
  10165e:	66 90                	xchg   ax,ax
  101660:	66 90                	xchg   ax,ax
  101662:	66 90                	xchg   ax,ax
  101664:	66 90                	xchg   ax,ax
  101666:	66 90                	xchg   ax,ax
  101668:	66 90                	xchg   ax,ax
  10166a:	66 90                	xchg   ax,ax
  10166c:	66 90                	xchg   ax,ax
  10166e:	66 90                	xchg   ax,ax
  101670:	66 90                	xchg   ax,ax
  101672:	66 90                	xchg   ax,ax
  101674:	66 90                	xchg   ax,ax
  101676:	66 90                	xchg   ax,ax
  101678:	66 90                	xchg   ax,ax
  10167a:	66 90                	xchg   ax,ax
  10167c:	66 90                	xchg   ax,ax
  10167e:	66 90                	xchg   ax,ax
  101680:	66 90                	xchg   ax,ax
  101682:	66 90                	xchg   ax,ax
  101684:	66 90                	xchg   ax,ax
  101686:	66 90                	xchg   ax,ax
  101688:	66 90                	xchg   ax,ax
  10168a:	66 90                	xchg   ax,ax
  10168c:	66 90                	xchg   ax,ax
  10168e:	66 90                	xchg   ax,ax
  101690:	66 90                	xchg   ax,ax
  101692:	66 90                	xchg   ax,ax
  101694:	66 90                	xchg   ax,ax
  101696:	66 90                	xchg   ax,ax
  101698:	66 90                	xchg   ax,ax
  10169a:	66 90                	xchg   ax,ax
  10169c:	66 90                	xchg   ax,ax
  10169e:	66 90                	xchg   ax,ax
  1016a0:	66 90                	xchg   ax,ax
  1016a2:	66 90                	xchg   ax,ax
  1016a4:	66 90                	xchg   ax,ax
  1016a6:	66 90                	xchg   ax,ax
  1016a8:	66 90                	xchg   ax,ax
  1016aa:	66 90                	xchg   ax,ax
  1016ac:	66 90                	xchg   ax,ax
  1016ae:	66 90                	xchg   ax,ax
  1016b0:	66 90                	xchg   ax,ax
  1016b2:	66 90                	xchg   ax,ax
  1016b4:	66 90                	xchg   ax,ax
  1016b6:	66 90                	xchg   ax,ax
  1016b8:	66 90                	xchg   ax,ax
  1016ba:	66 90                	xchg   ax,ax
  1016bc:	66 90                	xchg   ax,ax
  1016be:	66 90                	xchg   ax,ax
  1016c0:	66 90                	xchg   ax,ax
  1016c2:	66 90                	xchg   ax,ax
  1016c4:	66 90                	xchg   ax,ax
  1016c6:	66 90                	xchg   ax,ax
  1016c8:	66 90                	xchg   ax,ax
  1016ca:	66 90                	xchg   ax,ax
  1016cc:	66 90                	xchg   ax,ax
  1016ce:	66 90                	xchg   ax,ax
  1016d0:	66 90                	xchg   ax,ax
  1016d2:	66 90                	xchg   ax,ax
  1016d4:	66 90                	xchg   ax,ax
  1016d6:	66 90                	xchg   ax,ax
  1016d8:	66 90                	xchg   ax,ax
  1016da:	66 90                	xchg   ax,ax
  1016dc:	66 90                	xchg   ax,ax
  1016de:	66 90                	xchg   ax,ax
  1016e0:	66 90                	xchg   ax,ax
  1016e2:	66 90                	xchg   ax,ax
  1016e4:	66 90                	xchg   ax,ax
  1016e6:	66 90                	xchg   ax,ax
  1016e8:	66 90                	xchg   ax,ax
  1016ea:	66 90                	xchg   ax,ax
  1016ec:	66 90                	xchg   ax,ax
  1016ee:	66 90                	xchg   ax,ax
  1016f0:	66 90                	xchg   ax,ax
  1016f2:	66 90                	xchg   ax,ax
  1016f4:	66 90                	xchg   ax,ax
  1016f6:	66 90                	xchg   ax,ax
  1016f8:	66 90                	xchg   ax,ax
  1016fa:	66 90                	xchg   ax,ax
  1016fc:	66 90                	xchg   ax,ax
  1016fe:	66 90                	xchg   ax,ax
  101700:	66 90                	xchg   ax,ax
  101702:	66 90                	xchg   ax,ax
  101704:	66 90                	xchg   ax,ax
  101706:	66 90                	xchg   ax,ax
  101708:	66 90                	xchg   ax,ax
  10170a:	66 90                	xchg   ax,ax
  10170c:	66 90                	xchg   ax,ax
  10170e:	66 90                	xchg   ax,ax
  101710:	66 90                	xchg   ax,ax
  101712:	66 90                	xchg   ax,ax
  101714:	66 90                	xchg   ax,ax
  101716:	66 90                	xchg   ax,ax
  101718:	66 90                	xchg   ax,ax
  10171a:	66 90                	xchg   ax,ax
  10171c:	66 90                	xchg   ax,ax
  10171e:	66 90                	xchg   ax,ax
  101720:	66 90                	xchg   ax,ax
  101722:	66 90                	xchg   ax,ax
  101724:	66 90                	xchg   ax,ax
  101726:	66 90                	xchg   ax,ax
  101728:	66 90                	xchg   ax,ax
  10172a:	66 90                	xchg   ax,ax
  10172c:	66 90                	xchg   ax,ax
  10172e:	66 90                	xchg   ax,ax
  101730:	66 90                	xchg   ax,ax
  101732:	66 90                	xchg   ax,ax
  101734:	66 90                	xchg   ax,ax
  101736:	66 90                	xchg   ax,ax
  101738:	66 90                	xchg   ax,ax
  10173a:	66 90                	xchg   ax,ax
  10173c:	66 90                	xchg   ax,ax
  10173e:	66 90                	xchg   ax,ax
  101740:	66 90                	xchg   ax,ax
  101742:	66 90                	xchg   ax,ax
  101744:	66 90                	xchg   ax,ax
  101746:	66 90                	xchg   ax,ax
  101748:	66 90                	xchg   ax,ax
  10174a:	66 90                	xchg   ax,ax
  10174c:	66 90                	xchg   ax,ax
  10174e:	66 90                	xchg   ax,ax
  101750:	66 90                	xchg   ax,ax
  101752:	66 90                	xchg   ax,ax
  101754:	66 90                	xchg   ax,ax
  101756:	66 90                	xchg   ax,ax
  101758:	66 90                	xchg   ax,ax
  10175a:	66 90                	xchg   ax,ax
  10175c:	66 90                	xchg   ax,ax
  10175e:	66 90                	xchg   ax,ax
  101760:	66 90                	xchg   ax,ax
  101762:	66 90                	xchg   ax,ax
  101764:	66 90                	xchg   ax,ax
  101766:	66 90                	xchg   ax,ax
  101768:	66 90                	xchg   ax,ax
  10176a:	66 90                	xchg   ax,ax
  10176c:	66 90                	xchg   ax,ax
  10176e:	66 90                	xchg   ax,ax
  101770:	66 90                	xchg   ax,ax
  101772:	66 90                	xchg   ax,ax
  101774:	66 90                	xchg   ax,ax
  101776:	66 90                	xchg   ax,ax
  101778:	66 90                	xchg   ax,ax
  10177a:	66 90                	xchg   ax,ax
  10177c:	66 90                	xchg   ax,ax
  10177e:	66 90                	xchg   ax,ax
  101780:	66 90                	xchg   ax,ax
  101782:	66 90                	xchg   ax,ax
  101784:	66 90                	xchg   ax,ax
  101786:	66 90                	xchg   ax,ax
  101788:	66 90                	xchg   ax,ax
  10178a:	66 90                	xchg   ax,ax
  10178c:	66 90                	xchg   ax,ax
  10178e:	66 90                	xchg   ax,ax
  101790:	66 90                	xchg   ax,ax
  101792:	66 90                	xchg   ax,ax
  101794:	66 90                	xchg   ax,ax
  101796:	66 90                	xchg   ax,ax
  101798:	66 90                	xchg   ax,ax
  10179a:	66 90                	xchg   ax,ax
  10179c:	66 90                	xchg   ax,ax
  10179e:	66 90                	xchg   ax,ax
  1017a0:	66 90                	xchg   ax,ax
  1017a2:	66 90                	xchg   ax,ax
  1017a4:	66 90                	xchg   ax,ax
  1017a6:	66 90                	xchg   ax,ax
  1017a8:	66 90                	xchg   ax,ax
  1017aa:	66 90                	xchg   ax,ax
  1017ac:	66 90                	xchg   ax,ax
  1017ae:	66 90                	xchg   ax,ax
  1017b0:	66 90                	xchg   ax,ax
  1017b2:	66 90                	xchg   ax,ax
  1017b4:	66 90                	xchg   ax,ax
  1017b6:	66 90                	xchg   ax,ax
  1017b8:	66 90                	xchg   ax,ax
  1017ba:	66 90                	xchg   ax,ax
  1017bc:	66 90                	xchg   ax,ax
  1017be:	66 90                	xchg   ax,ax
  1017c0:	66 90                	xchg   ax,ax
  1017c2:	66 90                	xchg   ax,ax
  1017c4:	66 90                	xchg   ax,ax
  1017c6:	66 90                	xchg   ax,ax
  1017c8:	66 90                	xchg   ax,ax
  1017ca:	66 90                	xchg   ax,ax
  1017cc:	66 90                	xchg   ax,ax
  1017ce:	66 90                	xchg   ax,ax
  1017d0:	66 90                	xchg   ax,ax
  1017d2:	66 90                	xchg   ax,ax
  1017d4:	66 90                	xchg   ax,ax
  1017d6:	66 90                	xchg   ax,ax
  1017d8:	66 90                	xchg   ax,ax
  1017da:	66 90                	xchg   ax,ax
  1017dc:	66 90                	xchg   ax,ax
  1017de:	66 90                	xchg   ax,ax
  1017e0:	66 90                	xchg   ax,ax
  1017e2:	66 90                	xchg   ax,ax
  1017e4:	66 90                	xchg   ax,ax
  1017e6:	66 90                	xchg   ax,ax
  1017e8:	66 90                	xchg   ax,ax
  1017ea:	66 90                	xchg   ax,ax
  1017ec:	66 90                	xchg   ax,ax
  1017ee:	66 90                	xchg   ax,ax
  1017f0:	66 90                	xchg   ax,ax
  1017f2:	66 90                	xchg   ax,ax
  1017f4:	66 90                	xchg   ax,ax
  1017f6:	66 90                	xchg   ax,ax
  1017f8:	66 90                	xchg   ax,ax
  1017fa:	66 90                	xchg   ax,ax
  1017fc:	66 90                	xchg   ax,ax
  1017fe:	66 90                	xchg   ax,ax
  101800:	66 90                	xchg   ax,ax
  101802:	66 90                	xchg   ax,ax
  101804:	66 90                	xchg   ax,ax
  101806:	66 90                	xchg   ax,ax
  101808:	66 90                	xchg   ax,ax
  10180a:	66 90                	xchg   ax,ax
  10180c:	66 90                	xchg   ax,ax
  10180e:	66 90                	xchg   ax,ax
  101810:	66 90                	xchg   ax,ax
  101812:	66 90                	xchg   ax,ax
  101814:	66 90                	xchg   ax,ax
  101816:	66 90                	xchg   ax,ax
  101818:	66 90                	xchg   ax,ax
  10181a:	66 90                	xchg   ax,ax
  10181c:	66 90                	xchg   ax,ax
  10181e:	66 90                	xchg   ax,ax
  101820:	66 90                	xchg   ax,ax
  101822:	66 90                	xchg   ax,ax
  101824:	66 90                	xchg   ax,ax
  101826:	66 90                	xchg   ax,ax
  101828:	66 90                	xchg   ax,ax
  10182a:	66 90                	xchg   ax,ax
  10182c:	66 90                	xchg   ax,ax
  10182e:	66 90                	xchg   ax,ax
  101830:	66 90                	xchg   ax,ax
  101832:	66 90                	xchg   ax,ax
  101834:	66 90                	xchg   ax,ax
  101836:	66 90                	xchg   ax,ax
  101838:	66 90                	xchg   ax,ax
  10183a:	66 90                	xchg   ax,ax
  10183c:	66 90                	xchg   ax,ax
  10183e:	66 90                	xchg   ax,ax
  101840:	66 90                	xchg   ax,ax
  101842:	66 90                	xchg   ax,ax
  101844:	66 90                	xchg   ax,ax
  101846:	66 90                	xchg   ax,ax
  101848:	66 90                	xchg   ax,ax
  10184a:	66 90                	xchg   ax,ax
  10184c:	66 90                	xchg   ax,ax
  10184e:	66 90                	xchg   ax,ax
  101850:	66 90                	xchg   ax,ax
  101852:	66 90                	xchg   ax,ax
  101854:	66 90                	xchg   ax,ax
  101856:	66 90                	xchg   ax,ax
  101858:	66 90                	xchg   ax,ax
  10185a:	66 90                	xchg   ax,ax
  10185c:	66 90                	xchg   ax,ax
  10185e:	66 90                	xchg   ax,ax
  101860:	66 90                	xchg   ax,ax
  101862:	66 90                	xchg   ax,ax
  101864:	66 90                	xchg   ax,ax
  101866:	66 90                	xchg   ax,ax
  101868:	66 90                	xchg   ax,ax
  10186a:	66 90                	xchg   ax,ax
  10186c:	66 90                	xchg   ax,ax
  10186e:	66 90                	xchg   ax,ax
  101870:	66 90                	xchg   ax,ax
  101872:	66 90                	xchg   ax,ax
  101874:	66 90                	xchg   ax,ax
  101876:	66 90                	xchg   ax,ax
  101878:	66 90                	xchg   ax,ax
  10187a:	66 90                	xchg   ax,ax
  10187c:	66 90                	xchg   ax,ax
  10187e:	66 90                	xchg   ax,ax
  101880:	66 90                	xchg   ax,ax
  101882:	66 90                	xchg   ax,ax
  101884:	66 90                	xchg   ax,ax
  101886:	66 90                	xchg   ax,ax
  101888:	66 90                	xchg   ax,ax
  10188a:	66 90                	xchg   ax,ax
  10188c:	66 90                	xchg   ax,ax
  10188e:	66 90                	xchg   ax,ax
  101890:	66 90                	xchg   ax,ax
  101892:	66 90                	xchg   ax,ax
  101894:	66 90                	xchg   ax,ax
  101896:	66 90                	xchg   ax,ax
  101898:	66 90                	xchg   ax,ax
  10189a:	66 90                	xchg   ax,ax
  10189c:	66 90                	xchg   ax,ax
  10189e:	66 90                	xchg   ax,ax
  1018a0:	66 90                	xchg   ax,ax
  1018a2:	66 90                	xchg   ax,ax
  1018a4:	66 90                	xchg   ax,ax
  1018a6:	66 90                	xchg   ax,ax
  1018a8:	66 90                	xchg   ax,ax
  1018aa:	66 90                	xchg   ax,ax
  1018ac:	66 90                	xchg   ax,ax
  1018ae:	66 90                	xchg   ax,ax
  1018b0:	66 90                	xchg   ax,ax
  1018b2:	66 90                	xchg   ax,ax
  1018b4:	66 90                	xchg   ax,ax
  1018b6:	66 90                	xchg   ax,ax
  1018b8:	66 90                	xchg   ax,ax
  1018ba:	66 90                	xchg   ax,ax
  1018bc:	66 90                	xchg   ax,ax
  1018be:	66 90                	xchg   ax,ax
  1018c0:	66 90                	xchg   ax,ax
  1018c2:	66 90                	xchg   ax,ax
  1018c4:	66 90                	xchg   ax,ax
  1018c6:	66 90                	xchg   ax,ax
  1018c8:	66 90                	xchg   ax,ax
  1018ca:	66 90                	xchg   ax,ax
  1018cc:	66 90                	xchg   ax,ax
  1018ce:	66 90                	xchg   ax,ax
  1018d0:	66 90                	xchg   ax,ax
  1018d2:	66 90                	xchg   ax,ax
  1018d4:	66 90                	xchg   ax,ax
  1018d6:	66 90                	xchg   ax,ax
  1018d8:	66 90                	xchg   ax,ax
  1018da:	66 90                	xchg   ax,ax
  1018dc:	66 90                	xchg   ax,ax
  1018de:	66 90                	xchg   ax,ax
  1018e0:	66 90                	xchg   ax,ax
  1018e2:	66 90                	xchg   ax,ax
  1018e4:	66 90                	xchg   ax,ax
  1018e6:	66 90                	xchg   ax,ax
  1018e8:	66 90                	xchg   ax,ax
  1018ea:	66 90                	xchg   ax,ax
  1018ec:	66 90                	xchg   ax,ax
  1018ee:	66 90                	xchg   ax,ax
  1018f0:	66 90                	xchg   ax,ax
  1018f2:	66 90                	xchg   ax,ax
  1018f4:	66 90                	xchg   ax,ax
  1018f6:	66 90                	xchg   ax,ax
  1018f8:	66 90                	xchg   ax,ax
  1018fa:	66 90                	xchg   ax,ax
  1018fc:	66 90                	xchg   ax,ax
  1018fe:	66 90                	xchg   ax,ax
  101900:	66 90                	xchg   ax,ax
  101902:	66 90                	xchg   ax,ax
  101904:	66 90                	xchg   ax,ax
  101906:	66 90                	xchg   ax,ax
  101908:	66 90                	xchg   ax,ax
  10190a:	66 90                	xchg   ax,ax
  10190c:	66 90                	xchg   ax,ax
  10190e:	66 90                	xchg   ax,ax
  101910:	66 90                	xchg   ax,ax
  101912:	66 90                	xchg   ax,ax
  101914:	66 90                	xchg   ax,ax
  101916:	66 90                	xchg   ax,ax
  101918:	66 90                	xchg   ax,ax
  10191a:	66 90                	xchg   ax,ax
  10191c:	66 90                	xchg   ax,ax
  10191e:	66 90                	xchg   ax,ax
  101920:	66 90                	xchg   ax,ax
  101922:	66 90                	xchg   ax,ax
  101924:	66 90                	xchg   ax,ax
  101926:	66 90                	xchg   ax,ax
  101928:	66 90                	xchg   ax,ax
  10192a:	66 90                	xchg   ax,ax
  10192c:	66 90                	xchg   ax,ax
  10192e:	66 90                	xchg   ax,ax
  101930:	66 90                	xchg   ax,ax
  101932:	66 90                	xchg   ax,ax
  101934:	66 90                	xchg   ax,ax
  101936:	66 90                	xchg   ax,ax
  101938:	66 90                	xchg   ax,ax
  10193a:	66 90                	xchg   ax,ax
  10193c:	66 90                	xchg   ax,ax
  10193e:	66 90                	xchg   ax,ax
  101940:	66 90                	xchg   ax,ax
  101942:	66 90                	xchg   ax,ax
  101944:	66 90                	xchg   ax,ax
  101946:	66 90                	xchg   ax,ax
  101948:	66 90                	xchg   ax,ax
  10194a:	66 90                	xchg   ax,ax
  10194c:	66 90                	xchg   ax,ax
  10194e:	66 90                	xchg   ax,ax
  101950:	66 90                	xchg   ax,ax
  101952:	66 90                	xchg   ax,ax
  101954:	66 90                	xchg   ax,ax
  101956:	66 90                	xchg   ax,ax
  101958:	66 90                	xchg   ax,ax
  10195a:	66 90                	xchg   ax,ax
  10195c:	66 90                	xchg   ax,ax
  10195e:	66 90                	xchg   ax,ax
  101960:	66 90                	xchg   ax,ax
  101962:	66 90                	xchg   ax,ax
  101964:	66 90                	xchg   ax,ax
  101966:	66 90                	xchg   ax,ax
  101968:	66 90                	xchg   ax,ax
  10196a:	66 90                	xchg   ax,ax
  10196c:	66 90                	xchg   ax,ax
  10196e:	66 90                	xchg   ax,ax
  101970:	66 90                	xchg   ax,ax
  101972:	66 90                	xchg   ax,ax
  101974:	66 90                	xchg   ax,ax
  101976:	66 90                	xchg   ax,ax
  101978:	66 90                	xchg   ax,ax
  10197a:	66 90                	xchg   ax,ax
  10197c:	66 90                	xchg   ax,ax
  10197e:	66 90                	xchg   ax,ax
  101980:	66 90                	xchg   ax,ax
  101982:	66 90                	xchg   ax,ax
  101984:	66 90                	xchg   ax,ax
  101986:	66 90                	xchg   ax,ax
  101988:	66 90                	xchg   ax,ax
  10198a:	66 90                	xchg   ax,ax
  10198c:	66 90                	xchg   ax,ax
  10198e:	66 90                	xchg   ax,ax
  101990:	66 90                	xchg   ax,ax
  101992:	66 90                	xchg   ax,ax
  101994:	66 90                	xchg   ax,ax
  101996:	66 90                	xchg   ax,ax
  101998:	66 90                	xchg   ax,ax
  10199a:	66 90                	xchg   ax,ax
  10199c:	66 90                	xchg   ax,ax
  10199e:	66 90                	xchg   ax,ax
  1019a0:	66 90                	xchg   ax,ax
  1019a2:	66 90                	xchg   ax,ax
  1019a4:	66 90                	xchg   ax,ax
  1019a6:	66 90                	xchg   ax,ax
  1019a8:	66 90                	xchg   ax,ax
  1019aa:	66 90                	xchg   ax,ax
  1019ac:	66 90                	xchg   ax,ax
  1019ae:	66 90                	xchg   ax,ax
  1019b0:	66 90                	xchg   ax,ax
  1019b2:	66 90                	xchg   ax,ax
  1019b4:	66 90                	xchg   ax,ax
  1019b6:	66 90                	xchg   ax,ax
  1019b8:	66 90                	xchg   ax,ax
  1019ba:	66 90                	xchg   ax,ax
  1019bc:	66 90                	xchg   ax,ax
  1019be:	66 90                	xchg   ax,ax
  1019c0:	66 90                	xchg   ax,ax
  1019c2:	66 90                	xchg   ax,ax
  1019c4:	66 90                	xchg   ax,ax
  1019c6:	66 90                	xchg   ax,ax
  1019c8:	66 90                	xchg   ax,ax
  1019ca:	66 90                	xchg   ax,ax
  1019cc:	66 90                	xchg   ax,ax
  1019ce:	66 90                	xchg   ax,ax
  1019d0:	66 90                	xchg   ax,ax
  1019d2:	66 90                	xchg   ax,ax
  1019d4:	66 90                	xchg   ax,ax
  1019d6:	66 90                	xchg   ax,ax
  1019d8:	66 90                	xchg   ax,ax
  1019da:	66 90                	xchg   ax,ax
  1019dc:	66 90                	xchg   ax,ax
  1019de:	66 90                	xchg   ax,ax
  1019e0:	66 90                	xchg   ax,ax
  1019e2:	66 90                	xchg   ax,ax
  1019e4:	66 90                	xchg   ax,ax
  1019e6:	66 90                	xchg   ax,ax
  1019e8:	66 90                	xchg   ax,ax
  1019ea:	66 90                	xchg   ax,ax
  1019ec:	66 90                	xchg   ax,ax
  1019ee:	66 90                	xchg   ax,ax
  1019f0:	66 90                	xchg   ax,ax
  1019f2:	66 90                	xchg   ax,ax
  1019f4:	66 90                	xchg   ax,ax
  1019f6:	66 90                	xchg   ax,ax
  1019f8:	66 90                	xchg   ax,ax
  1019fa:	66 90                	xchg   ax,ax
  1019fc:	66 90                	xchg   ax,ax
  1019fe:	66 90                	xchg   ax,ax
  101a00:	66 90                	xchg   ax,ax
  101a02:	66 90                	xchg   ax,ax
  101a04:	66 90                	xchg   ax,ax
  101a06:	66 90                	xchg   ax,ax
  101a08:	66 90                	xchg   ax,ax
  101a0a:	66 90                	xchg   ax,ax
  101a0c:	66 90                	xchg   ax,ax
  101a0e:	66 90                	xchg   ax,ax
  101a10:	66 90                	xchg   ax,ax
  101a12:	66 90                	xchg   ax,ax
  101a14:	66 90                	xchg   ax,ax
  101a16:	66 90                	xchg   ax,ax
  101a18:	66 90                	xchg   ax,ax
  101a1a:	66 90                	xchg   ax,ax
  101a1c:	66 90                	xchg   ax,ax
  101a1e:	66 90                	xchg   ax,ax
  101a20:	66 90                	xchg   ax,ax
  101a22:	66 90                	xchg   ax,ax
  101a24:	66 90                	xchg   ax,ax
  101a26:	66 90                	xchg   ax,ax
  101a28:	66 90                	xchg   ax,ax
  101a2a:	66 90                	xchg   ax,ax
  101a2c:	66 90                	xchg   ax,ax
  101a2e:	66 90                	xchg   ax,ax
  101a30:	66 90                	xchg   ax,ax
  101a32:	66 90                	xchg   ax,ax
  101a34:	66 90                	xchg   ax,ax
  101a36:	66 90                	xchg   ax,ax
  101a38:	66 90                	xchg   ax,ax
  101a3a:	66 90                	xchg   ax,ax
  101a3c:	66 90                	xchg   ax,ax
  101a3e:	66 90                	xchg   ax,ax
  101a40:	66 90                	xchg   ax,ax
  101a42:	66 90                	xchg   ax,ax
  101a44:	66 90                	xchg   ax,ax
  101a46:	66 90                	xchg   ax,ax
  101a48:	66 90                	xchg   ax,ax
  101a4a:	66 90                	xchg   ax,ax
  101a4c:	66 90                	xchg   ax,ax
  101a4e:	66 90                	xchg   ax,ax
  101a50:	66 90                	xchg   ax,ax
  101a52:	66 90                	xchg   ax,ax
  101a54:	66 90                	xchg   ax,ax
  101a56:	66 90                	xchg   ax,ax
  101a58:	66 90                	xchg   ax,ax
  101a5a:	66 90                	xchg   ax,ax
  101a5c:	66 90                	xchg   ax,ax
  101a5e:	66 90                	xchg   ax,ax
  101a60:	66 90                	xchg   ax,ax
  101a62:	66 90                	xchg   ax,ax
  101a64:	66 90                	xchg   ax,ax
  101a66:	66 90                	xchg   ax,ax
  101a68:	66 90                	xchg   ax,ax
  101a6a:	66 90                	xchg   ax,ax
  101a6c:	66 90                	xchg   ax,ax
  101a6e:	66 90                	xchg   ax,ax
  101a70:	66 90                	xchg   ax,ax
  101a72:	66 90                	xchg   ax,ax
  101a74:	66 90                	xchg   ax,ax
  101a76:	66 90                	xchg   ax,ax
  101a78:	66 90                	xchg   ax,ax
  101a7a:	66 90                	xchg   ax,ax
  101a7c:	66 90                	xchg   ax,ax
  101a7e:	66 90                	xchg   ax,ax
  101a80:	66 90                	xchg   ax,ax
  101a82:	66 90                	xchg   ax,ax
  101a84:	66 90                	xchg   ax,ax
  101a86:	66 90                	xchg   ax,ax
  101a88:	66 90                	xchg   ax,ax
  101a8a:	66 90                	xchg   ax,ax
  101a8c:	66 90                	xchg   ax,ax
  101a8e:	66 90                	xchg   ax,ax
  101a90:	66 90                	xchg   ax,ax
  101a92:	66 90                	xchg   ax,ax
  101a94:	66 90                	xchg   ax,ax
  101a96:	66 90                	xchg   ax,ax
  101a98:	66 90                	xchg   ax,ax
  101a9a:	66 90                	xchg   ax,ax
  101a9c:	66 90                	xchg   ax,ax
  101a9e:	66 90                	xchg   ax,ax
  101aa0:	66 90                	xchg   ax,ax
  101aa2:	66 90                	xchg   ax,ax
  101aa4:	66 90                	xchg   ax,ax
  101aa6:	66 90                	xchg   ax,ax
  101aa8:	66 90                	xchg   ax,ax
  101aaa:	66 90                	xchg   ax,ax
  101aac:	66 90                	xchg   ax,ax
  101aae:	66 90                	xchg   ax,ax
  101ab0:	66 90                	xchg   ax,ax
  101ab2:	66 90                	xchg   ax,ax
  101ab4:	66 90                	xchg   ax,ax
  101ab6:	66 90                	xchg   ax,ax
  101ab8:	66 90                	xchg   ax,ax
  101aba:	66 90                	xchg   ax,ax
  101abc:	66 90                	xchg   ax,ax
  101abe:	66 90                	xchg   ax,ax
  101ac0:	66 90                	xchg   ax,ax
  101ac2:	66 90                	xchg   ax,ax
  101ac4:	66 90                	xchg   ax,ax
  101ac6:	66 90                	xchg   ax,ax
  101ac8:	66 90                	xchg   ax,ax
  101aca:	66 90                	xchg   ax,ax
  101acc:	66 90                	xchg   ax,ax
  101ace:	66 90                	xchg   ax,ax
  101ad0:	66 90                	xchg   ax,ax
  101ad2:	66 90                	xchg   ax,ax
  101ad4:	66 90                	xchg   ax,ax
  101ad6:	66 90                	xchg   ax,ax
  101ad8:	66 90                	xchg   ax,ax
  101ada:	66 90                	xchg   ax,ax
  101adc:	66 90                	xchg   ax,ax
  101ade:	66 90                	xchg   ax,ax
  101ae0:	66 90                	xchg   ax,ax
  101ae2:	66 90                	xchg   ax,ax
  101ae4:	66 90                	xchg   ax,ax
  101ae6:	66 90                	xchg   ax,ax
  101ae8:	66 90                	xchg   ax,ax
  101aea:	66 90                	xchg   ax,ax
  101aec:	66 90                	xchg   ax,ax
  101aee:	66 90                	xchg   ax,ax
  101af0:	66 90                	xchg   ax,ax
  101af2:	66 90                	xchg   ax,ax
  101af4:	66 90                	xchg   ax,ax
  101af6:	66 90                	xchg   ax,ax
  101af8:	66 90                	xchg   ax,ax
  101afa:	66 90                	xchg   ax,ax
  101afc:	66 90                	xchg   ax,ax
  101afe:	66 90                	xchg   ax,ax
  101b00:	66 90                	xchg   ax,ax
  101b02:	66 90                	xchg   ax,ax
  101b04:	66 90                	xchg   ax,ax
  101b06:	66 90                	xchg   ax,ax
  101b08:	66 90                	xchg   ax,ax
  101b0a:	66 90                	xchg   ax,ax
  101b0c:	66 90                	xchg   ax,ax
  101b0e:	66 90                	xchg   ax,ax
  101b10:	66 90                	xchg   ax,ax
  101b12:	66 90                	xchg   ax,ax
  101b14:	66 90                	xchg   ax,ax
  101b16:	66 90                	xchg   ax,ax
  101b18:	66 90                	xchg   ax,ax
  101b1a:	66 90                	xchg   ax,ax
  101b1c:	66 90                	xchg   ax,ax
  101b1e:	66 90                	xchg   ax,ax
  101b20:	66 90                	xchg   ax,ax
  101b22:	66 90                	xchg   ax,ax
  101b24:	66 90                	xchg   ax,ax
  101b26:	66 90                	xchg   ax,ax
  101b28:	66 90                	xchg   ax,ax
  101b2a:	66 90                	xchg   ax,ax
  101b2c:	66 90                	xchg   ax,ax
  101b2e:	66 90                	xchg   ax,ax
  101b30:	66 90                	xchg   ax,ax
  101b32:	66 90                	xchg   ax,ax
  101b34:	66 90                	xchg   ax,ax
  101b36:	66 90                	xchg   ax,ax
  101b38:	66 90                	xchg   ax,ax
  101b3a:	66 90                	xchg   ax,ax
  101b3c:	66 90                	xchg   ax,ax
  101b3e:	66 90                	xchg   ax,ax
  101b40:	66 90                	xchg   ax,ax
  101b42:	66 90                	xchg   ax,ax
  101b44:	66 90                	xchg   ax,ax
  101b46:	66 90                	xchg   ax,ax
  101b48:	66 90                	xchg   ax,ax
  101b4a:	66 90                	xchg   ax,ax
  101b4c:	66 90                	xchg   ax,ax
  101b4e:	66 90                	xchg   ax,ax
  101b50:	66 90                	xchg   ax,ax
  101b52:	66 90                	xchg   ax,ax
  101b54:	66 90                	xchg   ax,ax
  101b56:	66 90                	xchg   ax,ax
  101b58:	66 90                	xchg   ax,ax
  101b5a:	66 90                	xchg   ax,ax
  101b5c:	66 90                	xchg   ax,ax
  101b5e:	66 90                	xchg   ax,ax
  101b60:	66 90                	xchg   ax,ax
  101b62:	66 90                	xchg   ax,ax
  101b64:	66 90                	xchg   ax,ax
  101b66:	66 90                	xchg   ax,ax
  101b68:	66 90                	xchg   ax,ax
  101b6a:	66 90                	xchg   ax,ax
  101b6c:	66 90                	xchg   ax,ax
  101b6e:	66 90                	xchg   ax,ax
  101b70:	66 90                	xchg   ax,ax
  101b72:	66 90                	xchg   ax,ax
  101b74:	66 90                	xchg   ax,ax
  101b76:	66 90                	xchg   ax,ax
  101b78:	66 90                	xchg   ax,ax
  101b7a:	66 90                	xchg   ax,ax
  101b7c:	66 90                	xchg   ax,ax
  101b7e:	66 90                	xchg   ax,ax
  101b80:	66 90                	xchg   ax,ax
  101b82:	66 90                	xchg   ax,ax
  101b84:	66 90                	xchg   ax,ax
  101b86:	66 90                	xchg   ax,ax
  101b88:	66 90                	xchg   ax,ax
  101b8a:	66 90                	xchg   ax,ax
  101b8c:	66 90                	xchg   ax,ax
  101b8e:	66 90                	xchg   ax,ax
  101b90:	66 90                	xchg   ax,ax
  101b92:	66 90                	xchg   ax,ax
  101b94:	66 90                	xchg   ax,ax
  101b96:	66 90                	xchg   ax,ax
  101b98:	66 90                	xchg   ax,ax
  101b9a:	66 90                	xchg   ax,ax
  101b9c:	66 90                	xchg   ax,ax
  101b9e:	66 90                	xchg   ax,ax
  101ba0:	66 90                	xchg   ax,ax
  101ba2:	66 90                	xchg   ax,ax
  101ba4:	66 90                	xchg   ax,ax
  101ba6:	66 90                	xchg   ax,ax
  101ba8:	66 90                	xchg   ax,ax
  101baa:	66 90                	xchg   ax,ax
  101bac:	66 90                	xchg   ax,ax
  101bae:	66 90                	xchg   ax,ax
  101bb0:	66 90                	xchg   ax,ax
  101bb2:	66 90                	xchg   ax,ax
  101bb4:	66 90                	xchg   ax,ax
  101bb6:	66 90                	xchg   ax,ax
  101bb8:	66 90                	xchg   ax,ax
  101bba:	66 90                	xchg   ax,ax
  101bbc:	66 90                	xchg   ax,ax
  101bbe:	66 90                	xchg   ax,ax
  101bc0:	66 90                	xchg   ax,ax
  101bc2:	66 90                	xchg   ax,ax
  101bc4:	66 90                	xchg   ax,ax
  101bc6:	66 90                	xchg   ax,ax
  101bc8:	66 90                	xchg   ax,ax
  101bca:	66 90                	xchg   ax,ax
  101bcc:	66 90                	xchg   ax,ax
  101bce:	66 90                	xchg   ax,ax
  101bd0:	66 90                	xchg   ax,ax
  101bd2:	66 90                	xchg   ax,ax
  101bd4:	66 90                	xchg   ax,ax
  101bd6:	66 90                	xchg   ax,ax
  101bd8:	66 90                	xchg   ax,ax
  101bda:	66 90                	xchg   ax,ax
  101bdc:	66 90                	xchg   ax,ax
  101bde:	66 90                	xchg   ax,ax
  101be0:	66 90                	xchg   ax,ax
  101be2:	66 90                	xchg   ax,ax
  101be4:	66 90                	xchg   ax,ax
  101be6:	66 90                	xchg   ax,ax
  101be8:	66 90                	xchg   ax,ax
  101bea:	66 90                	xchg   ax,ax
  101bec:	66 90                	xchg   ax,ax
  101bee:	66 90                	xchg   ax,ax
  101bf0:	66 90                	xchg   ax,ax
  101bf2:	66 90                	xchg   ax,ax
  101bf4:	66 90                	xchg   ax,ax
  101bf6:	66 90                	xchg   ax,ax
  101bf8:	66 90                	xchg   ax,ax
  101bfa:	66 90                	xchg   ax,ax
  101bfc:	66 90                	xchg   ax,ax
  101bfe:	66 90                	xchg   ax,ax
  101c00:	66 90                	xchg   ax,ax
  101c02:	66 90                	xchg   ax,ax
  101c04:	66 90                	xchg   ax,ax
  101c06:	66 90                	xchg   ax,ax
  101c08:	66 90                	xchg   ax,ax
  101c0a:	66 90                	xchg   ax,ax
  101c0c:	66 90                	xchg   ax,ax
  101c0e:	66 90                	xchg   ax,ax
  101c10:	66 90                	xchg   ax,ax
  101c12:	66 90                	xchg   ax,ax
  101c14:	66 90                	xchg   ax,ax
  101c16:	66 90                	xchg   ax,ax
  101c18:	66 90                	xchg   ax,ax
  101c1a:	66 90                	xchg   ax,ax
  101c1c:	66 90                	xchg   ax,ax
  101c1e:	66 90                	xchg   ax,ax
  101c20:	66 90                	xchg   ax,ax
  101c22:	66 90                	xchg   ax,ax
  101c24:	66 90                	xchg   ax,ax
  101c26:	66 90                	xchg   ax,ax
  101c28:	66 90                	xchg   ax,ax
  101c2a:	66 90                	xchg   ax,ax
  101c2c:	66 90                	xchg   ax,ax
  101c2e:	66 90                	xchg   ax,ax
  101c30:	66 90                	xchg   ax,ax
  101c32:	66 90                	xchg   ax,ax
  101c34:	66 90                	xchg   ax,ax
  101c36:	66 90                	xchg   ax,ax
  101c38:	66 90                	xchg   ax,ax
  101c3a:	66 90                	xchg   ax,ax
  101c3c:	66 90                	xchg   ax,ax
  101c3e:	66 90                	xchg   ax,ax
  101c40:	66 90                	xchg   ax,ax
  101c42:	66 90                	xchg   ax,ax
  101c44:	66 90                	xchg   ax,ax
  101c46:	66 90                	xchg   ax,ax
  101c48:	66 90                	xchg   ax,ax
  101c4a:	66 90                	xchg   ax,ax
  101c4c:	66 90                	xchg   ax,ax
  101c4e:	66 90                	xchg   ax,ax
  101c50:	66 90                	xchg   ax,ax
  101c52:	66 90                	xchg   ax,ax
  101c54:	66 90                	xchg   ax,ax
  101c56:	66 90                	xchg   ax,ax
  101c58:	66 90                	xchg   ax,ax
  101c5a:	66 90                	xchg   ax,ax
  101c5c:	66 90                	xchg   ax,ax
  101c5e:	66 90                	xchg   ax,ax
  101c60:	66 90                	xchg   ax,ax
  101c62:	66 90                	xchg   ax,ax
  101c64:	66 90                	xchg   ax,ax
  101c66:	66 90                	xchg   ax,ax
  101c68:	66 90                	xchg   ax,ax
  101c6a:	66 90                	xchg   ax,ax
  101c6c:	66 90                	xchg   ax,ax
  101c6e:	66 90                	xchg   ax,ax
  101c70:	66 90                	xchg   ax,ax
  101c72:	66 90                	xchg   ax,ax
  101c74:	66 90                	xchg   ax,ax
  101c76:	66 90                	xchg   ax,ax
  101c78:	66 90                	xchg   ax,ax
  101c7a:	66 90                	xchg   ax,ax
  101c7c:	66 90                	xchg   ax,ax
  101c7e:	66 90                	xchg   ax,ax
  101c80:	66 90                	xchg   ax,ax
  101c82:	66 90                	xchg   ax,ax
  101c84:	66 90                	xchg   ax,ax
  101c86:	66 90                	xchg   ax,ax
  101c88:	66 90                	xchg   ax,ax
  101c8a:	66 90                	xchg   ax,ax
  101c8c:	66 90                	xchg   ax,ax
  101c8e:	66 90                	xchg   ax,ax
  101c90:	66 90                	xchg   ax,ax
  101c92:	66 90                	xchg   ax,ax
  101c94:	66 90                	xchg   ax,ax
  101c96:	66 90                	xchg   ax,ax
  101c98:	66 90                	xchg   ax,ax
  101c9a:	66 90                	xchg   ax,ax
  101c9c:	66 90                	xchg   ax,ax
  101c9e:	66 90                	xchg   ax,ax
  101ca0:	66 90                	xchg   ax,ax
  101ca2:	66 90                	xchg   ax,ax
  101ca4:	66 90                	xchg   ax,ax
  101ca6:	66 90                	xchg   ax,ax
  101ca8:	66 90                	xchg   ax,ax
  101caa:	66 90                	xchg   ax,ax
  101cac:	66 90                	xchg   ax,ax
  101cae:	66 90                	xchg   ax,ax
  101cb0:	66 90                	xchg   ax,ax
  101cb2:	66 90                	xchg   ax,ax
  101cb4:	66 90                	xchg   ax,ax
  101cb6:	66 90                	xchg   ax,ax
  101cb8:	66 90                	xchg   ax,ax
  101cba:	66 90                	xchg   ax,ax
  101cbc:	66 90                	xchg   ax,ax
  101cbe:	66 90                	xchg   ax,ax
  101cc0:	66 90                	xchg   ax,ax
  101cc2:	66 90                	xchg   ax,ax
  101cc4:	66 90                	xchg   ax,ax
  101cc6:	66 90                	xchg   ax,ax
  101cc8:	66 90                	xchg   ax,ax
  101cca:	66 90                	xchg   ax,ax
  101ccc:	66 90                	xchg   ax,ax
  101cce:	66 90                	xchg   ax,ax
  101cd0:	66 90                	xchg   ax,ax
  101cd2:	66 90                	xchg   ax,ax
  101cd4:	66 90                	xchg   ax,ax
  101cd6:	66 90                	xchg   ax,ax
  101cd8:	66 90                	xchg   ax,ax
  101cda:	66 90                	xchg   ax,ax
  101cdc:	66 90                	xchg   ax,ax
  101cde:	66 90                	xchg   ax,ax
  101ce0:	66 90                	xchg   ax,ax
  101ce2:	66 90                	xchg   ax,ax
  101ce4:	66 90                	xchg   ax,ax
  101ce6:	66 90                	xchg   ax,ax
  101ce8:	66 90                	xchg   ax,ax
  101cea:	66 90                	xchg   ax,ax
  101cec:	66 90                	xchg   ax,ax
  101cee:	66 90                	xchg   ax,ax
  101cf0:	66 90                	xchg   ax,ax
  101cf2:	66 90                	xchg   ax,ax
  101cf4:	66 90                	xchg   ax,ax
  101cf6:	66 90                	xchg   ax,ax
  101cf8:	66 90                	xchg   ax,ax
  101cfa:	66 90                	xchg   ax,ax
  101cfc:	66 90                	xchg   ax,ax
  101cfe:	66 90                	xchg   ax,ax
  101d00:	66 90                	xchg   ax,ax
  101d02:	66 90                	xchg   ax,ax
  101d04:	66 90                	xchg   ax,ax
  101d06:	66 90                	xchg   ax,ax
  101d08:	66 90                	xchg   ax,ax
  101d0a:	66 90                	xchg   ax,ax
  101d0c:	66 90                	xchg   ax,ax
  101d0e:	66 90                	xchg   ax,ax
  101d10:	66 90                	xchg   ax,ax
  101d12:	66 90                	xchg   ax,ax
  101d14:	66 90                	xchg   ax,ax
  101d16:	66 90                	xchg   ax,ax
  101d18:	66 90                	xchg   ax,ax
  101d1a:	66 90                	xchg   ax,ax
  101d1c:	66 90                	xchg   ax,ax
  101d1e:	66 90                	xchg   ax,ax
  101d20:	66 90                	xchg   ax,ax
  101d22:	66 90                	xchg   ax,ax
  101d24:	66 90                	xchg   ax,ax
  101d26:	66 90                	xchg   ax,ax
  101d28:	66 90                	xchg   ax,ax
  101d2a:	66 90                	xchg   ax,ax
  101d2c:	66 90                	xchg   ax,ax
  101d2e:	66 90                	xchg   ax,ax
  101d30:	66 90                	xchg   ax,ax
  101d32:	66 90                	xchg   ax,ax
  101d34:	66 90                	xchg   ax,ax
  101d36:	66 90                	xchg   ax,ax
  101d38:	66 90                	xchg   ax,ax
  101d3a:	66 90                	xchg   ax,ax
  101d3c:	66 90                	xchg   ax,ax
  101d3e:	66 90                	xchg   ax,ax
  101d40:	66 90                	xchg   ax,ax
  101d42:	66 90                	xchg   ax,ax
  101d44:	66 90                	xchg   ax,ax
  101d46:	66 90                	xchg   ax,ax
  101d48:	66 90                	xchg   ax,ax
  101d4a:	66 90                	xchg   ax,ax
  101d4c:	66 90                	xchg   ax,ax
  101d4e:	66 90                	xchg   ax,ax
  101d50:	66 90                	xchg   ax,ax
  101d52:	66 90                	xchg   ax,ax
  101d54:	66 90                	xchg   ax,ax
  101d56:	66 90                	xchg   ax,ax
  101d58:	66 90                	xchg   ax,ax
  101d5a:	66 90                	xchg   ax,ax
  101d5c:	66 90                	xchg   ax,ax
  101d5e:	66 90                	xchg   ax,ax
  101d60:	66 90                	xchg   ax,ax
  101d62:	66 90                	xchg   ax,ax
  101d64:	66 90                	xchg   ax,ax
  101d66:	66 90                	xchg   ax,ax
  101d68:	66 90                	xchg   ax,ax
  101d6a:	66 90                	xchg   ax,ax
  101d6c:	66 90                	xchg   ax,ax
  101d6e:	66 90                	xchg   ax,ax
  101d70:	66 90                	xchg   ax,ax
  101d72:	66 90                	xchg   ax,ax
  101d74:	66 90                	xchg   ax,ax
  101d76:	66 90                	xchg   ax,ax
  101d78:	66 90                	xchg   ax,ax
  101d7a:	66 90                	xchg   ax,ax
  101d7c:	66 90                	xchg   ax,ax
  101d7e:	66 90                	xchg   ax,ax
  101d80:	66 90                	xchg   ax,ax
  101d82:	66 90                	xchg   ax,ax
  101d84:	66 90                	xchg   ax,ax
  101d86:	66 90                	xchg   ax,ax
  101d88:	66 90                	xchg   ax,ax
  101d8a:	66 90                	xchg   ax,ax
  101d8c:	66 90                	xchg   ax,ax
  101d8e:	66 90                	xchg   ax,ax
  101d90:	66 90                	xchg   ax,ax
  101d92:	66 90                	xchg   ax,ax
  101d94:	66 90                	xchg   ax,ax
  101d96:	66 90                	xchg   ax,ax
  101d98:	66 90                	xchg   ax,ax
  101d9a:	66 90                	xchg   ax,ax
  101d9c:	66 90                	xchg   ax,ax
  101d9e:	66 90                	xchg   ax,ax
  101da0:	66 90                	xchg   ax,ax
  101da2:	66 90                	xchg   ax,ax
  101da4:	66 90                	xchg   ax,ax
  101da6:	66 90                	xchg   ax,ax
  101da8:	66 90                	xchg   ax,ax
  101daa:	66 90                	xchg   ax,ax
  101dac:	66 90                	xchg   ax,ax
  101dae:	66 90                	xchg   ax,ax
  101db0:	66 90                	xchg   ax,ax
  101db2:	66 90                	xchg   ax,ax
  101db4:	66 90                	xchg   ax,ax
  101db6:	66 90                	xchg   ax,ax
  101db8:	66 90                	xchg   ax,ax
  101dba:	66 90                	xchg   ax,ax
  101dbc:	66 90                	xchg   ax,ax
  101dbe:	66 90                	xchg   ax,ax
  101dc0:	66 90                	xchg   ax,ax
  101dc2:	66 90                	xchg   ax,ax
  101dc4:	66 90                	xchg   ax,ax
  101dc6:	66 90                	xchg   ax,ax
  101dc8:	66 90                	xchg   ax,ax
  101dca:	66 90                	xchg   ax,ax
  101dcc:	66 90                	xchg   ax,ax
  101dce:	66 90                	xchg   ax,ax
  101dd0:	66 90                	xchg   ax,ax
  101dd2:	66 90                	xchg   ax,ax
  101dd4:	66 90                	xchg   ax,ax
  101dd6:	66 90                	xchg   ax,ax
  101dd8:	66 90                	xchg   ax,ax
  101dda:	66 90                	xchg   ax,ax
  101ddc:	66 90                	xchg   ax,ax
  101dde:	66 90                	xchg   ax,ax
  101de0:	66 90                	xchg   ax,ax
  101de2:	66 90                	xchg   ax,ax
  101de4:	66 90                	xchg   ax,ax
  101de6:	66 90                	xchg   ax,ax
  101de8:	66 90                	xchg   ax,ax
  101dea:	66 90                	xchg   ax,ax
  101dec:	66 90                	xchg   ax,ax
  101dee:	66 90                	xchg   ax,ax
  101df0:	66 90                	xchg   ax,ax
  101df2:	66 90                	xchg   ax,ax
  101df4:	66 90                	xchg   ax,ax
  101df6:	66 90                	xchg   ax,ax
  101df8:	66 90                	xchg   ax,ax
  101dfa:	66 90                	xchg   ax,ax
  101dfc:	66 90                	xchg   ax,ax
  101dfe:	66 90                	xchg   ax,ax
  101e00:	66 90                	xchg   ax,ax
  101e02:	66 90                	xchg   ax,ax
  101e04:	66 90                	xchg   ax,ax
  101e06:	66 90                	xchg   ax,ax
  101e08:	66 90                	xchg   ax,ax
  101e0a:	66 90                	xchg   ax,ax
  101e0c:	66 90                	xchg   ax,ax
  101e0e:	66 90                	xchg   ax,ax
  101e10:	66 90                	xchg   ax,ax
  101e12:	66 90                	xchg   ax,ax
  101e14:	66 90                	xchg   ax,ax
  101e16:	66 90                	xchg   ax,ax
  101e18:	66 90                	xchg   ax,ax
  101e1a:	66 90                	xchg   ax,ax
  101e1c:	66 90                	xchg   ax,ax
  101e1e:	66 90                	xchg   ax,ax
  101e20:	66 90                	xchg   ax,ax
  101e22:	66 90                	xchg   ax,ax
  101e24:	66 90                	xchg   ax,ax
  101e26:	66 90                	xchg   ax,ax
  101e28:	66 90                	xchg   ax,ax
  101e2a:	66 90                	xchg   ax,ax
  101e2c:	66 90                	xchg   ax,ax
  101e2e:	66 90                	xchg   ax,ax
  101e30:	66 90                	xchg   ax,ax
  101e32:	66 90                	xchg   ax,ax
  101e34:	66 90                	xchg   ax,ax
  101e36:	66 90                	xchg   ax,ax
  101e38:	66 90                	xchg   ax,ax
  101e3a:	66 90                	xchg   ax,ax
  101e3c:	66 90                	xchg   ax,ax
  101e3e:	66 90                	xchg   ax,ax
  101e40:	66 90                	xchg   ax,ax
  101e42:	66 90                	xchg   ax,ax
  101e44:	66 90                	xchg   ax,ax
  101e46:	66 90                	xchg   ax,ax
  101e48:	66 90                	xchg   ax,ax
  101e4a:	66 90                	xchg   ax,ax
  101e4c:	66 90                	xchg   ax,ax
  101e4e:	66 90                	xchg   ax,ax
  101e50:	66 90                	xchg   ax,ax
  101e52:	66 90                	xchg   ax,ax
  101e54:	66 90                	xchg   ax,ax
  101e56:	66 90                	xchg   ax,ax
  101e58:	66 90                	xchg   ax,ax
  101e5a:	66 90                	xchg   ax,ax
  101e5c:	66 90                	xchg   ax,ax
  101e5e:	66 90                	xchg   ax,ax
  101e60:	66 90                	xchg   ax,ax
  101e62:	66 90                	xchg   ax,ax
  101e64:	66 90                	xchg   ax,ax
  101e66:	66 90                	xchg   ax,ax
  101e68:	66 90                	xchg   ax,ax
  101e6a:	66 90                	xchg   ax,ax
  101e6c:	66 90                	xchg   ax,ax
  101e6e:	66 90                	xchg   ax,ax
  101e70:	66 90                	xchg   ax,ax
  101e72:	66 90                	xchg   ax,ax
  101e74:	66 90                	xchg   ax,ax
  101e76:	66 90                	xchg   ax,ax
  101e78:	66 90                	xchg   ax,ax
  101e7a:	66 90                	xchg   ax,ax
  101e7c:	66 90                	xchg   ax,ax
  101e7e:	66 90                	xchg   ax,ax
  101e80:	66 90                	xchg   ax,ax
  101e82:	66 90                	xchg   ax,ax
  101e84:	66 90                	xchg   ax,ax
  101e86:	66 90                	xchg   ax,ax
  101e88:	66 90                	xchg   ax,ax
  101e8a:	66 90                	xchg   ax,ax
  101e8c:	66 90                	xchg   ax,ax
  101e8e:	66 90                	xchg   ax,ax
  101e90:	66 90                	xchg   ax,ax
  101e92:	66 90                	xchg   ax,ax
  101e94:	66 90                	xchg   ax,ax
  101e96:	66 90                	xchg   ax,ax
  101e98:	66 90                	xchg   ax,ax
  101e9a:	66 90                	xchg   ax,ax
  101e9c:	66 90                	xchg   ax,ax
  101e9e:	66 90                	xchg   ax,ax
  101ea0:	66 90                	xchg   ax,ax
  101ea2:	66 90                	xchg   ax,ax
  101ea4:	66 90                	xchg   ax,ax
  101ea6:	66 90                	xchg   ax,ax
  101ea8:	66 90                	xchg   ax,ax
  101eaa:	66 90                	xchg   ax,ax
  101eac:	66 90                	xchg   ax,ax
  101eae:	66 90                	xchg   ax,ax
  101eb0:	66 90                	xchg   ax,ax
  101eb2:	66 90                	xchg   ax,ax
  101eb4:	66 90                	xchg   ax,ax
  101eb6:	66 90                	xchg   ax,ax
  101eb8:	66 90                	xchg   ax,ax
  101eba:	66 90                	xchg   ax,ax
  101ebc:	66 90                	xchg   ax,ax
  101ebe:	66 90                	xchg   ax,ax
  101ec0:	66 90                	xchg   ax,ax
  101ec2:	66 90                	xchg   ax,ax
  101ec4:	66 90                	xchg   ax,ax
  101ec6:	66 90                	xchg   ax,ax
  101ec8:	66 90                	xchg   ax,ax
  101eca:	66 90                	xchg   ax,ax
  101ecc:	66 90                	xchg   ax,ax
  101ece:	66 90                	xchg   ax,ax
  101ed0:	66 90                	xchg   ax,ax
  101ed2:	66 90                	xchg   ax,ax
  101ed4:	66 90                	xchg   ax,ax
  101ed6:	66 90                	xchg   ax,ax
  101ed8:	66 90                	xchg   ax,ax
  101eda:	66 90                	xchg   ax,ax
  101edc:	66 90                	xchg   ax,ax
  101ede:	66 90                	xchg   ax,ax
  101ee0:	66 90                	xchg   ax,ax
  101ee2:	66 90                	xchg   ax,ax
  101ee4:	66 90                	xchg   ax,ax
  101ee6:	66 90                	xchg   ax,ax
  101ee8:	66 90                	xchg   ax,ax
  101eea:	66 90                	xchg   ax,ax
  101eec:	66 90                	xchg   ax,ax
  101eee:	66 90                	xchg   ax,ax
  101ef0:	66 90                	xchg   ax,ax
  101ef2:	66 90                	xchg   ax,ax
  101ef4:	66 90                	xchg   ax,ax
  101ef6:	66 90                	xchg   ax,ax
  101ef8:	66 90                	xchg   ax,ax
  101efa:	66 90                	xchg   ax,ax
  101efc:	66 90                	xchg   ax,ax
  101efe:	66 90                	xchg   ax,ax
  101f00:	66 90                	xchg   ax,ax
  101f02:	66 90                	xchg   ax,ax
  101f04:	66 90                	xchg   ax,ax
  101f06:	66 90                	xchg   ax,ax
  101f08:	66 90                	xchg   ax,ax
  101f0a:	66 90                	xchg   ax,ax
  101f0c:	66 90                	xchg   ax,ax
  101f0e:	66 90                	xchg   ax,ax
  101f10:	66 90                	xchg   ax,ax
  101f12:	66 90                	xchg   ax,ax
  101f14:	66 90                	xchg   ax,ax
  101f16:	66 90                	xchg   ax,ax
  101f18:	66 90                	xchg   ax,ax
  101f1a:	66 90                	xchg   ax,ax
  101f1c:	66 90                	xchg   ax,ax
  101f1e:	66 90                	xchg   ax,ax
  101f20:	66 90                	xchg   ax,ax
  101f22:	66 90                	xchg   ax,ax
  101f24:	66 90                	xchg   ax,ax
  101f26:	66 90                	xchg   ax,ax
  101f28:	66 90                	xchg   ax,ax
  101f2a:	66 90                	xchg   ax,ax
  101f2c:	66 90                	xchg   ax,ax
  101f2e:	66 90                	xchg   ax,ax
  101f30:	66 90                	xchg   ax,ax
  101f32:	66 90                	xchg   ax,ax
  101f34:	66 90                	xchg   ax,ax
  101f36:	66 90                	xchg   ax,ax
  101f38:	66 90                	xchg   ax,ax
  101f3a:	66 90                	xchg   ax,ax
  101f3c:	66 90                	xchg   ax,ax
  101f3e:	66 90                	xchg   ax,ax
  101f40:	66 90                	xchg   ax,ax
  101f42:	66 90                	xchg   ax,ax
  101f44:	66 90                	xchg   ax,ax
  101f46:	66 90                	xchg   ax,ax
  101f48:	66 90                	xchg   ax,ax
  101f4a:	66 90                	xchg   ax,ax
  101f4c:	66 90                	xchg   ax,ax
  101f4e:	66 90                	xchg   ax,ax
  101f50:	66 90                	xchg   ax,ax
  101f52:	66 90                	xchg   ax,ax
  101f54:	66 90                	xchg   ax,ax
  101f56:	66 90                	xchg   ax,ax
  101f58:	66 90                	xchg   ax,ax
  101f5a:	66 90                	xchg   ax,ax
  101f5c:	66 90                	xchg   ax,ax
  101f5e:	66 90                	xchg   ax,ax
  101f60:	66 90                	xchg   ax,ax
  101f62:	66 90                	xchg   ax,ax
  101f64:	66 90                	xchg   ax,ax
  101f66:	66 90                	xchg   ax,ax
  101f68:	66 90                	xchg   ax,ax
  101f6a:	66 90                	xchg   ax,ax
  101f6c:	66 90                	xchg   ax,ax
  101f6e:	66 90                	xchg   ax,ax
  101f70:	66 90                	xchg   ax,ax
  101f72:	66 90                	xchg   ax,ax
  101f74:	66 90                	xchg   ax,ax
  101f76:	66 90                	xchg   ax,ax
  101f78:	66 90                	xchg   ax,ax
  101f7a:	66 90                	xchg   ax,ax
  101f7c:	66 90                	xchg   ax,ax
  101f7e:	66 90                	xchg   ax,ax
  101f80:	66 90                	xchg   ax,ax
  101f82:	66 90                	xchg   ax,ax
  101f84:	66 90                	xchg   ax,ax
  101f86:	66 90                	xchg   ax,ax
  101f88:	66 90                	xchg   ax,ax
  101f8a:	66 90                	xchg   ax,ax
  101f8c:	66 90                	xchg   ax,ax
  101f8e:	66 90                	xchg   ax,ax
  101f90:	66 90                	xchg   ax,ax
  101f92:	66 90                	xchg   ax,ax
  101f94:	66 90                	xchg   ax,ax
  101f96:	66 90                	xchg   ax,ax
  101f98:	66 90                	xchg   ax,ax
  101f9a:	66 90                	xchg   ax,ax
  101f9c:	66 90                	xchg   ax,ax
  101f9e:	66 90                	xchg   ax,ax
  101fa0:	66 90                	xchg   ax,ax
  101fa2:	66 90                	xchg   ax,ax
  101fa4:	66 90                	xchg   ax,ax
  101fa6:	66 90                	xchg   ax,ax
  101fa8:	66 90                	xchg   ax,ax
  101faa:	66 90                	xchg   ax,ax
  101fac:	66 90                	xchg   ax,ax
  101fae:	66 90                	xchg   ax,ax
  101fb0:	66 90                	xchg   ax,ax
  101fb2:	66 90                	xchg   ax,ax
  101fb4:	66 90                	xchg   ax,ax
  101fb6:	66 90                	xchg   ax,ax
  101fb8:	66 90                	xchg   ax,ax
  101fba:	66 90                	xchg   ax,ax
  101fbc:	66 90                	xchg   ax,ax
  101fbe:	66 90                	xchg   ax,ax
  101fc0:	66 90                	xchg   ax,ax
  101fc2:	66 90                	xchg   ax,ax
  101fc4:	66 90                	xchg   ax,ax
  101fc6:	66 90                	xchg   ax,ax
  101fc8:	66 90                	xchg   ax,ax
  101fca:	66 90                	xchg   ax,ax
  101fcc:	66 90                	xchg   ax,ax
  101fce:	66 90                	xchg   ax,ax
  101fd0:	66 90                	xchg   ax,ax
  101fd2:	66 90                	xchg   ax,ax
  101fd4:	66 90                	xchg   ax,ax
  101fd6:	66 90                	xchg   ax,ax
  101fd8:	66 90                	xchg   ax,ax
  101fda:	66 90                	xchg   ax,ax
  101fdc:	66 90                	xchg   ax,ax
  101fde:	66 90                	xchg   ax,ax
  101fe0:	66 90                	xchg   ax,ax
  101fe2:	66 90                	xchg   ax,ax
  101fe4:	66 90                	xchg   ax,ax
  101fe6:	66 90                	xchg   ax,ax
  101fe8:	66 90                	xchg   ax,ax
  101fea:	66 90                	xchg   ax,ax
  101fec:	66 90                	xchg   ax,ax
  101fee:	66 90                	xchg   ax,ax
  101ff0:	66 90                	xchg   ax,ax
  101ff2:	66 90                	xchg   ax,ax
  101ff4:	66 90                	xchg   ax,ax
  101ff6:	66 90                	xchg   ax,ax
  101ff8:	66 90                	xchg   ax,ax
  101ffa:	66 90                	xchg   ax,ax
  101ffc:	66 90                	xchg   ax,ax
  101ffe:	66 90                	xchg   ax,ax

Disassembly of section .text.__x86.get_pc_thunk.ax:

00102000 <__x86.get_pc_thunk.ax>:
  102000:	8b 04 24             	mov    eax,DWORD PTR [esp]
  102003:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.bx:

00102004 <__x86.get_pc_thunk.bx>:
  102004:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
  102007:	c3                   	ret    
