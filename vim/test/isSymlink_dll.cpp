#include <stdio.h>
#include <windows.h>

#define BUFSIZE MAX_PATH

#ifdef _MSC_VER
# define EXPORT __declspec(dllexport)
#else
# error "windowsのみ,msvcのみ対応してます"
  a < a
# define EXPORT
#endif


#define myNDEBUG

EXPORT const char *is_symlink(char *args);

const char *is_symlink(char *args)
{
	WIN32_FIND_DATA fd;
	static char Path[BUFSIZE];

	if (!args) {
		return "error,Need argument";
	}

	const HANDLE hFind = FindFirstFile(args, &fd);
	if (hFind == INVALID_HANDLE_VALUE) {
		sprintf(Path, "error,%d %s", GetLastError(), args);
		return Path;
	}

	if (fd.dwReserved0 == IO_REPARSE_TAG_SYMLINK) {
		static char tmp_path[BUFSIZE];
		const HANDLE hFile = CreateFile(args, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
		const DWORD dwRet = GetFinalPathNameByHandle(hFile, tmp_path, BUFSIZE, VOLUME_NAME_DOS);
		sprintf(Path, "true,%s", &tmp_path[4]);
		CloseHandle(hFile);
	} else {
		return "false";	
	}

	FindClose(hFind);
	return Path;

}

#ifdef myNDEBUG
//test
int main (int argc, char *argv[])
{
	printf("%s\n", is_symlink("C:/Users/Fenrir/.vimrc"));
//    printf("%s\n", is_symlink("C:/Users/Fenrir/.vimr"));

}

#endif
