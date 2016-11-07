import os

def createBatFile():
	return open("setup.bat","w")

def createSpaceInProgramFiles(text_file):
	text_file.write('@echo off\n')
	text_file.write('\n')
	text_file.write(':: BatchGotAdmin\n')
	text_file.write(':-------------------------------------\n')
	text_file.write('REM  --> Check for permissions\n')
	text_file.write('    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (\n')
	text_file.write('>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"\n')
	text_file.write(') ELSE (\n')
	text_file.write('>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"\n')
	text_file.write(')\n')
	text_file.write('\n')
	text_file.write('REM --> If error flag set, we do not have admin.\n')
	text_file.write('if \'%errorlevel%\' NEQ \'0\' (\n')
	text_file.write('    echo Requesting administrative privileges...\n')
	text_file.write('    goto UACPrompt\n')
	text_file.write(') else ( goto gotAdmin )\n')
	text_file.write('\n')
	text_file.write(':UACPrompt\n')
	text_file.write('    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"\n')
	text_file.write('    set params = %*:"=""\n')
	text_file.write('    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"\n')
	text_file.write('\n')
	text_file.write('    "%temp%\getadmin.vbs"\n')
	text_file.write('    del "%temp%\getadmin.vbs"\n')
	text_file.write('    exit /B\n')
	text_file.write('\n')
	text_file.write(':gotAdmin\n')
	text_file.write('    pushd "%CD%"\n')
	text_file.write('    CD /D "%~dp0"\n')
	text_file.write(':-------------------------------------- \n')
	text_file.write('\n')
	text_file.write('@echo off\n')
	text_file.write('TITLE Installing Gila_Breath_Camp\n')
	text_file.write('cd C:\Program Files\n')
	text_file.write('if exist "Gila_Breath_Camp" (\n')
	text_file.write('	echo Gila_Breath_Camp already exist\n')
	text_file.write('	rmdir Gila_Breath_Camp\n')
	text_file.write('	echo removed Gila_Breath_Camp\n')
	text_file.write('	mkdir Gila_Breath_Camp\n')
	text_file.write('	echo created new folder Gila_Breath_Camp\n')
	text_file.write(') else (\n')
	text_file.write('	mkdir Gila_Breath_Camp\n')
	text_file.write('	echo created folder Gila_Breath_Camp\n')
	text_file.write(')\n')
	text_file.write('cd Gila_Breath_Camp\n')
	text_file.write('PAUSE\n')
	text_file.write('\n')

def makeMkdir():
	files = [f for f in os.listdir('.') if os.path.isfile(f)]
	for f in files:
		print(f)
	print([os.path.abspath(name) for name in os.listdir(".") if os.path.isdir(name)])
	text_file.write("mkdir")

def main():
	text_file = createBatFile()
	createSpaceInProgramFiles(text_file)

	#End of line
	text_file.write('\n')

#main()
makeMkdir()

