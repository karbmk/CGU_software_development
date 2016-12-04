import os
import PIL.Image
import io
import re
import copy
from csv import DictWriter
os.system("chcp 65001")

def createBatFile(text_file,proj_name,levels):
	
	createSpaceInProgramFiles(text_file,proj_name,levels)
	copyHtmlFiles(text_file,proj_name)
	makeFolders(text_file,levels)
	makeTextCsvFiles(text_file,levels)

def makeProperPathInLevels(text_file,levels,file_path,proj_name):
	for i in range(0,len(levels)):
		replace_with = 'C:\\Program Files\\' + proj_name
		levels[i]['new_path'] = levels[i]['path'].replace(file_path,replace_with)
	return levels

def makeFolders(text_file,levels):
	""" make folders statement """
	all_levels = []
	for j in range(0,len(levels)):
		if levels[j]['level'] not in all_levels:
			all_levels.append(levels[j]['level'])
			all_levels.sort()

	for level in all_levels:
		for i in range(0,len(levels)):
			if levels[i]['type'] == 'FOLDER' and levels[i]['level'] == level:
				text_file.write('cd ' + levels[i]['new_path'] + '\n')
				text_file.write('mkdir ' + levels[i]['file_name'] + '\n')

def delFolders(text_file,levels):
	""" make folders statement """
	all_levels = []
	for j in range(0,len(levels)):
		if levels[j]['level'] not in all_levels:
			all_levels.append(levels[j]['level'])
			all_levels.sort()
			all_levels.reverse()

	for level in all_levels:
		for i in range(0,len(levels)):
			if levels[i]['type'] == 'FOLDER' and levels[i]['level'] == level:
				text_file.write('cd ' + levels[i]['new_path'] + '\n')
				text_file.write('rmdir ' + levels[i]['file_name'] + '\n')

def makeTextCsvFiles(text_file,levels):
	""" make folders statement """
	all_levels = []
	for j in range(0,len(levels)):
		if levels[j]['level'] not in all_levels:
			all_levels.append(levels[j]['level'])

	for level in all_levels:
		for i in range(0,len(levels)):
			if levels[i]['type'] not in ['PNG','JPG','HTML','FOLDER','JS','CSS'] and levels[i]['level'] == level:
				text_file.write('echo copying ' + levels[i]['new_path'] + '\\' + levels[i]['file_name'] + '\n')
				text_file.write('cd ' + levels[i]['new_path'] + '\n')
				#print(levels[i]['path'] + '\\' + levels[i]['file_name'])
				with open(levels[i]['path'] + '\\' + levels[i]['file_name'] , "r") as myfile:
					for line in myfile:
						#print(line)
						if line.strip() == '':
							text_file.write('echo.>> ' + levels[i]['file_name'] + '\n')
						else:
							text_file.write('echo ' + line.rstrip('\n').replace('|','^|').replace('&','^&').replace('"""','^"""').replace('>','^>').replace('<','^<').replace('%','^%%') + ' >> ' + levels[i]['file_name'] + '\n')							

def copyHtmlFiles(text_file,proj_name):
	file_path = os.getcwd()
	new_file_path = 'C:\\Program Files\\' + proj_name
	text_file.write('cd %var%\n')
	text_file.write('mkdir Static\n')
	text_file.write('ROBOCOPY ".\\Static" "' + new_file_path + '\\Static' + '" /S\n')

def delTextCsvFiles(text_file,levels):
	""" make folders statement """
	all_levels = []
	for j in range(0,len(levels)):
		if levels[j]['level'] not in all_levels:
			all_levels.append(levels[j]['level'])
			all_levels.sort()
			all_levels.reverse()

	for level in all_levels:
		for i in range(0,len(levels)):
			if levels[i]['type'] not in ['PNG','JPG','HTML','FOLDER'] and levels[i]['level'] == level:
				text_file.write('cd ' + levels[i]['new_path'] + '\n')
				text_file.write('del ' + levels[i]['file_name'] + '\n')

