@ECHO OFF
:MODE CON: COLS=80 LINES=44
COLOR 0A
:START
TITLE .::.::. WALDO .::.::.
@ECHO OFF
:::           @@@,@@
:::        #*/%@@@@/.&@@,
:::    @@@#@@#&@#&#&@@@,*%/
:::    /@@@&###########@@&*(*
:::  (@################%@@@@@.
:::  @@@@&#############%@@@@@@@@@@@@@@@@@@@@@@@@%@
:::  %@@@@%##########&@@@                        #@@@@@@@
:::  @@&%#########@@@@/                        */@@@%(((@@@
:::     @@@#%@@%@@@,                       *&@@@&%((((((((@@
:::      /(@@@@@@@                     *&@@@@%(((((((((((((@@
:::         /#@@@/                ..@@@@%(((((((((((((((@@@@@@@@@@@@&#,
:::           %@               /@@@@&((((((((((((((((@@@@@@&#######%%@@@@#    
:::         *@@            .&@@@#((((((((((((((((@@@@@%###&@@@@@@@@@&%##&@@@@@@/
:::        /@@          #@@@&#((((((((((((((@@@@@%%%%@@@@%#########%&@@@@@@@@&
:::       *@@      *%@@@@#(((((((((((((((@@@@@@@@@@%####%@@@@@@@@@@@@###&@@@@@@@&
:::       %@/ .&%@@%#((((((((((((((((@@@@@@@&#####%@@@%#############%@@@&%##&@@/
:::       @@@@@@%((((((((((((((((@@@@&%####%@@@%#####&@@@@@@@@@@@@@@@&##&@@@@@@@@@/
:::      @@@&(((((((((((((((((@@@@@&@@@@######@@@###################&@@@&#####%@@*
:::      @@#(((((((((((((#@@@@%&@@.,,.*@@@%#####@@@@@@@@@@@@@@@@@@@%####%@@@@@@@@@@
:::      *@@%(((((((((@@@@@@@%#&@@,,.,,.&@@@#####################%@@@@@@%######&@@.
:::        @@@((((@@@@@&##&@@@&#@@/,,,,,,,,@@@&######&@@@@@@@@&&%######%@@@@@@@@@@@
:::         @@@@@@&%&@@@%#&@%%@@@@/,,,,,,,,,,/@@@@@@@#/,,.*&@@%&@@@@@@&%#####%@@@@.
:::           .@@@###&@@@%%@(,,,%@&,.,,,,,,,,,,,,,.*&@@@@&(,*@&#@%%@@@@@@@@@@@@*
:::             @@%##%@@/@@@%/@@@@@@@@@#,,,,.../@@@@@%#%&@@@@(&@&@&@@@@(
:::             .@@&##@@,,/@@@@&(.  .&@@@&,,,.&@@/         #@@%@@@@@@@@@/
:::            *@@@@@&@@.*@@@          %@@@*,&@@            *@@@@@&.#/,@/
:::           *@@&*#@@@@@@@&     #@(    .@@@@@@&    ,@@@,    @@@@@(,@/@@
:::           *@@/@#.#@@@@@/    %@@@,   .@@@@@@@     &@&     @@*@@*(@@#
:::            (@@/@,,@@&@@@            &@@,,(@@&          .@@%/@@,@@
:::              /@@@*,@@,@@@*         @@@,,,,,@@@@.     *@@@%,@@**@#
:::                %@@.%@&,(@@@@,  /&@@@@,,,,,,,%@@@@@@@@@@%,,*@@,#@,
:::                 ,@@,&@,,,,(@@@@@@@(,,,,,,,,,,,,,,**,,,,,,.*@/,&@
:::                  &@,*@@.,,,,,,,,,,,&@@%/**/@@*,,,,,&(.,,,.@@,,@@
:::                  /@%,&@/,,,,,,,,,,,,*&@@@@@#.,,,,,,,,,,,,(@@@@@(
:::             ##    ##    ##    #####     ##       #####      #######
:::             ##   ####   ##   ##   ##    ##       ##   ##   ##     ##
:::             ##  ##  ##  ##   ##   ##    ##       ##    ##  ##     ##
:::              ## ##  ## ##   ## ### ##   ##       ##   ##   ##     ##
:::               ####  ####    ##     ##   ######   #####      #######   
:::                                                            ver 1.0.0
:::
:::
:::                        PRESIONA UNA TECLA PARA COMENZAR
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
PAUSE>NUL
CLS
GOTO MENU
:MENU
ECHO.
ECHO.  +-----------+-------------------------------------+
ECHO.  ^|  OPCION   ^|  DESCRIPCION                        ^|
ECHO.  +-----------+-------------------------------------+
ECHO.  ^|     1     ^| CONSULTA DE LOCAL POR NUMERO        ^|
ECHO.  ^|     2     ^| CONSULTA DE LOCAL POR SERIE         ^|
ECHO.  ^|     3     ^| CONSULTA DE LOCAL POR IP            ^|
ECHO.  ^|     4     ^| REGISTRAR UNA TAREA                 ^|
ECHO.  ^|     X     ^| SALIR                               ^|
ECHO.  +-------------------------------------------------+
ECHO.  ^| ESCOJA UNA OPCION PARA CONTINUAR                ^|
ECHO.  +-------------------------------------------------+
ECHO.
CHOICE /N /C:1234X
CLS
GOTO LABEL-%ERRORLEVEL%
:LABEL-1
ECHO. 
ECHO. +---------------------------+
ECHO. ^|     CONSULTA DE LOCAL     ^|
ECHO. +---------------------------+
ECHO.
SET /P var=NUMERO DE LOCAL: 
FOR /F "tokens=* USEBACKQ" %%F IN (`findstr /b "%var%;" locales.csv`) DO (SET str=%%F)
CALL SET local=%%str:%var%;=%%
ECHO. 
ECHO. %local%
ECHO.
ECHO. PARA CONSULTAR OTRO LOCAL, PRESIONE 1
ECHO. PARA VOLVER AL MENU PRINCIPAL, PRESIONE 2
CHOICE /N /C:12
IF %ERRORLEVEL% == 1 CLS & GOTO LABEL-1
IF %ERRORLEVEL% == 2 CLS & GOTO MENU
:LABEL-2
ECHO. 
ECHO. +---------------------------+
ECHO. ^|     CONSULTA DE LOCAL     ^|
ECHO. +---------------------------+
ECHO.
SET /P var=NUMERO DE SERIE: 
FOR /F "tokens=* USEBACKQ" %%F IN (`findstr /b "%var%;" series.csv`) DO (SET str=%%F)
CALL SET local=%%str:%var%;=%%
ECHO. 
ECHO. %local%
ECHO.
ECHO. PARA CONSULTAR OTRO LOCAL, PRESIONE 1
ECHO. PARA VOLVER AL MENU PRINCIPAL, PRESIONE 2
CHOICE /N /C:12
IF %ERRORLEVEL% == 1 CLS & GOTO LABEL-2
IF %ERRORLEVEL% == 2 CLS & GOTO MENU
:LABEL-3
ECHO. 
ECHO. +---------------------------+
ECHO. ^|     CONSULTA DE LOCAL     ^|
ECHO. +---------------------------+
ECHO.
SET /P var=DIRECCION IP: 
FOR /F "tokens=* USEBACKQ" %%F IN (`findstr /b "%var%;" ip.csv`) DO (SET str=%%F)
CALL SET local=%%str:%var%;=%%
ECHO. 
ECHO. %local%
ECHO.
ECHO. PARA CONSULTAR OTRO LOCAL, PRESIONE 1
ECHO. PARA VOLVER AL MENU PRINCIPAL, PRESIONE 2
CHOICE /N /C:12
IF %ERRORLEVEL% == 1 CLS & GOTO LABEL-3
IF %ERRORLEVEL% == 2 CLS & GOTO MENU
:LABEL-4
ECHO. 
ECHO. +---------------------------+
ECHO. ^|     REGISTRO DE TAREA     ^|
ECHO. +---------------------------+
ECHO.
SET /P printer=SERIE: 
SET /P store=LOCAL: 
SET /P date=FECHA: 
SET /P hashtag=HASHTAG: 
SET /P desc=ACTIVIDAD: 
ECHO %printer%,%store%,%date%,%hashtag%,%hashtag% %desc%>>registros.csv
ECHO.
ECHO. PARA REGISTRAR OTRA TAREA, PRESIONE 1
ECHO. PARA VOLVER AL MENU PRINCIPAL, PRESIONE 2
CHOICE /N /C:12 >NUL
IF %ERRORLEVEL% == 1 GOTO LABEL-4
IF %ERRORLEVEL% == 2 CLS & GOTO MENU
:LABEL-X
EXIT