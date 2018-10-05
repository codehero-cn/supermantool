;#号代表 Win 键；
;!号代表 Alt 键；
;^号代表 Alt 键；
;+号代表 shift 键；
;::号(两个英文冒号)起分隔作用；
;run，非常常用 的 AHK 命令之一;
;号代表 注释后面一行内容；

;右键菜单项
#Persistent  ; 让脚本持续运行, 直到用户退出.
#SingleInstance ignore
Menu, Tray, Nostandard  ; 从菜单中删除所有标准菜单项.
Menu, Tray, Add, 截屏  | Alt+q, MenuHandler_screensnap  ; 创建新菜单项.
Menu, Tray, Add, a.txt  | Alt+a, MenuHandler_a ;打开a.txt文件
Menu, Tray, Add, 音量控制|Win+F10F11F12, MenuHandler_vol    ;音量控制，Win+F10,F11,F12
Menu, Tray, Add  ; 创建分隔线.
Menu, Tray, Add, help_about, MenuHandler_help  ; 创建新菜单项.
Menu, Tray, Add, exit, MenuHandler_exit  ; 创建新菜单项.
return

MenuHandler_screensnap:
Run "%A_WorkingDir%/lib/screensnap.exe"
return

MenuHandler_a:
Run "%A_WorkingDir%/lib/a.txt"

MenuHandler_vol:
return

MenuHandler_help:
;MsgBox You selected %A_ThisMenuItem% from menu %A_ThisMenu%.
;msgBox www.codehero.cn
Run, http://www.codehero.cn 
return

MenuHandler_exit:
ExitApp
return

;屏幕截图
!q::Run "%A_WorkingDir%/lib/screensnap.exe"
return

;打开桌面上的a.txt文件
!a::Run "%A_WorkingDir%/lib/a.txt"

;音量控制，Win+F10~F12
#F11::Send {Volume_Up 1}  ; Raise the master volume by 1 interval (typically 5%).
#F10::Send {Volume_Down 3}  ; Lower the master volume by 3 intervals.这里如果不加参数的话就是默认5
#F12::Send {Volume_Mute};
return

;实现快捷键复制文件路径
^+c::
send ^c
sleep,200
clipboard=%clipboard% ;%null%
tooltip,%clipboard%
sleep,300
tooltip,
return


