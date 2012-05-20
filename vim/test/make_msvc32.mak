all: isSymlink_win32.dll

isSymlink_win32.dll: isSymlink_dll.cpp
	cl /wd4996 /LD /FeisSymlink_win32.dll isSymlink_dll.cpp isSymlink_dll.lib advapi32.lib shell32.lib

clean:
	cmd /C "del isSymlink.lib isSymlink_win32.exp" /F /Q

