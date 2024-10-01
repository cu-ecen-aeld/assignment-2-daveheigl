// make sure there are two arguments, if not, print usage and exit
// first argument is a path to the file
// second argument is a string to write to the file
// make sure the path exists. If not, create it

#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <syslog.h>
#include <unistd.h>

int main(char argc, char *argv[]) {
  if (argc != 3) {
    printf("Usage: %s <path> <string>\n", argv[0]);
    exit(1);
  }

  char *path = argv[1];
  char *string = argv[2];

  openlog("writer", LOG_PID | LOG_CONS, LOG_DEBUG);

  int fd = open(path, O_WRONLY | O_CREAT | O_TRUNC, 0600);
  if (fd == -1) {
    perror("open");
    exit(1);
  }

  if (write(fd, string, strlen(string)) == -1) {
    syslog(LOG_ERR, "Failed to write %s to file %s", string, path);
    exit(1);
  } else {
    syslog(LOG_DEBUG, "Successfully wrote \"%s\" to file %s", string, path);
  }

  close(fd);
  closelog();
  return 0;
}