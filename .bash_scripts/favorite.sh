echo Provide a filename for your application '('i.e. myapp - all lowercase, no extensions')':
read FILENAME
echo Provide a name for your application '('i.e. My App')':
read NAME
echo Provide the FULL FILE PATH to the application, including the file extension, if it has one:
read EXEC
echo Provide the FULL PATH to the icon '('.png')' to be used for this application, including the extension:
read ICON

sudo touch $FILENAME.desktop

echo "#!/usr/bin/env xdg-open
[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Exec=$EXEC
Name=$NAME
Comment=Description of YourApp
Icon=$ICON" | sudo tee $FILENAME.desktop

sudo mv $FILENAME.desktop /usr/share/applications/
if [ -f /usr/share/applications/$FILENAME.desktop ]; then
    sudo chmod +x /usr/share/applications/$FILENAME.desktop
    echo Successfully created $FILENAME.desktop in /usr/share/applications
    echo You can now add/remove $NAME from the Favorites bar without ever having to run this script again! :D
else
    echo Failure - file not created
fi
