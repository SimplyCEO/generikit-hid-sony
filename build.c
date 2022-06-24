#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

int helpF(void)
{
    printf("Use the GeneriKit build tool with the right options and the program will work as expected.\n\
            \n\
            \rUsage:\n\
            \n\
            \r-m/--modules: get the modules from the available modules list.\n\
            \r-L/--list: list all modules available to build.\n\
            \r-v/--verbose: TODO.\n\
            \r-V/--version: show the version and all contributors of the project.\n\
            \r-h/--help: gives what is showing right now.\n");

    return 0;
}

// Show the version and all contributors of the project.
int versionF(void)
{
    printf("GeneriKit devel.\n\
            \n\
            \rCredits:\n\n");

    FILE *credits;
    char character;
    credits = fopen("credits.txt", "r");
    while((character = fgetc(credits)) != EOF)
        printf("%c", character);
    printf("\n");
    fclose(credits);
    
    return 0;
}

// List all modules available to build.
int listF(void)
{
    FILE *modules;
    char character;
    modules = fopen("modules.txt", "r");
    while((character = fgetc(modules)) != EOF)
        printf("%c", character);
    printf("\n");
    fclose(modules);

    return 0;
}

// Support for generic PS3 Controller
int custom_hid_sony(void)
{
	// TODO

    return 0;
}

// Enable monitor mode for TL-WN722N v2/3
int custom_8188eu(void)
{
	// TODO

    return 0;
}

// Use a phone / Google Cardboard VR as a SteamVR
int custom_openvr(void)
{
	// TODO

    return 0;
}

int main(int argc, char *argv[])
{
    int i, x;
    char option[16], arguments[256];
    
    for(i=0;i<argc-1;i++)
    {
        if(!strncmp(argv[i+1], "-", 1))
        {
            snprintf(option, sizeof(argv[i+1]), "%s", argv[i+1]);
            snprintf(arguments, sizeof(arguments), "%s", argv[i+2]);
        }

        if(!strncmp(option, "-h", 2) || !strncmp(option, "--help", 6))
        {
            helpF();
            break;
        }
        else if(!strncmp(option, "-V", 2) || !strncmp(option, "--version", 9))
        {
            versionF();
            break;
        }
        else if(!strncmp(option, "-v", 2) || !strncmp(option, "--verbose", 9))
        {
            printf("TODO(?)\n");
            break;
        }
        else if(!strncmp(option, "-L", 2) || !strncmp(option, "--list", 6))
        {
            listF();
            break;
        }
        else if(!strncmp(option, "-m", 2) || !strncmp(option, "--modules", 9))
        {
            char command[256];
            snprintf(command, sizeof("make -j$(nproc)  modules && sudo make install clean")+strlen(arguments), "make -j$(nproc) %s modules && sudo make install clean", arguments);
            system(command);
            return 0;
        }
    }

    return 0;
}