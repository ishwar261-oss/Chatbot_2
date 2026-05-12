@echo off
REM =========================================
REM Mohini AI ChatBot Launcher
REM =========================================

setlocal

REM --------------------------
REM SET OPENROUTER API KEY
REM --------------------------
set "OPENROUTER_API_KEY=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"

REM --------------------------
REM CHECK JSON LIBRARY
REM --------------------------
if not exist "json.jar" (
    echo Downloading json.jar...
    powershell -Command "Invoke-WebRequest https://repo1.maven.org/maven2/org/json/json/20230227/json-20230227.jar -OutFile json.jar"
)

REM --------------------------
REM COMPILE JAVA
REM --------------------------
echo Compiling Mohini AI...
javac -cp ".;json.jar" ChatBotGUI.java

if %ERRORLEVEL% NEQ 0 (
    echo Compile failed!
    pause
    exit /b
)

REM --------------------------
REM RUN CHATBOT
REM --------------------------
echo Launching Mohini AI...
java -cp ".;json.jar" ChatBotGUI
