#Requires AutoHotkey v2.0
#SingleInstance Force
dx := 0x00CB ; Horizontal distance
dy := 0x0010 ; Vertical distance
isAutoModeOpen := false

TaskRuner()
{
    ; 不毛之地开任务
    Send "{e down}"
    Sleep 1500
    Send "{e up}"
}

Jump()
{
    ; 按下空格键
    Send "{space down}"
    Sleep 50
    Send "{space up}"
    Sleep 300
}

MoveMouseX(x)
{

    DllCall("mouse_event", "UInt", 0x0001, "Int", x, "Int", 0x0000)
    Sleep 100

}

JumpAndTurn()
{
    ; 循环跳动，并且转换镜头
    Sleep 700
    Jump()
    Sleep 300
    Jump()
    Sleep 500
    Send "{v}" 
    Sleep 1000
    ; 转头
    MoveMouseX(-2 * dx)
}

#HotIf WinActive("ahk_exe M1-Win64-Shipping.exe")
XButton1:: 
{      
    global isAutoModeOpen
    If (isAutoModeOpen)
    {
        isAutoModeOpen := false
        Send "{w up}"
        SetTimer JumpAndTurn, 0
    }
    else
    {
        isAutoModeOpen := true
        ; 使用计时器
        SetTimer JumpAndTurn, 800
        ; Send "{c}"
        ; 按住W前进
        Send "{w down}"
        Sleep 700
    }

    return    
}

#HotIf WinActive("ahk_exe M1-Win64-Shipping.exe")
XButton2:: 
{   
    ; 长按F2 2秒
    Send "{F2 down}"
    Sleep 2000
    Send "{F2 up}"

    Sleep 3000

    ; 长按R 2秒
    Send "{r down}"
    Sleep 2000
    Send "{r up}"
        
}

#HotIf WinActive("ahk_exe M1-Win64-Shipping.exe")
F1::
{   
    SetTimer TaskRuner, 200
}

#HotIf WinActive("ahk_exe M1-Win64-Shipping.exe")
F2::
{
    SetTimer TaskRuner, 0
}