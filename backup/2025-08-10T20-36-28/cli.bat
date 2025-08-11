@echo off
set "ezyclasspath=lib\*;"
java -cp %ezyclasspath% org.youngmonkeys.ezyplatform.cli.CLI %1
