#include<iostream>
#include<windows.h>
int main(int argc, char const* argv[])
{
	
	using namespace std;
	const HMODULE hMod= LoadLibrary("isSymlink_dll.dll");
	if(!hMod){
		cout << "failed" << endl;
	}
	const char* (__stdcall *is_symlink)(char*);
	is_symlink = (const char* (__stdcall*)(char*))GetProcAddress(hMod, "is_symlink");
	const DWORD err = GetLastError();
	if(err < 1){
		cout << "failed" << endl;
	}
	if(!is_symlink){
		is_symlink("C:/Users/Fenrir/.vimrc");
	}
	else{
		std::cout << "null" << std::endl;
	}

	FreeLibrary(hMod);
	return 0;
}