def createSpaceInProgramFiles(text_file,filename,levels):
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
	text_file.write('set "var=%cd%"\n')
	text_file.write('TITLE Installing ' + filename + '\n')
	text_file.write('cd C:\Program Files\n')
	text_file.write('if exist "' + filename + '" (\n')
	text_file.write('	echo ' + filename + ' already exist\n')
	delTextCsvFiles(text_file,levels)
	delFolders(text_file,levels)
	text_file.write('cd C:\Program Files\n')
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

def findFilesFolders(file_path):
	all_folders_files = [name for name in os.listdir(file_path)]
	segregate_folders_files = {'file_names':[],'path':''}
	for name in all_folders_files:
		if name not in ['__pycache__','Dustbin','.DS_Store','db.sqlite3','applicant_11_17_2016.csv','applicant_old.csv','Static'] and name[-4:] not in ['.pyc','.bat']:
			segregate_folders_files['file_names'].append(name)
	return segregate_folders_files

def makeLevels(text_file,continue_flag,level,file_path):
	""" Make one level at which files are present """
	if continue_flag == 1:
		return []
	else:
		all_level = []
		stop_flag = 0
		last_filename = file_path.split('\\')[-1]
		parent = last_filename
		path = file_path
		continue_flag = 0
		seed = findFilesFolders(path)
		for i in range(0,len(seed['file_names'])):
			level_dict = {'level':'','parent':'','file_name':'','type':'','path':''}
			level_dict['level'] = level
			level_dict['parent'] = parent
			level_dict['file_name'] = seed['file_names'][i]
			level_dict['path'] = path
			all_level.append(level_dict)
			if '.txt' in level_dict['file_name']:
				level_dict['type'] = 'TEXT'
				continue_flag = 1
			elif '.csv' in level_dict['file_name']:
				level_dict['type'] = 'CSV'
				continue_flag = 1
			elif '.py' in level_dict['file_name']:
				level_dict['type'] = 'PYTHON'
				continue_flag = 1
			elif '.png' in level_dict['file_name']:
				level_dict['type'] = 'PNG'
				continue_flag = 1
			elif '.jpg' in level_dict['file_name']:
				level_dict['type'] = 'JPG'
				continue_flag = 1
			elif '.js' in level_dict['file_name']:
				level_dict['type'] = 'JS'
				continue_flag = 1
			elif '.html' in level_dict['file_name']:
				level_dict['type'] = 'HTML'
				continue_flag = 1
			elif '.css' in level_dict['file_name']:
				level_dict['type'] = 'CSS'
				continue_flag = 1
			elif '.' not in level_dict['file_name']:
				level_dict['type'] = 'FOLDER'
				#text_file.write('echo copying ' + file_path + '\\' + level_dict['file_name'] + '\n')
				all_level = all_level + makeLevels(text_file,0,level + 1,file_path + '\\' + level_dict['file_name'])

	return all_level

def printLod(lod,header):
	with open('out1.csv','w') as outfile:
		writer = DictWriter(outfile, tuple(header))
		writer.writeheader()
		writer.writerows(lod)

def imagetopy(image,output_file):
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
#	file_path = "C:\Rohan\CGU\Fall 2016\Software Development\BitBucket\software_development_cgu\Gila_Breath_Camp\\folder"
	file_path = "C:\Rohan\CGU\Fall 2016\Software Development\BitBucket\software_development_cgu\Gila_Breath_Camp\Code"
	proj_name = 'Gila_Breath_Camp'
	#file_path = file_path.replace("\\","\\\\")
	#print(file_path)
	#jpgfile = Image.open("Pic.jpg")
	#End of line
	text_file = open(proj_name + "_setup.bat","w")
	levels = makeLevels(text_file,0,0,file_path)
	levels = makeProperPathInLevels(text_file,levels,file_path,proj_name)
	print(levels[0]['path'])
	#header = ['level','parent','file_name','type','path']
	createBatFile(text_file,proj_name,levels)
	#text_file.write('\n')

main()


