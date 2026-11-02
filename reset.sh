pkill -f flutter
pkill -f dart
rm -rf flutter_web.log
nohup flutter run -d web-server --web-port 8080 --web-hostname 0.0.0.0 > flutter_web.log 2>&1 &
echo " ----- DONE ------"
