@echo off

setlocal enabledelayedexpansion

set folderSource=%3
set folderDestination=%4

for /F %%b in ('dir !folderSource! /b') do (

	if %%b GTR %1 (

		if %%b LSS %2 ( 

			for /F %%f in ('dir !folderSource!\%%b /s /b') do (
				set name=%%~nf
				set prefix=!name:~0,2!

				if !prefix! == ok (
					XCOPY "%%f" !folderDestination! /Y
					
					for /F %%k in ('dir !folderSource!\%%b /s /b') do (

						set nameAux=%%~nk
			
						set prefixAux=!nameAux:~0,5!
						
						if !prefixAux! == %%b_ (
							ren "!folderDestination!\!name!.pdf" "!nameAux!.pdf"
						) 
						set order=%%k_ 
					)

				) else (

					set prefixAux=!name:~0,5!

					set order=%%b_

					if !prefixAux! == !order! (
						rem need to check if the file is already in the destination folder
							XCOPY "%%f" !folderDestination! /Y
						
					)
				)
			)
		)
	)
)

for /F %%f in ('dir !folderDestination! /s /b') do (

	set name=%%~nf
	set prefix=!name:~0,2!

		if !prefix! == ok (
		
			set oldname= %%~nf

			set newname=!oldname:~3!
		
			ren "%%f" "!newname!.pdf"
		
		)


	echo !name!|findstr /r /c:"etiqueta" >nul && (

	  del "!folderDestination!\!name!.pdf"
	  rem any commands can go here
	) 

	echo !name!|findstr /r /c:"factsheet" >nul && (
	 
	  del "!folderDestination!\!name!.pdf"
	  rem any commands can go here
	) 

	echo !name!|findstr /r /c:"INVOICE" >nul && (

	  del "!folderDestination!\!name!.pdf"
	  rem any commands can go here
	)

	echo !name!|findstr /r /c:"_Error-" >nul && (

	  del "!folderDestination!\!name!.pdf"
	  rem any commands can go here
	) 

	echo !name!|findstr /r /c:"_Alert-" >nul && (

	  del "!folderDestination!\!name!.pdf"
	  rem any commands can go here
	) 

)          

pause
