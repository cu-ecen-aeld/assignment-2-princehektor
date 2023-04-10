/*
 * Author : Anand
 * Description : writer.c
 */

#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>
#include <stdint.h>
#include <syslog.h>

int main(int argc, char *argv[])
{
	openlog(NULL, 0, LOG_USER);

	if (argc < 3)
	{
		syslog(LOG_ERR, "Please specify all arguments\n");
		exit(1);
	}

	char *writefile = argv[1];
	char *writestr = argv[2];

	//Open file for writing
	FILE        *file_ptr      = NULL;

	//Open the file (file name specified as command line argument)
	file_ptr = fopen(writefile,"w");
	if (file_ptr == NULL)
	{
		syslog(LOG_ERR, "Could not open file for writing \n");
		exit(1);
	}

	syslog(LOG_DEBUG, "Writing %s to %s ", writestr, writefile);

	//Write content to the file
	fprintf(file_ptr,"%s",writestr);

	//Close the file
	fclose(file_ptr);

	return 0;
}
