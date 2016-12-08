@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:-------------------------------------- 

@echo off
set "var=%cd%"
TITLE Installing Gila_Breath_Camp
cd C:\Program Files
if exist "Gila_Breath_Camp" (
	echo Gila_Breath_Camp already exist
cd C:\Program Files\Gila_Breath_Camp\Python\Entities
del applicant.py
cd C:\Program Files\Gila_Breath_Camp\Python\Entities
del bunkhouse.py
cd C:\Program Files\Gila_Breath_Camp\Python\Entities
del date.py
cd C:\Program Files\Gila_Breath_Camp\Python\Entities
del transactions.py
cd C:\Program Files\Gila_Breath_Camp\Python\Entities
del tribe.py
cd C:\Program Files\Gila_Breath_Camp\Python\Entities
del user.py
cd C:\Program Files\Gila_Breath_Camp\Python\User_Stories
del application_cancellation.py
cd C:\Program Files\Gila_Breath_Camp\Python\User_Stories
del application_status.py
cd C:\Program Files\Gila_Breath_Camp\Python\User_Stories
del assignment_of_bunkhouses.py
cd C:\Program Files\Gila_Breath_Camp\Python\User_Stories
del assignment_of_tribes.py
cd C:\Program Files\Gila_Breath_Camp\Python\User_Stories
del cancellation.py
cd C:\Program Files\Gila_Breath_Camp\Python\User_Stories
del check_in_status.py
cd C:\Program Files\Gila_Breath_Camp\Python\User_Stories
del choose_date.py
cd C:\Program Files\Gila_Breath_Camp\Python\User_Stories
del printing_of_acceptance_or_rejection_notice.py
cd C:\Program Files\Gila_Breath_Camp\Python\User_Stories
del priorities.py
cd C:\Program Files\Gila_Breath_Camp\Python\User_Stories
del registration.py
cd C:\Program Files\Gila_Breath_Camp\Textfiles\Prints
del JEMIN_GOHIL_1_rejection_letter.txt
cd C:\Program Files\Gila_Breath_Camp\Textfiles\Prints
del JEMIN_GOHIL_3_acception_letter.txt
cd C:\Program Files\Gila_Breath_Camp\Textfiles\Prints
del JEMIN_GOHIL_3_rejection_letter.txt
cd C:\Program Files\Gila_Breath_Camp\Textfiles\Prints
del KATHIK_BASAVANAHALLI_2_acception_letter.txt
cd C:\Program Files\Gila_Breath_Camp\Textfiles\Prints
del SACHIN_TENDULKAR_5_rejection_letter.txt
cd C:\Program Files\Gila_Breath_Camp\Textfiles\Prints
del VIRAT_KOHLI_6_rejection_letter.txt
cd C:\Program Files\Gila_Breath_Camp\Textfiles\Templates
del a_template.txt
cd C:\Program Files\Gila_Breath_Camp\Textfiles\Templates
del r_template.txt
cd C:\Program Files\Gila_Breath_Camp\Csv
del applicant.csv
cd C:\Program Files\Gila_Breath_Camp\Csv
del date.csv
cd C:\Program Files\Gila_Breath_Camp\Csv
del user.csv
cd C:\Program Files\Gila_Breath_Camp\Main
del settings.py
cd C:\Program Files\Gila_Breath_Camp\Main
del urls.py
cd C:\Program Files\Gila_Breath_Camp\Main
del wsgi.py
cd C:\Program Files\Gila_Breath_Camp\Python
del common_functions.py
cd C:\Program Files\Gila_Breath_Camp\Python
del local_urls.py
cd C:\Program Files\Gila_Breath_Camp\Python
del tests.py
cd C:\Program Files\Gila_Breath_Camp\Python
del views.py
cd C:\Program Files\Gila_Breath_Camp
del manage.py
cd C:\Program Files\Gila_Breath_Camp
del relations.csv
cd C:\Program Files\Gila_Breath_Camp
del test.py
cd C:\Program Files\Gila_Breath_Camp\Python
rmdir Entities
cd C:\Program Files\Gila_Breath_Camp\Python
rmdir User_Stories
cd C:\Program Files\Gila_Breath_Camp\Textfiles
rmdir Prints
cd C:\Program Files\Gila_Breath_Camp\Textfiles
rmdir Templates
cd C:\Program Files\Gila_Breath_Camp
rmdir Csv
cd C:\Program Files\Gila_Breath_Camp
rmdir Main
cd C:\Program Files\Gila_Breath_Camp
rmdir Python
cd C:\Program Files\Gila_Breath_Camp
rmdir Textfiles
cd C:\Program Files
	rmdir Gila_Breath_Camp
	echo removed Gila_Breath_Camp
	mkdir Gila_Breath_Camp
	echo created new folder Gila_Breath_Camp
) else (
	mkdir Gila_Breath_Camp
	echo created folder Gila_Breath_Camp
)
cd Gila_Breath_Camp
PAUSE

