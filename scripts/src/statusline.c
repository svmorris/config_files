#define _POSIX_C_SOURCE 200809L

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <time.h>


#define DELAY 1



struct cpu_measurement {
    uint32_t user;
    uint32_t nice;
    uint32_t system;
    uint32_t idle;
    uint32_t iowait;
    uint32_t irq;
    uint32_t softirq;
    uint32_t steal;
    uint32_t guest;
    uint32_t guest_nice;
};

float get_cpu();
float get_volume();
void printbars(float value);
void get_cpu_reading(struct cpu_measurement *mes);


int main()
{

    printf("CPU ");
    fflush(stdout);
    while (1)
    {

        float volume = get_volume();
        printf("VOL ");
        printbars(volume);
        printf("%.1f%%\t\t", volume);

        float load = get_cpu();
        printf("CPU ");
        printbars(load);
        printf("%.1f%%\t\t", load);


        // date stuff
        time_t now = time(NULL);
        struct tm *tm_info = localtime(&now);
        char buf[64];
        strftime(buf, sizeof(buf), "%Y-%m-%d %H:%M:%S", tm_info);
        printf("%s\n", buf);



        fflush(stdout);
    }

}

void printbars(float value)
{
    printf("┃");
    uint8_t barcount = value/4;
    for (int i = 0; i < 25; i++)
    {
        if (i < barcount)
           printf("═");
        else
            printf(" ");
    }
    printf("┃");
}

//wpctl get-volume @DEFAULT_AUDIO_SINK@
float get_volume()
{
    FILE *fp;
    char *cmd = "wpctl get-volume @DEFAULT_AUDIO_SINK@";
    char *outbuf = malloc(0xff);
    float volume = 0.0;

    if (outbuf == NULL)
    {
        perror("malloc failed");
        free(outbuf);
        return -1.0;
    }

    fp = popen(cmd, "r");
    if (fp == NULL)
    {
        perror("Could not run wpctl");
        pclose(fp);
        free(outbuf);
        return -1.0;
    }

    if (fgets(outbuf, 0xfe, fp) != NULL)
    {
        pclose(fp);
        if (sscanf(outbuf, "Volume: %f", &volume) == 1)
        {
            free(outbuf);
            return volume*100;
        }
        perror("Scanf failed");
        free(outbuf);
        return -1.0;
    }

    pclose(fp);
    free(outbuf);
    return 0.0;
}

float get_cpu()
{
    struct cpu_measurement mes = {0};
    get_cpu_reading(&mes);

    uint32_t total = mes.user + mes.nice + mes.system + mes.idle + mes.iowait + mes.irq + mes.softirq + mes.steal + mes.guest + mes.guest_nice;
    uint32_t idle = mes.idle + mes.iowait;

    sleep(DELAY);

    struct cpu_measurement mes1 = {0};
    get_cpu_reading(&mes1);

    uint32_t total1 = mes1.user + mes1.nice + mes1.system + mes1.idle + mes1.iowait + mes1.irq + mes1.softirq + mes1.steal + mes1.guest + mes1.guest_nice;
    uint32_t idle1 = mes1.idle + mes1.iowait;

    float total_delta = (float)(total1 - total);
    float idle_delta = (float)(idle1 - idle);

    float load = ((total_delta - idle_delta) / total_delta) * 100; 

    return load;
}

void get_cpu_reading(struct cpu_measurement *mes)
{
    FILE *fp;
    int n = 0;
    size_t linelen = 0xfe;
    char *value = {0};
    fp = fopen("/proc/stat", "r");
    if (fp == NULL)
    {
        perror("Cannot open file");
        exit(-1);
    }

    char *line = malloc(linelen+1);
    if (line == NULL)
    {
        perror("Cannot alloc memory");
        exit(-1);
    }

    if ((n = getline(&line, &linelen, fp)) <= 0)
    {
        perror("Cannot read CPU file");
        exit(-1);
    }

    // first one is just CPU name
    value = strtok(line, " ");

    value = strtok(NULL, " ");
    sscanf(value, "%10u", &mes->user);

    value = strtok(NULL, " ");
    sscanf(value, "%10u", &mes->nice);

    value = strtok(NULL, " ");
    sscanf(value, "%10u", &mes->system);

    value = strtok(NULL, " ");
    sscanf(value, "%10u", &mes->idle);

    value = strtok(NULL, " ");
    sscanf(value, "%10u", &mes->iowait);

    value = strtok(NULL, " ");
    sscanf(value, "%10u", &mes->irq);

    value = strtok(NULL, " ");
    sscanf(value, "%10u", &mes->softirq);

    value = strtok(NULL, " ");
    sscanf(value, "%10u", &mes->steal);

    value = strtok(NULL, " ");
    sscanf(value, "%10u", &mes->guest);

    value = strtok(NULL, " ");
    sscanf(value, "%10u", &mes->guest_nice);

    fclose(fp);
    free(line);
}
