@ECHO ON

REM set the date as a value for variable "date"
	

REM go to drive where you want this new folder, make new folder "newFolder"
	CD /D D:
	MD newFolder

REM ask for input, what you want the folder to be named, set that input to a varaible
	SET /P folderName=[Name the folder]

REM rename "newFolder" to what the variable has been set as
	CD /D D:
	REN "newFolder" %folderName%

REM go into the folder we just renamed and create folders "raw" and "edited"
	CD /D D:/%folderName%
	MD Edited
	MD Raw

REM go into edited and make folders "Images" and "Videos"
	CD /D D:/%folderName%/Edited
	MD Images
	MD Videos

REM go into raw and make folders "Images" and "Videos"
	CD /D D:/%folderName%/Raw
	MD Images
	MD Videos

REM copy images from SD Card to Raw/Images
	ROBOCOPY G:/DCIM D:/%folderName%/Raw/Images /E

REM copy videos from SD Card to Raw/Videos
REM	ROBOCOPY G:/PRIVATE/AVCHD/BDMV/Stream D:/%folderName%/Raw/Videos /E

REM open the folder in file explorer
	START D:/%folderName%
