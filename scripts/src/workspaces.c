#include <stdio.h>
#include <stdlib.h>
#include <string.h>



const char *workspaces[] = {
    "1234",
    "567",
    "890",
    "qwe",
};
#define NUM_WP 13

int main(int argc, char** argv)
{
    int move = 0;

    if (argc == 2)
    {
        if (argv[1][0] == '+')
            move = 1;
        else if (argv[1][0] == '-')
            move = -1;
    } else {
        fprintf(stderr, "Wrong number of arguments..\n");
        exit(-3);
    }




    char buffer[256];
    char workspace = '0';
    char next = '0';
    FILE *fp;

    fp = popen("swaymsg -t get_workspaces | jq -r '.[] | select(.focused==true) | .name'", "r");
    if (fp == NULL)
    {
        fprintf(stderr, "Failed to get current workspace\n");
        exit(-1);
    }


    if (fgets(buffer, sizeof(buffer), fp) != NULL)
    {
        workspace = buffer[0];
        if (workspace == '0')
        {
            fprintf(stderr, "Failed to parse the current workspace from: %s", buffer);
            exit(-2);
        }

        printf("Current workspace: %c\n", workspace);

        for (int i = 0; i < (sizeof(workspaces)/sizeof(workspaces[0])); i++)
        {
            for (int j = 0; j < strlen(workspaces[i]); j++)
            {
                if (workspace == workspaces[i][j])
                {

                    next = j+move;
                    if (next < 0)
                        next = strlen(workspaces[i])-1;

                    next = workspaces[i][next];
                    printf("Next: %c\n", next);


                    memset(buffer, 0, sizeof(buffer));
                    snprintf(buffer, sizeof(buffer)-1, "swaymsg workspace %c", next);
                    system(buffer);
                }
            }
        }
    }

}