cd %var%
mkdir Static
ROBOCOPY ".\Static" "C:\Program Files\Gila_Breath_Camp\Static" /S
cd C:\Program Files\Gila_Breath_Camp
mkdir Csv
cd C:\Program Files\Gila_Breath_Camp
mkdir Main
cd C:\Program Files\Gila_Breath_Camp
mkdir Python
cd C:\Program Files\Gila_Breath_Camp
mkdir Textfiles
cd C:\Program Files\Gila_Breath_Camp\Python
mkdir Entities
cd C:\Program Files\Gila_Breath_Camp\Python
mkdir User_Stories
cd C:\Program Files\Gila_Breath_Camp\Textfiles
mkdir Prints
cd C:\Program Files\Gila_Breath_Camp\Textfiles
mkdir Templates
echo copying C:\Program Files\Gila_Breath_Camp\manage.py
cd C:\Program Files\Gila_Breath_Camp
echo #!/usr/bin/env python >> manage.py
echo import os >> manage.py
echo import sys >> manage.py
echo.>> manage.py
echo os.system("chcp 65001") >> manage.py
echo.>> manage.py
echo if __name__ == "__main__": >> manage.py
echo     os.environ.setdefault("DJANGO_SETTINGS_MODULE", "Main.settings") >> manage.py
echo     try: >> manage.py
echo         from django.core.management import execute_from_command_line >> manage.py
echo     except ImportError: >> manage.py
echo         # The above import may fail for some other reason. Ensure that the >> manage.py
echo         # issue is really that Django is missing to avoid masking other >> manage.py
echo         # exceptions on Python 2. >> manage.py
echo         try: >> manage.py
echo             import django >> manage.py
echo         except ImportError: >> manage.py
echo             raise ImportError( >> manage.py
echo                 "Couldn't import Django. Are you sure it's installed and " >> manage.py
echo                 "available on your PYTHONPATH environment variable? Did you " >> manage.py
echo                 "forget to activate a virtual environment?" >> manage.py
echo             ) >> manage.py
echo         raise >> manage.py
echo     execute_from_command_line(sys.argv) >> manage.py
echo copying C:\Program Files\Gila_Breath_Camp\relations.csv
cd C:\Program Files\Gila_Breath_Camp
echo "filename","column">> relations.csv
echo "user.csv","user_id">> relations.csv
echo "applicant.csv","applicant_id">> relations.csv
echo "transactions.csv","transaction_id">> relations.csv
echo copying C:\Program Files\Gila_Breath_Camp\test.py
cd C:\Program Files\Gila_Breath_Camp
echo def setSequence(csv_data,input_list): >> test.py
echo 	^""" Returns a list in a sequence putting data in csv as first ^""" >> test.py
echo 	output_list = [csv_data] >> test.py
echo.>> test.py
echo 	for i in range(0,len(input_list)): >> test.py
echo 		if input_list[i] != csv_data: >> test.py
echo 			output_list.append(input_list[i]) >> test.py
echo.>> test.py
echo 	return output_list >> test.py
echo.>> test.py
echo.>> test.py
echo copying C:\Program Files\Gila_Breath_Camp\Csv\applicant.csv
cd C:\Program Files\Gila_Breath_Camp\Csv
echo "applicant_id","user_id","bunkhouse_id","tribe_id","camp_time_slots","applicant_first_name","applicant_last_name","applicant_age","applicant_gender","applicant_address","guardian_first_name","guardian_last_name","guardian_contact_number","guardian_address","application_date","emergency_contact","payment","medical_form","legal_form","helmet","boot","sleeping_bag","water_bottle","sunscreen","bugs_spray","check_in_status","application_status","acceptance_packet","mailing_date","rejected_reason","guardian_ssn","cancel_flag","refund","cancel_date","applicant_name_together_with","applicant_id_together_with","applicant_name_not_together_with","applicant_id_not_together_with">> applicant.csv
echo "1","1","","","2017-02-12 00:00:00.000000","JEMIN","GOHIL","21","MALE","Cecilia Chapman, 711-2880 Nulla St. Mankato Mississippi -96522, (257)563-7401","SANJIV","GOHIL","9098912122","Cecilia Chapman, 711-2880 Nulla St. Mankato Mississippi -96522, (257)563-7401","2016-11-20 15:54:13.327180","9098912122","1000","","","","","","","","","","0","","","AGE IS NOT BETWEEN 8 AND 19","342-909-8982","","","","TENDULKAR, SACHIN","3","RAO, JAYANT","8">> applicant.csv
echo "2","1","","","2017-02-12 00:00:00.000000","KATHIK","BASAVANAHALLI","16","MALE","Calista Wise, 7292 Dictum Av. San Antonio MI 47096, (492)709-6392","MANJUNATH","BASAVANAHALLI","9096751122","Calista Wise, 7292 Dictum Av. San Antonio MI 47096, (492)709-6392","2016-11-23 15:54:13.327180","1","1000","1","1","1","1","1","1","1","1","1","1","1","2016-12-07 19:50:14.826527","NO VIOLATIONS","343-10-1212","0","","","NONE","NONE","NONE","NONE">> applicant.csv
echo "3","1","1","","2017-02-12 00:00:00.000000","SACHIN","TENDULKAR","10","MALE","Bandra, Mumbai","RAMESH","TENDULKAR","9099099099","Bandra, Mumbai","2016-11-24 12:40:19.105645","1","10000","1","1","1","1","1","1","1","1","1","1","1","2016-11-24 13:10:39.878099","NO VIOLATIONS","000-11-2222","1","9900.0","2016-12-07 20:45:45.286525","NONE","NONE","NONE","NONE">> applicant.csv
echo "4","1","3","","2017-02-12 00:00:00.000000","VIRAT","KOHLI","18","MALE","Delhi, India","MR","KOHLI","9899899899","Delhi, India","2016-11-24 12:50:46.615292","1","1000","1","1","1","1","1","1","1","1","1","1","1","2016-11-29 13:28:25.049243","NO VIOLATIONS","000-11-1111","1","900.0","2016-12-07 20:45:45.286525","BASAVANAHALLI, KATHIK","2","NONE","NONE">> applicant.csv
echo "5","1","2","","2017-02-12 00:00:00.000000","SURESH","RAINA","13","MALE","100, N. Mills Ave, Claremont California -91711","MR","RAINA","9090099009","100, N. Mills Ave, Claremont California -91711","2016-11-26 17:22:11.901116","1","1000","1","1","1","1","1","1","1","1","1","1","1","2016-11-29 13:29:13.353150","NO VIOLATIONS","123-45-6789","1","900.0","2016-12-07 20:45:45.290526","GOHIL, JEMIN","1","NONE","NONE">> applicant.csv
echo "6","1","2","","2017-02-12 00:00:00.000000","RICKY","P ONTING","11","MALE","Australia","GREAME","PONTING","1234567890","Australia","2016-11-26 19:03:08.001738","0","1200","0","0","0","0","0","0","0","0","0","1","1","2016-11-29 14:42:04.905432","NO VIOLATIONS","000-00-0000","1","1100.0","2016-12-07 20:45:45.290526","KOHLI, VIRAT","4","NONE","NONE">> applicant.csv
echo "7","1","4.0","","2017-02-12 00:00:00.000000","SONAL","RYDER","9","FEMALE","1244 West Main Stamford,CA 069122 USA","ZACKIE","RYDER","2033528600","1244 West Main Stamford,CA 069122 USA","2016-11-26 21:17:05.899819","1","1000","1","1","1","1","1","1","1","1","1","1","","","NO VIOLATIONS","100-22-3333","0","","","NONE","NONE","NONE","NONE">> applicant.csv
echo "8","1","1","","2017-02-12 00:00:00.000000","JAYANT","RAO","17","MALE","Kalyan, India - 421304","GOVIND","RAO","9093447086","Kalyan, India - 421304","2016-11-26 21:19:52.986987","0","1150","0","0","0","0","0","0","0","0","0","1","","","NO VIOLATIONS","110-11-1234","0","","","BASAVANAHALLI, KATHIK","2","NONE","NONE">> applicant.csv
echo "9","1","3","","2017-02-12 00:00:00.000000","JAMES","BUTT","12","MALE","6649 N Blue Gum St, New Orleans, Orleans, LA 70116","FRANCOISE","BUTT","5199786179","6649 N Blue Gum St, New Orleans, Orleans, LA 70116","2016-11-26 21:22:44.662888","0","1300","0","0","0","0","0","0","0","0","0","1","","","NO VIOLATIONS","234-11-7788","0","","","NONE","NONE","NONE","NONE">> applicant.csv
echo "10","1","3","","2017-02-12 00:00:00.000000","MITSUE","TOLLNER","15","MALE","7 Eads St, Chicago, Cook, IL 60632","HUI","TOLLNER","5062764830","7 Eads St, Chicago, Cook, IL 60632","2016-11-26 21:25:52.208938","0","1000","0","0","0","0","0","0","0","0","0","1","","","NO VIOLATIONS","123-45-6666","0","","","NONE","NONE","NONE","NONE">> applicant.csv
echo "11","1","1","","2017-02-12 00:00:00.000000","YUKI","WHOBREY","9","MALE","1 State Route 27, Taylor, Wayne, MI 48180","VALENTIN","WHOBREY","3063167477","1 State Route 27, Taylor, Wayne, MI 48180","2016-11-26 21:28:33.525999","0","1000","0","0","0","0","0","0","0","0","0","1","","","NO VIOLATIONS","111-00-2222","0","","","HOLLACK, CECILY","14","NONE","NONE">> applicant.csv
echo "12","1","3","","2017-02-12 00:00:00.000000","WILLOW","KUSKO","18","MALE","90991 Thorburn Ave, New York, New York, NY 10011","ANDREE","CHRISTMANN","5196484096","90991 Thorburn Ave, New York, New York, NY 10011","2016-11-26 21:31:29.549194","0","1100","0","0","0","0","0","0","0","0","0","1","","","NO VIOLATIONS","012-34-5678","0","","","NONE","NONE","NONE","NONE">> applicant.csv
echo "13","1","1","","2017-02-12 00:00:00.000000","JAMAL","VANAUSDAL","15","MALE","53075 Sw 152nd Ter #615, Monroe Township, Middlesex, NJ 8831","EURA","VANAUSDAL","3068138269","53075 Sw 152nd Ter #615, Monroe Township, Middlesex, NJ 8831","2016-11-26 21:34:23.122980","0","1000","0","0","0","0","0","0","0","0","0","1","","","NO VIOLATIONS","102-22-1234","0","","","NONE","NONE","NONE","NONE">> applicant.csv
echo "14","1","3","","2017-02-12 00:00:00.000000","CECILY","HOLLACK","10","MALE","59 N Groesbeck Hwy, Austin, Travis, TX 78731","LANG","HOLLACK","5198643447","59 N Groesbeck Hwy, Austin, Travis, TX 78731","2016-11-26 21:38:29.959583","0","1000","0","0","0","0","0","0","0","0","0","1","","","NO VIOLATIONS","111-23-4567","0","","","NONE","NONE","NONE","NONE">> applicant.csv
echo "15","1","","","2017-01-08 00:00:00.000000","WILLIAM","GOLDBERG","15","MALE","Bonsall, California, United States","GOLDBERG","SCOTT","9199092912","Bonsall, California, United States","2016-11-27 16:03:07.933956","9199092912","1200","","","","","","","","","","","","","DATE OF REGISTRATION HAS SURPASSED","110-00-0000","","","","","","","">> applicant.csv
echo "16","1","3","","2017-02-12 00:00:00.000000","KATHIK","BASAVANAHALLI","16","MALE","Calista Wise, 7292 Dictum Av. San Antonio MI 47096","MANJUNATH","BASAVANAHALLI","9096751122","Calista Wise, 7292 Dictum Av. San Antonio MI 47096","2016-11-27 16:18:13.792583","0","1200","0","0","0","0","0","0","0","0","0","1","","","NO VIOLATIONS","112-00-3231","0","","","NONE","NONE","NONE","NONE">> applicant.csv
echo "17","1","","","2017-01-08 00:00:00.000000","EMMA","WATSON","27","FEMALE","840 Wood St, Clarion, PA 16214, USA","MR","WATSON","1234567890","840 Wood St, Clarion, PA 16214, USA","2016-11-29 00:10:25.697534","1234567890","1000","s^""""","","","","","","","","","","","","DATE OF REGISTRATION HAS SURPASSED","134-44-6483","","","","","","","">> applicant.csv
echo "18","1","5.0","","2017-02-12 00:00:00.000000","SNIVY","RYDER","9","FEMALE","1241 East Main Street Stamford, CT 06902 USA","ZACK","RYDER","2033528600","1241 East Main Street Stamford, CT 06902 USA","2016-11-29 14:07:31.173355","1","1200","1","1","1","1","1","1","1","1","1","1","1","2016-11-29 14:42:04.946597","NO VIOLATIONS","001-11-2121","0","","","MACLEAD, ABEL","22","HOLLACK, CECILY","14">> applicant.csv
echo "19","1","5.0","","2017-02-12 00:00:00.000000","KANCHAN","GHONGE","16","FEMALE","SDV, Airoli, Maharashtra, India","VAIBHAV","GHONGE","9191919110","SDV, Airoli, Maharashtra, India","2016-11-29 14:10:22.605823","1","1000","1","1","1","1","1","1","1","1","1","1","","","NO VIOLATIONS","100-99-8787","0","","","NONE","NONE","NONE","NONE">> applicant.csv
echo "20","1","4.0","","2017-02-12 00:00:00.000000","JOSEPHINE","DARAKJY","15","FEMALE","4 B Blue Ridge Blvd, Brighton, Livingston, MI 48116","KENDRA","DARAKJY","5069324472","4 B Blue Ridge Blvd, Brighton, Livingston, MI 48116","2016-11-29 14:12:21.495608","0","1000","0","0","0","0","0","0","0","0","0","1","1","2016-11-29 14:42:04.949794","NO VIOLATIONS","090-87-8989","0","","","MARRIER, KRIS","21","NONE","NONE">> applicant.csv
echo "21","1","4.0","","2017-02-12 00:00:00.000000","KRIS","MARRIER","17","FEMALE","228 Runamuck Pl #2808, Baltimore, Baltimore City, MD 21224","PAOLA","MARRIER","9052637711","228 Runamuck Pl #2808, Baltimore, Baltimore City, MD 21224","2016-11-29 14:14:47.074711","0","1001","0","0","0","0","0","0","0","0","0","1","","","NO VIOLATIONS","201-34-5678","0","","","NONE","NONE","DARAKJY, JOSEPHINE","20">> applicant.csv
echo "22","1","4.0","","2017-02-12 00:00:00.000000","ABEL","MACLEAD","13","FEMALE","37275 St Rt 17m M, Middle Island, Suffolk, NY 11953","LEANNA","TIJERINA","4166581773","37275 St Rt 17m M, Middle Island, Suffolk, NY 11953","2016-11-29 14:17:11.715827","1","1000","1","1","1","1","1","1","1","1","1","1","","","NO VIOLATIONS","101-11-1213","0","","","MARRIER, KRIS","21","NONE","NONE">> applicant.csv
echo "23","1","5.0","","2017-02-12 00:00:00.000000","GRACIELA","RUTA","18","FEMALE","98 Connecticut Ave Nw, Chagrin Falls, Geauga, OH 44023","HUEY","RUTA","7805201241","98 Connecticut Ave Nw, Chagrin Falls, Geauga, OH 44023","2016-11-29 14:20:08.830637","0","1000","0","0","0","0","0","0","0","0","0","1","1","2016-11-29 14:42:04.959151","NO VIOLATIONS","909-99-9999","1","900.0","2016-12-07 20:45:45.290526","NONE","NONE","NONE","NONE">> applicant.csv
echo "24","1","6.0","","2017-02-12 00:00:00.000000","MEAGHAN","GARUFI","9","FEMALE","69734 E Carrillo St, Mc Minnville, Warren, TN 37110","CRISSY","GARUFI","7055236746","69734 E Carrillo St, Mc Minnville, Warren, TN 37110","2016-11-29 14:32:35.169643","1","1000","1","1","1","1","1","1","1","1","1","1","","","NO VIOLATIONS","100-21-0495","0","","","NONE","NONE","NONE","NONE">> applicant.csv
echo "25","1","1","","2017-02-12 00:00:00.000000","CAMMY","ALBARES","18","MALE","56 E Morehead St, Laredo, Webb, TX 78045","APOLONIA","ALBARES","5062211874","56 E Morehead St, Laredo, Webb, TX 78045","2016-11-30 00:39:22.857196","0","1000","0","0","0","0","0","0","0","0","0","1","","","NO VIOLATIONS","120-11-3456","0","","","NONE","NONE","NONE","NONE">> applicant.csv
echo "26","1","4.0","","2017-02-12 00:00:00.000000","GLADYS","RIM","12","FEMALE","322 New Horizon Blvd, Milwaukee, Milwaukee, WI 53207","GIANNA","RIM","4035405944","322 New Horizon Blvd, Milwaukee, Milwaukee, WI 53207","2016-11-30 00:43:42.676066","0","1100","0","0","0","0","0","0","0","0","0","1","","","NO VIOLATIONS","109-11-1234","0","","","NONE","NONE","NONE","NONE">> applicant.csv
echo "27","1","1","","2017-02-12 00:00:00.000000","BETTE","NICKA","10","MALE","6 S 33rd St, Aston, Delaware, PA 19014","WILLARD","NICKA","7808358022","6 S 33rd St, Aston, Delaware, PA 19014","2016-11-30 01:03:00.812204","0","1000","0","0","0","0","0","0","0","0","0","1","1","2016-12-03 23:50:09.762101","NO VIOLATIONS","234-11-9733","0","","","NONE","NONE","NONE","NONE">> applicant.csv
echo "28","1","5.0","","2017-02-12 00:00:00.000000","VERONIKA","INOUYE","15","FEMALE","6 Greenleaf Ave, San Jose, CA 95111","LAURYN","INOUYE","6045975482","6 Greenleaf Ave, San Jose, CA 95111","2016-11-30 11:58:06.931461","0","1000","0","0","0","0","0","0","0","0","0","1","","","NO VIOLATIONS","678-99-5678","0","","","NONE","NONE","NONE","NONE">> applicant.csv
echo "29","1","2","","2017-02-12 00:00:00.000000","BROCK","BOLOGNIA","13","MALE","4486 W O St #1, New York, New York, NY 10003","JILLIAN","BOLOGNIA","9059957113","4486 W O St #1, New York, New York, NY 10003","2016-11-30 12:11:55.620101","0","1000","0","0","0","0","0","0","0","0","0","1","","","NO VIOLATIONS","456-78-9089","0","","","NONE","NONE","NONE","NONE">> applicant.csv
echo "30","1","6.0","","2017-02-12 00:00:00.000000","LORRIE","NESTLE","13","FEMALE","39 S 7th St, Tullahoma, Coffee, TN 37388","LOUIS","NESTLE","4183962430","39 S 7th St, Tullahoma, Coffee, TN 37388","2016-11-30 12:20:16.033092","0","1000","0","0","0","0","0","0","0","0","0","1","","","NO VIOLATIONS","232-11-3438","0","","","NONE","NONE","NONE","NONE">> applicant.csv
echo "31","1","","","2017-02-12 00:00:00.000000","SABRA","UYETAKE","18","MALE","98839 Hawthorne Blvd #6101, Columbia, Richland, SC 29201","EMMETT","UYETAKE","7057798510","98839 Hawthorne Blvd #6101, Columbia, Richland, SC 29201","2016-11-30 12:22:46.773336","0","1000","0","0","0","0","0","0","0","0","0","1","","","NO VIOLATIONS","109-38-7329","0","","","NONE","NONE","NONE","NONE">> applicant.csv
echo "32","1","","","2017-02-12 00:00:00.000000","MARJORY","MASTELLA","16","FEMALE","71 San Mateo Ave, Wayne, Delaware, PA 19087","TAMMY","MASTELLA","2506256517","71 San Mateo Ave, Wayne, Delaware, PA 19087","2016-11-30 12:25:49.931698","0","1000","0","0","0","0","0","0","0","0","0","1","","","NO VIOLATIONS","567-39-8939","0","","","NONE","NONE","NONE","NONE">> applicant.csv
echo "33","1","","","2017-02-12 00:00:00.000000","VIVA","TOELKES","11","MALE","4284 Dorigo Ln, Chicago, Cook, IL 60647","MADONNA","TOELKES","2502815616","4284 Dorigo Ln, Chicago, Cook, IL 60647","2016-11-30 12:28:11.644896","0","1000","0","0","0","0","0","0","0","0","0","1","","","NO VIOLATIONS","392-44-2987","0","","","NONE","NONE","NONE","NONE">> applicant.csv
echo "34","1","","","2017-02-12 00:00:00.000000","ELZA","LIPKE","14","FEMALE","6794 Lake Dr E, Newark, Essex, NJ 7104","CHUCK","BERGGREN","7093746188","6794 Lake Dr E, Newark, Essex, NJ 7104","2016-11-30 12:30:16.211229","0","1100","0","0","0","0","0","0","0","0","0","1","","","NO VIOLATIONS","367-84-7289","0","","","NONE","NONE","NONE","NONE">> applicant.csv
echo "35","1","","","2017-02-12 00:00:00.000000","DEVORAH","CHICKERING","18","MALE","31 Douglas Blvd #950, Clovis, Curry, NM 88101","GREGG","CHICKERING","5142938889","31 Douglas Blvd #950, Clovis, Curry, NM 88101","2016-11-30 12:33:34.011349","0","1000","0","0","0","0","0","0","0","0","0","1","","","NO VIOLATIONS","287-27-4720","0","","","NONE","NONE","NONE","NONE">> applicant.csv
echo "36","1","","","2017-02-12 00:00:00.000000","TIMOTHY","MULQUEEN","15","FEMALE","44 W 4th St, Staten Island, Richmond, NY 10309","YAN","MULQUEEN","5068222002","44 W 4th St, Staten Island, Richmond, NY 10309","2016-11-30 12:35:23.551139","0","1000","0","0","0","0","0","0","0","0","0","1","","","NO VIOLATIONS","289-38-9528","0","","","NONE","NONE","NONE","NONE">> applicant.csv
echo "37","1","","","2017-02-12 00:00:00.000000","ARLETTE","HONEYWELL","15","MALE","11279 Loytan St, Jacksonville, Duval, FL 32254","STEPHANIE","GARLETT","6139981215","11279 Loytan St, Jacksonville, Duval, FL 32254","2016-11-30 12:37:57.786301","0","1000","0","0","0","0","0","0","0","0","0","1","","","NO VIOLATIONS","384-37-3924","0","","","GOHIL, JEMIN","1","NONE","NONE">> applicant.csv
echo "38","1","","","2017-02-12 00:00:00.000000","LETTIE","ISENHOWER","14","FEMALE","70 W Main St, Beachwood, Cuyahoga, OH 44122","WAYNE","ISENHOWER","4183233965","70 W Main St, Beachwood, Cuyahoga, OH 44122","2016-11-30 12:41:23.531034","0","1000","0","0","0","0","0","0","0","0","0","1","","","NO VIOLATIONS","395-94-5837","0","","","NONE","NONE","NONE","NONE">> applicant.csv
echo "39","1","","","2017-02-12 00:00:00.000000","STEPHAINE","BARFIELD","10","FEMALE","47154 Whipple Ave Nw, Gardena, Los Angeles, CA 90247","FLORENCIA","BARFIELD","5192832137","47154 Whipple Ave Nw, Gardena, Los Angeles, CA 90247","2016-11-30 12:44:27.430802","0","1000","0","0","0","0","0","0","0","0","0","1","","","NO VIOLATIONS","219-37-4977","0","","","NONE","NONE","NONE","NONE">> applicant.csv
echo "40","1","","","2017-02-12 00:00:00.000000","STEPHEN","EMIGH","16","MALE","3777 E Richmond St #900, Akron, Summit, OH 44302","FREEMAN","EMIGH","4505867429","3777 E Richmond St #900, Akron, Summit, OH 44302","2016-11-30 13:16:11.454155","0","1000","0","0","0","0","0","0","0","0","0","1","","","NO VIOLATIONS","328-43-4729","0","","","NONE","NONE","NONE","NONE">> applicant.csv
echo "41","1","","","2017-02-12 00:00:00.000000","TAMMARA","WARDRIP","14","FEMALE","4800 Black Horse Pike, Burlingame, San Mateo, CA 94010","ELLSWORTH","WARDRIP","6134146589","4800 Black Horse Pike, Burlingame, San Mateo, CA 94010","2016-11-30 13:18:48.562919","0","1000","0","0","0","0","0","0","0","0","0","1","","","NO VIOLATIONS","280-48-8593","0","","","NONE","NONE","NONE","NONE">> applicant.csv
echo "42","1","","","2017-02-12 00:00:00.000000","ROLLAND","FRANCESCON","16","MALE","2726 Charcot Ave, Paterson, Passaic, NJ 7501","HARLEY","FRANCESCON","5196333173","2726 Charcot Ave, Paterson, Passaic, NJ 7501","2016-11-30 13:21:26.536817","0","1001","0","0","0","0","0","0","0","0","0","1","","","NO VIOLATIONS","347-39-8539","0","","","NONE","NONE","NONE","NONE">> applicant.csv
echo copying C:\Program Files\Gila_Breath_Camp\Csv\date.csv
cd C:\Program Files\Gila_Breath_Camp\Csv
echo "date_id","month","year">> date.csv
echo "1","1","2017">> date.csv
echo "2","2","2017">> date.csv
echo "3","3","2017">> date.csv
echo copying C:\Program Files\Gila_Breath_Camp\Csv\user.csv
cd C:\Program Files\Gila_Breath_Camp\Csv
echo "user_id","user_name","user_type","password">> user.csv
echo copying C:\Program Files\Gila_Breath_Camp\Main\settings.py
cd C:\Program Files\Gila_Breath_Camp\Main
echo ^""" >> settings.py
echo Django settings for Code project. >> settings.py
echo.>> settings.py
echo Generated by 'django-admin startproject' using Django 1.10.1. >> settings.py
echo.>> settings.py
echo For more information on this file, see >> settings.py
echo https://docs.djangoproject.com/en/1.10/topics/settings/ >> settings.py
echo.>> settings.py
echo For the full list of settings and their values, see >> settings.py
echo https://docs.djangoproject.com/en/1.10/ref/settings/ >> settings.py
echo ^""" >> settings.py
echo.>> settings.py
echo import os >> settings.py
echo.>> settings.py
echo # Build paths inside the project like this: os.path.join(BASE_DIR, ...) >> settings.py
echo BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__))) >> settings.py
echo.>> settings.py
echo.>> settings.py
echo # Quick-start development settings - unsuitable for production >> settings.py
echo # See https://docs.djangoproject.com/en/1.10/howto/deployment/checklist/ >> settings.py
echo.>> settings.py
echo # SECURITY WARNING: keep the secret key used in production secret! >> settings.py
echo SECRET_KEY = '%%s+p0e^&82k7*15dkpb!#8cad@5l(m7$5_d7wxjv5rdv0hpz6r)' >> settings.py
echo.>> settings.py
echo # SECURITY WARNING: don't run with debug turned on in production! >> settings.py
echo DEBUG = True >> settings.py
echo.>> settings.py
echo ALLOWED_HOSTS = [] >> settings.py
echo.>> settings.py
echo.>> settings.py
echo # Application definition >> settings.py
echo.>> settings.py
echo INSTALLED_APPS = [ >> settings.py
echo     'django.contrib.admin', >> settings.py
echo     'django.contrib.auth', >> settings.py
echo     'django.contrib.contenttypes', >> settings.py
echo     'django.contrib.sessions', >> settings.py
echo     'django.contrib.messages', >> settings.py
echo     'django.contrib.staticfiles', >> settings.py
echo     'Python' >> settings.py
echo ] >> settings.py
echo.>> settings.py
echo MIDDLEWARE = [ >> settings.py
echo     'django.middleware.security.SecurityMiddleware', >> settings.py
echo     'django.contrib.sessions.middleware.SessionMiddleware', >> settings.py
echo     'django.middleware.common.CommonMiddleware', >> settings.py
echo     'django.middleware.csrf.CsrfViewMiddleware', >> settings.py
echo     'django.contrib.auth.middleware.AuthenticationMiddleware', >> settings.py
echo     'django.contrib.messages.middleware.MessageMiddleware', >> settings.py
echo     'django.middleware.clickjacking.XFrameOptionsMiddleware', >> settings.py
echo ] >> settings.py
echo.>> settings.py
echo ROOT_URLCONF = 'Main.urls' >> settings.py
echo.>> settings.py
echo.>> settings.py
echo import os >> settings.py
echo SETTINGS_PATH = os.path.dirname(os.path.dirname(__file__)) >> settings.py
echo TEMPLATES = [ >> settings.py
echo     { >> settings.py
echo         'BACKEND': 'django.template.backends.django.DjangoTemplates', >> settings.py
echo         'DIRS': [os.path.join(SETTINGS_PATH, 'Static/Templates')], >> settings.py
echo         'APP_DIRS': True, >> settings.py
echo         'OPTIONS': { >> settings.py
echo             'context_processors': [ >> settings.py
echo                 'django.template.context_processors.debug', >> settings.py
echo                 'django.template.context_processors.request', >> settings.py
echo                 'django.contrib.auth.context_processors.auth', >> settings.py
echo                 'django.contrib.messages.context_processors.messages', >> settings.py
echo             ], >> settings.py
echo         }, >> settings.py
echo     }, >> settings.py
echo ] >> settings.py
echo.>> settings.py
echo.>> settings.py
echo.>> settings.py
echo WSGI_APPLICATION = 'Main.wsgi.application' >> settings.py
echo.>> settings.py
echo.>> settings.py
echo # Database >> settings.py
echo # https://docs.djangoproject.com/en/1.10/ref/settings/#databases >> settings.py
echo.>> settings.py
echo DATABASES = { >> settings.py
echo     'default': { >> settings.py
echo         'ENGINE': 'django.db.backends.sqlite3', >> settings.py
echo         'NAME': os.path.join(BASE_DIR, 'db.sqlite3'), >> settings.py
echo     } >> settings.py
echo } >> settings.py
echo.>> settings.py
echo.>> settings.py
echo # Password validation >> settings.py
echo # https://docs.djangoproject.com/en/1.10/ref/settings/#auth-password-validators >> settings.py
echo.>> settings.py
echo AUTH_PASSWORD_VALIDATORS = [ >> settings.py
echo     { >> settings.py
echo         'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator', >> settings.py
echo     }, >> settings.py
echo     { >> settings.py
echo         'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator', >> settings.py
echo     }, >> settings.py
echo     { >> settings.py
echo         'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator', >> settings.py
echo     }, >> settings.py
echo     { >> settings.py
echo         'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator', >> settings.py
echo     }, >> settings.py
echo ] >> settings.py
echo.>> settings.py
echo.>> settings.py
echo # Internationalization >> settings.py
echo # https://docs.djangoproject.com/en/1.10/topics/i18n/ >> settings.py
echo.>> settings.py
echo LANGUAGE_CODE = 'en-us' >> settings.py
echo.>> settings.py
echo TIME_ZONE = 'UTC' >> settings.py
echo.>> settings.py
echo USE_I18N = True >> settings.py
echo.>> settings.py
echo USE_L10N = True >> settings.py
echo.>> settings.py
echo USE_TZ = True >> settings.py
echo.>> settings.py
echo.>> settings.py
echo SITE_ROOT = os.path.dirname(os.path.dirname(__file__)) >> settings.py
echo.>> settings.py
echo STATICFILES_DIRS = ( >> settings.py
echo    # Put strings here, like "/home/html/static" or "C:/www/django/static". >> settings.py
echo    # Always use forward slashes, even on Windows. >> settings.py
echo    # Don't forget to use absolute paths, not relative paths. >> settings.py
echo    os.path.join(SITE_ROOT, 'Static'), >> settings.py
echo.>> settings.py
echo ) >> settings.py
echo.>> settings.py
echo.>> settings.py
echo # Static files (CSS, JavaScript, Images) >> settings.py
echo # https://docs.djangoproject.com/en/1.10/howto/static-files/ >> settings.py
echo.>> settings.py
echo STATIC_URL = '/Python/' >> settings.py
echo STATIC_URL = '/Static/' >> settings.py
echo copying C:\Program Files\Gila_Breath_Camp\Main\urls.py
cd C:\Program Files\Gila_Breath_Camp\Main
echo ^"""Code URL Configuration >> urls.py
echo.>> urls.py
echo The `urlpatterns` list routes URLs to views. For more information please see: >> urls.py
echo     https://docs.djangoproject.com/en/1.10/topics/http/urls/ >> urls.py
echo Examples: >> urls.py
echo Function views >> urls.py
echo     1. Add an import:  from my_app import views >> urls.py
echo     2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home') >> urls.py
echo Class-based views >> urls.py
echo     1. Add an import:  from other_app.views import Home >> urls.py
echo     2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home') >> urls.py
echo Including another URLconf >> urls.py
echo     1. Import the include() function: from django.conf.urls import url, include >> urls.py
echo     2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls')) >> urls.py
echo ^""" >> urls.py
echo from django.conf.urls import url,include >> urls.py
echo from Python import views >> urls.py
echo.>> urls.py
echo urlpatterns = [ >> urls.py
echo     url(r'^Python/', include('Python.local_urls')), >> urls.py
echo     url(r'^registration_ui/', views.registration_ui, name='registration_ui'), >> urls.py
echo 	url(r'^test_js/', views.test_js, name='test_js'), >> urls.py
echo 	url(r'^test_js_get_appl/', views.test_js_get_appl, name='test_js_get_appl'), >> urls.py
echo 	url(r'^application_status_send/', views.application_status_send, name='application_status_send'), >> urls.py
echo 	url(r'^application_status_get/', views.application_status_get, name='application_status_get'), >> urls.py
echo 	url(r'^test_submit_checkin/', views.test_submit_checkin, name='test_submit_checkin'), >> urls.py
echo 	url(r'^already_ssn/', views.already_ssn, name='already_ssn'), >> urls.py
echo 	url(r'^print_letter/', views.print_letter, name='print_letter'), >> urls.py
echo 	url(r'^send_cancel/', views.send_cancel, name='send_cancel'), >> urls.py
echo 	url(r'^priorities_get/', views.priorities_get, name='priorities_get'), >> urls.py
echo 	url(r'^priorities_get_guar_ssn/', views.priorities_get_guar_ssn, name='priorities_get_guar_ssn'), >> urls.py
echo 	url(r'^priorities_set_submit/', views.priorities_set_submit, name='priorities_set_submit'), >> urls.py
echo 	url(r'^assignment_tribe/', views.assignment_tribe, name='assignment_tribe'), >> urls.py
echo 	url(r'^assignment_bunkhouse/', views.assignment_bunkhouse, name='assignment_bunkhouse'), >> urls.py
echo 	url(r'^update_get_application/', views.update_get_application, name='update_get_application'), >> urls.py
echo 	url(r'^update_set_application/', views.update_set_application, name='update_set_application'), >> urls.py
echo.>> urls.py
echo ] >> urls.py
echo copying C:\Program Files\Gila_Breath_Camp\Main\wsgi.py
cd C:\Program Files\Gila_Breath_Camp\Main
echo ^""" >> wsgi.py
echo WSGI config for Code project. >> wsgi.py
echo.>> wsgi.py
echo It exposes the WSGI callable as a module-level variable named ``application``. >> wsgi.py
echo.>> wsgi.py
echo For more information on this file, see >> wsgi.py
echo https://docs.djangoproject.com/en/1.10/howto/deployment/wsgi/ >> wsgi.py
echo ^""" >> wsgi.py
echo.>> wsgi.py
echo import os >> wsgi.py
echo.>> wsgi.py
echo from django.core.wsgi import get_wsgi_application >> wsgi.py
echo.>> wsgi.py
echo os.environ.setdefault("DJANGO_SETTINGS_MODULE", "Main.settings") >> wsgi.py
echo.>> wsgi.py
echo application = get_wsgi_application() >> wsgi.py
echo copying C:\Program Files\Gila_Breath_Camp\Python\common_functions.py
cd C:\Program Files\Gila_Breath_Camp\Python
echo # =============================================================================== >> common_functions.py
echo #                             GILA BREATH CAMP >> common_functions.py
echo # >> common_functions.py
echo # =============================================================================== >> common_functions.py
echo # =============================================================================== >> common_functions.py
echo # FILE NAME      : common_functions.py >> common_functions.py
echo # PURPOSE        : READ from or WRITE to any CSV file, Joins, Convert Object to >> common_functions.py
echo #				   class and many more. All the common functions >> common_functions.py
echo # AUTHOR         : KARTHIK MANJUNATH >> common_functions.py
echo # CREATION DATE  : 01-OCT-2016 >> common_functions.py
echo # PENDING 		 : Logic for update >> common_functions.py
echo # ------------------------------------------------------------------------------- >> common_functions.py
echo # CHANGE HISTORY : >> common_functions.py
echo # VER	^|	DATE       	^|	MODIFIED BY  		^|  	CHANGE DESCRIPTION >> common_functions.py
echo # ------------------------------------------------------------------------------- >> common_functions.py
echo # 1.0   	01-OCT-2016  	KARTHIK MANJUNATH		Just defined name of functions >> common_functions.py
echo # 2.0		02-OCT-2016		ROHAN SAWANT			Made reading logic for getFromCsv >> common_functions.py
echo # 3.0		02-OCT-2016		KARTHIK MANJUNATH		Adding Logic to convert dict to Object >> common_functions.py
echo # 4.0       10-OCT-2016		ROHAN SAWANT			Adding increment logic for Id's >> common_functions.py
echo # 5.0       10-OCT-2016		ROHAN SAWANT			Corrected increment logic for Id's empty file >> common_functions.py
echo # 6.0       10-OCT-2016		ROHAN SAWANT			Created update data to csv function (many rows) >> common_functions.py
echo # 7.0       10-OCT-2016		ROHAN SAWANT			Created update data to csv function (one row) >> common_functions.py
echo # 8.0		15-OCT-2016		ROHAN SAWANT			Added suffix function for Integers >> common_functions.py
echo # 9.0		20-NOV-2016		ROHAN SAWANT			Added function to get data for accepted applicants >> common_functions.py
echo # =============================================================================== >> common_functions.py
echo.>> common_functions.py
echo import csv >> common_functions.py
echo import sys >> common_functions.py
echo import calendar >> common_functions.py
echo import ast >> common_functions.py
echo import copy >> common_functions.py
echo sys.path.append("Csv") >> common_functions.py
echo sys.path.append("Python/User_Stories") >> common_functions.py
echo import application_status >> common_functions.py
echo import datetime >> common_functions.py
echo from csv import DictWriter >> common_functions.py
echo.>> common_functions.py
echo class Common_functions(object): >> common_functions.py
echo.>> common_functions.py
echo 	def csvToListOfList(self,filename): >> common_functions.py
echo 		^""" Read from csv file to List of List ^""" >> common_functions.py
echo.>> common_functions.py
echo 		data = [] >> common_functions.py
echo 		with open(filename, "rt", encoding='ascii') as csvfile: >> common_functions.py
echo 			csvreader = csv.reader(csvfile, delimiter=',', skipinitialspace=True) >> common_functions.py
echo 			data = list(csvreader) >> common_functions.py
echo.>> common_functions.py
echo 		return data >> common_functions.py
echo.>> common_functions.py
echo 	def convertListToDict(self,input_list): >> common_functions.py
echo 		^""" Convert List of List to Dictionary (having header) ^""" >> common_functions.py
echo.>> common_functions.py
echo 		list_of_dict = [] >> common_functions.py
echo 		header = input_list[0] >> common_functions.py
echo.>> common_functions.py
echo 		for i in range(1,len(input_list)): >> common_functions.py
echo 			dict = {} >> common_functions.py
echo 			for j in range(0,len(header)): >> common_functions.py
echo 				dict[header[j]] = input_list[i][j] >> common_functions.py
echo 			list_of_dict.append(dict) >> common_functions.py
echo.>> common_functions.py
echo 		return list_of_dict >> common_functions.py
echo.>> common_functions.py
echo 	def monthdelta(self,date,delta): >> common_functions.py
echo 		m, y = (date.month+delta) %% 12, date.year + ((date.month)+delta-1) // 12 >> common_functions.py
echo 		if not m: m = 12 >> common_functions.py
echo 		d = min(date.day, [31,29 if y%%4==0 and not y%%400==0 else 28,31,30,31,30,31,31,30,31,30,31][m-1]) >> common_functions.py
echo 		return date.replace(day=d,month=m, year=y) >> common_functions.py
echo.>> common_functions.py
echo 	def insertIntoCsv(self,filename,object_name): >> common_functions.py
echo 		^""" Insert into .csv from objects ^""" >> common_functions.py
echo.>> common_functions.py
echo 		dict = object_name.__dict__ >> common_functions.py
echo 		list_data = self.csvToListOfList('Csv/'+ filename) >> common_functions.py
echo.>> common_functions.py
echo 		last_row = [list_data[0]] >> common_functions.py
echo.>> common_functions.py
echo 		if len(list_data) != 1: >> common_functions.py
echo 			last_row.append(list_data[len(list_data)-1]) >> common_functions.py
echo.>> common_functions.py
echo 		last_row_dict = self.convertListToDict(last_row) >> common_functions.py
echo.>> common_functions.py
echo 		output_list = [] >> common_functions.py
echo 		relations = self.csvToListOfList('relations.csv') >> common_functions.py
echo 		relations_dict = self.convertListToDict(relations) >> common_functions.py
echo.>> common_functions.py
echo 		for i in range(0,len(list_data[0])): >> common_functions.py
echo 			for j in range(0,len(relations_dict)): >> common_functions.py
echo 				if relations_dict[j]['filename'] == filename: >> common_functions.py
echo 					if len(list_data) != 1: >> common_functions.py
echo 						dict[relations_dict[j]['column']] = int(last_row_dict[0][relations_dict[j]['column']]) + 1 >> common_functions.py
echo 					else: >> common_functions.py
echo 						dict[relations_dict[j]['column']] = 1 >> common_functions.py
echo 			output_list.append(str(dict[list_data[0][i]])) >> common_functions.py
echo.>> common_functions.py
echo 		writer=csv.writer(open('Csv/'+ filename,'a'),quoting=csv.QUOTE_ALL,lineterminator='\n') >> common_functions.py
echo 		writer.writerow(output_list) >> common_functions.py
echo.>> common_functions.py
echo 	def updateManyRowIntoCsv(self,filename,list_of_dict,input_key): >> common_functions.py
echo 		^""" Update into .csv from objects ^""" >> common_functions.py
echo.>> common_functions.py
echo 		csv_list_of_data = self.csvToListOfList('Csv/'+ filename) >> common_functions.py
echo.>> common_functions.py
echo 		# get values from where i.e. input_key_id >> common_functions.py
echo.>> common_functions.py
echo 		column_number = 0 >> common_functions.py
echo.>> common_functions.py
echo 		for i in range(0,len(csv_list_of_data[0])): >> common_functions.py
echo 			if csv_list_of_data[0][i] == input_key: >> common_functions.py
echo 				column_number = i >> common_functions.py
echo.>> common_functions.py
echo 		for i in range(0,len(csv_list_of_data)): >> common_functions.py
echo 			# finding the id >> common_functions.py
echo 			for j in range(0,len(list_of_dict)): >> common_functions.py
echo 				if csv_list_of_data[i][column_number] == list_of_dict[j][input_key]: >> common_functions.py
echo 					# replacing values >> common_functions.py
echo 					for k in range(0,len(csv_list_of_data[i])):						 >> common_functions.py
echo 						csv_list_of_data[i][k] = list_of_dict[j][csv_list_of_data[0][k]] >> common_functions.py
echo.>> common_functions.py
echo 		# write into file >> common_functions.py
echo 		with open('Csv/'+ filename, 'w', newline='') as csvfile: >> common_functions.py
echo 			writer = csv.writer(csvfile,quoting=csv.QUOTE_ALL) >> common_functions.py
echo 			writer.writerows(csv_list_of_data) >> common_functions.py
echo.>> common_functions.py
echo 	def updateOneRowIntoCsv(self,filename,object_name,input_key): >> common_functions.py
echo 		^""" Update into .csv from objects ^""" >> common_functions.py
echo.>> common_functions.py
echo 		csv_list_of_data = self.csvToListOfList('Csv/'+ filename) >> common_functions.py
echo 		object_name_dict = object_name.__dict__ >> common_functions.py
echo.>> common_functions.py
echo 		# get values from where i.e. input_key_id >> common_functions.py
echo 		input_id = object_name_dict[input_key] >> common_functions.py
echo.>> common_functions.py
echo 		column_number = 0 >> common_functions.py
echo.>> common_functions.py
echo 		for i in range(0,len(csv_list_of_data[0])-1): >> common_functions.py
echo 			if csv_list_of_data[0][i] == input_key: >> common_functions.py
echo 				column_number = i >> common_functions.py
echo.>> common_functions.py
echo 		for i in range(0,len(csv_list_of_data)-1): >> common_functions.py
echo 			# finding the id >> common_functions.py
echo 			if csv_list_of_data[i][column_number] == input_id: >> common_functions.py
echo 				# replacing values >> common_functions.py
echo 				for j in range(0,len(csv_list_of_data[i])-1): >> common_functions.py
echo 					csv_list_of_data[i][j] = object_name_dict[csv_list_of_data[0][j]] >> common_functions.py
echo.>> common_functions.py
echo 		# write into file >> common_functions.py
echo 		with open('Csv/'+ filename, 'w', newline='') as csvfile: >> common_functions.py
echo 			writer = csv.writer(csvfile,quoting=csv.QUOTE_ALL) >> common_functions.py
echo 			writer.writerows(csv_list_of_data) >> common_functions.py
echo.>> common_functions.py
echo 	def getFromCsv(self,filename,where): >> common_functions.py
echo 		^""" Read to csv file ^""" >> common_functions.py
echo.>> common_functions.py
echo 		# Reading csv and storing data in List of List >> common_functions.py
echo 		list_data = self.csvToListOfList('Csv/'+filename)  >> common_functions.py
echo 		# Converting List of List to List of Dictionary >> common_functions.py
echo 		list_dict_data = self.convertListToDict(list_data) >> common_functions.py
echo 		list_dict_data_where = [] >> common_functions.py
echo.>> common_functions.py
echo 		if where == {}: >> common_functions.py
echo 			# return all the data if there is no where clause defined >> common_functions.py
echo 			list_dict_data_where = list_dict_data >> common_functions.py
echo 		else: >> common_functions.py
echo 			# find rows that match the where >> common_functions.py
echo.>> common_functions.py
echo 			for i in range(0,len(list_dict_data)): >> common_functions.py
echo 				dict = {} >> common_functions.py
echo 				for columns in where: >> common_functions.py
echo 					if list_dict_data[i][columns] == where[columns]: >> common_functions.py
echo 						list_dict_data_where.append(list_dict_data[i]) >> common_functions.py
echo.>> common_functions.py
echo 		return list_dict_data_where >> common_functions.py
echo.>> common_functions.py
echo 	def getAcceptedApplicants(self,front_end_str): >> common_functions.py
echo 		^""" Read from csv only accepted applicants ^""" >> common_functions.py
echo.>> common_functions.py
echo 		front_end_dict = ast.literal_eval(front_end_str) >> common_functions.py
echo 		front_end_data = front_end_dict['data'][0] >> common_functions.py
echo.>> common_functions.py
echo 		data = self.getFromCsv('applicant.csv',front_end_data) >> common_functions.py
echo.>> common_functions.py
echo 		apps = application_status.Application_status() >> common_functions.py
echo 		new_data = apps.getApplicationStatus(front_end_str) >> common_functions.py
echo.>> common_functions.py
echo 		new_data_check = ast.literal_eval(new_data) >> common_functions.py
echo 		data_accepted = new_data_check['data'] >> common_functions.py
echo.>> common_functions.py
echo 		accepted_applicant_id = [] >> common_functions.py
echo 		for i in range(0,len(data_accepted)): >> common_functions.py
echo 			if data_accepted[i]['application_status'] == 1: >> common_functions.py
echo 				accepted_applicant_id.append(data_accepted[i]['applicant_id']) >> common_functions.py
echo.>> common_functions.py
echo 		accepted_data = [] >> common_functions.py
echo 		for i in range(0,len(data)): >> common_functions.py
echo 			if data[i]['applicant_id'] in accepted_applicant_id: >> common_functions.py
echo 				accepted_data.append(data[i]) >> common_functions.py
echo.>> common_functions.py
echo 		return accepted_data >> common_functions.py
echo.>> common_functions.py
echo.>> common_functions.py
echo 	def getCheckedInApplicants(self,front_end_str): >> common_functions.py
echo 		^""" Read from csv only accepted applicants ^""" >> common_functions.py
echo.>> common_functions.py
echo 		front_end_dict = ast.literal_eval(front_end_str) >> common_functions.py
echo 		front_end_data = front_end_dict['data'][0] >> common_functions.py
echo.>> common_functions.py
echo 		data = self.getFromCsv('applicant.csv',front_end_data) >> common_functions.py
echo.>> common_functions.py
echo 		checked_in_applicant_id = [] >> common_functions.py
echo 		for i in range(0,len(data)): >> common_functions.py
echo 			if data[i]['check_in_status'] == "1": >> common_functions.py
echo 				checked_in_applicant_id.append(data[i]['applicant_id']) >> common_functions.py
echo.>> common_functions.py
echo 		checked_in_data = [] >> common_functions.py
echo 		for i in range(0,len(data)): >> common_functions.py
echo 			if data[i]['applicant_id'] in checked_in_applicant_id: >> common_functions.py
echo 				checked_in_data.append(data[i]) >> common_functions.py
echo.>> common_functions.py
echo 		return checked_in_data >> common_functions.py
echo.>> common_functions.py
echo 	def str_to_date(self, date_str): >> common_functions.py
echo 		^"""converts str to date^""" >> common_functions.py
echo 		date_object = datetime.datetime.strptime(date_str.split(" ")[0], '%%Y-%%m-%%d') >> common_functions.py
echo 		return date_object >> common_functions.py
echo.>> common_functions.py
echo 	def printLod(self,lod,header): >> common_functions.py
echo 		with open('out.csv','w') as outfile: >> common_functions.py
echo 			writer = DictWriter(outfile, tuple(header)) >> common_functions.py
echo 			writer.writeheader() >> common_functions.py
echo 			writer.writerows(lod) >> common_functions.py
echo.>> common_functions.py
echo 	def sortData(self,input_list,column_to_sort_on): >> common_functions.py
echo 		^""" Sorting data ^""" >> common_functions.py
echo.>> common_functions.py
echo 		backup_input_list = copy.deepcopy(input_list) >> common_functions.py
echo 		sorted_list = [] >> common_functions.py
echo 		sort_on = [] >> common_functions.py
echo.>> common_functions.py
echo 		for i in range(0,len(input_list)): >> common_functions.py
echo 			sort_on.append(int(input_list[i][column_to_sort_on])) >> common_functions.py
echo.>> common_functions.py
echo 		sort_on.sort() >> common_functions.py
echo.>> common_functions.py
echo 		for j in range(0,len(sort_on)): >> common_functions.py
echo 			for k in range(0,len(input_list)): >> common_functions.py
echo 				if sort_on[j] == int(input_list[k][column_to_sort_on]): >> common_functions.py
echo 					if input_list[k] not in sorted_list: >> common_functions.py
echo 						sorted_list.append(input_list[k]) >> common_functions.py
echo.>> common_functions.py
echo 		return sorted_list >> common_functions.py
echo.>> common_functions.py
echo.>> common_functions.py
echo copying C:\Program Files\Gila_Breath_Camp\Python\local_urls.py
cd C:\Program Files\Gila_Breath_Camp\Python
echo from django.conf.urls import url >> local_urls.py
echo import sys >> local_urls.py
echo sys.path.append("Python") >> local_urls.py
echo import views >> local_urls.py
echo #from . import views >> local_urls.py
echo urlpatterns = [ >> local_urls.py
echo     url(r'^$', views.test, name='test'), >> local_urls.py
echo ] >> local_urls.py
echo copying C:\Program Files\Gila_Breath_Camp\Python\tests.py
cd C:\Program Files\Gila_Breath_Camp\Python
echo from django.test import TestCase >> tests.py
echo.>> tests.py
echo # Create your tests here. >> tests.py
echo copying C:\Program Files\Gila_Breath_Camp\Python\views.py
cd C:\Program Files\Gila_Breath_Camp\Python
echo # ================================================================================================= >> views.py
echo #                             GILA BREATH CAMP >> views.py
echo # >> views.py
echo # ================================================================================================= >> views.py
echo # ================================================================================================= >> views.py
echo # FILE NAME      : views.py >> views.py
echo # PURPOSE        : Connection between all the python modules and the front end >> views.py
echo # AUTHOR         : KARTHIK MANJUNATH >> views.py
echo # CREATION DATE  : 02-OCT-2016 >> views.py
echo # PENDING 		 :  >> views.py
echo # ------------------------------------------------------------------------------------------------- >> views.py
echo # CHANGE HISTORY : >> views.py
echo # VER	^|	DATE       	^|	MODIFIED BY  		^|  	CHANGE DESCRIPTION >> views.py
echo # ------------------------------------------------------------------------------------------------- >> views.py
echo # 1.0   	02-OCT-2016  	KARTHIK MANJUNATH    		Started basic structure >> views.py
echo # 2.0   	12-OCT-2016  	KARTHIK MANJUNATH   		Added logic for registration with front end >> views.py
echo # 3.0   	15-OCT-2016  	KARTHIK MANJUNATH    		Added logic for check-in with front end >> views.py
echo # 4.0   	17-OCT-2016  	KARTHIK MANJUNATH    		Added logic for application status with >> views.py
echo #														front end and code clean up or refactoring >> views.py
echo # ================================================================================================= >> views.py
echo.>> views.py
echo from django.shortcuts import render >> views.py
echo from django.template.context_processors import csrf >> views.py
echo from django.views.decorators.csrf import csrf_exempt >> views.py
echo from django.http import HttpResponse >> views.py
echo from django.http import HttpResponseForbidden >> views.py
echo import sys >> views.py
echo sys.path.append("Python") >> views.py
echo sys.path.append("Python/Entities") >> views.py
echo import common_functions >> views.py
echo import user >> views.py
echo import ast >> views.py
echo import json >> views.py
echo sys.path.append("Python/User_Stories") >> views.py
echo import registration >> views.py
echo import choose_date >> views.py
echo import check_in_status >> views.py
echo import application_status >> views.py
echo import priorities >> views.py
echo import application_cancellation >> views.py
echo import printing_of_acceptance_or_rejection_notice >> views.py
echo import assignment_of_bunkhouses >> views.py
echo import assignment_of_tribes >> views.py
echo.>> views.py
echo.>> views.py
echo def test(request): >> views.py
echo 	context = "" >> views.py
echo 	return render(request,'index.html',context) >> views.py
echo.>> views.py
echo @csrf_exempt >> views.py
echo def registration_ui(request): >> views.py
echo 	c = {} >> views.py
echo 	c.update(csrf(request)); >> views.py
echo 	data = request.POST["vol_name"] >> views.py
echo 	print("data"+data) >> views.py
echo 	try: >> views.py
echo 		regis = registration.Registration() >> views.py
echo 		st = regis.register(data) >> views.py
echo 	except Exception as e: >> views.py
echo 		st = e >> views.py
echo 	return HttpResponse(st,content_type="application/type") >> views.py
echo.>> views.py
echo @csrf_exempt >> views.py
echo def already_ssn(request): >> views.py
echo 	c = {} >> views.py
echo 	c.update(csrf(request)); >> views.py
echo 	data = request.POST["ssn"] >> views.py
echo 	front_end_str10 = json.dumps({"data" :[{"guardian_ssn":"342-909-8982"}]}) >> views.py
echo 	try: >> views.py
echo 		regis = registration.Registration() >> views.py
echo 		st = regis.alreadySsn(data) >> views.py
echo 	except Exception as e: >> views.py
echo 		st = e >> views.py
echo 	return HttpResponse(st,content_type="application/type") >> views.py
echo.>> views.py
echo.>> views.py
echo @csrf_exempt >> views.py
echo def priorities_get(request): >> views.py
echo 	c = {} >> views.py
echo 	c.update(csrf(request)); >> views.py
echo 	data = request.POST["prior"] >> views.py
echo 	print(data) >> views.py
echo 	dt = choose_date.Choose_date() >> views.py
echo 	st = dt.chooseDate() >> views.py
echo 	camp_slot = '' >> views.py
echo 	cis = check_in_status.Check_in_status() >> views.py
echo 	if json.loads(data)["data"][0]["date_id"]=="1": >> views.py
echo 		camp_slot = json.loads(st)["data"][0]["camp_time_slots1"] >> views.py
echo 	elif json.loads(data)["data"][0]["date_id"]=="2": >> views.py
echo 		camp_slot = json.loads(st)["data"][0]["camp_time_slots2"] >> views.py
echo 	elif json.loads(data)["data"][0]["date_id"]=="3": >> views.py
echo 		camp_slot = json.loads(st)["data"][0]["camp_time_slots3"] >> views.py
echo 	st_get = cis.getCheckInStatus('{"data" :[{"camp_time_slots":"'+camp_slot+'"}]}') >> views.py
echo 	print(camp_slot) >> views.py
echo 	front_end_str111 = '{"data" :[{"camp_time_slots":"'+camp_slot+'"}]}' >> views.py
echo 	try: >> views.py
echo 		pr = priorities.Priorities() >> views.py
echo 		st = pr.getCustomerPriorities(front_end_str111) >> views.py
echo 	except Exception as e: >> views.py
echo 		st = e >> views.py
echo 	return HttpResponse(st,content_type="application/type") >> views.py
echo.>> views.py
echo @csrf_exempt >> views.py
echo def priorities_get_guar_ssn(request): >> views.py
echo 	c = {} >> views.py
echo 	c.update(csrf(request)); >> views.py
echo 	data = request.POST["prior"] >> views.py
echo 	print(data) >> views.py
echo 	pr = priorities.Priorities() >> views.py
echo 	st = pr.getId(data) >> views.py
echo 	print(st) >> views.py
echo 	return HttpResponse(st,content_type="application/type") >> views.py
echo.>> views.py
echo @csrf_exempt >> views.py
echo def priorities_set_submit(request): >> views.py
echo 	c = {} >> views.py
echo 	c.update(csrf(request)); >> views.py
echo 	data = request.POST["prior"] >> views.py
echo 	print(data) >> views.py
echo 	pr = priorities.Priorities() >> views.py
echo 	st = pr.updateCustomerPriorities(data) >> views.py
echo 	print(st) >> views.py
echo 	return HttpResponse(st,content_type="application/type") >> views.py
echo.>> views.py
echo @csrf_exempt >> views.py
echo def print_letter(request): >> views.py
echo 	c = {} >> views.py
echo 	c.update(csrf(request)); >> views.py
echo 	data = request.POST["ssn"] >> views.py
echo 	prin_letter = printing_of_acceptance_or_rejection_notice.Notice() >> views.py
echo 	st = prin_letter.printAcceptanceRejection(data) >> views.py
echo 	print(st) >> views.py
echo 	return HttpResponse(st,content_type="application/type") >> views.py
echo.>> views.py
echo @csrf_exempt >> views.py
echo def send_cancel(request): >> views.py
echo 	c = {} >> views.py
echo 	c.update(csrf(request)); >> views.py
echo 	data = request.POST["vol_name"] >> views.py
echo 	apps = application_cancellation.Application_cancellation() >> views.py
echo 	st = apps.setManyCancelFlag(data) >> views.py
echo 	#print(st) >> views.py
echo 	return HttpResponse(st,content_type="application/type") >> views.py
echo.>> views.py
echo.>> views.py
echo @csrf_exempt	 >> views.py
echo def test_js(request): >> views.py
echo 	c = {} >> views.py
echo 	c.update(csrf(request)); >> views.py
echo 	data = request.POST["vol_name"] >> views.py
echo 	try: >> views.py
echo 		dt = choose_date.Choose_date() >> views.py
echo 		st = dt.chooseDate() >> views.py
echo 		camp_slot = '' >> views.py
echo 		cis = check_in_status.Check_in_status() >> views.py
echo 		if json.loads(data)["data"][0]["date_id"]=="1": >> views.py
echo 			camp_slot = json.loads(st)["data"][0]["camp_time_slots1"] >> views.py
echo 		elif json.loads(data)["data"][0]["date_id"]=="2": >> views.py
echo 			camp_slot = json.loads(st)["data"][0]["camp_time_slots2"] >> views.py
echo 		elif json.loads(data)["data"][0]["date_id"]=="3": >> views.py
echo 			camp_slot = json.loads(st)["data"][0]["camp_time_slots3"] >> views.py
echo 		st_get = cis.getCheckInStatus('{"data" :[{"camp_time_slots":"'+camp_slot+'"}]}') >> views.py
echo 	except Exception as e: >> views.py
echo 		st_get = e >> views.py
echo 	print(st_get) >> views.py
echo 	return HttpResponse(st_get,content_type="application/type") >> views.py
echo.>> views.py
echo @csrf_exempt	 >> views.py
echo def test_js_get_appl(request): >> views.py
echo 	c = {} >> views.py
echo 	c.update(csrf(request)); >> views.py
echo 	data = request.POST["vol_name"] >> views.py
echo 	try: >> views.py
echo 		dt = choose_date.Choose_date() >> views.py
echo 		st = dt.chooseDate() >> views.py
echo 		print(st) >> views.py
echo 		cis = application_status.Application_status() >> views.py
echo 		if json.loads(data)["data"][0]["date_id"]=="1": >> views.py
echo 			camp_slot = json.loads(st)["data"][0]["camp_time_slots1"] >> views.py
echo 		elif json.loads(data)["data"][0]["date_id"]=="2": >> views.py
echo 			camp_slot = json.loads(st)["data"][0]["camp_time_slots2"] >> views.py
echo 		elif json.loads(data)["data"][0]["date_id"]=="3": >> views.py
echo 			camp_slot = json.loads(st)["data"][0]["camp_time_slots3"] >> views.py
echo 		st_get = cis.getApplicationStatus('{"data" :[{"camp_time_slots":"'+camp_slot+'"}]}') >> views.py
echo 		print(st_get) >> views.py
echo 	except Exception as e: >> views.py
echo 		st_get = e >> views.py
echo 		print(st_get) >> views.py
echo 	return HttpResponse(st_get,content_type="application/type") >> views.py
echo.>> views.py
echo.>> views.py
echo @csrf_exempt	 >> views.py
echo def test_submit_checkin(request): >> views.py
echo 	c = {} >> views.py
echo 	c.update(csrf(request)); >> views.py
echo 	data = request.POST["vol_name"] >> views.py
echo 	print("data"+data) >> views.py
echo 	try: >> views.py
echo 		dt = choose_date.Choose_date() >> views.py
echo 		st = dt.chooseDate() >> views.py
echo 		print(st) >> views.py
echo 		cis = check_in_status.Check_in_status() >> views.py
echo 		st_get = cis.updateCheckInStatus(data)#json.dumps({"data" :[{"camp_time_slots":"2016-10-15 00:00:00.000000"}]})) >> views.py
echo 		print(st_get) >> views.py
echo 	except Exception as e: >> views.py
echo 		st_get = e >> views.py
echo 		print(st_get) >> views.py
echo 	return HttpResponse(st_get,content_type="application/type") >> views.py
echo.>> views.py
echo @csrf_exempt >> views.py
echo def assignment_bunkhouse(request): >> views.py
echo 	c = {} >> views.py
echo 	c.update(csrf(request)); >> views.py
echo 	data = request.POST["bunk"] >> views.py
echo 	print(data) >> views.py
echo 	dt = choose_date.Choose_date() >> views.py
echo 	st = dt.chooseDate() >> views.py
echo 	print(st) >> views.py
echo 	cis = application_status.Application_status() >> views.py
echo 	if json.loads(data)["data"][0]["date_id"]=="1": >> views.py
echo 		camp_slot = json.loads(st)["data"][0]["camp_time_slots1"] >> views.py
echo 	elif json.loads(data)["data"][0]["date_id"]=="2": >> views.py
echo 		camp_slot = json.loads(st)["data"][0]["camp_time_slots2"] >> views.py
echo 	elif json.loads(data)["data"][0]["date_id"]=="3": >> views.py
echo 		camp_slot = json.loads(st)["data"][0]["camp_time_slots3"] >> views.py
echo 	front_end_str = '{"data" :[{"camp_time_slots":"'+camp_slot+'","no_of_bunkhouses":"'+json.loads(data)["data"][0]["no_of_bunkhouses"]+'"}]}' >> views.py
echo 	aob = assignment_of_bunkhouses.Assignment_of_bunkhouses() >> views.py
echo 	st = aob.readBunkhouseData(front_end_str) >> views.py
echo 	print(st) >> views.py
echo 	return HttpResponse(st,content_type="application/type") >> views.py
echo.>> views.py
echo @csrf_exempt >> views.py
echo def assignment_tribe(request): >> views.py
echo 	c = {} >> views.py
echo 	c.update(csrf(request)); >> views.py
echo 	data = request.POST["tribe"] >> views.py
echo 	dt = choose_date.Choose_date() >> views.py
echo 	st = dt.chooseDate() >> views.py
echo 	print(st) >> views.py
echo 	cis = application_status.Application_status() >> views.py
echo 	if json.loads(data)["data"][0]["date_id"]=="1": >> views.py
echo 		camp_slot = json.loads(st)["data"][0]["camp_time_slots1"] >> views.py
echo 	elif json.loads(data)["data"][0]["date_id"]=="2": >> views.py
echo 		camp_slot = json.loads(st)["data"][0]["camp_time_slots2"] >> views.py
echo 	elif json.loads(data)["data"][0]["date_id"]=="3": >> views.py
echo 		camp_slot = json.loads(st)["data"][0]["camp_time_slots3"] >> views.py
echo 	front_end_str = '{"data" :[{"camp_time_slots":"'+camp_slot+'","no_of_tribes":"'+json.loads(data)["data"][0]["no_of_tribes"]+'"}]}' >> views.py
echo 	aob = assignment_of_tribes.Assignment_of_tribes() >> views.py
echo 	st = aob.readTribesData(front_end_str) >> views.py
echo 	return HttpResponse(st,content_type="application/type") >> views.py
echo.>> views.py
echo @csrf_exempt >> views.py
echo def application_status_send(request): >> views.py
echo 	c = {} >> views.py
echo 	c.update(csrf(request)); >> views.py
echo 	data = request.POST["vol_name"] >> views.py
echo 	try: >> views.py
echo 		a = application_status.Application_status() >> views.py
echo 		st = a.updateApplicationStatus(data) >> views.py
echo 	except Exception as e: >> views.py
echo 		st = e >> views.py
echo 	return HttpResponse(st,content_type="application/type") >> views.py
echo.>> views.py
echo.>> views.py
echo def application_status_get(request): >> views.py
echo 	try: >> views.py
echo 		dt = choose_date.Choose_date() >> views.py
echo 		st = dt.chooseDate() >> views.py
echo 	except Exception as e: >> views.py
echo 		st = e >> views.py
echo 	return HttpResponse(st,content_type="application/type") >> views.py
echo.>> views.py
echo @csrf_exempt >> views.py
echo def update_get_application(request): >> views.py
echo 	c = {} >> views.py
echo 	c.update(csrf(request)); >> views.py
echo 	data = request.POST["prior"] >> views.py
echo 	regis = registration.Registration() >> views.py
echo 	st = regis.viewRegisteredApplicant(data) >> views.py
echo 	print(st) >> views.py
echo 	return HttpResponse(st,content_type="application/type") >> views.py
echo.>> views.py
echo @csrf_exempt >> views.py
echo def update_set_application(request): >> views.py
echo 	c = {} >> views.py
echo 	c.update(csrf(request)); >> views.py
echo 	data = request.POST["prior"] >> views.py
echo 	regis = registration.Registration() >> views.py
echo 	st = regis.updateRegisteredApplicantData(data) >> views.py
echo 	print(st) >> views.py
echo 	return HttpResponse(st,content_type="application/type") >> views.py
echo copying C:\Program Files\Gila_Breath_Camp\Python\Entities\applicant.py
cd C:\Program Files\Gila_Breath_Camp\Python\Entities
echo # =============================================================================== >> applicant.py
echo #                             GILA BREATH CAMP >> applicant.py
echo # >> applicant.py
echo # =============================================================================== >> applicant.py
echo # =============================================================================== >> applicant.py
echo # FILE NAME      : applicant.py >> applicant.py
echo # PURPOSE        : Reading and Writing to "User.csv" >> applicant.py
echo # AUTHOR         : JEMIN GOHIL,SOHEIL BOUZARI >> applicant.py
echo # CREATION DATE  : 02-OCT-2016 >> applicant.py
echo # PENDING 		 : >> applicant.py
echo # ------------------------------------------------------------------------------- >> applicant.py
echo # CHANGE HISTORY : >> applicant.py
echo # VER	^|	DATE       	^|	MODIFIED BY  		^|  	CHANGE DESCRIPTION >> applicant.py
echo # ------------------------------------------------------------------------------- >> applicant.py
echo # 1.0   	02-OCT-2016  	JEMIN GOHIL, SOHEIL   	Added all functions, testing required >> applicant.py
echo # 2.0		04-OCT-2016		JEMIN GOHIL			  	Added Transformation >> applicant.py
echo # 3.0       10-OCT-2016     JEMIN GOHIL           	removed transformation from age ^& gender >> applicant.py
echo # 4.0		13-OCT-2016		ROHAN SAWANT			Changed value of tribe_id and bunkhouse_id = 0 >> applicant.py
echo # 5.0		13-OCT-2016		ROHAN SAWANT			Added transformation to setAge >> applicant.py
echo # 6.0		15-OCT-2016		ROHAN SAWANT			Added user_id getter-setter >> applicant.py
echo # 7.0       19-OCT-2016		SOHEIL BOUZARI			Added .replace(" ","").isalpha(): ApplicantFirstName, ApplicantLastName, GuardianFirstName, GuardianLastName   >> applicant.py
echo # 8.0		20-NOV-2016		ROHAN SAWANT			Changed return for cancel flag >> applicant.py
echo # ================================================================================ >> applicant.py
echo.>> applicant.py
echo from datetime import datetime >> applicant.py
echo.>> applicant.py
echo class Applicant(object): >> applicant.py
echo.>> applicant.py
echo 	def __init__(self): >> applicant.py
echo 		self.applicant_id = '' >> applicant.py
echo 		self.user_id = '' >> applicant.py
echo 		self.bunkhouse_id = '' >> applicant.py
echo 		self.tribe_id = '' >> applicant.py
echo 		self.camp_time_slots = '' >> applicant.py
echo 		self.applicant_first_name = '' >> applicant.py
echo 		self.applicant_last_name = '' >> applicant.py
echo 		self.applicant_age = '' >> applicant.py
echo 		self.applicant_gender = '' >> applicant.py
echo 		self.applicant_address = '' >> applicant.py
echo 		self.guardian_first_name = '' >> applicant.py
echo 		self.guardian_last_name = '' >> applicant.py
echo 		self.guardian_contact_number = '' >> applicant.py
echo 		self.guardian_address = '' >> applicant.py
echo 		self.application_date = '' >> applicant.py
echo 		self.emergency_contact = '' >> applicant.py
echo 		self.payment = '' >> applicant.py
echo 		self.medical_form = ''			 >> applicant.py
echo 		self.legal_form = '' >> applicant.py
echo 		self.helmet = '' >> applicant.py
echo 		self.boot = '' >> applicant.py
echo 		self.sleeping_bag = '' >> applicant.py
echo 		self.water_bottle = '' >> applicant.py
echo 		self.sunscreen = '' >> applicant.py
echo 		self.bugs_spray = '' >> applicant.py
echo 		self.check_in_status = '' >> applicant.py
echo 		self.application_status = '' >> applicant.py
echo 		self.acceptance_packet = '' >> applicant.py
echo 		self.mailing_date = '' >> applicant.py
echo 		self.rejected_reason = '' >> applicant.py
echo 		self.guardian_ssn = '' >> applicant.py
echo 		self.cancel_flag = '' >> applicant.py
echo 		self.refund = '' >> applicant.py
echo 		self.cancel_date = '' >> applicant.py
echo 		self.applicant_name_together_with = '' >> applicant.py
echo 		self.applicant_ssn_together_with = '' >> applicant.py
echo 		self.applicant_id_together_with = '' >> applicant.py
echo 		self.applicant_name_not_together_with = '' >> applicant.py
echo 		self.applicant_ssn_not_together_with = '' >> applicant.py
echo 		self.applicant_id_not_together_with = '' >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setApplicantId(self,applicant_id): >> applicant.py
echo 		self.applicant_id = applicant_id >> applicant.py
echo.>> applicant.py
echo 	def getApplicantId(self): >> applicant.py
echo 		return self.applicant_id >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setUserId(self,user_id): >> applicant.py
echo 		self.user_id = user_id >> applicant.py
echo.>> applicant.py
echo 	def getUserid(self): >> applicant.py
echo 		return self.user_id >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setBunkhouseId(self,bunkhouse_id): >> applicant.py
echo 		self.bunkhouse_id = bunkhouse_id >> applicant.py
echo.>> applicant.py
echo 	def getBunkhouseId(self): >> applicant.py
echo 		return self.bunkhouse_id >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setTribeId(self,tribe_id): >> applicant.py
echo 		self.tribe_id = tribe_id >> applicant.py
echo.>> applicant.py
echo 	def getTribeId(self): >> applicant.py
echo 		return self.tribe_id >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setCampTimeSlots(self,camp_time_slots): >> applicant.py
echo 		self.camp_time_slots = camp_time_slots >> applicant.py
echo.>> applicant.py
echo 	def getCampTimeSlots(self): >> applicant.py
echo 		return self.camp_time_slots >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setApplicantFirstName(self,applicant_first_name): >> applicant.py
echo 		applicant_first_name = applicant_first_name.strip() >> applicant.py
echo 		if applicant_first_name.replace(" ","").isalpha(): >> applicant.py
echo 			self.applicant_first_name = applicant_first_name.upper() >> applicant.py
echo 		else: >> applicant.py
echo 			return "Camper First Name: Enter only alphabets" >> applicant.py
echo.>> applicant.py
echo 	def getApplicantFirstName(self): >> applicant.py
echo 		return self.applicant_first_name >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setApplicantLastName(self,applicant_last_name): >> applicant.py
echo 		applicant_last_name = applicant_last_name.strip() >> applicant.py
echo 		if applicant_last_name.replace(" ","").isalpha(): >> applicant.py
echo 			self.applicant_last_name = applicant_last_name.upper() >> applicant.py
echo 		else: >> applicant.py
echo 			return "Camper Last Name: Enter only alphabets" >> applicant.py
echo.>> applicant.py
echo 	def getApplicantLastName(self): >> applicant.py
echo 		return self.applicant_last_name >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setApplicantAge(self,applicant_age): >> applicant.py
echo 		try: >> applicant.py
echo 			self.applicant_age = applicant_age.strip() >> applicant.py
echo 			self.applicant_age = int(applicant_age) >> applicant.py
echo 		except: >> applicant.py
echo 			return "Camper Age: Enter proper age" >> applicant.py
echo.>> applicant.py
echo 	def getApplicantAge(self): >> applicant.py
echo 		return self.applicant_age >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setApplicantGender(self,applicant_gender): >> applicant.py
echo 		self.applicant_gender = applicant_gender >> applicant.py
echo.>> applicant.py
echo 	def getApplicantGender(self): >> applicant.py
echo 		return self.applicant_gender >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setApplicantAddress(self,applicant_address): >> applicant.py
echo 		self.applicant_address = applicant_address.replace('\n',' ') >> applicant.py
echo.>> applicant.py
echo 	def getApplicantAddress(self): >> applicant.py
echo 		return self.applicant_address >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setGuardianFirstName(self,guardian_first_name): >> applicant.py
echo 		guardian_first_name = guardian_first_name.strip() >> applicant.py
echo 		if guardian_first_name.replace(" ","").isalpha(): >> applicant.py
echo 			self.guardian_first_name = guardian_first_name.upper() >> applicant.py
echo 		else: >> applicant.py
echo 			self.guardian_first_name = '' >> applicant.py
echo 			return "Parent/Guardian First Name: Enter only alphabets" >> applicant.py
echo.>> applicant.py
echo 	def getGuardianFirstName(self): >> applicant.py
echo 		return self.guardian_first_name >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setGuardianLastName(self,guardian_last_name): >> applicant.py
echo 		guardian_last_name = guardian_last_name.strip() >> applicant.py
echo 		if guardian_last_name.replace(" ","").isalpha(): >> applicant.py
echo 			self.guardian_last_name = guardian_last_name.upper() >> applicant.py
echo 		else: >> applicant.py
echo 			return "Parent/Guardian Last Name: Enter only alphabets" >> applicant.py
echo.>> applicant.py
echo 	def getGuardianLastName(self): >> applicant.py
echo 		return self.guardian_last_name >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setGuardianContactNumber(self,guardian_contact_number): >> applicant.py
echo 		guardian_contact_number = guardian_contact_number.strip() >> applicant.py
echo 		if (len(guardian_contact_number) == 10 and guardian_contact_number.isdigit()): >> applicant.py
echo 			self.guardian_contact_number = guardian_contact_number >> applicant.py
echo 		else: >> applicant.py
echo 			return "Parent/Guardian Contact Number: Enter 10 digits properly" >> applicant.py
echo.>> applicant.py
echo 	def getGuardianContactNumber(self): >> applicant.py
echo 		return self.guardian_contact_number >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setGuardianAddress(self,guardian_address): >> applicant.py
echo 		self.guardian_address = guardian_address.replace('\n',' ') >> applicant.py
echo.>> applicant.py
echo 	def getGuardianAddress(self): >> applicant.py
echo 		return self.guardian_address >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setApplicationDate(self,application_date): >> applicant.py
echo 		self.application_date = application_date >> applicant.py
echo.>> applicant.py
echo 	def getApplicationDate(self): >> applicant.py
echo 		return self.application_date >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setEmergencyContact(self,emergency_contact): >> applicant.py
echo 		emergency_contact = emergency_contact.strip() >> applicant.py
echo 		if (len(emergency_contact) == 10 and emergency_contact.isdigit()): >> applicant.py
echo 			self.emergency_contact = emergency_contact >> applicant.py
echo 		else: >> applicant.py
echo 			return "Emergency Contact: Enter 10 digits properly" >> applicant.py
echo.>> applicant.py
echo 	def getEmergencyContact(self): >> applicant.py
echo 		return self.emergency_contact >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setPayment(self,payment): >> applicant.py
echo 		self.payment = payment >> applicant.py
echo.>> applicant.py
echo 	def getPayment(self): >> applicant.py
echo 		return self.payment >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setMedicalForm(self,medical_form): >> applicant.py
echo 		self.medical_form = medical_form >> applicant.py
echo.>> applicant.py
echo 	def getMedicalForm(self): >> applicant.py
echo 		return self.medical_form >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setLegalForm(self,legal_form): >> applicant.py
echo 		self.legal_form = legal_form >> applicant.py
echo.>> applicant.py
echo 	def getLegalForm(self): >> applicant.py
echo 		return self.legal_form >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setHelmet(self,helmet): >> applicant.py
echo 		self.helmet = helmet >> applicant.py
echo.>> applicant.py
echo 	def getHelmet(self): >> applicant.py
echo 		return self.helmet >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setBoot(self,boot): >> applicant.py
echo 		self.boot = boot >> applicant.py
echo.>> applicant.py
echo 	def getBoot(self): >> applicant.py
echo 		return self.boot >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setSleepingBag(self,sleeping_bag): >> applicant.py
echo 		self.sleeping_bag = sleeping_bag >> applicant.py
echo.>> applicant.py
echo 	def getSleepingBag(self): >> applicant.py
echo 		return self.sleeping_bag >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setWaterBottle(self,water_bottle): >> applicant.py
echo 		self.water_bottle = water_bottle >> applicant.py
echo.>> applicant.py
echo 	def getWaterBottle(self): >> applicant.py
echo 		return self.water_bottle >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setSunscreen(self,sunscreen): >> applicant.py
echo 		self.sunscreen = sunscreen >> applicant.py
echo.>> applicant.py
echo 	def getSunscreen(self): >> applicant.py
echo 		return self.sunscreen >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setBugsSpray(self,bugs_spray): >> applicant.py
echo 		self.bugs_spray = bugs_spray >> applicant.py
echo.>> applicant.py
echo 	def getBugsSpray(self): >> applicant.py
echo 		return self.bugs_spray >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setCheckInStatus(self,check_in_status): >> applicant.py
echo 		self.check_in_status = check_in_status >> applicant.py
echo.>> applicant.py
echo 	def getCheckInStatus(self): >> applicant.py
echo 		return self.check_in_status >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setApplicationStatus(self,application_status): >> applicant.py
echo 		self.application_status = application_status >> applicant.py
echo.>> applicant.py
echo 	def getApplicationStatus(self): >> applicant.py
echo 		return self.application_status >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setAcceptancePacket(self,acceptance_packet): >> applicant.py
echo 		self.acceptance_packet = acceptance_packet >> applicant.py
echo.>> applicant.py
echo 	def getAcceptancePacket(self): >> applicant.py
echo 		return self.acceptance_packet >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setMailingDate(self,mailing_date): >> applicant.py
echo 		self.mailing_date = mailing_date >> applicant.py
echo.>> applicant.py
echo 	def getMailingDate(self): >> applicant.py
echo 		return self.mailing_date >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setRejectedReason(self,rejected_reason): >> applicant.py
echo 		self.rejected_reason = rejected_reason >> applicant.py
echo.>> applicant.py
echo 	def getRejectedReason(self): >> applicant.py
echo 		return self.rejected_reason >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setGuardianSsn(self,guardian_ssn): >> applicant.py
echo 		guardian_ssn = guardian_ssn.strip() >> applicant.py
echo 		if len(guardian_ssn) == 11 and (guardian_ssn[3] == '-' and guardian_ssn[6] == '-'): >> applicant.py
echo 			if guardian_ssn.replace("-","").isdigit(): >> applicant.py
echo 				self.guardian_ssn = guardian_ssn >> applicant.py
echo 			else: >> applicant.py
echo 				return "SSN can't have anything except alphabets" >> applicant.py
echo 		else: >> applicant.py
echo 			return "Enter Proper Social Security Number in 'AAA-GG-SSSS' format" >> applicant.py
echo.>> applicant.py
echo 	def getGuardianSsn(self): >> applicant.py
echo 		return self.guardian_ssn >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setCancelFlag(self,cancel_flag): >> applicant.py
echo 		self.cancel_flag = cancel_flag >> applicant.py
echo.>> applicant.py
echo 	def getCancelFlag(self): >> applicant.py
echo 		return self.cancel_flag >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setrefund(self,refund): >> applicant.py
echo 		self.refund = refund >> applicant.py
echo.>> applicant.py
echo 	def getrefund(self): >> applicant.py
echo 		return self.refund >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setcancel_date(self,cancel_date): >> applicant.py
echo 		self.refund = refund >> applicant.py
echo.>> applicant.py
echo 	def getcancel_date(self): >> applicant.py
echo 		return self.cancel_date >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setApplicantNameTogetherWith(self,applicant_name_together_with): >> applicant.py
echo 		self.applicant_name_together_with = applicant_name_together_with >> applicant.py
echo.>> applicant.py
echo 	def getApplicantNameTogetherWith(self): >> applicant.py
echo 		return self.applicant_name_together_with >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setApplicantIdTogetherWith(self,applicant_id_together_with): >> applicant.py
echo 		self.applicant_id_together_with = applicant_id_together_with >> applicant.py
echo.>> applicant.py
echo 	def getApplicantIdTogetherWith(self): >> applicant.py
echo 		return self.applicant_id_together_with >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setApplicantNameNotTogetherWith(self,applicant_name_not_together_with): >> applicant.py
echo 		self.applicant_name_not_together_with = applicant_name_not_together_with >> applicant.py
echo.>> applicant.py
echo 	def getApplicantNameNotTogetherWith(self): >> applicant.py
echo 		return self.applicant_name_not_together_with >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo 	def setApplicantIdNotTogetherWith(self,applicant_id_not_together_with): >> applicant.py
echo 		self.applicant_id_not_together_with = applicant_id_not_together_with >> applicant.py
echo.>> applicant.py
echo 	def getApplicantIdNotTogetherWith(self): >> applicant.py
echo 		return self.applicant_id_not_together_with >> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo.>> applicant.py
echo copying C:\Program Files\Gila_Breath_Camp\Python\Entities\bunkhouse.py
cd C:\Program Files\Gila_Breath_Camp\Python\Entities
echo # =============================================================================== >> bunkhouse.py
echo #                             GILA BREATH CAMP >> bunkhouse.py
echo # >> bunkhouse.py
echo # =============================================================================== >> bunkhouse.py
echo # =============================================================================== >> bunkhouse.py
echo # FILE NAME      : bunkhouse.py >> bunkhouse.py
echo # PURPOSE        : Reading and Writing to "User.csv" >> bunkhouse.py
echo # AUTHOR         : JEMIN GOHIL, SOHEIL BOUZARI >> bunkhouse.py
echo # CREATION DATE  : 02-OCT-2016 >> bunkhouse.py
echo # PENDING 		 : Transformation >> bunkhouse.py
echo # ------------------------------------------------------------------------------- >> bunkhouse.py
echo # CHANGE HISTORY : >> bunkhouse.py
echo # VER	^|	DATE       	^|	MODIFIED BY  		^|  	CHANGE DESCRIPTION >> bunkhouse.py
echo # ------------------------------------------------------------------------------- >> bunkhouse.py
echo # 1.0   	02-OCT-2016  	JEMIN GOHIL, SOHEIL   Added bunkhouse_id, bunkhouse_name >> bunkhouse.py
echo #  >> bunkhouse.py
echo # ============================================================================== >> bunkhouse.py
echo.>> bunkhouse.py
echo class Bunkhouse(object): >> bunkhouse.py
echo.>> bunkhouse.py
echo 	def __init__  (self): >> bunkhouse.py
echo 		self.bunkhouse_id = 0 >> bunkhouse.py
echo 		self.bunkhouse_name = '' >> bunkhouse.py
echo.>> bunkhouse.py
echo 	def setBunkhouseId(self,bunkhouse_id): >> bunkhouse.py
echo 		self.bunkhouse_id = bunkhouse_id >> bunkhouse.py
echo.>> bunkhouse.py
echo 	def getBunkhouseId(self): >> bunkhouse.py
echo 		return self.bunkhouse_id >> bunkhouse.py
echo.>> bunkhouse.py
echo 	def setBunkhouseName(self,bunkhouse_name): >> bunkhouse.py
echo 		bunkhouse_name = bunkhouse_name.strip() >> bunkhouse.py
echo 		if bunkhouse_name.isalpha(): >> bunkhouse.py
echo 			self.bunkhouse_name = bunkhouse_name.upper() >> bunkhouse.py
echo 		else: >> bunkhouse.py
echo 			return "Enter only alphabets" >> bunkhouse.py
echo.>> bunkhouse.py
echo 	def getBunkhouseName(self): >> bunkhouse.py
echo 		return self.bunkhouse_name >> bunkhouse.py
echo.>> bunkhouse.py
echo copying C:\Program Files\Gila_Breath_Camp\Python\Entities\date.py
cd C:\Program Files\Gila_Breath_Camp\Python\Entities
echo # =============================================================================== >> date.py
echo #                             GILA BREATH CAMP >> date.py
echo # >> date.py
echo # =============================================================================== >> date.py
echo # =============================================================================== >> date.py
echo # FILE NAME      : date.py >> date.py
echo # PURPOSE        : Reading and Writing to "date.csv" >> date.py
echo # AUTHOR         : ROHAN SAWANT >> date.py
echo # CREATION DATE  : 15-OCT-2016 >> date.py
echo # PENDING 		 :  >> date.py
echo # ------------------------------------------------------------------------------- >> date.py
echo # CHANGE HISTORY : >> date.py
echo # VER	^|	DATE       	^|	MODIFIED BY  		^|  	CHANGE DESCRIPTION >> date.py
echo # ------------------------------------------------------------------------------- >> date.py
echo # 1.0   	15-OCT-2016  	ROHAN SAWANT    		Started coding >> date.py
echo # 2.0   	15-OCT-2016  	ROHAN SAWANT    		Completed coding >> date.py
echo # ================================================================================ >> date.py
echo.>> date.py
echo class Date(object): >> date.py
echo.>> date.py
echo 	def __init__  (self): >> date.py
echo 		self.date_id = '' >> date.py
echo 		self.month = ''		 >> date.py
echo 		self.year = '' >> date.py
echo.>> date.py
echo.>> date.py
echo 	def setDateId(self,date_id): >> date.py
echo 		self.date_id = date_id >> date.py
echo.>> date.py
echo 	def getDateId(self): >> date.py
echo 		return self.date_id >> date.py
echo.>> date.py
echo.>> date.py
echo 	def setMonth(self,month): >> date.py
echo 		self.month = month >> date.py
echo.>> date.py
echo 	def getMonth(self): >> date.py
echo 		return self.month >> date.py
echo.>> date.py
echo.>> date.py
echo 	def setYear(self,year): >> date.py
echo 		self.year = year >> date.py
echo.>> date.py
echo 	def getYear(self): >> date.py
echo 		return self.year >> date.py
echo.>> date.py
echo.>> date.py
echo copying C:\Program Files\Gila_Breath_Camp\Python\Entities\transactions.py
cd C:\Program Files\Gila_Breath_Camp\Python\Entities
echo # =============================================================================== >> transactions.py
echo #                             GILA BREATH CAMP >> transactions.py
echo # >> transactions.py
echo # =============================================================================== >> transactions.py
echo # =============================================================================== >> transactions.py
echo # FILE NAME      : transactions.py >> transactions.py
echo # PURPOSE        : Reading and Writing to "User.csv" >> transactions.py
echo # AUTHOR         : JEMIN GOHIL, SOHEIL BOUZARI >> transactions.py
echo # CREATION DATE  : 01-OCT-2016 >> transactions.py
echo # PENDING 		 : Transformation >> transactions.py
echo # ------------------------------------------------------------------------------- >> transactions.py
echo # CHANGE HISTORY : >> transactions.py
echo # VER	^|	DATE       	^|	MODIFIED BY  		^|  	CHANGE DESCRIPTION >> transactions.py
echo # ------------------------------------------------------------------------------- >> transactions.py
echo # 1.0   	01-OCT-2016  	JEMIN GOHIL    		Added user_id, user_name >> transactions.py
echo # 2.0       01-OCT-2016		SOHEIL BOUZARI      Added user_type, password >> transactions.py
echo # =============================================================================== >> transactions.py
echo.>> transactions.py
echo class Transactions(object): >> transactions.py
echo.>> transactions.py
echo 	def __init__(self):	 >> transactions.py
echo 		self.transaction_id = 0 >> transactions.py
echo 		self.user_id = '' >> transactions.py
echo 		self.applicant_id = '' >> transactions.py
echo 		self.bunkhouse_id = '' >> transactions.py
echo 		self.tribe_id = '' >> transactions.py
echo 											# Add Date and Time >> transactions.py
echo.>> transactions.py
echo.>> transactions.py
echo.>> transactions.py
echo 	def setTransactionId(self,transaction_id): >> transactions.py
echo 		self.transaction_id = transaction_id >> transactions.py
echo.>> transactions.py
echo 	def getTransactionId(self): >> transactions.py
echo 		return self.transaction_id >> transactions.py
echo.>> transactions.py
echo.>> transactions.py
echo.>> transactions.py
echo 	def setUserId(self,user_id): >> transactions.py
echo 		self.user_id = user_id	 >> transactions.py
echo.>> transactions.py
echo 	def getUserId(self): >> transactions.py
echo 		return self.user_id >> transactions.py
echo.>> transactions.py
echo.>> transactions.py
echo.>> transactions.py
echo.>> transactions.py
echo 	def setApplicantId(self,applicant_id): >> transactions.py
echo 		self.applicant_id = applicant_id >> transactions.py
echo.>> transactions.py
echo 	def getApplicantId(self): >> transactions.py
echo 		return self.applicant_id >> transactions.py
echo.>> transactions.py
echo.>> transactions.py
echo.>> transactions.py
echo.>> transactions.py
echo 	def setBunkhouseId(self,bunkhouse_id): >> transactions.py
echo 		self.bunkhouse_id = bunkhouse_id >> transactions.py
echo.>> transactions.py
echo 	def getBunkhouseId(self): >> transactions.py
echo 		return self.bunkhouse_id >> transactions.py
echo.>> transactions.py
echo.>> transactions.py
echo.>> transactions.py
echo.>> transactions.py
echo 	def setTribeId(self,tribe_id): >> transactions.py
echo 		self.tribe_id = tribe_id	 >> transactions.py
echo.>> transactions.py
echo 	def getTribeId(self): >> transactions.py
echo 		return self.tribe_id	 >> transactions.py
echo copying C:\Program Files\Gila_Breath_Camp\Python\Entities\tribe.py
cd C:\Program Files\Gila_Breath_Camp\Python\Entities
echo # =============================================================================== >> tribe.py
echo #                             GILA BREATH CAMP >> tribe.py
echo # >> tribe.py
echo # =============================================================================== >> tribe.py
echo # =============================================================================== >> tribe.py
echo # FILE NAME      : tribe.py >> tribe.py
echo # PURPOSE        : Reading and Writing to "User.csv" >> tribe.py
echo # AUTHOR         : JEMIN GOHIL, SOHEIL BOUZARI >> tribe.py
echo # CREATION DATE  : 01-OCT-2016 >> tribe.py
echo # PENDING 		 : Transformation >> tribe.py
echo # ------------------------------------------------------------------------------- >> tribe.py
echo # CHANGE HISTORY : >> tribe.py
echo # VER	^|	DATE       	^|	MODIFIED BY  		^|  	CHANGE DESCRIPTION >> tribe.py
echo # ------------------------------------------------------------------------------- >> tribe.py
echo # 1.0   	01-OCT-2016  	JEMIN GOHIL    		Added user_id, user_name >> tribe.py
echo # 2.0       01-OCT-2016		SOHEIL BOUZARI      Added user_type, password >> tribe.py
echo # ============================================================================== >> tribe.py
echo.>> tribe.py
echo.>> tribe.py
echo.>> tribe.py
echo class Tribe(object): >> tribe.py
echo.>> tribe.py
echo 	def __init__(self):	 >> tribe.py
echo 		self.tribe_id = 0 >> tribe.py
echo 		self.tribe_name = '' >> tribe.py
echo.>> tribe.py
echo.>> tribe.py
echo 	def setTribeId(self,tribe_id): >> tribe.py
echo 		self.tribe_id = tribe_id >> tribe.py
echo.>> tribe.py
echo 	def getTribeId(self): >> tribe.py
echo 		return self.tribe_id >> tribe.py
echo.>> tribe.py
echo.>> tribe.py
echo.>> tribe.py
echo 	def setTribeName(self,tribe_name): >> tribe.py
echo 		tribe_name = tribe_name.strip()				# Removing extra character from tribe class >> tribe.py
echo 		if tribe_name.isalpha(): >> tribe.py
echo 			self.tribe_name = tribe_name.upper() >> tribe.py
echo 		else:  >> tribe.py
echo 			return "Enter only alphabets" >> tribe.py
echo.>> tribe.py
echo.>> tribe.py
echo 	def getTribeName(self): >> tribe.py
echo 		return self.tribe_name >> tribe.py
echo copying C:\Program Files\Gila_Breath_Camp\Python\Entities\user.py
cd C:\Program Files\Gila_Breath_Camp\Python\Entities
echo # =============================================================================== >> user.py
echo #                             GILA BREATH CAMP >> user.py
echo # >> user.py
echo # =============================================================================== >> user.py
echo # =============================================================================== >> user.py
echo # FILE NAME      : user.py >> user.py
echo # PURPOSE        : Reading and Writing to "User.csv" >> user.py
echo # AUTHOR         : ROHAN SAWANT >> user.py
echo # CREATION DATE  : 01-OCT-2016 >> user.py
echo # PENDING 		 :  >> user.py
echo # ------------------------------------------------------------------------------- >> user.py
echo # CHANGE HISTORY : >> user.py
echo # VER	^|	DATE       	^|	MODIFIED BY  		^|  	CHANGE DESCRIPTION >> user.py
echo # ------------------------------------------------------------------------------- >> user.py
echo # 1.0   	01-OCT-2016  	ROHAN SAWANT    		Added user_id, user_name >> user.py
echo # 2.0       01-OCT-2016		JEMIN GOHIL             Added user_type, password >> user.py
echo # 3.0       03-OCT-2016		JEMIN GOHIL             Transformation complete >> user.py
echo # ================================================================================ >> user.py
echo.>> user.py
echo class User(object): >> user.py
echo.>> user.py
echo 	def __init__(self):	 >> user.py
echo 		self.user_id = 0 >> user.py
echo 		self.user_name = '' >> user.py
echo 		self.user_type = '' >> user.py
echo 		self.password = '' >> user.py
echo.>> user.py
echo 	def setUserId(self,user_id): >> user.py
echo 		self.user_id = user_id >> user.py
echo.>> user.py
echo 	def getUserId(self): >> user.py
echo 		return self.user_id >> user.py
echo.>> user.py
echo 	def setUserName(self,user_name): >> user.py
echo 		self.user_name = user_name.strip() >> user.py
echo.>> user.py
echo 	def getUserName(self): >> user.py
echo 		return self.user_name >> user.py
echo.>> user.py
echo 	def setUserType(self,user_type): >> user.py
echo 		self.user_type = user_type >> user.py
echo.>> user.py
echo 	def getUserType(self): >> user.py
echo 		return self.user_type >> user.py
echo.>> user.py
echo 	def setPassword(self,password): >> user.py
echo 		if len(password) ^< 5: >> user.py
echo 			return "Password should be more than 5 characters" >> user.py
echo 		else:  >> user.py
echo 			self.password = password >> user.py
echo.>> user.py
echo 	def getPassword(self): >> user.py
echo 		return self.password >> user.py
echo.>> user.py
echo.>> user.py
echo copying C:\Program Files\Gila_Breath_Camp\Python\User_Stories\application_cancellation.py
cd C:\Program Files\Gila_Breath_Camp\Python\User_Stories
echo # =============================================================================== >> application_cancellation.py
echo #                             GILA BREATH CAMP >> application_cancellation.py
echo # >> application_cancellation.py
echo # =============================================================================== >> application_cancellation.py
echo # =============================================================================== >> application_cancellation.py
echo # FILE NAME      : application_cancellation.py >> application_cancellation.py
echo # PURPOSE        : Logic to cancel an application of an applicant >> application_cancellation.py
echo # AUTHOR         : ROHAN SAWANT >> application_cancellation.py
echo # CREATION DATE  : 23-OCT-2016 >> application_cancellation.py
echo # PENDING 		 :  >> application_cancellation.py
echo # ------------------------------------------------------------------------------- >> application_cancellation.py
echo # CHANGE HISTORY : >> application_cancellation.py
echo # VER	^|	DATE       	^|	MODIFIED BY  		^|  	CHANGE DESCRIPTION >> application_cancellation.py
echo # ------------------------------------------------------------------------------- >> application_cancellation.py
echo # 1.0   	23-OCT-2016  	SOHEIL BOUZARI    		Started coding >> application_cancellation.py
echo # 2.0   	23-NOV-2016  	JEMIN GOHIL     		Completed cancellation, refund left >> application_cancellation.py
echo # ================================================================================ >> application_cancellation.py
echo.>> application_cancellation.py
echo import sys >> application_cancellation.py
echo import ast >> application_cancellation.py
echo import json >> application_cancellation.py
echo import datetime >> application_cancellation.py
echo import getpass >> application_cancellation.py
echo sys.path.append("Python") >> application_cancellation.py
echo import common_functions >> application_cancellation.py
echo.>> application_cancellation.py
echo class Application_cancellation(object): >> application_cancellation.py
echo.>> application_cancellation.py
echo 	def getApplicationCancellation(self,front_end_str): >> application_cancellation.py
echo 		^""" get data for accepted applicants ^""" >> application_cancellation.py
echo.>> application_cancellation.py
echo 		cf = common_functions.Common_functions() >> application_cancellation.py
echo 		data = cf.getAcceptedApplicants(front_end_str) >> application_cancellation.py
echo.>> application_cancellation.py
echo 		if len(data) == 0: >> application_cancellation.py
echo 			return_front_end_dict = '{ "data": [], "status":"success", "message":"No applicants registered" }' >> application_cancellation.py
echo 		else: >> application_cancellation.py
echo 			return_front_end_dict = '{ "data": ' + json.dumps(data) + ', "status":"success", "message":"All applicant''s information retrieved" }' >> application_cancellation.py
echo.>> application_cancellation.py
echo 		return return_front_end_dict >> application_cancellation.py
echo.>> application_cancellation.py
echo 	def setCancelFlag(self,front_end_str): >> application_cancellation.py
echo 		^""" set cancel at csv ^""" >> application_cancellation.py
echo.>> application_cancellation.py
echo 		front_end_dict = ast.literal_eval(front_end_str) >> application_cancellation.py
echo 		front_end_data = front_end_dict['data'][0] >> application_cancellation.py
echo 		where = {'applicant_id': str(front_end_data['applicant_id'])} >> application_cancellation.py
echo.>> application_cancellation.py
echo 		cf = common_functions.Common_functions() >> application_cancellation.py
echo 		data = cf.getFromCsv('applicant.csv',where) >> application_cancellation.py
echo.>> application_cancellation.py
echo 		if len(data) == 0: >> application_cancellation.py
echo 			return_front_end_dict = '{ "data": "", "status":"error", "message":"Something went wrong" }' >> application_cancellation.py
echo.>> application_cancellation.py
echo 		else: >> application_cancellation.py
echo 			data[0]['cancel_flag'] = '0' >> application_cancellation.py
echo 			cf.updateManyRowIntoCsv('applicant.csv',data,'applicant_id') >> application_cancellation.py
echo 			return_front_end_dict = '{ "data": ' + json.dumps(data) + ', "status":"success", "message":"Applicantion has been cancelled" }' >> application_cancellation.py
echo.>> application_cancellation.py
echo.>> application_cancellation.py
echo 		#print('return_front_end_dict;',return_front_end_dict)		 >> application_cancellation.py
echo 		return return_front_end_dict >> application_cancellation.py
echo.>> application_cancellation.py
echo 	def setManyCancelFlag(self,front_end_str): >> application_cancellation.py
echo 		^""" set cancel at csv ^""" >> application_cancellation.py
echo.>> application_cancellation.py
echo 		front_end_dict = ast.literal_eval(front_end_str) >> application_cancellation.py
echo 		front_end_data = front_end_dict['data'] >> application_cancellation.py
echo.>> application_cancellation.py
echo 		cf = common_functions.Common_functions() >> application_cancellation.py
echo 		data = cf.getFromCsv('applicant.csv',{}) >> application_cancellation.py
echo.>> application_cancellation.py
echo 		applicant_ids = [] >> application_cancellation.py
echo 		new = [] >> application_cancellation.py
echo.>> application_cancellation.py
echo.>> application_cancellation.py
echo 		for i in range(0,len(front_end_data)): >> application_cancellation.py
echo 			applicant_ids.append(front_end_data[i]['applicant_id']) >> application_cancellation.py
echo 			#print(applicant_ids) >> application_cancellation.py
echo 		for j in range(0,len(data)): >> application_cancellation.py
echo 			if data[j]['applicant_id'] in applicant_ids: >> application_cancellation.py
echo 				new.append(data[j]) >> application_cancellation.py
echo.>> application_cancellation.py
echo 		print (len(new)) >> application_cancellation.py
echo.>> application_cancellation.py
echo 		for k in range(0,len(new)): >> application_cancellation.py
echo 			for i in range(0,len(front_end_data)): >> application_cancellation.py
echo 				if new[k]["applicant_id"] == front_end_data[i]["applicant_id"]: >> application_cancellation.py
echo 					new[k]["cancel_flag"] = front_end_data[i]["cancel_flag"] >> application_cancellation.py
echo.>> application_cancellation.py
echo.>> application_cancellation.py
echo 		for l in range(0,len(new)): >> application_cancellation.py
echo 			if new[l]["cancel_flag"] == '1': >> application_cancellation.py
echo 				new[l]["cancel_date"] = str(datetime.datetime.now()) >> application_cancellation.py
echo 				print('new[l]["cancel_date"]:',new[l]["cancel_date"]) >> application_cancellation.py
echo 					#getRefund(new[l]["payment"],new[l]["mailing_date"],new[l]["cancel_date"]) >> application_cancellation.py
echo 				new[l]["refund"] = self.getRefund(new[l]["payment"],new[l]["mailing_date"],new[l]["cancel_date"]) >> application_cancellation.py
echo 				print(new[l]["refund"]) >> application_cancellation.py
echo 			else: >> application_cancellation.py
echo 				new[l]["cancel_date"] = "" >> application_cancellation.py
echo 				new[l]["refund"] = "" >> application_cancellation.py
echo.>> application_cancellation.py
echo 		cf.updateManyRowIntoCsv('applicant.csv',new,'applicant_id') >> application_cancellation.py
echo 		return_front_end_dict = '{ "data": ' + json.dumps(new) + ', "status":"success", "message":"Application has been updated" }' >> application_cancellation.py
echo 		return return_front_end_dict >> application_cancellation.py
echo.>> application_cancellation.py
echo 	def getRefund(self,payment,mailing_date,cancel_date): >> application_cancellation.py
echo.>> application_cancellation.py
echo 		^"""Set Refund at csv^""" >> application_cancellation.py
echo 		cf = common_functions.Common_functions() >> application_cancellation.py
echo 		mail = cf.str_to_date(mailing_date) >> application_cancellation.py
echo 		print('cancel_date:',cancel_date) >> application_cancellation.py
echo 		cancel = cf.str_to_date(cancel_date) >> application_cancellation.py
echo.>> application_cancellation.py
echo 		#print(mail) >> application_cancellation.py
echo 		#print(cancel_date) >> application_cancellation.py
echo 		#if week_difference >> application_cancellation.py
echo 		week_difference =  (cancel - mail).days/7 >> application_cancellation.py
echo 		print('week_difference:',week_difference) >> application_cancellation.py
echo 		if int(payment)^<=1000: >> application_cancellation.py
echo 			if week_difference ^<= 3: >> application_cancellation.py
echo 				refund = float(payment)*0.9 >> application_cancellation.py
echo 				return refund >> application_cancellation.py
echo.>> application_cancellation.py
echo 			elif week_difference ^>= 3 and week_difference ^<= 6: >> application_cancellation.py
echo 				refund = float(payment)*0.45 >> application_cancellation.py
echo 				return refund >> application_cancellation.py
echo.>> application_cancellation.py
echo 			else: >> application_cancellation.py
echo 				return "0" >> application_cancellation.py
echo 		elif int(payment)^>1000: >> application_cancellation.py
echo 			payment_extra = int(payment)-1000 >> application_cancellation.py
echo 			if week_difference ^<= 3: >> application_cancellation.py
echo 				refund = float(1000)*0.9 >> application_cancellation.py
echo 				return refund+payment_extra >> application_cancellation.py
echo.>> application_cancellation.py
echo 			elif week_difference ^>= 3 and week_difference ^<= 6: >> application_cancellation.py
echo 				refund = float(1000)*0.45 >> application_cancellation.py
echo 				return refund+payment_extra >> application_cancellation.py
echo.>> application_cancellation.py
echo 			else: >> application_cancellation.py
echo 				return "0" >> application_cancellation.py
echo.>> application_cancellation.py
echo.>> application_cancellation.py
echo 		#for i in range(0,len(new)): >> application_cancellation.py
echo 			#if new[i]["cancel_flag"] == '1' >> application_cancellation.py
echo 			#refunds.append()^""" >> application_cancellation.py
echo.>> application_cancellation.py
echo copying C:\Program Files\Gila_Breath_Camp\Python\User_Stories\application_status.py
cd C:\Program Files\Gila_Breath_Camp\Python\User_Stories
echo # =============================================================================== >> application_status.py
echo #                             GILA BREATH CAMP >> application_status.py
echo # >> application_status.py
echo # =============================================================================== >> application_status.py
echo # =============================================================================== >> application_status.py
echo # FILE NAME      :  application_status.py >> application_status.py
echo # PURPOSE        : Logic for getting the application status >> application_status.py
echo # AUTHOR         : ROHAN SAWANT >> application_status.py
echo # CREATION DATE  : 16-OCT-2016 >> application_status.py
echo # PENDING 		 :  >> application_status.py
echo # ------------------------------------------------------------------------------- >> application_status.py
echo # CHANGE HISTORY : >> application_status.py
echo # VER	^|	DATE       	^|	MODIFIED BY  		^|  	CHANGE DESCRIPTION >> application_status.py
echo # ------------------------------------------------------------------------------- >> application_status.py
echo # 1.0   	16-OCT-2016  	ROHAN SAWANT    		Started coding >> application_status.py
echo # 2.0   	16-OCT-2016  	ROHAN SAWANT    		Added logic for getApplicationStatus >> application_status.py
echo # ================================================================================ >> application_status.py
echo.>> application_status.py
echo import sys >> application_status.py
echo import json >> application_status.py
echo import ast >> application_status.py
echo import datetime >> application_status.py
echo sys.path.append("Python") >> application_status.py
echo import common_functions >> application_status.py
echo sys.path.append("Python/Entities") >> application_status.py
echo import applicant >> application_status.py
echo.>> application_status.py
echo class Application_status(object): >> application_status.py
echo.>> application_status.py
echo 	def isApplicationDateNotInRange(self,application_date,camp_date): >> application_status.py
echo 		^""" checks whether the application date has surpassed or not ^""" >> application_status.py
echo.>> application_status.py
echo 		cf = common_functions.Common_functions() >> application_status.py
echo 		camp_date_minus_2_month = cf.monthdelta(camp_date,-2) >> application_status.py
echo 		camp_date_minus_8_month = cf.monthdelta(camp_date,-8)	 >> application_status.py
echo.>> application_status.py
echo 		if application_date ^>= camp_date_minus_8_month and application_date ^<=camp_date_minus_2_month: >> application_status.py
echo 			return False					 >> application_status.py
echo 		else: >> application_status.py
echo 			return True >> application_status.py
echo.>> application_status.py
echo 	def isSlotNotAvailable(self,accepted_count,gender): >> application_status.py
echo 		^""" checks slots for male and female are available  ^""" >> application_status.py
echo.>> application_status.py
echo 		if accepted_count[gender] ^<= 36: >> application_status.py
echo 			return False					 >> application_status.py
echo 		else: >> application_status.py
echo 			return True >> application_status.py
echo.>> application_status.py
echo 	def isAgeNotInRange(self,age): >> application_status.py
echo 		^""" checks whether the age of applicant in between 8 and 19 ^""" >> application_status.py
echo.>> application_status.py
echo 		if age ^>= 9 and age ^<=18: >> application_status.py
echo 			return False >> application_status.py
echo 		else: >> application_status.py
echo 			return True >> application_status.py
echo.>> application_status.py
echo 	def isPaymentNotCorrect(self,payment): >> application_status.py
echo 		^""" checks whether payment is correct (1000$ or more) ^""" >> application_status.py
echo.>> application_status.py
echo 		if payment ^>= 1000: >> application_status.py
echo 			return False >> application_status.py
echo 		else: >> application_status.py
echo 			return True >> application_status.py
echo.>> application_status.py
echo 	def getApplicationStatus(self,front_end_str): >> application_status.py
echo.>> application_status.py
echo 		front_end_dict = ast.literal_eval(front_end_str) >> application_status.py
echo 		front_end_data = front_end_dict['data'][0] >> application_status.py
echo.>> application_status.py
echo 		cf = common_functions.Common_functions() >> application_status.py
echo 		data = cf.getFromCsv('applicant.csv',front_end_data) >> application_status.py
echo.>> application_status.py
echo 		if len(data) == 0: >> application_status.py
echo 			return_front_end_dict = '{ "data": [], "status":"success", "message":"No applicants registered" }' >> application_status.py
echo 		else: >> application_status.py
echo.>> application_status.py
echo 			new_data = [] >> application_status.py
echo 			accepted_count = {'MALE':0,'FEMALE':0} >> application_status.py
echo.>> application_status.py
echo 			for i in range(0,len(data)): >> application_status.py
echo.>> application_status.py
echo 				dict = {} >> application_status.py
echo 				violations = [] >> application_status.py
echo 				slot = 36 >> application_status.py
echo 				applicant_status = 0 >> application_status.py
echo.>> application_status.py
echo 				# data about the applicant >> application_status.py
echo 				camp_date = datetime.datetime.strptime(data[i]['camp_time_slots'],"%%Y-%%m-%%d %%H:%%M:%%S.%%f")	 >> application_status.py
echo 				application_date = datetime.datetime.strptime(data[i]['application_date'],"%%Y-%%m-%%d %%H:%%M:%%S.%%f") >> application_status.py
echo 				gender = data[i]['applicant_gender'] >> application_status.py
echo 				age = int(data[i]['applicant_age']) >> application_status.py
echo 				payment = int(data[i]['payment'])	 >> application_status.py
echo.>> application_status.py
echo 				if self.isApplicationDateNotInRange(application_date,camp_date): >> application_status.py
echo 					violations.append('DATE OF REGISTRATION HAS SURPASSED') >> application_status.py
echo.>> application_status.py
echo 				if self.isSlotNotAvailable(accepted_count,gender): >> application_status.py
echo 					violations.append(gender + ' SLOTS ARE FULL') >> application_status.py
echo.>> application_status.py
echo 				if self.isAgeNotInRange(age): >> application_status.py
echo 					violations.append('AGE IS NOT BETWEEN 8 AND 19') >> application_status.py
echo.>> application_status.py
echo 				if self.isPaymentNotCorrect(payment): >> application_status.py
echo 					violations.append(str(payment) + '$ IS LESS THAN 1000$') >> application_status.py
echo.>> application_status.py
echo 				if len(violations) == 0: >> application_status.py
echo 					accepted_count[gender] += 1 >> application_status.py
echo 					applicant_status = 1 >> application_status.py
echo 					violations.append('NO VIOLATIONS') >> application_status.py
echo.>> application_status.py
echo 				dict['applicant_id'] = data[i]['applicant_id'] >> application_status.py
echo 				dict['applicant_first_name'] = data[i]['applicant_first_name'] >> application_status.py
echo 				dict['applicant_last_name'] = data[i]['applicant_last_name'] >> application_status.py
echo 				dict['application_status'] = applicant_status >> application_status.py
echo 				dict['acceptance_packet'] = data[i]['acceptance_packet'] >> application_status.py
echo 				dict['violations'] = violations >> application_status.py
echo.>> application_status.py
echo 				new_data.append(dict) >> application_status.py
echo.>> application_status.py
echo 				data[i]['rejected_reason'] = new_data[i]['violations'][0] >> application_status.py
echo.>> application_status.py
echo 			cf.updateManyRowIntoCsv('applicant.csv',data,'applicant_id') >> application_status.py
echo.>> application_status.py
echo 			return_front_end_dict = '{ "data": ' + json.dumps(new_data) + ', "status":"success", "message":"All applicant''s information retrieved" }' >> application_status.py
echo.>> application_status.py
echo 		return return_front_end_dict >> application_status.py
echo.>> application_status.py
echo.>> application_status.py
echo 	def updateApplicationStatus(self,front_end_str): >> application_status.py
echo.>> application_status.py
echo 		front_end_dict = ast.literal_eval(front_end_str) >> application_status.py
echo 		front_end_data = front_end_dict['data'] >> application_status.py
echo 		cf = common_functions.Common_functions() >> application_status.py
echo.>> application_status.py
echo 		app_dict = [] >> application_status.py
echo.>> application_status.py
echo 		for i in range(0,len(front_end_data)): >> application_status.py
echo.>> application_status.py
echo 			where_applicant_id = {} >> application_status.py
echo 			where_applicant_id['applicant_id'] = front_end_data[i]['applicant_id'] >> application_status.py
echo.>> application_status.py
echo 			data = cf.getFromCsv('applicant.csv',where_applicant_id) >> application_status.py
echo 			print(data) >> application_status.py
echo.>> application_status.py
echo 			if front_end_data[i]['acceptance_packet'] == "1": >> application_status.py
echo 				data[0]['acceptance_packet'] = front_end_data[i]['acceptance_packet'] >> application_status.py
echo 				if data[0]['mailing_date'] == "": >> application_status.py
echo 					data[0]['mailing_date'] = str(datetime.datetime.now()) >> application_status.py
echo 			elif front_end_data[i]['acceptance_packet'] == "0": >> application_status.py
echo 				data[0]['acceptance_packet'] = "" >> application_status.py
echo 				data[0]['mailing_date'] = "" >> application_status.py
echo.>> application_status.py
echo 			if front_end_data[i]['application_status'][0] == "A": >> application_status.py
echo 				data[0]['application_status'] = "1" >> application_status.py
echo 			elif front_end_data[i]['application_status'][0] == "R": >> application_status.py
echo 				data[0]['application_status'] = "0" >> application_status.py
echo.>> application_status.py
echo 			data[0]['rejected_reason'] = front_end_data[i]['rejected_reason'] >> application_status.py
echo.>> application_status.py
echo 			app_dict.append(data[0]) >> application_status.py
echo.>> application_status.py
echo 		cf.updateManyRowIntoCsv('applicant.csv',app_dict,'applicant_id') >> application_status.py
echo.>> application_status.py
echo 		return_front_end_dict = '{ "data": "", "status":"success", "message":"All applicant''s information updated" }' >> application_status.py
echo.>> application_status.py
echo 		return return_front_end_dict >> application_status.py
echo.>> application_status.py
echo.>> application_status.py
echo.>> application_status.py
echo.>> application_status.py
echo copying C:\Program Files\Gila_Breath_Camp\Python\User_Stories\assignment_of_bunkhouses.py
cd C:\Program Files\Gila_Breath_Camp\Python\User_Stories
echo # =============================================================================== >> assignment_of_bunkhouses.py
echo #                             GILA BREATH CAMP >> assignment_of_bunkhouses.py
echo # >> assignment_of_bunkhouses.py
echo # =============================================================================== >> assignment_of_bunkhouses.py
echo # =============================================================================== >> assignment_of_bunkhouses.py
echo # FILE NAME      : assignment_of_bunkhouses.py >> assignment_of_bunkhouses.py
echo # PURPOSE        : Assign bunkhouses to applicants >> assignment_of_bunkhouses.py
echo # AUTHOR         : ROHAN SAWANT >> assignment_of_bunkhouses.py
echo # CREATION DATE  : 26-NOV-2016 >> assignment_of_bunkhouses.py
echo # PENDING 		 :  >> assignment_of_bunkhouses.py
echo # ------------------------------------------------------------------------------- >> assignment_of_bunkhouses.py
echo # CHANGE HISTORY : >> assignment_of_bunkhouses.py
echo # VER	^|	DATE       	^|	MODIFIED BY  		^|  	CHANGE DESCRIPTION >> assignment_of_bunkhouses.py
echo # ------------------------------------------------------------------------------- >> assignment_of_bunkhouses.py
echo # 1.0   	26-NOV-2016  	ROHAN SAWANT    		Started coding >> assignment_of_bunkhouses.py
echo # =============================================================================== >> assignment_of_bunkhouses.py
echo.>> assignment_of_bunkhouses.py
echo import ast >> assignment_of_bunkhouses.py
echo import json >> assignment_of_bunkhouses.py
echo import sys >> assignment_of_bunkhouses.py
echo sys.path.append("Python") >> assignment_of_bunkhouses.py
echo import common_functions >> assignment_of_bunkhouses.py
echo.>> assignment_of_bunkhouses.py
echo class Assignment_of_bunkhouses(object): >> assignment_of_bunkhouses.py
echo.>> assignment_of_bunkhouses.py
echo 	def readBunkhouseData(self,front_end_str): >> assignment_of_bunkhouses.py
echo 		^""" read data for Bunkhouse ^""" >> assignment_of_bunkhouses.py
echo.>> assignment_of_bunkhouses.py
echo 		front_end_dict = ast.literal_eval(front_end_str) >> assignment_of_bunkhouses.py
echo 		front_end_data = front_end_dict['data'][0] >> assignment_of_bunkhouses.py
echo 		where = [{'camp_time_slots':str(front_end_data['camp_time_slots'])}] >> assignment_of_bunkhouses.py
echo 		total_no_of_bunkhouses = int(front_end_data['no_of_bunkhouses']) >> assignment_of_bunkhouses.py
echo 		no_of_male_bunkhouses = total_no_of_bunkhouses/2 >> assignment_of_bunkhouses.py
echo 		no_of_female_bunkhouses = total_no_of_bunkhouses >> assignment_of_bunkhouses.py
echo.>> assignment_of_bunkhouses.py
echo 		cf = common_functions.Common_functions() >> assignment_of_bunkhouses.py
echo 		data = cf.getCheckedInApplicants('{ "data": ' + json.dumps(where) + '}') >> assignment_of_bunkhouses.py
echo.>> assignment_of_bunkhouses.py
echo 		if len(data) == 0: >> assignment_of_bunkhouses.py
echo 			return_front_end_dict = '{ "data": [], "status":"success", "message":"No applicants registered" }' >> assignment_of_bunkhouses.py
echo 		else: >> assignment_of_bunkhouses.py
echo 			male_data = [] >> assignment_of_bunkhouses.py
echo 			female_data = [] >> assignment_of_bunkhouses.py
echo.>> assignment_of_bunkhouses.py
echo 			for i in range(0,len(data)): >> assignment_of_bunkhouses.py
echo 				if data[i]['applicant_gender'] == 'MALE': >> assignment_of_bunkhouses.py
echo 					male_data.append(data[i]) >> assignment_of_bunkhouses.py
echo 				elif data[i]['applicant_gender'] == 'FEMALE': >> assignment_of_bunkhouses.py
echo 					female_data.append(data[i]) >> assignment_of_bunkhouses.py
echo.>> assignment_of_bunkhouses.py
echo 			male_data_with_bunkhouses = cf.sortData(male_data,'applicant_age') >> assignment_of_bunkhouses.py
echo 			female_data_with_bunkhouses = cf.sortData(female_data,'applicant_age') >> assignment_of_bunkhouses.py
echo.>> assignment_of_bunkhouses.py
echo 			bunkhouse_id = 1 >> assignment_of_bunkhouses.py
echo 			for k in range(0,len(male_data_with_bunkhouses)):  >> assignment_of_bunkhouses.py
echo 				male_data_with_bunkhouses[k]['bunkhouse_id'] = bunkhouse_id >> assignment_of_bunkhouses.py
echo 				bunkhouse_id += 1 >> assignment_of_bunkhouses.py
echo 				if bunkhouse_id == no_of_male_bunkhouses + 1: >> assignment_of_bunkhouses.py
echo 					bunkhouse_id = 1 >> assignment_of_bunkhouses.py
echo.>> assignment_of_bunkhouses.py
echo 			bunkhouse_id = no_of_male_bunkhouses + 1 >> assignment_of_bunkhouses.py
echo 			for l in range(0,len(female_data_with_bunkhouses)):  >> assignment_of_bunkhouses.py
echo 				female_data_with_bunkhouses[l]['bunkhouse_id'] = bunkhouse_id >> assignment_of_bunkhouses.py
echo 				bunkhouse_id += 1 >> assignment_of_bunkhouses.py
echo 				if bunkhouse_id == no_of_female_bunkhouses + 1: >> assignment_of_bunkhouses.py
echo 					bunkhouse_id = no_of_male_bunkhouses + 1 >> assignment_of_bunkhouses.py
echo.>> assignment_of_bunkhouses.py
echo 			all_data = male_data_with_bunkhouses + female_data_with_bunkhouses >> assignment_of_bunkhouses.py
echo 			cf.updateManyRowIntoCsv('applicant.csv',all_data,'applicant_id') >> assignment_of_bunkhouses.py
echo 			all_data_rows = cf.sortData(all_data,'bunkhouse_id') >> assignment_of_bunkhouses.py
echo.>> assignment_of_bunkhouses.py
echo 			return_front_end_dict = '{ "data": ' + json.dumps(all_data_rows) + ', "status":"success", "message":"All applicant''s information retrieved" }' >> assignment_of_bunkhouses.py
echo.>> assignment_of_bunkhouses.py
echo 		return return_front_end_dict >> assignment_of_bunkhouses.py
echo.>> assignment_of_bunkhouses.py
echo.>> assignment_of_bunkhouses.py
echo.>> assignment_of_bunkhouses.py
echo.>> assignment_of_bunkhouses.py
echo.>> assignment_of_bunkhouses.py
echo copying C:\Program Files\Gila_Breath_Camp\Python\User_Stories\assignment_of_tribes.py
cd C:\Program Files\Gila_Breath_Camp\Python\User_Stories
echo # =============================================================================== >> assignment_of_tribes.py
echo #                             GILA BREATH CAMP >> assignment_of_tribes.py
echo # >> assignment_of_tribes.py
echo # =============================================================================== >> assignment_of_tribes.py
echo # =============================================================================== >> assignment_of_tribes.py
echo # FILE NAME      : assignment_of_tribes.py >> assignment_of_tribes.py
echo # PURPOSE        : Assign tribes to applicants >> assignment_of_tribes.py
echo # AUTHOR         : ROHAN SAWANT >> assignment_of_tribes.py
echo # CREATION DATE  : 27-NOV-2016 >> assignment_of_tribes.py
echo # PENDING 		 :  >> assignment_of_tribes.py
echo # ------------------------------------------------------------------------------- >> assignment_of_tribes.py
echo # CHANGE HISTORY : >> assignment_of_tribes.py
echo # VER	^|	DATE       	^|	MODIFIED BY  		^|  	CHANGE DESCRIPTION >> assignment_of_tribes.py
echo # ------------------------------------------------------------------------------- >> assignment_of_tribes.py
echo # 1.0   	27-NOV-2016  	ROHAN SAWANT    		Started coding >> assignment_of_tribes.py
echo # =============================================================================== >> assignment_of_tribes.py
echo.>> assignment_of_tribes.py
echo import ast >> assignment_of_tribes.py
echo import json >> assignment_of_tribes.py
echo import sys >> assignment_of_tribes.py
echo sys.path.append("Python") >> assignment_of_tribes.py
echo import common_functions >> assignment_of_tribes.py
echo.>> assignment_of_tribes.py
echo class Assignment_of_tribes(object): >> assignment_of_tribes.py
echo.>> assignment_of_tribes.py
echo 	def readTribesData(self,front_end_str): >> assignment_of_tribes.py
echo 		^""" read data for Tribes ^""" >> assignment_of_tribes.py
echo.>> assignment_of_tribes.py
echo 		front_end_dict = ast.literal_eval(front_end_str) >> assignment_of_tribes.py
echo 		front_end_data = front_end_dict['data'][0] >> assignment_of_tribes.py
echo 		where = [{'camp_time_slots':str(front_end_data['camp_time_slots'])}] >> assignment_of_tribes.py
echo 		total_no_of_tribes = int(front_end_data['no_of_tribes']) >> assignment_of_tribes.py
echo.>> assignment_of_tribes.py
echo 		cf = common_functions.Common_functions() >> assignment_of_tribes.py
echo 		data = cf.getCheckedInApplicants('{ "data": ' + json.dumps(where) + '}') >> assignment_of_tribes.py
echo.>> assignment_of_tribes.py
echo 		if len(data) == 0: >> assignment_of_tribes.py
echo 			return_front_end_dict = '{ "data": [], "status":"success", "message":"No applicants registered" }' >> assignment_of_tribes.py
echo 		else: >> assignment_of_tribes.py
echo 			male_data = [] >> assignment_of_tribes.py
echo 			female_data = [] >> assignment_of_tribes.py
echo.>> assignment_of_tribes.py
echo 			for i in range(0,len(data)): >> assignment_of_tribes.py
echo 				if data[i]['applicant_gender'] == 'MALE': >> assignment_of_tribes.py
echo 					male_data.append(data[i]) >> assignment_of_tribes.py
echo 				elif data[i]['applicant_gender'] == 'FEMALE': >> assignment_of_tribes.py
echo 					female_data.append(data[i]) >> assignment_of_tribes.py
echo.>> assignment_of_tribes.py
echo 			male_data_with_tribes = cf.sortData(male_data,'applicant_age') >> assignment_of_tribes.py
echo 			female_data_with_tribes = cf.sortData(female_data,'applicant_age') >> assignment_of_tribes.py
echo.>> assignment_of_tribes.py
echo 			tribe_id = 1 >> assignment_of_tribes.py
echo 			for k in range(0,len(male_data_with_tribes)):  >> assignment_of_tribes.py
echo 				male_data_with_tribes[k]['tribe_id'] = tribe_id >> assignment_of_tribes.py
echo 				tribe_id += 1 >> assignment_of_tribes.py
echo 				if tribe_id == total_no_of_tribes + 1: >> assignment_of_tribes.py
echo 					tribe_id = 1 >> assignment_of_tribes.py
echo.>> assignment_of_tribes.py
echo 			for l in range(0,len(female_data_with_tribes)):  >> assignment_of_tribes.py
echo 				female_data_with_tribes[l]['tribe_id'] = tribe_id >> assignment_of_tribes.py
echo 				tribe_id += 1 >> assignment_of_tribes.py
echo 				if tribe_id == total_no_of_tribes + 1: >> assignment_of_tribes.py
echo 					tribe_id = 1 >> assignment_of_tribes.py
echo.>> assignment_of_tribes.py
echo 			all_data = male_data_with_tribes + female_data_with_tribes >> assignment_of_tribes.py
echo 			all_data_rows = cf.sortData(all_data,'tribe_id') >> assignment_of_tribes.py
echo.>> assignment_of_tribes.py
echo 			return_front_end_dict = '{ "data": ' + json.dumps(all_data_rows) + ', "status":"success", "message":"All applicant''s information retrieved" }' >> assignment_of_tribes.py
echo.>> assignment_of_tribes.py
echo 		return return_front_end_dict >> assignment_of_tribes.py
echo.>> assignment_of_tribes.py
echo.>> assignment_of_tribes.py
echo.>> assignment_of_tribes.py
echo.>> assignment_of_tribes.py
echo copying C:\Program Files\Gila_Breath_Camp\Python\User_Stories\cancellation.py
cd C:\Program Files\Gila_Breath_Camp\Python\User_Stories
echo # =============================================================================== >> cancellation.py
echo #                             GILA BREATH CAMP >> cancellation.py
echo # >> cancellation.py
echo # =============================================================================== >> cancellation.py
echo # =============================================================================== >> cancellation.py
echo # FILE NAME      : cancellation.py >> cancellation.py
echo # PURPOSE        : Logic for cancellation >> cancellation.py
echo # AUTHOR         : SOHEIL BOUZARI >> cancellation.py
echo # CREATION DATE  : 28-OCT-2016 >> cancellation.py
echo # PENDING 		 :  >> cancellation.py
echo # ------------------------------------------------------------------------------- >> cancellation.py
echo # CHANGE HISTORY : >> cancellation.py
echo # VER	^|	DATE       	^|	MODIFIED BY  		^|  	CHANGE DESCRIPTION >> cancellation.py
echo # -------------------------------------------------------------------------------- >> cancellation.py
echo # 1.0   	28-OCT-2016  	SOHEIL BOUZARI    		Started coding >> cancellation.py
echo # ================================================================================ >> cancellation.py
echo.>> cancellation.py
echo.>> cancellation.py
echo.>> cancellation.py
echo import sys >> cancellation.py
echo import ast >> cancellation.py
echo import json >> cancellation.py
echo sys.path.append("Python") >> cancellation.py
echo import common_functions >> cancellation.py
echo sys.path.append("Python/Entities") >> cancellation.py
echo import applicant >> cancellation.py
echo sys.path.append("Python/User_Stories") >> cancellation.py
echo.>> cancellation.py
echo class Cancellation(object): >> cancellation.py
echo.>> cancellation.py
echo 	def cancel(self,)  >> cancellation.py
echo.>> cancellation.py
echo 		input_from_ui = json.loads('{"applicant_id": "9", "cancel_flag":"1"}') >> cancellation.py
echo.>> cancellation.py
echo 		applicantid = input_from_ui['applicant_id'] >> cancellation.py
echo 		cancelflag = input_from_ui['cancel_flag'] >> cancellation.py
echo.>> cancellation.py
echo.>> cancellation.py
echo 		cf = common_functions.Common_functions() >> cancellation.py
echo 		where = {'applicant_id':str(applicantid)} >> cancellation.py
echo 		data = cf.getFromCsv("applicant.csv",where) >> cancellation.py
echo 		data[0]['cancel_flag'] = str(cancelflag) >> cancellation.py
echo.>> cancellation.py
echo 		#print (data[0])  >> cancellation.py
echo.>> cancellation.py
echo.>> cancellation.py
echo 		#updateManyRowIntoCsv(self,filename,list_of_dict,input_key): >> cancellation.py
echo.>> cancellation.py
echo 		cf.updateManyRowIntoCsv("applicant.csv",data,"applicant_id") >> cancellation.py
echo.>> cancellation.py
echo.>> cancellation.py
echo.>> cancellation.py
echo copying C:\Program Files\Gila_Breath_Camp\Python\User_Stories\check_in_status.py
cd C:\Program Files\Gila_Breath_Camp\Python\User_Stories
echo # =============================================================================== >> check_in_status.py
echo #                             GILA BREATH CAMP >> check_in_status.py
echo # >> check_in_status.py
echo # =============================================================================== >> check_in_status.py
echo # =============================================================================== >> check_in_status.py
echo # FILE NAME      : check_in_status.py >> check_in_status.py
echo # PURPOSE        : Logic for Check In >> check_in_status.py
echo # AUTHOR         : ROHAN SAWANT >> check_in_status.py
echo # CREATION DATE  : 15-OCT-2016 >> check_in_status.py
echo # PENDING 		 :  >> check_in_status.py
echo # ------------------------------------------------------------------------------- >> check_in_status.py
echo # CHANGE HISTORY : >> check_in_status.py
echo # VER	^|	DATE       	^|	MODIFIED BY  		^|  	CHANGE DESCRIPTION >> check_in_status.py
echo # ------------------------------------------------------------------------------- >> check_in_status.py
echo # 1.0   	15-OCT-2016  	ROHAN SAWANT    		Started coding >> check_in_status.py
echo # 2.0   	15-OCT-2016  	ROHAN SAWANT    		Completed >> check_in_status.py
echo # ================================================================================ >> check_in_status.py
echo.>> check_in_status.py
echo import sys >> check_in_status.py
echo import ast >> check_in_status.py
echo import json >> check_in_status.py
echo sys.path.append("Python") >> check_in_status.py
echo import common_functions >> check_in_status.py
echo sys.path.append("Python/Entities") >> check_in_status.py
echo import applicant >> check_in_status.py
echo sys.path.append("Python/User_Stories") >> check_in_status.py
echo import application_status >> check_in_status.py
echo.>> check_in_status.py
echo class Check_in_status(object): >> check_in_status.py
echo.>> check_in_status.py
echo 	def getCheckInStatus(self,front_end_str): >> check_in_status.py
echo.>> check_in_status.py
echo 		cf = common_functions.Common_functions() >> check_in_status.py
echo 		data = cf.getAcceptedApplicants(front_end_str) >> check_in_status.py
echo.>> check_in_status.py
echo 		if len(data) == 0: >> check_in_status.py
echo 			return_front_end_dict = '{ "data": [], "status":"success", "message":"No applicants registered" }' >> check_in_status.py
echo 		else: >> check_in_status.py
echo 			return_front_end_dict = '{ "data": ' + json.dumps(data) + ', "status":"success", "message":"All applicant''s information retrieved" }' >> check_in_status.py
echo.>> check_in_status.py
echo 		return return_front_end_dict >> check_in_status.py
echo.>> check_in_status.py
echo 	def updateCheckInStatus(self,front_end_str): >> check_in_status.py
echo.>> check_in_status.py
echo 		front_end_dict = ast.literal_eval(front_end_str) >> check_in_status.py
echo 		front_end_data = front_end_dict['data'] >> check_in_status.py
echo.>> check_in_status.py
echo 		cf = common_functions.Common_functions() >> check_in_status.py
echo.>> check_in_status.py
echo 		app_dict = [] >> check_in_status.py
echo.>> check_in_status.py
echo 		for i in range(0,len(front_end_data)): >> check_in_status.py
echo.>> check_in_status.py
echo 			where_applicant_id = {} >> check_in_status.py
echo 			where_applicant_id['applicant_id'] = front_end_data[i]['applicant_id'] >> check_in_status.py
echo.>> check_in_status.py
echo 			data = cf.getFromCsv('applicant.csv',where_applicant_id) >> check_in_status.py
echo.>> check_in_status.py
echo 			data[0]['medical_form'] = front_end_data[i]['medical_form'] >> check_in_status.py
echo 			data[0]['legal_form'] = front_end_data[i]['legal_form'] >> check_in_status.py
echo 			data[0]['emergency_contact'] = front_end_data[i]['emergency_contact'] >> check_in_status.py
echo 			data[0]['helmet'] = front_end_data[i]['helmet'] >> check_in_status.py
echo 			data[0]['boot'] = front_end_data[i]['boot'] >> check_in_status.py
echo 			data[0]['sleeping_bag'] = front_end_data[i]['sleeping_bag'] >> check_in_status.py
echo 			data[0]['water_bottle'] = front_end_data[i]['water_bottle'] >> check_in_status.py
echo 			data[0]['sunscreen'] = front_end_data[i]['sunscreen'] >> check_in_status.py
echo 			data[0]['bugs_spray'] = front_end_data[i]['bugs_spray'] >> check_in_status.py
echo 			data[0]['check_in_status'] = front_end_data[i]['check_in_status'] >> check_in_status.py
echo.>> check_in_status.py
echo 			app_dict.append(data[0]) >> check_in_status.py
echo.>> check_in_status.py
echo 		cf.updateManyRowIntoCsv('applicant.csv',app_dict,'applicant_id') >> check_in_status.py
echo.>> check_in_status.py
echo 		return_front_end_dict = '{ "data": "", "status":"success", "message":"All applicant''s information updated" }' >> check_in_status.py
echo.>> check_in_status.py
echo 		return return_front_end_dict >> check_in_status.py
echo.>> check_in_status.py
echo copying C:\Program Files\Gila_Breath_Camp\Python\User_Stories\choose_date.py
cd C:\Program Files\Gila_Breath_Camp\Python\User_Stories
echo # =============================================================================== >> choose_date.py
echo #                             GILA BREATH CAMP >> choose_date.py
echo # >> choose_date.py
echo # =============================================================================== >> choose_date.py
echo # =============================================================================== >> choose_date.py
echo # FILE NAME      : choose_date.py >> choose_date.py
echo # PURPOSE        : Logic to Choose Date >> choose_date.py
echo # AUTHOR         : ROHAN SAWANT >> choose_date.py
echo # CREATION DATE  : 15-OCT-2016 >> choose_date.py
echo # PENDING 		 :  >> choose_date.py
echo # ------------------------------------------------------------------------------- >> choose_date.py
echo # CHANGE HISTORY : >> choose_date.py
echo # VER	^|	DATE       	^|	MODIFIED BY  		^|  	CHANGE DESCRIPTION >> choose_date.py
echo # ------------------------------------------------------------------------------- >> choose_date.py
echo # 1.0   	15-OCT-2016  	ROHAN SAWANT    		Started coding >> choose_date.py
echo # 2.0		16-OCT-2016		ROHAN SAWANT			Changed get date return logic >> choose_date.py
echo # ================================================================================ >> choose_date.py
echo.>> choose_date.py
echo import json >> choose_date.py
echo import sys >> choose_date.py
echo import ast >> choose_date.py
echo import datetime >> choose_date.py
echo import calendar >> choose_date.py
echo sys.path.append("Python") >> choose_date.py
echo import common_functions >> choose_date.py
echo sys.path.append("Python/Entities") >> choose_date.py
echo import date >> choose_date.py
echo.>> choose_date.py
echo class Choose_date(object): >> choose_date.py
echo.>> choose_date.py
echo 	def suffix(self,d): >> choose_date.py
echo 		return 'th' if 11^<=d^<=13 else {1:'st',2:'nd',3:'rd'}.get(d%%10, 'th') >> choose_date.py
echo.>> choose_date.py
echo 	def returnSecondSunday(self,year,month): >> choose_date.py
echo 		c = calendar.Calendar(firstweekday=calendar.MONDAY) >> choose_date.py
echo 		date = c.monthdatescalendar(year,month)[1][6] >> choose_date.py
echo 		return date >> choose_date.py
echo.>> choose_date.py
echo 	def chooseDate(self): >> choose_date.py
echo.>> choose_date.py
echo 		return_front_end_dict = '' >> choose_date.py
echo.>> choose_date.py
echo 		cf = common_functions.Common_functions() >> choose_date.py
echo 		dt = date.Date() >> choose_date.py
echo.>> choose_date.py
echo 		date1 = {"date_id":"1"} >> choose_date.py
echo 		date2 = {"date_id":"2"} >> choose_date.py
echo 		date3 = {"date_id":"3"} >> choose_date.py
echo.>> choose_date.py
echo 		data1 = cf.getFromCsv('date.csv',date1)	 >> choose_date.py
echo 		data2 = cf.getFromCsv('date.csv',date2)	 >> choose_date.py
echo 		data3 = cf.getFromCsv('date.csv',date3)		 >> choose_date.py
echo.>> choose_date.py
echo 		if len(data1) == 0: >> choose_date.py
echo 			return_front_end_dict = '{ "data": [], "status":"error", "message":"No Date in ''date.csv''" }' >> choose_date.py
echo 		elif len(data2) == 0: >> choose_date.py
echo 			return_front_end_dict = '{ "data": [], "status":"error", "message":"No Date in ''date.csv''" }' >> choose_date.py
echo 		elif len(data3) == 0: >> choose_date.py
echo 			return_front_end_dict = '{ "data": [], "status":"error", "message":"No Date in ''date.csv''" }' >> choose_date.py
echo 		else: >> choose_date.py
echo 			start_date1 = self.returnSecondSunday(int(data1[0]['year']),int(data1[0]['month'])) >> choose_date.py
echo 			start_date2 = self.returnSecondSunday(int(data2[0]['year']),int(data2[0]['month'])) >> choose_date.py
echo 			start_date3 = self.returnSecondSunday(int(data3[0]['year']),int(data3[0]['month'])) >> choose_date.py
echo.>> choose_date.py
echo 			new_data = [{}] >> choose_date.py
echo.>> choose_date.py
echo 			new_data[0]['camp_time_slots1'] = str(start_date1) + " 00:00:00.000000" >> choose_date.py
echo 			new_data[0]['camp_time_slots2'] = str(start_date2) + " 00:00:00.000000" >> choose_date.py
echo 			new_data[0]['camp_time_slots3'] = str(start_date3) + " 00:00:00.000000" >> choose_date.py
echo.>> choose_date.py
echo 			end_date1 = start_date1 + datetime.timedelta(days=13) >> choose_date.py
echo 			end_date2 = start_date2 + datetime.timedelta(days=13) >> choose_date.py
echo 			end_date3 = start_date3 + datetime.timedelta(days=13) >> choose_date.py
echo.>> choose_date.py
echo 			display_date1 = str(start_date1.day) + self.suffix(start_date1.day) + '-' + str(end_date1.day) + self.suffix(end_date1.day) + " " + start_date1.strftime("%%B") + " " + str(end_date1.year) >> choose_date.py
echo 			display_date2 = str(start_date2.day) + self.suffix(start_date2.day) + '-' + str(end_date2.day) + self.suffix(end_date2.day) + " " + start_date2.strftime("%%B") + " " + str(end_date2.year) >> choose_date.py
echo 			display_date3 = str(start_date3.day) + self.suffix(start_date3.day) + '-' + str(end_date3.day) + self.suffix(end_date3.day) + " " + start_date3.strftime("%%B") + " " + str(end_date3.year) >> choose_date.py
echo.>> choose_date.py
echo 			new_data[0]['display_date1'] = display_date1 >> choose_date.py
echo 			new_data[0]['display_date2'] = display_date2 >> choose_date.py
echo 			new_data[0]['display_date3'] = display_date3 >> choose_date.py
echo.>> choose_date.py
echo 			return_front_end_dict = '{ "data": ' + json.dumps(new_data) + ', "status":"success", "message":"" }' >> choose_date.py
echo.>> choose_date.py
echo 		return return_front_end_dict >> choose_date.py
echo.>> choose_date.py
echo.>> choose_date.py
echo copying C:\Program Files\Gila_Breath_Camp\Python\User_Stories\printing_of_acceptance_or_rejection_notice.py
cd C:\Program Files\Gila_Breath_Camp\Python\User_Stories
echo # =============================================================================== >> printing_of_acceptance_or_rejection_notice.py
echo #                             GILA BREATH CAMP >> printing_of_acceptance_or_rejection_notice.py
echo # >> printing_of_acceptance_or_rejection_notice.py
echo # =============================================================================== >> printing_of_acceptance_or_rejection_notice.py
echo # =============================================================================== >> printing_of_acceptance_or_rejection_notice.py
echo # FILE NAME      : printing_of_acceptance_or_rejection_notice.py >> printing_of_acceptance_or_rejection_notice.py
echo # PURPOSE        : printing of notice >> printing_of_acceptance_or_rejection_notice.py
echo # AUTHOR         : Jemin Gohil >> printing_of_acceptance_or_rejection_notice.py
echo # CREATION DATE  : 1-Nov-2016 >> printing_of_acceptance_or_rejection_notice.py
echo # PENDING 		 :  >> printing_of_acceptance_or_rejection_notice.py
echo # ------------------------------------------------------------------------------- >> printing_of_acceptance_or_rejection_notice.py
echo # CHANGE HISTORY : >> printing_of_acceptance_or_rejection_notice.py
echo # VER	^|	DATE       	^|	MODIFIED BY  		^|  	CHANGE DESCRIPTION >> printing_of_acceptance_or_rejection_notice.py
echo # ------------------------------------------------------------------------------- >> printing_of_acceptance_or_rejection_notice.py
echo # 1.0   	1-Nov-2016  	Jemin Gohil    		    Started coding >> printing_of_acceptance_or_rejection_notice.py
echo # 2.0       3-Nov-2016      Jemin Gohil         	Logic for printing rejection notice >> printing_of_acceptance_or_rejection_notice.py
echo # 3.0      	16-Nov-2016 	Jemin Gohil            	Printing rejection notice completed >> printing_of_acceptance_or_rejection_notice.py
echo # 4.0       25-Nov-2016     Karthik                 return the string  >> printing_of_acceptance_or_rejection_notice.py
echo # ================================================================================ >> printing_of_acceptance_or_rejection_notice.py
echo.>> printing_of_acceptance_or_rejection_notice.py
echo import sys >> printing_of_acceptance_or_rejection_notice.py
echo import ast >> printing_of_acceptance_or_rejection_notice.py
echo import json >> printing_of_acceptance_or_rejection_notice.py
echo import os >> printing_of_acceptance_or_rejection_notice.py
echo import getpass >> printing_of_acceptance_or_rejection_notice.py
echo sys.path.append("Python") >> printing_of_acceptance_or_rejection_notice.py
echo import common_functions >> printing_of_acceptance_or_rejection_notice.py
echo sys.path.append("Python/Entities") >> printing_of_acceptance_or_rejection_notice.py
echo import applicant >> printing_of_acceptance_or_rejection_notice.py
echo sys.path.append("Python/User_Stories") >> printing_of_acceptance_or_rejection_notice.py
echo import application_status >> printing_of_acceptance_or_rejection_notice.py
echo.>> printing_of_acceptance_or_rejection_notice.py
echo #front_end_str = json.dumps({"data" :[{"applicant_id":"1"}]}) #Need to remove >> printing_of_acceptance_or_rejection_notice.py
echo.>> printing_of_acceptance_or_rejection_notice.py
echo class Notice(object): >> printing_of_acceptance_or_rejection_notice.py
echo 	^"""docstring for AcceptanceNotice^""" >> printing_of_acceptance_or_rejection_notice.py
echo 	def __init__(self): >> printing_of_acceptance_or_rejection_notice.py
echo 		pass >> printing_of_acceptance_or_rejection_notice.py
echo.>> printing_of_acceptance_or_rejection_notice.py
echo 	def printAcceptanceRejection(self,front_end_str): >> printing_of_acceptance_or_rejection_notice.py
echo.>> printing_of_acceptance_or_rejection_notice.py
echo 		front_end_dict = ast.literal_eval(front_end_str) >> printing_of_acceptance_or_rejection_notice.py
echo 		front_end_data = front_end_dict['data'][0] >> printing_of_acceptance_or_rejection_notice.py
echo 		#print('front_end_data :',front_end_data) >> printing_of_acceptance_or_rejection_notice.py
echo.>> printing_of_acceptance_or_rejection_notice.py
echo 		cf = common_functions.Common_functions()  >> printing_of_acceptance_or_rejection_notice.py
echo 		data = cf.getFromCsv('applicant.csv',front_end_data) >> printing_of_acceptance_or_rejection_notice.py
echo 		#print(data) >> printing_of_acceptance_or_rejection_notice.py
echo.>> printing_of_acceptance_or_rejection_notice.py
echo 		app = application_status.Application_status() >> printing_of_acceptance_or_rejection_notice.py
echo 		data1 = app.getApplicationStatus(front_end_str) >> printing_of_acceptance_or_rejection_notice.py
echo 		data2 = ast.literal_eval(data1) >> printing_of_acceptance_or_rejection_notice.py
echo 		data3 = data2['data'] >> printing_of_acceptance_or_rejection_notice.py
echo 		#print("data2 :",data2) >> printing_of_acceptance_or_rejection_notice.py
echo.>> printing_of_acceptance_or_rejection_notice.py
echo 		#print(data) >> printing_of_acceptance_or_rejection_notice.py
echo 		#print("data3[0]['violations'] :",data3[0]["violations"]) >> printing_of_acceptance_or_rejection_notice.py
echo.>> printing_of_acceptance_or_rejection_notice.py
echo 		data[0]["violations"] = data3[0]["violations"] >> printing_of_acceptance_or_rejection_notice.py
echo 		data[0]["application_status"] = data3[0]["application_status"] >> printing_of_acceptance_or_rejection_notice.py
echo 		#print >> printing_of_acceptance_or_rejection_notice.py
echo 		data[0]["camp_time_slots"] = data[0]["camp_time_slots"][:10] >> printing_of_acceptance_or_rejection_notice.py
echo.>> printing_of_acceptance_or_rejection_notice.py
echo 		if data[0]["violations"][0] =="NO VIOLATIONS": >> printing_of_acceptance_or_rejection_notice.py
echo 			file_print = "Textfiles/Templates/a_template.txt" >> printing_of_acceptance_or_rejection_notice.py
echo 			path_name = "acception_letter" >> printing_of_acceptance_or_rejection_notice.py
echo 		else: >> printing_of_acceptance_or_rejection_notice.py
echo 			file_print = "Textfiles/Templates/r_template.txt" >> printing_of_acceptance_or_rejection_notice.py
echo 			path_name = "rejection_letter" >> printing_of_acceptance_or_rejection_notice.py
echo.>> printing_of_acceptance_or_rejection_notice.py
echo 		with open(file_print, "r") as myfile: >> printing_of_acceptance_or_rejection_notice.py
echo 			template = myfile.readlines() >> printing_of_acceptance_or_rejection_notice.py
echo 			temp = ''.join(template) >> printing_of_acceptance_or_rejection_notice.py
echo.>> printing_of_acceptance_or_rejection_notice.py
echo 		k = 1 >> printing_of_acceptance_or_rejection_notice.py
echo 		Str = '' >> printing_of_acceptance_or_rejection_notice.py
echo 		for j in range(0,len(data)): >> printing_of_acceptance_or_rejection_notice.py
echo 			t = temp >> printing_of_acceptance_or_rejection_notice.py
echo 			for i in data[j].keys(): >> printing_of_acceptance_or_rejection_notice.py
echo 				if('*'+i+'*' in temp ): >> printing_of_acceptance_or_rejection_notice.py
echo 					try: >> printing_of_acceptance_or_rejection_notice.py
echo 						t = t.replace('*'+i+'*',data[j][i]) >> printing_of_acceptance_or_rejection_notice.py
echo 					except: >> printing_of_acceptance_or_rejection_notice.py
echo 						pass >> printing_of_acceptance_or_rejection_notice.py
echo 			#print("--------------------------------") >> printing_of_acceptance_or_rejection_notice.py
echo 			Str = '' >> printing_of_acceptance_or_rejection_notice.py
echo 			for m in range(0,len(data[j]['violations'])): >> printing_of_acceptance_or_rejection_notice.py
echo 				if m == 0: >> printing_of_acceptance_or_rejection_notice.py
echo 					Str = str(m+1) + '. ' + data[j]['violations'][m] >> printing_of_acceptance_or_rejection_notice.py
echo 				else: >> printing_of_acceptance_or_rejection_notice.py
echo 					Str = Str + '\n' + str(m+1) + '. ' +  data[j]['violations'][m] >> printing_of_acceptance_or_rejection_notice.py
echo 			#print(type(Str)) >> printing_of_acceptance_or_rejection_notice.py
echo 			t=t.replace("*violations*",Str) >> printing_of_acceptance_or_rejection_notice.py
echo 			#print ("yes") >> printing_of_acceptance_or_rejection_notice.py
echo.>> printing_of_acceptance_or_rejection_notice.py
echo.>> printing_of_acceptance_or_rejection_notice.py
echo 			#print(t) >> printing_of_acceptance_or_rejection_notice.py
echo 		user  = getpass.getuser() >> printing_of_acceptance_or_rejection_notice.py
echo 		save_path = 'C:/Users/' + user + '/Documents/Gila_Breath_Camp' >> printing_of_acceptance_or_rejection_notice.py
echo.>> printing_of_acceptance_or_rejection_notice.py
echo 		if not os.path.exists(save_path): >> printing_of_acceptance_or_rejection_notice.py
echo 			os.makedirs(save_path) >> printing_of_acceptance_or_rejection_notice.py
echo.>> printing_of_acceptance_or_rejection_notice.py
echo 		name_of_file = data[0]["applicant_first_name"]+"_"+data[0]["applicant_last_name"]+"_"+data[0]["applicant_id"]+"_"+path_name >> printing_of_acceptance_or_rejection_notice.py
echo 		completeName = os.path.join(save_path, name_of_file + ".txt") >> printing_of_acceptance_or_rejection_notice.py
echo 		text_file = open(completeName,"w") >> printing_of_acceptance_or_rejection_notice.py
echo 		text_file.write(t) >> printing_of_acceptance_or_rejection_notice.py
echo 		text_file.close() >> printing_of_acceptance_or_rejection_notice.py
echo 		print(t) >> printing_of_acceptance_or_rejection_notice.py
echo 		return(t) >> printing_of_acceptance_or_rejection_notice.py
echo.>> printing_of_acceptance_or_rejection_notice.py
echo #ap = Notice() >> printing_of_acceptance_or_rejection_notice.py
echo #ap.acceptance(front_end_str) >> printing_of_acceptance_or_rejection_notice.py
echo.>> printing_of_acceptance_or_rejection_notice.py
echo.>> printing_of_acceptance_or_rejection_notice.py
echo copying C:\Program Files\Gila_Breath_Camp\Python\User_Stories\priorities.py
cd C:\Program Files\Gila_Breath_Camp\Python\User_Stories
echo # =============================================================================== >> priorities.py
echo #                             GILA BREATH CAMP >> priorities.py
echo # >> priorities.py
echo # =============================================================================== >> priorities.py
echo # =============================================================================== >> priorities.py
echo # FILE NAME      : priorities.py >> priorities.py
echo # PURPOSE        : Take data of applicant priorities from guardian >> priorities.py
echo # AUTHOR         : ROHAN SAWANT >> priorities.py
echo # CREATION DATE  : 17-NOV-2016 >> priorities.py
echo # PENDING 		 :  >> priorities.py
echo # ------------------------------------------------------------------------------- >> priorities.py
echo # CHANGE HISTORY : >> priorities.py
echo # VER	^|	DATE       	^|	MODIFIED BY  		^|  	CHANGE DESCRIPTION >> priorities.py
echo # ------------------------------------------------------------------------------- >> priorities.py
echo # 1.0   	17-NOV-2016  	ROHAN SAWANT    		Started coding >> priorities.py
echo # 2.0		20-NOV-2016		ROHAN SAWANT			Completed function getCustomerPriorities >> priorities.py
echo # 3.0		26-NOV-2016		ROHAN SAWANT			Completed update priorities >> priorities.py
echo # ================================================================================ >> priorities.py
echo.>> priorities.py
echo import sys >> priorities.py
echo import json >> priorities.py
echo import ast >> priorities.py
echo import datetime >> priorities.py
echo import copy >> priorities.py
echo sys.path.append("Python") >> priorities.py
echo import common_functions >> priorities.py
echo sys.path.append("Python/Entities") >> priorities.py
echo import applicant >> priorities.py
echo.>> priorities.py
echo class Priorities(object): >> priorities.py
echo.>> priorities.py
echo 	def getCustomerPriorities(self,front_end_str): >> priorities.py
echo 		^""" get data for priorities from Customer ^""" >> priorities.py
echo.>> priorities.py
echo 		cf = common_functions.Common_functions() >> priorities.py
echo 		appl = applicant.Applicant() >> priorities.py
echo.>> priorities.py
echo 		front_end_dict = ast.literal_eval(front_end_str) >> priorities.py
echo 		front_end_data = front_end_dict['data'][0] >> priorities.py
echo.>> priorities.py
echo 		data = cf.getFromCsv('applicant.csv',front_end_data) >> priorities.py
echo.>> priorities.py
echo 		if data == []: >> priorities.py
echo 			return_front_end_dict = '{ "data": [], "status":"success", "message":"No applicants registered"}' >> priorities.py
echo 		else: >> priorities.py
echo 			new_data = [] >> priorities.py
echo 			list_of_names = ["NONE"] >> priorities.py
echo 			list_of_id = ["NONE"] >> priorities.py
echo.>> priorities.py
echo 			for i in range(0,len(data)): >> priorities.py
echo 				name = data[i]['applicant_last_name'] + ', ' + data[i]['applicant_first_name'] >> priorities.py
echo 				if name not in list_of_names: >> priorities.py
echo 					list_of_names.append(data[i]['applicant_last_name'] + ', ' + data[i]['applicant_first_name']) >> priorities.py
echo.>> priorities.py
echo 			for j in range(0,len(data)): >> priorities.py
echo.>> priorities.py
echo 				backup_list_of_names = copy.deepcopy(list_of_names) >> priorities.py
echo 				backup_list_of_id = copy.deepcopy(list_of_id) >> priorities.py
echo.>> priorities.py
echo 				new_dict = {} >> priorities.py
echo 				new_dict['applicant_id'] = data[j]['applicant_id'] >> priorities.py
echo 				new_dict['applicant_name'] = data[j]['applicant_last_name'] + ', ' + data[j]['applicant_first_name'] >> priorities.py
echo 				new_dict['applicant_name_together_with'] = self.getCorrectSequence(data[j]['applicant_name_together_with'],backup_list_of_names) >> priorities.py
echo.>> priorities.py
echo 				check_list_of_id1 = ['NONE'] >> priorities.py
echo 				if data[j]['applicant_id_together_with'] != '': >> priorities.py
echo 					dict_applicant_name = [{'applicant_name_together_with':data[j]['applicant_name_together_with']}] >> priorities.py
echo 					check_list_of_id1_str = self.getId('{ "data": ' + json.dumps(dict_applicant_name) + '}') >> priorities.py
echo 					check_list_of_id1_dict = ast.literal_eval(check_list_of_id1_str) >> priorities.py
echo 					check_list_of_id1 = check_list_of_id1_dict['data'][0]['applicant_id_together_with'] >> priorities.py
echo 					#print("check_list_of_id1 :",check_list_of_id1) >> priorities.py
echo 					if len(check_list_of_id1) ^> 1 and check_list_of_id1[0] != 'NONE': >> priorities.py
echo 						check_list_of_id1 = self.getCorrectSequence(data[j]['applicant_id_together_with'],check_list_of_id1) >> priorities.py
echo.>> priorities.py
echo 				new_dict['applicant_id_together_with'] = check_list_of_id1 >> priorities.py
echo.>> priorities.py
echo 				new_dict['applicant_name_not_together_with'] = self.getCorrectSequence(data[j]['applicant_name_not_together_with'],backup_list_of_names) >> priorities.py
echo.>> priorities.py
echo 				check_list_of_id2 = ['NONE'] >> priorities.py
echo 				print("data[j]['applicant_id_not_together_with'] :",data[j]['applicant_id_not_together_with']) >> priorities.py
echo 				if data[j]['applicant_id_not_together_with'] != '': >> priorities.py
echo 					dict_applicant_name = [{'applicant_name_not_together_with':data[j]['applicant_name_not_together_with']}] >> priorities.py
echo 					check_list_of_id2_str = self.getId('{ "data": ' + json.dumps(dict_applicant_name) + '}') >> priorities.py
echo 					check_list_of_id2_dict = ast.literal_eval(check_list_of_id2_str) >> priorities.py
echo 					check_list_of_id2 = check_list_of_id2_dict['data'][0]['applicant_id_not_together_with'] >> priorities.py
echo 					#print("check_list_of_id1 :",check_list_of_id2) >> priorities.py
echo 					if len(check_list_of_id2) ^> 1 and check_list_of_id2[0] != 'NONE': >> priorities.py
echo 						check_list_of_id2 = self.getCorrectSequence(data[j]['applicant_id_not_together_with'],check_list_of_id2) >> priorities.py
echo.>> priorities.py
echo 				new_dict['applicant_id_not_together_with'] = check_list_of_id2 >> priorities.py
echo.>> priorities.py
echo 				new_data.append(new_dict) >> priorities.py
echo.>> priorities.py
echo 			print("new_data[0]:",new_data[11]) >> priorities.py
echo.>> priorities.py
echo 			return_front_end_dict = '{ "data": ' + json.dumps(new_data) + ', "status":"success", "message":"All applicant''s information retrieved" }' >> priorities.py
echo.>> priorities.py
echo 		return return_front_end_dict >> priorities.py
echo.>> priorities.py
echo 	def getId(self,front_end_str): >> priorities.py
echo 		^""" Get Id for selected Name ^""" >> priorities.py
echo 		front_end_dict = ast.literal_eval(front_end_str) >> priorities.py
echo.>> priorities.py
echo 		together_flag = 1 >> priorities.py
echo.>> priorities.py
echo 		try: >> priorities.py
echo 			applicant_name = front_end_dict['data'][0]['applicant_name_together_with'] >> priorities.py
echo.>> priorities.py
echo 		except: >> priorities.py
echo 			applicant_name = front_end_dict['data'][0]['applicant_name_not_together_with'] >> priorities.py
echo 			together_flag = 0 >> priorities.py
echo.>> priorities.py
echo 		cf = common_functions.Common_functions() >> priorities.py
echo 		data = cf.getFromCsv('applicant.csv',{}) >> priorities.py
echo.>> priorities.py
echo 		if data == []: >> priorities.py
echo 			return_front_end_dict = '{ "data": [], "status":"success", "message":"No applicants registered"}' >> priorities.py
echo 		else: >> priorities.py
echo.>> priorities.py
echo 			new_data = [{}] >> priorities.py
echo 			list_of_id = [] >> priorities.py
echo 			#print("applicant_name : ",applicant_name) >> priorities.py
echo 			if applicant_name != 'NONE': >> priorities.py
echo 				for i in range(0,len(data)): >> priorities.py
echo 					name = data[i]['applicant_last_name'] + ', ' + data[i]['applicant_first_name'] >> priorities.py
echo 					if name == applicant_name: >> priorities.py
echo 						id = data[i]['applicant_id'] >> priorities.py
echo 						if id not in list_of_id: >> priorities.py
echo 							list_of_id.append(data[i]['applicant_id']) >> priorities.py
echo 			else: >> priorities.py
echo 				list_of_id = ['NONE'] >> priorities.py
echo.>> priorities.py
echo 		if together_flag == 1: >> priorities.py
echo 			new_data[0]['applicant_id_together_with'] = list_of_id >> priorities.py
echo 		else: >> priorities.py
echo 			new_data[0]['applicant_id_not_together_with'] = list_of_id >> priorities.py
echo.>> priorities.py
echo 		if len(list_of_id) ^<=1: >> priorities.py
echo 			return_front_end_dict = '{ "data": ' + json.dumps(new_data) + ', "status":"success", "message":"" }' >> priorities.py
echo 		else: >> priorities.py
echo 			return_front_end_dict = '{ "data": ' + json.dumps(new_data) + ', "status":"success", "message":"There are more than 1 Application Id\'s.^| Please choose one of them from the dropdown" }' >> priorities.py
echo.>> priorities.py
echo 		#print("new_data : ",new_data) >> priorities.py
echo 		return return_front_end_dict >> priorities.py
echo.>> priorities.py
echo 	def updateCustomerPriorities(self,front_end_str): >> priorities.py
echo 		^""" Updating priorities in applicant.csv ^""" >> priorities.py
echo.>> priorities.py
echo 		front_end_dict = ast.literal_eval(front_end_str) >> priorities.py
echo 		front_end_data = front_end_dict['data'] >> priorities.py
echo.>> priorities.py
echo 		cf = common_functions.Common_functions()		 >> priorities.py
echo 		data = cf.getFromCsv('applicant.csv',{}) >> priorities.py
echo.>> priorities.py
echo 		if len(data) == 0: >> priorities.py
echo 			return_front_end_dict = '{ "data": ' + json.dumps(data) + ', "status":"error", "message":"Something went wrong" }' >> priorities.py
echo 		else: >> priorities.py
echo 			update_flag = 1 >> priorities.py
echo 			applicant_id_same = '' >> priorities.py
echo 			applicant_id_same_applicant = '' >> priorities.py
echo.>> priorities.py
echo 			for k in range(0,len(front_end_data)): >> priorities.py
echo.>> priorities.py
echo 				if front_end_data[k]['applicant_name_together_with']  != 'NONE': >> priorities.py
echo 					if front_end_data[k]['applicant_id_together_with'] == front_end_data[k]['applicant_id_not_together_with']: >> priorities.py
echo 						update_flag = 2 >> priorities.py
echo 						if applicant_id_same == '': >> priorities.py
echo 							applicant_id_same = front_end_data[k]['applicant_id'] >> priorities.py
echo 						else: >> priorities.py
echo 							applicant_id_same = applicant_id_same + ', ' + front_end_data[k]['applicant_id'] >> priorities.py
echo.>> priorities.py
echo 			for l in range(0,len(front_end_data)): >> priorities.py
echo.>> priorities.py
echo 				if front_end_data[l]['applicant_id_together_with'] == front_end_data[l]['applicant_id'] or front_end_data[l]['applicant_id_not_together_with'] == front_end_data[l]['applicant_id']: >> priorities.py
echo 					update_flag = 3 >> priorities.py
echo 					if applicant_id_same_applicant == '': >> priorities.py
echo 						applicant_id_same_applicant = front_end_data[l]['applicant_id'] >> priorities.py
echo 					else: >> priorities.py
echo 						applicant_id_same_applicant = applicant_id_same_applicant + ', ' + front_end_data[l]['applicant_id'] >> priorities.py
echo.>> priorities.py
echo 			if update_flag == 1: >> priorities.py
echo 				for i in range(0,len(data)): >> priorities.py
echo 					for j in range(0,len(front_end_data)): >> priorities.py
echo 						if data[i]['applicant_id'] == front_end_data[j]['applicant_id']: >> priorities.py
echo 							data[i]['applicant_name_together_with'] = front_end_data[j]['applicant_name_together_with'] >> priorities.py
echo 							data[i]['applicant_id_together_with'] = front_end_data[j]['applicant_id_together_with'] >> priorities.py
echo 							data[i]['applicant_name_not_together_with'] = front_end_data[j]['applicant_name_not_together_with'] >> priorities.py
echo 							data[i]['applicant_id_not_together_with'] = front_end_data[j]['applicant_id_not_together_with'] >> priorities.py
echo.>> priorities.py
echo.>> priorities.py
echo 			if update_flag == 1: >> priorities.py
echo 				cf.updateManyRowIntoCsv('applicant.csv',data,'applicant_id') >> priorities.py
echo 				return_front_end_dict = '{ "data": ' + json.dumps(data) + ', "status":"success", "message":"All applicant\'s data updated" }' >> priorities.py
echo 			elif update_flag == 2: >> priorities.py
echo 				return_front_end_dict = '{ "data": ' + json.dumps(data) + ', "status":"success", "message":"You can\'t enter same names in both together and not together. Check following applicant id\'s : ' + applicant_id_same + '" }' >> priorities.py
echo 			elif update_flag == 3: >> priorities.py
echo 				return_front_end_dict = '{ "data": ' + json.dumps(data) + ', "status":"success", "message":"You can\'t enter same name as applicant in together or not together. Check following applicant id\'s : ' + applicant_id_same_applicant + '" }' >> priorities.py
echo.>> priorities.py
echo 		return return_front_end_dict >> priorities.py
echo.>> priorities.py
echo 	def setSequence(self,input_list,csv_data): >> priorities.py
echo 		^""" Returns a list in a sequence putting data in csv as first ^""" >> priorities.py
echo 		output_list = [csv_data] >> priorities.py
echo.>> priorities.py
echo 		for i in range(0,len(input_list)): >> priorities.py
echo 			if input_list[i] != csv_data: >> priorities.py
echo 				output_list.append(input_list[i]) >> priorities.py
echo.>> priorities.py
echo 		return output_list >> priorities.py
echo.>> priorities.py
echo 	def getCorrectSequence(self,input_key_value,input_list): >> priorities.py
echo 		^""" perform check for correct sequence for a particular key ^""" >> priorities.py
echo 		if input_key_value != '': >> priorities.py
echo 			return self.setSequence(input_list,input_key_value) >> priorities.py
echo 		else: >> priorities.py
echo 			return input_list >> priorities.py
echo.>> priorities.py
echo copying C:\Program Files\Gila_Breath_Camp\Python\User_Stories\registration.py
cd C:\Program Files\Gila_Breath_Camp\Python\User_Stories
echo # =============================================================================== >> registration.py
echo #                             GILA BREATH CAMP >> registration.py
echo # >> registration.py
echo # =============================================================================== >> registration.py
echo # =============================================================================== >> registration.py
echo # FILE NAME      : registration.py >> registration.py
echo # PURPOSE        : Logic for Registration >> registration.py
echo # AUTHOR         : ROHAN SAWANT >> registration.py
echo # CREATION DATE  : 15-OCT-2016 >> registration.py
echo # PENDING 		 :  >> registration.py
echo # ------------------------------------------------------------------------------- >> registration.py
echo # CHANGE HISTORY : >> registration.py
echo # VER	^|	DATE       	^|	MODIFIED BY  		^|  	CHANGE DESCRIPTION >> registration.py
echo # ------------------------------------------------------------------------------- >> registration.py
echo # 1.0   	01-OCT-2016  	ROHAN SAWANT    		Started coding >> registration.py
echo # 2.0		15-OCT-2016		ROHAN SAWANT			First version of Registration User Story >> registration.py
echo # 3.0		20-NOV-2016		ROHAN SAWANT			Added alreadySsn function >> registration.py
echo # 4.0		30-NOV-2016		ROHAN SAWANT			Added viewRegisteredApplicant function >> registration.py
echo # ================================================================================ >> registration.py
echo.>> registration.py
echo import sys >> registration.py
echo import json >> registration.py
echo import ast >> registration.py
echo import datetime >> registration.py
echo sys.path.append("Python") >> registration.py
echo import common_functions >> registration.py
echo sys.path.append("Python/Entities") >> registration.py
echo import applicant >> registration.py
echo.>> registration.py
echo class Registration(object): >> registration.py
echo.>> registration.py
echo 	def register(self,front_end_str): >> registration.py
echo.>> registration.py
echo 		cf = common_functions.Common_functions() >> registration.py
echo 		appl = applicant.Applicant() >> registration.py
echo.>> registration.py
echo 		error = [] >> registration.py
echo 		message = '' >> registration.py
echo 		none = 0 >> registration.py
echo 		return_front_end_dict = '' >> registration.py
echo.>> registration.py
echo 		front_end_dict = ast.literal_eval(front_end_str) >> registration.py
echo 		front_end_data = front_end_dict['data'][0] >> registration.py
echo.>> registration.py
echo 		error.append(appl.setUserId(front_end_data['user_id'])) >> registration.py
echo 		error.append(appl.setCampTimeSlots(front_end_data['camp_time_slots'])) >> registration.py
echo 		error.append(appl.setApplicantFirstName(front_end_data['applicant_first_name'])) >> registration.py
echo 		error.append(appl.setApplicantLastName(front_end_data['applicant_last_name'])) >> registration.py
echo 		error.append(appl.setApplicantAge(front_end_data['applicant_age'])) >> registration.py
echo 		error.append(appl.setApplicantGender(front_end_data['applicant_gender'])) >> registration.py
echo 		error.append(appl.setApplicantAddress(front_end_data['applicant_address'])) >> registration.py
echo 		error.append(appl.setGuardianFirstName(front_end_data['guardian_first_name'])) >> registration.py
echo 		error.append(appl.setGuardianLastName(front_end_data['guardian_last_name'])) >> registration.py
echo 		error.append(appl.setGuardianContactNumber(front_end_data['guardian_contact_number'])) >> registration.py
echo 		error.append(appl.setGuardianAddress(front_end_data['guardian_address'])) >> registration.py
echo 		error.append(appl.setApplicationDate(str(datetime.datetime.now()))) >> registration.py
echo 		error.append(appl.setEmergencyContact(front_end_data['emergency_contact'])) >> registration.py
echo 		error.append(appl.setPayment(front_end_data['payment'])) >> registration.py
echo 		error.append(appl.setGuardianSsn(front_end_data['guardian_ssn'])) >> registration.py
echo 		#print(front_end_str) >> registration.py
echo 		#print(error) >> registration.py
echo.>> registration.py
echo 		for i in range(0,len(error)): >> registration.py
echo 			if error[i] != None: >> registration.py
echo 				if message == '': >> registration.py
echo 					message = error[i] >> registration.py
echo 				else: >> registration.py
echo 					message = message + '^|' + error[i] >> registration.py
echo.>> registration.py
echo 		if message == '': >> registration.py
echo 			cf.insertIntoCsv('applicant.csv',appl) >> registration.py
echo 			emp_appl = applicant.Applicant() >> registration.py
echo 			return_front_end_dict = '{ "data": [' + json.dumps(emp_appl.__dict__) + '], "status":"success", "message":"REGISTRATION COMPLETE" }' >> registration.py
echo 		else: >> registration.py
echo 			return_front_end_dict = '{ "data": [' + json.dumps(appl.__dict__) + '], "status":"error", "message":"' + message + '" }' >> registration.py
echo.>> registration.py
echo 		return return_front_end_dict >> registration.py
echo.>> registration.py
echo.>> registration.py
echo 	def alreadySsn(self,front_end_str): >> registration.py
echo 		^""" Showing data if already present for an SSN ^""" >> registration.py
echo.>> registration.py
echo 		cf = common_functions.Common_functions() >> registration.py
echo 		appl = {'guardian_ssn':'','guardian_first_name':'','applicant_last_name':'','guardian_contact_number':'','emergency_contact':''} >> registration.py
echo.>> registration.py
echo 		error = [] >> registration.py
echo 		message = '' >> registration.py
echo 		none = 0 >> registration.py
echo 		return_front_end_dict = '' >> registration.py
echo.>> registration.py
echo 		front_end_dict = ast.literal_eval(front_end_str) >> registration.py
echo 		front_end_data = front_end_dict['data'][0] >> registration.py
echo.>> registration.py
echo 		ssn_data = cf.getFromCsv('applicant.csv',front_end_data) >> registration.py
echo.>> registration.py
echo 		if ssn_data == []: >> registration.py
echo 			return_front_end_dict = '{ "data": [], "status":"error", "message":"" }' >> registration.py
echo 		else: >> registration.py
echo 			key = len(ssn_data)-1 >> registration.py
echo 			appl['guardian_ssn'] = ssn_data[key]['guardian_ssn'] >> registration.py
echo 			appl['guardian_first_name'] = ssn_data[key]['guardian_first_name'] >> registration.py
echo 			appl['guardian_last_name'] = ssn_data[key]['guardian_last_name'] >> registration.py
echo 			appl['guardian_address'] = ssn_data[key]['guardian_address'] >> registration.py
echo 			appl['guardian_contact_number'] = ssn_data[key]['guardian_contact_number'] >> registration.py
echo 			appl['emergency_contact'] = ssn_data[key]['emergency_contact'] >> registration.py
echo.>> registration.py
echo 			return_front_end_dict = '{ "data": [' + json.dumps(appl) + '], "status":"success", "message":"WE ALREADY HAVE DATA FOR SSN : ' + ssn_data[0]['guardian_ssn'] + '^|DO YOU WANT TO USE IT?"}' >> registration.py
echo.>> registration.py
echo 		return return_front_end_dict >> registration.py
echo.>> registration.py
echo.>> registration.py
echo 	def viewRegisteredApplicant(self,front_end_str): >> registration.py
echo 		^""" View Registered Applicant based on Application Id ^""" >> registration.py
echo 		front_end_dict = ast.literal_eval(front_end_str) >> registration.py
echo 		front_end_data = front_end_dict['data'][0] >> registration.py
echo.>> registration.py
echo 		cf = common_functions.Common_functions() >> registration.py
echo 		data = cf.getFromCsv('applicant.csv',front_end_data) >> registration.py
echo.>> registration.py
echo 		if len(data) != 0: >> registration.py
echo 			return_front_end_dict = '{ "data": [' + json.dumps(data) + '], "status":"success", "message":"DATA RETRIEVED" }' >> registration.py
echo 		else: >> registration.py
echo 			return_front_end_dict = '{ "data": [' + json.dumps(data) + '], "status":"success", "message":"THERE WAS SOME PROBLEM WHILE RETRIEVING DATA" }' >> registration.py
echo.>> registration.py
echo 		return return_front_end_dict >> registration.py
echo.>> registration.py
echo.>> registration.py
echo 	def updateRegisteredApplicantData(self,front_end_str): >> registration.py
echo 		^""" View Registered Applicant based on Application Id ^""" >> registration.py
echo 		cf = common_functions.Common_functions() >> registration.py
echo 		appl = applicant.Applicant() >> registration.py
echo.>> registration.py
echo 		error = [] >> registration.py
echo 		message = '' >> registration.py
echo 		none = 0 >> registration.py
echo 		return_front_end_dict = '' >> registration.py
echo.>> registration.py
echo 		front_end_dict = ast.literal_eval(front_end_str) >> registration.py
echo 		front_end_data = front_end_dict['data'][0] >> registration.py
echo.>> registration.py
echo 		error.append(appl.setApplicantId(front_end_data['applicant_id'])) >> registration.py
echo 		error.append(appl.setUserId(front_end_data['user_id'])) >> registration.py
echo 		error.append(appl.setCampTimeSlots(front_end_data['camp_time_slots'])) >> registration.py
echo 		error.append(appl.setApplicantFirstName(front_end_data['applicant_first_name'])) >> registration.py
echo 		error.append(appl.setApplicantLastName(front_end_data['applicant_last_name'])) >> registration.py
echo 		error.append(appl.setApplicantAge(front_end_data['applicant_age'])) >> registration.py
echo 		error.append(appl.setApplicantGender(front_end_data['applicant_gender'])) >> registration.py
echo 		error.append(appl.setApplicantAddress(front_end_data['applicant_address'])) >> registration.py
echo 		error.append(appl.setGuardianFirstName(front_end_data['guardian_first_name'])) >> registration.py
echo 		error.append(appl.setGuardianLastName(front_end_data['guardian_last_name'])) >> registration.py
echo 		error.append(appl.setGuardianContactNumber(front_end_data['guardian_contact_number'])) >> registration.py
echo 		error.append(appl.setGuardianAddress(front_end_data['guardian_address'])) >> registration.py
echo 		error.append(appl.setEmergencyContact(front_end_data['emergency_contact'])) >> registration.py
echo 		error.append(appl.setPayment(front_end_data['payment'])) >> registration.py
echo 		error.append(appl.setGuardianSsn(front_end_data['guardian_ssn'])) >> registration.py
echo 		error.append(appl.setApplicationDate(front_end_data['application_date'])) >> registration.py
echo.>> registration.py
echo 		#print(front_end_str) >> registration.py
echo 		#print(error) >> registration.py
echo.>> registration.py
echo 		for i in range(0,len(error)): >> registration.py
echo 			if error[i] != None: >> registration.py
echo 				if message == '': >> registration.py
echo 					message = error[i] >> registration.py
echo 				else: >> registration.py
echo 					message = message + '^|' + error[i] >> registration.py
echo.>> registration.py
echo 		if message == '': >> registration.py
echo 			cf.updateOneRowIntoCsv('applicant.csv',appl,'applicant_id') >> registration.py
echo 			return_front_end_dict = '{ "data": [' + json.dumps(appl.__dict__) + '], "status":"success", "message":"APPLICANT DATA UPDATED" }' >> registration.py
echo 		else: >> registration.py
echo 			return_front_end_dict = '{ "data": [' + json.dumps(appl.__dict__) + '], "status":"error", "message":"' + message + '" }' >> registration.py
echo.>> registration.py
echo 		return return_front_end_dict >> registration.py
echo.>> registration.py
echo.>> registration.py
echo copying C:\Program Files\Gila_Breath_Camp\Textfiles\Prints\JEMIN_GOHIL_1_rejection_letter.txt
cd C:\Program Files\Gila_Breath_Camp\Textfiles\Prints
echo Dear GOHIL, >> JEMIN_GOHIL_1_rejection_letter.txt
echo.>> JEMIN_GOHIL_1_rejection_letter.txt
echo This is to inform you that your child JEMIN is not admitted for the summer camp because of following reasons:  >> JEMIN_GOHIL_1_rejection_letter.txt
echo 1. AGE IS NOT BETWEEN 8 AND 19 >> JEMIN_GOHIL_1_rejection_letter.txt
echo 2. 900$ IS LESS THAN 1000$ >> JEMIN_GOHIL_1_rejection_letter.txt
echo We look forward for your child’s application for the coming camps. >> JEMIN_GOHIL_1_rejection_letter.txt
echo.>> JEMIN_GOHIL_1_rejection_letter.txt
echo Director >> JEMIN_GOHIL_1_rejection_letter.txt
echo GILA BREATH CAMP >> JEMIN_GOHIL_1_rejection_letter.txt
echo copying C:\Program Files\Gila_Breath_Camp\Textfiles\Prints\JEMIN_GOHIL_3_acception_letter.txt
cd C:\Program Files\Gila_Breath_Camp\Textfiles\Prints
echo Dear GOHIL, >> JEMIN_GOHIL_3_acception_letter.txt
echo.>> JEMIN_GOHIL_3_acception_letter.txt
echo This is to inform you that your child JEMIN has been admitted for the summer camp starting from 2017-02-12 00:00:00.000000. Please look into the attached packet for information and guidance regarding the Check-In. We look forward to see your child at the Gila Breath Camp. >> JEMIN_GOHIL_3_acception_letter.txt
echo.>> JEMIN_GOHIL_3_acception_letter.txt
echo.>> JEMIN_GOHIL_3_acception_letter.txt
echo.>> JEMIN_GOHIL_3_acception_letter.txt
echo Director >> JEMIN_GOHIL_3_acception_letter.txt
echo.>> JEMIN_GOHIL_3_acception_letter.txt
echo GILA BREATH CAMP >> JEMIN_GOHIL_3_acception_letter.txt
echo copying C:\Program Files\Gila_Breath_Camp\Textfiles\Prints\JEMIN_GOHIL_3_rejection_letter.txt
cd C:\Program Files\Gila_Breath_Camp\Textfiles\Prints
echo Dear GOHIL, >> JEMIN_GOHIL_3_rejection_letter.txt
echo.>> JEMIN_GOHIL_3_rejection_letter.txt
echo This is to inform you that your child JEMIN is not admitted for the summer camp because of following reasons: AGE IS NOT BETWEEN 8 AND 19. We look forward for your child’s application for the coming camps. >> JEMIN_GOHIL_3_rejection_letter.txt
echo.>> JEMIN_GOHIL_3_rejection_letter.txt
echo.>> JEMIN_GOHIL_3_rejection_letter.txt
echo.>> JEMIN_GOHIL_3_rejection_letter.txt
echo Director >> JEMIN_GOHIL_3_rejection_letter.txt
echo.>> JEMIN_GOHIL_3_rejection_letter.txt
echo GILA BREATH CAMP >> JEMIN_GOHIL_3_rejection_letter.txt
echo copying C:\Program Files\Gila_Breath_Camp\Textfiles\Prints\KATHIK_BASAVANAHALLI_2_acception_letter.txt
cd C:\Program Files\Gila_Breath_Camp\Textfiles\Prints
echo Dear BASAVANAHALLI, >> KATHIK_BASAVANAHALLI_2_acception_letter.txt
echo.>> KATHIK_BASAVANAHALLI_2_acception_letter.txt
echo.>> KATHIK_BASAVANAHALLI_2_acception_letter.txt
echo.>> KATHIK_BASAVANAHALLI_2_acception_letter.txt
echo This is to inform you that your child KATHIK has been admitted for the summer camp starting from 2017-02-12 00:00:00.000000.  >> KATHIK_BASAVANAHALLI_2_acception_letter.txt
echo.>> KATHIK_BASAVANAHALLI_2_acception_letter.txt
echo Please look into the attached packet for information and guidance regarding the Check-In.  >> KATHIK_BASAVANAHALLI_2_acception_letter.txt
echo.>> KATHIK_BASAVANAHALLI_2_acception_letter.txt
echo We look forward to see your child at the Gila Breath Camp. >> KATHIK_BASAVANAHALLI_2_acception_letter.txt
echo.>> KATHIK_BASAVANAHALLI_2_acception_letter.txt
echo.>> KATHIK_BASAVANAHALLI_2_acception_letter.txt
echo.>> KATHIK_BASAVANAHALLI_2_acception_letter.txt
echo Director >> KATHIK_BASAVANAHALLI_2_acception_letter.txt
echo.>> KATHIK_BASAVANAHALLI_2_acception_letter.txt
echo GILA BREATH CAMP >> KATHIK_BASAVANAHALLI_2_acception_letter.txt
echo copying C:\Program Files\Gila_Breath_Camp\Textfiles\Prints\SACHIN_TENDULKAR_5_rejection_letter.txt
cd C:\Program Files\Gila_Breath_Camp\Textfiles\Prints
echo Dear TENDULKAR, >> SACHIN_TENDULKAR_5_rejection_letter.txt
echo.>> SACHIN_TENDULKAR_5_rejection_letter.txt
echo This is to inform you that your child SACHIN is not admitted for the summer camp because of following reasons: DATE OF REGISTRATION HAS SURPASSED. We look forward for your child’s application for the coming camps. >> SACHIN_TENDULKAR_5_rejection_letter.txt
echo.>> SACHIN_TENDULKAR_5_rejection_letter.txt
echo.>> SACHIN_TENDULKAR_5_rejection_letter.txt
echo.>> SACHIN_TENDULKAR_5_rejection_letter.txt
echo Director >> SACHIN_TENDULKAR_5_rejection_letter.txt
echo.>> SACHIN_TENDULKAR_5_rejection_letter.txt
echo GILA BREATH CAMP >> SACHIN_TENDULKAR_5_rejection_letter.txt
echo copying C:\Program Files\Gila_Breath_Camp\Textfiles\Prints\VIRAT_KOHLI_6_rejection_letter.txt
cd C:\Program Files\Gila_Breath_Camp\Textfiles\Prints
echo Dear KOHLI, >> VIRAT_KOHLI_6_rejection_letter.txt
echo.>> VIRAT_KOHLI_6_rejection_letter.txt
echo This is to inform you that your child VIRAT is not admitted for the summer camp because of following reasons: AGE IS NOT BETWEEN 8 AND 19,  >> VIRAT_KOHLI_6_rejection_letter.txt
echo 900$ IS LESS THAN 1000$. We look forward for your child’s application for the coming camps. >> VIRAT_KOHLI_6_rejection_letter.txt
echo.>> VIRAT_KOHLI_6_rejection_letter.txt
echo.>> VIRAT_KOHLI_6_rejection_letter.txt
echo.>> VIRAT_KOHLI_6_rejection_letter.txt
echo Director >> VIRAT_KOHLI_6_rejection_letter.txt
echo.>> VIRAT_KOHLI_6_rejection_letter.txt
echo GILA BREATH CAMP >> VIRAT_KOHLI_6_rejection_letter.txt
echo copying C:\Program Files\Gila_Breath_Camp\Textfiles\Templates\a_template.txt
cd C:\Program Files\Gila_Breath_Camp\Textfiles\Templates
echo Dear *guardian_last_name*, >> a_template.txt
echo.>> a_template.txt
echo This is to inform you that your child *applicant_first_name* has been admitted for the summer camp starting from *camp_time_slots*.  >> a_template.txt
echo Please look into the attached packet for information and guidance regarding the Check-In.  >> a_template.txt
echo We look forward to see your child at the Gila Breath Camp. >> a_template.txt
echo.>> a_template.txt
echo Director >> a_template.txt
echo GILA BREATH CAMP >> a_template.txt
echo copying C:\Program Files\Gila_Breath_Camp\Textfiles\Templates\r_template.txt
cd C:\Program Files\Gila_Breath_Camp\Textfiles\Templates
echo Dear *guardian_last_name*, >> r_template.txt
echo.>> r_template.txt
echo This is to inform you that your child *applicant_first_name* is not admitted for the summer camp because of following reasons:  >> r_template.txt
echo *violations* >> r_template.txt
echo We look forward for your child’s application for the coming camps. >> r_template.txt
echo.>> r_template.txt
echo Director >> r_template.txt
echo GILA BREATH CAMP >> r_template.txt
cd C:\Program Files\Gila_Breath_Camp\Static
XCOPY ".\Gila_Breath_Camp.bat" "%userprofile%\desktop" /S
