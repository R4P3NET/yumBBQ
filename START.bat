@echo off
set PWD=%~dp0

echo injecting mmBBQ...

rundll32 "%PWD%mmbbq.dll",rundll_inject 0,0,0,0
