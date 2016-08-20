NumpadIns & NumpadClear::
send {Media_Play_Pause}
return

NumpadIns & NumpadLeft::
send {Media_Prev}
return

NumpadIns & NumpadRight::
send {Media_Next}
return

;show desktop on 0 + 2 click
NumpadIns & NumpadDown::
Run explore C:\Users\Alexander\Desktop
return

; change sound output:  speaker or headphones
#include VA.ahk	;VA.ahk has to be in the same folder as this script
#Persistent	;this keeps the script running if no hotkeys are set (though one is)

;TOGGLE HEADPHONES AND SPEAKERS (if those are the only 2 playback devices enabled)
NumpadIns & NumpadPgUp::   ;Win+h toggles headphones / speakers
Toggle := !Toggle
VA_SetDefaultEndpoint("playback:" (Toggle ? 1 : 2), 0)
if (Toggle) {
Menu, Tray, Icon, head.ico,,1
}
else {
Menu, Tray, Icon, speak.ico,,1
}
return




; Show / hide spotify window
NumpadIns & NumpadEnd::
If ProcessExist("Spotify.exe")
{
	IfWinActive ahk_class SpotifyMainWindow
	{
		WinMinimize, ahk_class SpotifyMainWindow 
		WinHide, ahk_class SpotifyMainWindow
	}
	else
	{
		WinShow, ahk_class SpotifyMainWindow 
		winactivate, ahk_class SpotifyMainWindow 
			
	}
}
else If !ProcessExist("Spotify.exe")
{
	Run, C:\Users\Alexander\AppData\Roaming\Spotify\Spotify.exe
}
return

ProcessExist(Name){
	Process,Exist,%Name%
	return Errorlevel
}