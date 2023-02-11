#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>

#define MAX_LENGTH 100

int compare_files(const char *file1, const char *file2) {
    FILE *fp1 = fopen(file1, "r");
    FILE *fp2 = fopen(file2, "r");
    if (!fp1 || !fp2) {
        return 1;
    }

    int result = 0;
    char c1, c2;
    while ((c1 = fgetc(fp1)) != EOF && (c2 = fgetc(fp2)) != EOF) {
        if (c1 != c2) {
            result = 1;
            break;
        }
    }

    if (fgetc(fp1) != EOF || fgetc(fp2) != EOF) {
        result = 1;
    }

    fclose(fp1);
    fclose(fp2);
    return result;
}

int compare_files_if_ls(const char *file1, const char *file2) {
    FILE *fp1 = fopen(file1, "r");
    FILE *fp2 = fopen(file2, "r");
    if (!fp1 || !fp2) {
        return 1;
    }

    int result = 0;
    int count1 = 0, count2 = 0;
    char c1, c2;
    while ((c1 = fgetc(fp1)) != EOF) {
        if (c1 == '\n') count1++;
    }
    while ((c2 = fgetc(fp2)) != EOF) {
        if (c2 == '\n') count2++;
    }

    if (count1 != count2) {
        result = 1;
    }

    fclose(fp1);
    fclose(fp2);
    return result;
}

int main(int argc, char *argv[]) {

    char *makefile = argv[1];
    char *command1 = argv[2];
    char *command2 = argv[3];
	char *command3 = argv[4];
	char *command4 = argv[5];
	char *command5 = argv[6];
	char *command6 = argv[7];
    char *outfile = argv[8];

    
    char pipex_path[MAX_LENGTH] = "../pipex_bonus";
    char command[MAX_LENGTH];
    sprintf(command, "%s %s \"%s\" \"%s\" \"%s\" \"%s\" \"%s\" \"%s\" %s", pipex_path, makefile, command1, command2, command3, command4, command5, command6, outfile);
    system(command);

    char expected_output[MAX_LENGTH];
    sprintf(expected_output, "%s.expected", outfile);
    char expected_command[MAX_LENGTH];
    sprintf(expected_command, "< %s %s | %s | %s | %s | %s | %s > %s", makefile, command1, command2, command3, command4, command5, command6, expected_output);
    int result = system(expected_command);

    if (result != 0) {
        fprintf(stderr, "Error: Expected output could not be created\n");
        return 1;
    }
    
    result = compare_files(outfile, expected_output);
    int i = 0;
    int j = 0;
	int l = 0;
	int s = 0;
	int p = 0;
	int u = 0;
    while (argv[2][i] == ' ' || argv[2][i] == '\t')
        i++;
    while (argv[3][j] == ' ' || argv[3][j] == '\t')
        j++;
	while (argv[4][l] == ' ' || argv[4][l] == '\t')
        l++;
	while (argv[5][s] == ' ' || argv[5][s] == '\t')
        s++;
	while (argv[6][p] == ' ' || argv[6][p] == '\t')
        p++;
	while (argv[7][u] == ' ' || argv[7][u] == '\t')
        u++;
    // int x = strlen(argv[2]);
    // int k = strlen(argv[3]);
    // printf("%d , %d\n", x, i);
    // printf("%d , %d\n", k, j);
    if (strlen(argv[2]) == i || strlen(argv[3]) == j || strlen(argv[4]) == l || strlen(argv[5]) == s || strlen(argv[6]) == p || strlen(argv[7]) == u)
    {
        
        return (0);
    }
    else if (strncmp(argv[2], "ls", 2) == 0 || strncmp(argv[3], "ls", 2) == 0 || strncmp(argv[4], "ls", 2) == 0 || strncmp(argv[5], "ls", 2) == 0 || strncmp(argv[6], "ls", 2) == 0 || strncmp(argv[7], "ls", 2) == 0)
    {
        result = compare_files_if_ls(outfile, expected_output);
    }
    else if (result != 0) {
        fprintf(stderr, "Error: Expected output is not equal to actual output\n");
        return 1;
    }

    printf("Test passed: Output is as expected\n");
    // unlink(expected_output);
    return 0;
}