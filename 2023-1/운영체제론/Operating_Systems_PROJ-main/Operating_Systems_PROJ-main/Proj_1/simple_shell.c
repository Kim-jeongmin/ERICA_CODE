#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <stdlib.h>
#include <fcntl.h>

#define MAX_LINE 80 /* The maxumum length command */

int main(void){
  char *args[MAX_LINE/2+1]; /* command line arguments */
  int should_run=1; /* flag to determine when to exit program */

  while(should_run){
    printf("ahs> ");
    fflush(stdout);

    char input[MAX_LINE/2+1]; // 입력을 받기 위한 문자열 선언
    fgets(input, sizeof(input), stdin); // 입력 받기
    int input_len = strlen(input); // 입력 길이 저장
    input[input_len-1]='\0'; // 입력 끝부분 표시 (NULL)

    if(strcmp(input, "")==0) continue; // 아무 입력 없을 경우 예외 처리

    int flag=0; // 간격만 입력 되었을 시 표시를 위해 생성
    for(int i=0; i<(input_len-1); i++){ // 마지막에는 NULL 입력 되기 때문에 (길이-1)까지
      if(input[i]==' ') continue;
      flag=1;
      break;
    }
    if(flag==0) continue; // 입력이 모두 간격일 때 예외 처리

    int index = 0; // args에 저장되는 순서를 위한 변수

    // 입력된 명령어 받아오기 위해 생성
    char *command = (char *)malloc(input_len+1); // 메모리 할당
    command = strcpy(command, input);

    int output = 0; // redirection이 input인지 output인지 표시하기 위해 생성
    char *file_name = (char *)malloc(input_len+1); // 파일명 저장하기 위해 생성

    // '>', '<', '|' 기준으로 앞,뒤로 나눠서 저장하기 위해 생성
    char *left = (char *)malloc(input_len+1);
    char *right = (char *)malloc(input_len+1);

    int pipe_index = 0; // pipe 명령어 입력 시 '|'를 기주으로 뒤로 나뉘어진 index 저장 위해 생성
    char *pipe_args[MAX_LINE/2+1]; // | 뒤에 명령어 저장 위해 생성

    // 명령어 받아서 구분해주는 부분
    if(strchr(input, '<') != NULL || strchr(input, '>') != NULL){ // input&output redirection 처리 과정
      if(strchr(input, '>') != NULL){
        left = strtok(command, ">"); // > 기준으로 앞에 있는 명령어 + 옵션 부분 잘라서 저장
        right = strtok(NULL, ">"); // > 기준으로 뒤에 있는 파일명 (&) 부분 잘라서 저장
        output = 1; // output redirection 표시
      } else{
        left = strtok(command, "<"); // < 기준으로 앞에 있는 명령어 + 옵션 부분 잘라서 저장
        right = strtok(NULL, "<"); // < 기준으로 뒤에 있는 파일명 (&) 부분 잘라서 저장
        output = -1; // input redirection 표시
      }
      // 공백을 기준으로 명령어, 옵션 저장하는 과정
      args[index]=strtok(left, " ");
      index++;
      while(left!=NULL){
        left = strtok(NULL, " ");
        if(left == NULL) break;
        args[index] = left;
        index++;
      }
      args[index] = NULL; // 명령어 + 옵션 종료 위치 표시
      file_name = strtok(right, " "); // 파일명을 저장한다
      // 파일명까지만 저장하기 때문에 뒤에 형식 따르지 않더라도 무시된다.
    } else if(strchr(input, '|') != NULL){ // pipe
      left = strtok(command, "|"); // | 기준으로 앞에 있는 명령어 + 옵션 부분 잘라서 저장
      right = strtok(NULL, "|"); // | 기준으로 뒤에 있는 파일명 (&) 부분 잘라서 저장
      // strtok 를 | 기준 앞, 뒤 한번만 하기 때문에 형식 벗어나더라도 뒷 부분은 무시됨
      // 공백을 기준으로 명령어, 옵션 구분하여 저장하는 과정
      args[index]=strtok(left, " ");
      index++;
      while(left!=NULL){
        left = strtok(NULL, " ");
        if(left == NULL) break;
        args[index] = left;
        index++;
      }
      args[index] = NULL; // 명령어 + 옵션 종료 위치 표시
      index++;
      // | 뒷 부분 명령어는 따로 저장한다. -> 앞 부분과 명령어 구분하기 위해서
      pipe_args[pipe_index]=strtok(right, " ");
      pipe_index++;
      while(right!=NULL){
        right = strtok(NULL, " ");
        if(right == NULL || strcmp(right,"&")==0) break; // &는 실행되는 명령어가 아니기 때문에 args에 저장하면 안됨
        pipe_args[pipe_index] = right;
        pipe_index++;
      }
      pipe_args[pipe_index] = NULL; // 명령어 + 옵션 종료 위치 표시
      pipe_index++;
    }else { // 명령어 + 옵션 (&) 입력 시 처리하는 과정
      char *temp = strtok(command, " "); // 공백 기준으로 자른 것 저장 위해 생성
      args[index] = temp;
      index++;
      while(temp!=NULL){ // 공백을 기준으로 명령어, 옵션, & 구분하여 저장하는 과정
        temp = strtok(NULL, " ");
        if(temp == NULL || strcmp(temp,"&")==0) break; // &는 실행되는 명령어가 아니기 때문에 args에 저장하면 안됨
        args[index] = temp;
        index++;
      }
      args[index] = NULL; // 명령어 + 옵션 종료 위치 표시
      // cd 명령어는 child process에서 실행하면 반영이 안되기 때문에 parent process에서 실행한다.
      if(strcmp(args[0],"cd")==0){ // cd 명령어 처리를 위한 과정
        if(index==1 || strcmp(args[1], "~")==0) chdir(getenv("HOME"));
        // cd 및 cd ~ 입력 시 home directory 로 가는 명령어 예외 처리
        else{
          if(chdir(args[1])==-1){
            perror(args[1]); // 경로 없을 시 에러 표시
            exit(1);
          }
          else chdir(args[1]); // 경로 있으면 이동
        }
      }
    }
    pid_t pid;

    if(pid>0) waitpid(pid, 0, WNOHANG);
    // &로 백그라운드 실행 시 종료가 안되어 좀비 process로 남는 child process 종료 위한 과정

    pid = fork(); // 자식 프로세스를 fork

    if(strcmp(args[0],"exit")==0) should_run=0; // exit 받으면 종료

    if(pid<0){
      perror("fork error");
      exit(1);
    } else if(pid>0){ // parent process
      if(strchr(input, '&') != NULL){
        printf("[1] %d\n", getpid());
      } else wait(NULL); // & 없을 시 wait
    } else{ // child process
      // 명령어를 처리하기 위해 새로운 process 생성
      if(pipe_index == 0){ // pipe 일어나지 않을
        if(output!=0){ // input, output redirection 실행
          // 파일 열기 : 없다면 생성하고 내용 있어도 다 지우고 읽고 쓰기 모두 가능하도록 연다.
          int redirection; // input, output에 따라 open 형태를 다르게 하기 위해 생성
          if(output==1) redirection = open(file_name, O_CREAT | O_TRUNC | O_RDWR, 0644);
          /* output redirection은 출력 내용을 파일에 입력해야하니 없다면 생성, 내용이 있다면 지우고 써야하므로
             읽기-쓰기 모두 가능하도록 열어준다. */
          if(output==-1) redirection = open(file_name, O_RDONLY);
          // input redirection은 저장되어있는 파일을 열어서 읽는 것 이므로 읽기 전용으로 열어준다.
          if(redirection<0){
            perror(file_name); // 파일 열기 실패했다면 에러 표시
            exit(1);
          }
          else {
            int dup2_stat; // input, output에 따라 dup2 형태를 다르게 하기 위해 생성
            if(output==1) dup2_stat = dup2(redirection, STDOUT_FILENO); // output 일땐 STDOUT_FILENO
            if(output==-1) dup2_stat = dup2(redirection, STDIN_FILENO); // input 일땐 STDIN_FILENO
            if(dup2_stat<0){
              perror("redirection dup2 error"); // dup2 실패시 에러 표시
              exit(1);
            }
            close(redirection); // 파일 닫아준다
          }
        }
        if(strcmp(args[0], "cd")!=0){ // cd 명령어를 예외 처리 한 뒤 shell 입력을 받아온다.
          if(execvp(args[0], args) < 0){
            perror(args[0]);
            exit(1);
          } else execvp(args[0], args); // 명령어 실행
          exit(0); // 종료
        }
        exit(0); // cd 명령어 종료 처리
      } else{ // pipe 명령어 입력시 실행
        int pipe_fd[2];
        if (pipe(pipe_fd) == -1) {
            perror("Error: Pipe failed");
            exit(1);
        }

        pid_t pipe_pid = fork();
        if (pipe_pid == 0) {
            dup2(pipe_fd[1], STDOUT_FILENO);
            close(pipe_fd[0]);
            close(pipe_fd[1]);
            execvp(args[0], args);
            exit(0);
        }

        dup2(pipe_fd[0], STDIN_FILENO);
        close(pipe_fd[1]);
        close(pipe_fd[0]);
        execvp(pipe_args[0], pipe_args);
        exit(0);

        // wait pipe_pid
        if(strchr(input, '&') != NULL){
          printf("[1] %d\n", getpid());
        } else wait(NULL); // & 없을 시 wait

        // wait pid
        if(strchr(input, '&') != NULL){
          printf("[1] %d\n", getpid());
        } else wait(NULL); // & 없을 시 wait
      }
    }
  }
  return 0;
}
