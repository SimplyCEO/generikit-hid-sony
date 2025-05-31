#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <poll.h>
#include <limits.h>
#include <sys/time.h>

void
help(void)
{
  printf("GeneriKit 0.2.0 event-reader.\n\
        \r\n\
        \rUsage:\n\
        \r\t-s: Enable sensor detection.\n\
        \r\t    Disabled by default because generic devices may cause a mess.\n\
        \r\t-h: Print help page.\n");
}

struct input_event
{
  struct timeval time;
  unsigned short type;
  unsigned short code;
  unsigned int value;
};

unsigned char display_sensors = 0;

int
main(int argc, char *argv[])
{
  int opt = 0;
  unsigned char argp = 1;
  while((opt = getopt(argc, argv, ":sh")) != -1)
  {
    switch (opt)
    {
      case 's': display_sensors = 1; argp++; break;
      case 'h': help(); return 1;
      case '?': printf("ERROR: Unknown option: %c.\n", optopt); break;
    }
  }

  const int timeout_ms = -1;
  int       ret, st;
  char      *input_dev = argv[argp];
  struct pollfd fdstream[1];

  fdstream[0].fd = open(input_dev, O_RDONLY|O_NONBLOCK);
  if (fdstream[0].fd < 0)
  {
    printf("ERROR: Unable to open for reading: '%s'.\n", input_dev);
    return 1;
  }

  const int input_size = sizeof(struct input_event);
  printf("input_size=%d\n", input_size);

  struct input_event input_data;
  memset(&input_data, 0, input_size);

  fdstream[0].events = POLLIN;

  while(1)
  {
    ret = poll(fdstream, 1, timeout_ms);
    if (ret < 1)
    { printf("Timeout.\n"); }
    else
    {
      if (fdstream[0].revents < 1)
      { printf("ERROR.\n"); }
      else
      {
        ssize_t r = read(fdstream[0].fd, &input_data, input_size);
        if (r < 0)
        { printf("error %d\n", (int)r); break; }
        else if (((display_sensors == 1) & (input_data.value > 0)) | (input_data.value == 1))
        {
          printf("time=%ld.%01lu type=%hu code=%hu value=%u\n",
              input_data.time.tv_sec,
              input_data.time.tv_usec,
              input_data.type,
              input_data.code,
              input_data.value);
          memset(&input_data, 0, input_size);
        }
      }
    }
  }

  close(fdstream[0].fd);

  return 0;
}

