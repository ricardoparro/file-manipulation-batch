@echo off

setlocal enabledelayedexpansion



for /F %%b in ('dir C:\dropboxtest /b') do (
	
	echo %%b

	for /F %%f in ('dir C:\dropboxtest\%%b /s /b') do (

		echo %%f

		set name=%%~nf
		set prefix=!name:~0,2!

		if !prefix! == ok (
			XCOPY "%%f" C:\robocopyTest\destination /Y

		) else (

		set prefixAux=!name:~0,5!

		echo !prefixAux!

		echo !prefixAux!

		set order=%%b_

		echo !order!

		if !prefixAux! == !order! (
			XCOPY "%%f" C:\robocopyTest\destination /Y
		)


		rem if !prefixAux! == %%b_ (
		rem )
		)
	)
)


  pause

for /F %%f in ('dir C:\robocopyTest\destination /s /b') do (

set name=%%~nf
set prefix=!name:~0,2!


echo !prefix!

	if !prefix! == ok (
	echo entrou
	pause
		set oldname= %%~nf

		set newname=!oldname:~3!
		
	 
		del "C:\robocopyTest\destination\!newname!.pdf"
	
		ren "%%f" "!newname!.pdf"
	
	)


	echo !name!|findstr /r /c:"etiqueta" >nul && (

  del "C:\robocopyTest\destination\!name!.pdf"
  rem any commands can go here
) 

	echo !name!|findstr /r /c:"factsheet" >nul && (
 
  del "C:\robocopyTest\destination\!name!.pdf"
  rem any commands can go here
) 

	echo !name!|findstr /r /c:"INVOICE" >nul && (

  del "C:\robocopyTest\destination\!name!.pdf"
  rem any commands can go here
)

echo !name!|findstr /r /c:"_Error-" >nul && (

  del "C:\robocopyTest\destination\!name!.pdf"
  rem any commands can go here
) 

echo !name!|findstr /r /c:"_Alert-" >nul && (

  del "C:\robocopyTest\destination\!name!.pdf"
  rem any commands can go here
) 

)          

pause


::FOR /F "tokens=*" %%i in ('dir C:\Projects /AD /s /b') DO (


::echo "%%i"


::REM XCOPY "%%i\*.jpg" C:\robocopyTest /Y 


::)