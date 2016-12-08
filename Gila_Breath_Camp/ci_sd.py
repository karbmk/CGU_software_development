import os
import zipfile

def zip(src, dst):
    zf = zipfile.ZipFile("%s.zip" % (dst), "w", zipfile.ZIP_DEFLATED)
    abs_src = os.path.abspath(src)
    for dirname, subdirs, files in os.walk(src):
        for filename in files:
            absname = os.path.abspath(os.path.join(dirname, filename))
            arcname = absname[len(abs_src) + 1:]
            print ('zipping %s as %s' % (os.path.join(dirname, filename),arcname))
            zf.write(absname, arcname)
    zf.close()


os.system("python make_setup.py")

if not os.path.exists("Report/setup"):
    os.makedirs("Report/setup")

os.system("copy /Y Gila_Breath_Camp_setup.bat Report\setup\Gila_Breath_Camp_setup.bat")
os.system('XCOPY "Code/Static" "Report/setup" /S /Y')

zip("Report/setup","Report/setup.zip")
