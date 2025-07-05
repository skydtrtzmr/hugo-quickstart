@echo off
echo Starting Hugo server with network access...
hugo server --bind 0.0.0.0 --baseURL http://192.168.159.1:1313 -p 80
pause 