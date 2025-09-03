#include <stdio.h>
#include <dirent.h>

// Path name folder
const char *FOLDER_PATH = TIPS_PAGES_PATH;
printf("%s", FOLDER_PATH);

int main(int argc, char *argv[])
{
	// Only take one argument
	if (argc != 2)
	{
		// Print an usage message
		printf("Usage: tips name\n");
		return 1;
	}

	// Store the command in a variable
	char *tip_name = argv[1];

	// Store the new path in a buffer
        char path[PATH_MAX];

        // Make the new path
        snprintf(path, sizeof(path), "%s/%s.txt", FOLDER_PATH, tip_name);

        // Open the file
        FILE *tips = fopen(path,"r");

        // Verify if is opened successfully
        if (tips == NULL)
        {
                // Print an error if there is not page
                printf("No tips for '%s'.\n", tip_name);
                return 1;
        }
	
	// Use an int to handle the EOF.
	int c;
	
	// Loop through the file until you reach EOF
	while ((c = fgetc(tips)) != EOF)
	{
		// Print the char onto the terminal
		putchar(c);
	}	
	
        // Close the tips (file)
        fclose(tips);

	// Exit the program
	return 0;
}
