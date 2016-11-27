import os
import PIL.Image
import io
import re

def createBatFile():
	return open("setup.bat","w")

def createSpaceInProgramFiles(text_file,filename):
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
	text_file.write('TITLE Installing ' + filename + '\n')
	text_file.write('cd C:\Program Files\n')
	text_file.write('if exist "' + filename + '" (\n')
	text_file.write('	echo ' + filename + ' already exist\n')
	text_file.write('	rmdir ' + filename + '\n')
	text_file.write('	echo removed ' + filename + '\n')
	text_file.write('	mkdir ' + filename + '\n')
	text_file.write('	echo created new folder ' + filename + '\n')
	text_file.write(') else (\n')
	text_file.write('	mkdir ' + filename + '\n')
	text_file.write('	echo created folder ' + filename + '\n')
	text_file.write(')\n')
	text_file.write('cd ' + filename + '\n')
	text_file.write('PAUSE\n')
	text_file.write('\n')

def differentiateFilesFolders(file_path):
	all_folders_files = [name for name in os.listdir(file_path)]
	segregate_folders_files = {'folders':[],'files':[],'path':''}
	for name in all_folders_files:
		if name not in ['__pycache__'] and name[-4:] not in ['.pyc']:
			if name.find('.') !=  -1:
				segregate_folders_files['files'].append(name)
			else:
				segregate_folders_files['folders'].append(name)
	return segregate_folders_files

def makeLevel(file_path):
	""" Make one level at which files are present """
	all_level = []
	stop_flag = 0
	level = 0
	last_filename = file_path.split('\\')[-1]
	parent = last_filename
	path = file_path
	continue_flag = 0

	seed = differentiateFilesFolders(path)
	for i in range(0,len(seed['folders'])):
		level_dict = {'level':'','parent':'','file_name':'','type':'','path':'','continue':''}
		level_dict['level'] = level
		level_dict['parent'] = parent
		level_dict['file_name'] = seed['folders'][i]
		if '.txt' in level_dict['file_name']:
			level_dict['type'] = 'TEXT'
		elif '.' not in level_dict['file_name']:
			level_dict['type'] = 'FOLDER'
			continue_flag = 1
		level_dict['continue'] = continue_flag
		level_dict['path'] = path
		all_level.append(level_dict)
		level += 1

	return all_level

def makeAllLevels(file_path,proj_name):
	""" Make all levels at which files are present """
	all_levels = makeLevel(file_path)
	print(all_levels)
#	for i in 
#	while all_levels
	

def imagetopy(image, output_file):
	image_data = None
	with open(image, 'rb') as fin:
		image_data = fin.read()

	with open(output_file, 'w') as fout:
		fout.write('image_data = '+ repr(image_data))

def pytoimage(pyfile):
	pymodule = __import__(pyfile)
	img = PIL.Image.open(io.BytesIO(pymodule.image_data))
	img.show()

def main():
	#text_file = createBatFile()
	#createSpaceInProgramFiles(text_file)
	#file_path = input('Enter the path plus the folder name for which you need to create setup.exe :\n')
	file_path = "C:\Rohan\CGU\Fall 2016\Software Development\BitBucket\software_development_cgu\Gila_Breath_Camp\\folder"
	#file_path = file_path.replace("\\","\\\\")
	#print(file_path)
	#jpgfile = Image.open("Pic.jpg")
	#End of line
	levels = makeAllLevels(file_path,"C:\Program Files\Gila_Breath_Camp")
	#text_file.write('\n')
	print(levels)

main()






