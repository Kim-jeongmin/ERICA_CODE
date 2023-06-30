#include <stdio.h>
#include <stdlib.h>
#include <sys/ptrace.h>
#include <sys/syscall.h>
#include <sys/types.h>
#include <sys/user.h>
#include <sys/wait.h>
#include <unistd.h>

#define syscode_case(x)                                                        \
  case x:                                                                      \
    return #x

const char *get_syscode(long);

struct user_regs_struct regs;

int main() {
  pid_t child = fork();
  if (child == 0) {
    /* TODO: 자식 프로세스를 추적 가능하도록 설정 */
    execl("/bin/ls", "ls", NULL);
  } else if (child < 0) {
    printf("Fork failed.\n");
  } else {
    int status;
    while (waitpid(child, &status, 0) && !WIFEXITED(status)) {
      /* TODO: 전체 레지스터 값을 가져오기 */
      fprintf(stderr, "[SYSCALL]:%-20s\t%5lld\n", get_syscode(regs.orig_rax),
              regs.orig_rax);
      /* TODO: 매 시스템 콜 마다 실행을 중단하게끔 설정하기 */
    }
  }
  return 0;
}

const char *get_syscode(long code) {
  switch (code) {
    syscode_case(SYS_read);
    syscode_case(SYS_write);
    syscode_case(SYS_close);
    syscode_case(SYS_fstat);
    syscode_case(SYS_mmap);
    syscode_case(SYS_mprotect);
    syscode_case(SYS_munmap);
    syscode_case(SYS_brk);
    syscode_case(SYS_rt_sigaction);
    syscode_case(SYS_rt_sigprocmask);
    syscode_case(SYS_rt_sigreturn);
    syscode_case(SYS_ioctl);
    syscode_case(SYS_getpid);
    syscode_case(SYS_pread64);
    syscode_case(SYS_access);
    syscode_case(SYS_pipe);
    syscode_case(SYS_execve);
    syscode_case(SYS_getdents);
    syscode_case(SYS_statfs);
    syscode_case(SYS_exit_group);
    syscode_case(SYS_openat);
    syscode_case(SYS_mkdirat);
    syscode_case(SYS_prlimit64);
    syscode_case(SYS_arch_prctl);
    syscode_case(SYS_set_tid_address);
    syscode_case(SYS_set_robust_list);
  default:
    return "Not registered in the function list.";
  }
}
