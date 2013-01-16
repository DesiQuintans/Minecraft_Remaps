;
; Minecraft Remaps (Toggle Digging and Autowalk) v5
; Author:			Desi Quintans <me@desiquintans.com>
; Website:			http://www.desiquintans.com

#NoEnv
#SingleInstance, Force
SendMode Input
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 3

IfWinNotExist, Minecraft
{
	IfWinNotExist, Minecraft Launcher
	{
		Run, Minecraft.exe
		WinWait, Minecraft
	}
}
SetTimer, AutoClose, 5000

#IfWinActive, Minecraft
{			
	;	1) Mouse 3/Mouse4/Z toggle hold-left-click. Handy for breaking lots of blocks or mining obsidian.
			*XButton1::
				Send % "{LButton " ((Cnt := !Cnt) ? "Down}" : "Up}")
			return

	;	2) Home toggles autowalking on and off, allowing you to move forward without holding down the
	;		key. Use with mouse-hold toggle for automated mining action!
			*Home::Send % "{w " ((Cnt2 := !Cnt2) ? "Down}" : "Up}")

	;	6) Holding MButton spams left-click. No longer click 64 times when crafting a stack.
			*MButton::SpamKey("MButton", "LButton")
}

AutoClose:
	IfWinNotExist, Minecraft
	{
		ExitApp
	}
return

SpamKey(trigger, target)
{
	Loop
	{
	    if GetKeyState(trigger, "P") = 0
	    	Break
	    	
		Send {%target%}
		Sleep, 1
	}
	return
}