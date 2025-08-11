@echo off
set modulesClasspath=%~1
set modulesClasspath=%modulesClasspath:"=^"%
set ezyclasspath=lib\*;web\lib\*;web\settings;web\resources;%modulesClasspath%
echo classpath = %ezyclasspath%

java -cp %ezyclasspath% org.youngmonkeys.ezyplatform.web.WebStartup
