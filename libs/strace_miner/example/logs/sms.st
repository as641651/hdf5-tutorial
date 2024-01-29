64743 13:32:58.743966 (+     0.000000) execve("/bin/ls", ["ls"], 0x7fff45f7fb28 /* 52 vars */) = 0 <0.000206>
64743 13:32:58.744546 (+     0.000535) brk(NULL) = 0x55cb1e264000 <0.000165>
64743 13:32:58.744957 (+     0.000401) access("/etc/ld.so.preload", R_OK) = -1 ENOENT (No such file or directory) <0.000109>
64743 13:32:58.745221 (+     0.000261) openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3</etc/ld.so.cache> <0.000093>
64743 13:32:58.745577 (+     0.000357) fstat(3</etc/ld.so.cache>, {st_mode=S_IFREG|0644, st_size=39386, ...}) = 0 <0.000053>
64743 13:32:58.745812 (+     0.000232) mmap(NULL, 39386, PROT_READ, MAP_PRIVATE, 3</etc/ld.so.cache>, 0) = 0x7f7b481c7000 <0.000135>
64743 13:32:58.746055 (+     0.000249) close(3</etc/ld.so.cache>) = 0 <0.000102>
64743 13:32:58.746304 (+     0.000245) openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libselinux.so.1", O_RDONLY|O_CLOEXEC) = 3</lib/x86_64-linux-gnu/libselinux.so.1> <0.000035>
64743 13:32:58.746414 (+     0.000106) read(3</lib/x86_64-linux-gnu/libselinux.so.1>, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\220}\0\0\0\0\0\0"..., 832) = 832 <0.000032>
64743 13:32:58.746549 (+     0.000135) fstat(3</lib/x86_64-linux-gnu/libselinux.so.1>, {st_mode=S_IFREG|0644, st_size=166120, ...}) = 0 <0.000032>
64743 13:32:58.746663 (+     0.000115) mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f7b481c5000 <0.000037>
64743 13:32:58.746899 (+     0.000233) mmap(NULL, 177672, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3</lib/x86_64-linux-gnu/libselinux.so.1>, 0) = 0x7f7b48199000 <0.000049>
64743 13:32:58.747099 (+     0.000201) mmap(0x7f7b481a0000, 102400, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3</lib/x86_64-linux-gnu/libselinux.so.1>, 0x7000) = 0x7f7b481a0000 <0.000062>
64743 13:32:58.747232 (+     0.000131) mmap(0x7f7b481b9000, 32768, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3</lib/x86_64-linux-gnu/libselinux.so.1>, 0x20000) = 0x7f7b481b9000 <0.000059>
64743 13:32:58.747346 (+     0.000113) mmap(0x7f7b481c1000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3</lib/x86_64-linux-gnu/libselinux.so.1>, 0x27000) = 0x7f7b481c1000 <0.000102>
64743 13:32:58.747520 (+     0.000178) mmap(0x7f7b481c3000, 5640, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f7b481c3000 <0.000086>
64743 13:32:58.747751 (+     0.000229) close(3</lib/x86_64-linux-gnu/libselinux.so.1>) = 0 <0.000121>
64743 13:32:58.748006 (+     0.000260) openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC) = 3</lib/x86_64-linux-gnu/libc-2.31.so> <0.000060>
64743 13:32:58.748193 (+     0.000182) read(3</lib/x86_64-linux-gnu/libc-2.31.so>, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0@>\2\0\0\0\0\0"..., 832) = 832 <0.000053>
64743 13:32:58.748346 (+     0.000150) fstat(3</lib/x86_64-linux-gnu/libc-2.31.so>, {st_mode=S_IFREG|0755, st_size=1901536, ...}) = 0 <0.000091>
64743 13:32:58.748504 (+     0.000157) mmap(NULL, 1914496, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3</lib/x86_64-linux-gnu/libc-2.31.so>, 0) = 0x7f7b47fc5000 <0.000057>
64743 13:32:58.748621 (+     0.000116) mmap(0x7f7b47fe7000, 1413120, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3</lib/x86_64-linux-gnu/libc-2.31.so>, 0x22000) = 0x7f7b47fe7000 <0.000060>
64743 13:32:58.748739 (+     0.000116) mmap(0x7f7b48140000, 323584, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3</lib/x86_64-linux-gnu/libc-2.31.so>, 0x17b000) = 0x7f7b48140000 <0.000121>
64743 13:32:58.748944 (+     0.000211) mmap(0x7f7b4818f000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3</lib/x86_64-linux-gnu/libc-2.31.so>, 0x1c9000) = 0x7f7b4818f000 <0.000118>
64743 13:32:58.749187 (+     0.000241) mmap(0x7f7b48195000, 13952, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f7b48195000 <0.000053>
64743 13:32:58.749338 (+     0.000146) close(3</lib/x86_64-linux-gnu/libc-2.31.so>) = 0 <0.000032>
64743 13:32:58.749446 (+     0.000107) openat(AT_FDCWD, "/usr/lib/x86_64-linux-gnu/libpcre2-8.so.0", O_RDONLY|O_CLOEXEC) = 3</usr/lib/x86_64-linux-gnu/libpcre2-8.so.0.10.1> <0.000039>
64743 13:32:58.749560 (+     0.000114) read(3</usr/lib/x86_64-linux-gnu/libpcre2-8.so.0.10.1>, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\200\"\0\0\0\0\0\0"..., 832) = 832 <0.000094>
64743 13:32:58.749714 (+     0.000155) fstat(3</usr/lib/x86_64-linux-gnu/libpcre2-8.so.0.10.1>, {st_mode=S_IFREG|0644, st_size=617128, ...}) = 0 <0.000053>
64743 13:32:58.749832 (+     0.000117) mmap(NULL, 619432, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3</usr/lib/x86_64-linux-gnu/libpcre2-8.so.0.10.1>, 0) = 0x7f7b47f2d000 <0.000053>
64743 13:32:58.749943 (+     0.000109) mmap(0x7f7b47f2f000, 438272, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3</usr/lib/x86_64-linux-gnu/libpcre2-8.so.0.10.1>, 0x2000) = 0x7f7b47f2f000 <0.000056>
64743 13:32:58.750055 (+     0.000112) mmap(0x7f7b47f9a000, 167936, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3</usr/lib/x86_64-linux-gnu/libpcre2-8.so.0.10.1>, 0x6d000) = 0x7f7b47f9a000 <0.000054>
64743 13:32:58.750165 (+     0.000109) mmap(0x7f7b47fc3000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3</usr/lib/x86_64-linux-gnu/libpcre2-8.so.0.10.1>, 0x95000) = 0x7f7b47fc3000 <0.000053>
64743 13:32:58.750279 (+     0.000114) close(3</usr/lib/x86_64-linux-gnu/libpcre2-8.so.0.10.1>) = 0 <0.000030>
64743 13:32:58.750364 (+     0.000084) openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libdl.so.2", O_RDONLY|O_CLOEXEC) = 3</lib/x86_64-linux-gnu/libdl-2.31.so> <0.000034>
64743 13:32:58.750472 (+     0.000107) read(3</lib/x86_64-linux-gnu/libdl-2.31.so>, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0000\21\0\0\0\0\0\0"..., 832) = 832 <0.000033>
64743 13:32:58.750577 (+     0.000105) fstat(3</lib/x86_64-linux-gnu/libdl-2.31.so>, {st_mode=S_IFREG|0644, st_size=18688, ...}) = 0 <0.000032>
64743 13:32:58.750685 (+     0.000107) mmap(NULL, 20752, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3</lib/x86_64-linux-gnu/libdl-2.31.so>, 0) = 0x7f7b47f27000 <0.000035>
64743 13:32:58.750790 (+     0.000104) mmap(0x7f7b47f28000, 8192, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3</lib/x86_64-linux-gnu/libdl-2.31.so>, 0x1000) = 0x7f7b47f28000 <0.000038>
64743 13:32:58.750898 (+     0.000108) mmap(0x7f7b47f2a000, 4096, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3</lib/x86_64-linux-gnu/libdl-2.31.so>, 0x3000) = 0x7f7b47f2a000 <0.000034>
64743 13:32:58.751003 (+     0.000104) mmap(0x7f7b47f2b000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3</lib/x86_64-linux-gnu/libdl-2.31.so>, 0x3000) = 0x7f7b47f2b000 <0.000033>
64743 13:32:58.751118 (+     0.000114) close(3</lib/x86_64-linux-gnu/libdl-2.31.so>) = 0 <0.000031>
64743 13:32:58.751226 (+     0.000108) openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libpthread.so.0", O_RDONLY|O_CLOEXEC) = 3</lib/x86_64-linux-gnu/libpthread-2.31.so> <0.000034>
64743 13:32:58.751332 (+     0.000105) read(3</lib/x86_64-linux-gnu/libpthread-2.31.so>, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0 l\0\0\0\0\0\0"..., 832) = 832 <0.000032>
64743 13:32:58.751438 (+     0.000105) fstat(3</lib/x86_64-linux-gnu/libpthread-2.31.so>, {st_mode=S_IFREG|0755, st_size=149520, ...}) = 0 <0.000032>
64743 13:32:58.751566 (+     0.000136) mmap(NULL, 136304, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3</lib/x86_64-linux-gnu/libpthread-2.31.so>, 0) = 0x7f7b47f05000 <0.000163>
64743 13:32:58.751880 (+     0.000317) mmap(0x7f7b47f0b000, 65536, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3</lib/x86_64-linux-gnu/libpthread-2.31.so>, 0x6000) = 0x7f7b47f0b000 <0.000090>
64743 13:32:58.752205 (+     0.000319) mmap(0x7f7b47f1b000, 24576, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3</lib/x86_64-linux-gnu/libpthread-2.31.so>, 0x16000) = 0x7f7b47f1b000 <0.000183>
64743 13:32:58.752507 (+     0.000301) mmap(0x7f7b47f21000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3</lib/x86_64-linux-gnu/libpthread-2.31.so>, 0x1b000) = 0x7f7b47f21000 <0.000135>
64743 13:32:58.752864 (+     0.000357) mmap(0x7f7b47f23000, 13424, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f7b47f23000 <0.000055>
64743 13:32:58.753011 (+     0.000144) close(3</lib/x86_64-linux-gnu/libpthread-2.31.so>) = 0 <0.000122>
64743 13:32:58.753306 (+     0.000295) mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f7b47f03000 <0.000056>
64743 13:32:58.753450 (+     0.000140) arch_prctl(ARCH_SET_FS, 0x7f7b47f04400) = 0 <0.000204>
64743 13:32:58.753878 (+     0.000432) mprotect(0x7f7b4818f000, 16384, PROT_READ) = 0 <0.000044>
64743 13:32:58.754088 (+     0.000217) mprotect(0x7f7b47f21000, 4096, PROT_READ) = 0 <0.000065>
64743 13:32:58.754317 (+     0.000219) mprotect(0x7f7b47f2b000, 4096, PROT_READ) = 0 <0.000217>
64743 13:32:58.754615 (+     0.000296) mprotect(0x7f7b47fc3000, 4096, PROT_READ) = 0 <0.000048>
64743 13:32:58.754810 (+     0.000205) mprotect(0x7f7b481c1000, 4096, PROT_READ) = 0 <0.000079>
64743 13:32:58.755135 (+     0.000316) mprotect(0x55cb1d700000, 4096, PROT_READ) = 0 <0.000106>
64743 13:32:58.755316 (+     0.000178) mprotect(0x7f7b481fb000, 4096, PROT_READ) = 0 <0.000124>
64743 13:32:58.755495 (+     0.000177) munmap(0x7f7b481c7000, 39386) = 0 <0.000073>
64743 13:32:58.755627 (+     0.000131) set_tid_address(0x7f7b47f046d0) = 64743 <0.000031>
64743 13:32:58.755732 (+     0.000105) set_robust_list(0x7f7b47f046e0, 24) = 0 <0.000032>
64743 13:32:58.755843 (+     0.000111) rt_sigaction(SIGRTMIN, {sa_handler=0x7f7b47f0b690, sa_mask=[], sa_flags=SA_RESTORER|SA_SIGINFO, sa_restorer=0x7f7b47f18140}, NULL, 8) = 0 <0.000032>
64743 13:32:58.755963 (+     0.000119) rt_sigaction(SIGRT_1, {sa_handler=0x7f7b47f0b730, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART|SA_SIGINFO, sa_restorer=0x7f7b47f18140}, NULL, 8) = 0 <0.000032>
64743 13:32:58.756069 (+     0.000106) rt_sigprocmask(SIG_UNBLOCK, [RTMIN RT_1], NULL, 8) = 0 <0.000032>
64743 13:32:58.756185 (+     0.000115) prlimit64(0, RLIMIT_STACK, NULL, {rlim_cur=8192*1024, rlim_max=RLIM64_INFINITY}) = 0 <0.000033>
64743 13:32:58.756419 (+     0.000240) statfs("/sys/fs/selinux", 0x7ffd67d38230) = -1 ENOENT (No such file or directory) <0.000042>
64743 13:32:58.756561 (+     0.000136) statfs("/selinux", 0x7ffd67d38230) = -1 ENOENT (No such file or directory) <0.000035>
64743 13:32:58.756712 (+     0.000152) brk(NULL) = 0x55cb1e264000 <0.000032>
64743 13:32:58.756821 (+     0.000106) brk(0x55cb1e285000) = 0x55cb1e285000 <0.000039>
64743 13:32:58.756943 (+     0.000126) openat(AT_FDCWD, "/proc/filesystems", O_RDONLY|O_CLOEXEC) = 3</proc/filesystems> <0.000065>
64743 13:32:58.757107 (+     0.000161) fstat(3</proc/filesystems>, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0 <0.000057>
64743 13:32:58.757238 (+     0.000128) read(3</proc/filesystems>, "nodev\tsysfs\nnodev\ttmpfs\nnodev\tbd"..., 1024) = 478 <0.000068>
64743 13:32:58.757373 (+     0.000135) read(3</proc/filesystems>, "", 1024) = 0 <0.000031>
64743 13:32:58.757445 (+     0.000071) close(3</proc/filesystems>) = 0 <0.000033>
64743 13:32:58.757521 (+     0.000075) access("/etc/selinux/config", F_OK) = -1 ENOENT (No such file or directory) <0.000043>
64743 13:32:58.757641 (+     0.000120) openat(AT_FDCWD, "/usr/lib/locale/locale-archive", O_RDONLY|O_CLOEXEC) = 3</usr/lib/locale/locale-archive> <0.000058>
64743 13:32:58.757783 (+     0.000141) fstat(3</usr/lib/locale/locale-archive>, {st_mode=S_IFREG|0644, st_size=3041456, ...}) = 0 <0.000034>
64743 13:32:58.757952 (+     0.000169) mmap(NULL, 3041456, PROT_READ, MAP_PRIVATE, 3</usr/lib/locale/locale-archive>, 0) = 0x7f7b47c1c000 <0.000063>
64743 13:32:58.758083 (+     0.000130) close(3</usr/lib/locale/locale-archive>) = 0 <0.000032>
64743 13:32:58.758158 (+     0.000074) openat(AT_FDCWD, "/usr/share/locale/locale.alias", O_RDONLY|O_CLOEXEC) = 3</etc/locale.alias> <0.000038>
64743 13:32:58.758375 (+     0.000226) fstat(3</etc/locale.alias>, {st_mode=S_IFREG|0644, st_size=2996, ...}) = 0 <0.000055>
64743 13:32:58.758545 (+     0.000162) read(3</etc/locale.alias>, "# Locale name alias data base.\n#"..., 4096) = 2996 <0.000033>
64743 13:32:58.758644 (+     0.000097) read(3</etc/locale.alias>, "", 4096) = 0 <0.000031>
64743 13:32:58.758727 (+     0.000083) close(3</etc/locale.alias>) = 0 <0.000031>
64743 13:32:58.758827 (+     0.000099) openat(AT_FDCWD, "/usr/lib/locale/C.UTF-8/LC_IDENTIFICATION", O_RDONLY|O_CLOEXEC) = 3</usr/lib/locale/C.UTF-8/LC_IDENTIFICATION> <0.000036>
64743 13:32:58.758916 (+     0.000089) fstat(3</usr/lib/locale/C.UTF-8/LC_IDENTIFICATION>, {st_mode=S_IFREG|0644, st_size=252, ...}) = 0 <0.000031>
64743 13:32:58.758989 (+     0.000073) mmap(NULL, 252, PROT_READ, MAP_PRIVATE, 3</usr/lib/locale/C.UTF-8/LC_IDENTIFICATION>, 0) = 0x7f7b481fa000 <0.000035>
64743 13:32:58.759065 (+     0.000076) close(3</usr/lib/locale/C.UTF-8/LC_IDENTIFICATION>) = 0 <0.000031>
64743 13:32:58.759141 (+     0.000075) openat(AT_FDCWD, "/usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache", O_RDONLY) = 3</usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache> <0.000035>
64743 13:32:58.759230 (+     0.000089) fstat(3</usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache>, {st_mode=S_IFREG|0644, st_size=27002, ...}) = 0 <0.000031>
64743 13:32:58.759303 (+     0.000073) mmap(NULL, 27002, PROT_READ, MAP_SHARED, 3</usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache>, 0) = 0x7f7b481ca000 <0.000032>
64743 13:32:58.759377 (+     0.000073) close(3</usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache>) = 0 <0.000031>
64743 13:32:58.759451 (+     0.000074) futex(0x7f7b4819499c, FUTEX_WAKE_PRIVATE, 2147483647) = 0 <0.000030>
64743 13:32:58.759536 (+     0.000085) openat(AT_FDCWD, "/usr/lib/locale/C.UTF-8/LC_MEASUREMENT", O_RDONLY|O_CLOEXEC) = 3</usr/lib/locale/C.UTF-8/LC_MEASUREMENT> <0.000032>
64743 13:32:58.759621 (+     0.000084) fstat(3</usr/lib/locale/C.UTF-8/LC_MEASUREMENT>, {st_mode=S_IFREG|0644, st_size=23, ...}) = 0 <0.000030>
64743 13:32:58.759694 (+     0.000072) mmap(NULL, 23, PROT_READ, MAP_PRIVATE, 3</usr/lib/locale/C.UTF-8/LC_MEASUREMENT>, 0) = 0x7f7b481c9000 <0.000031>
64743 13:32:58.759766 (+     0.000072) close(3</usr/lib/locale/C.UTF-8/LC_MEASUREMENT>) = 0 <0.000030>
64743 13:32:58.759839 (+     0.000073) openat(AT_FDCWD, "/usr/lib/locale/C.UTF-8/LC_TELEPHONE", O_RDONLY|O_CLOEXEC) = 3</usr/lib/locale/C.UTF-8/LC_TELEPHONE> <0.000032>
64743 13:32:58.759923 (+     0.000083) fstat(3</usr/lib/locale/C.UTF-8/LC_TELEPHONE>, {st_mode=S_IFREG|0644, st_size=47, ...}) = 0 <0.000031>
64743 13:32:58.759995 (+     0.000072) mmap(NULL, 47, PROT_READ, MAP_PRIVATE, 3</usr/lib/locale/C.UTF-8/LC_TELEPHONE>, 0) = 0x7f7b481c8000 <0.000032>
64743 13:32:58.760069 (+     0.000073) close(3</usr/lib/locale/C.UTF-8/LC_TELEPHONE>) = 0 <0.000030>
64743 13:32:58.760141 (+     0.000072) openat(AT_FDCWD, "/usr/lib/locale/C.UTF-8/LC_ADDRESS", O_RDONLY|O_CLOEXEC) = 3</usr/lib/locale/C.UTF-8/LC_ADDRESS> <0.000032>
64743 13:32:58.760226 (+     0.000084) fstat(3</usr/lib/locale/C.UTF-8/LC_ADDRESS>, {st_mode=S_IFREG|0644, st_size=131, ...}) = 0 <0.000031>
64743 13:32:58.760298 (+     0.000072) mmap(NULL, 131, PROT_READ, MAP_PRIVATE, 3</usr/lib/locale/C.UTF-8/LC_ADDRESS>, 0) = 0x7f7b481c7000 <0.000031>
64743 13:32:58.760381 (+     0.000082) close(3</usr/lib/locale/C.UTF-8/LC_ADDRESS>) = 0 <0.000030>
64743 13:32:58.760454 (+     0.000073) openat(AT_FDCWD, "/usr/lib/locale/C.UTF-8/LC_NAME", O_RDONLY|O_CLOEXEC) = 3</usr/lib/locale/C.UTF-8/LC_NAME> <0.000033>
64743 13:32:58.760529 (+     0.000075) fstat(3</usr/lib/locale/C.UTF-8/LC_NAME>, {st_mode=S_IFREG|0644, st_size=62, ...}) = 0 <0.000030>
64743 13:32:58.760602 (+     0.000072) mmap(NULL, 62, PROT_READ, MAP_PRIVATE, 3</usr/lib/locale/C.UTF-8/LC_NAME>, 0) = 0x7f7b47c1b000 <0.000032>
64743 13:32:58.760674 (+     0.000072) close(3</usr/lib/locale/C.UTF-8/LC_NAME>) = 0 <0.000030>
64743 13:32:58.760757 (+     0.000083) openat(AT_FDCWD, "/usr/lib/locale/C.UTF-8/LC_PAPER", O_RDONLY|O_CLOEXEC) = 3</usr/lib/locale/C.UTF-8/LC_PAPER> <0.000033>
64743 13:32:58.760831 (+     0.000074) fstat(3</usr/lib/locale/C.UTF-8/LC_PAPER>, {st_mode=S_IFREG|0644, st_size=34, ...}) = 0 <0.000030>
64743 13:32:58.760914 (+     0.000082) mmap(NULL, 34, PROT_READ, MAP_PRIVATE, 3</usr/lib/locale/C.UTF-8/LC_PAPER>, 0) = 0x7f7b47c1a000 <0.000031>
64743 13:32:58.760986 (+     0.000072) close(3</usr/lib/locale/C.UTF-8/LC_PAPER>) = 0 <0.000030>
64743 13:32:58.761062 (+     0.000075) openat(AT_FDCWD, "/usr/lib/locale/C.UTF-8/LC_MESSAGES", O_RDONLY|O_CLOEXEC) = 3</usr/lib/locale/C.UTF-8/LC_MESSAGES> <0.000033>
64743 13:32:58.761147 (+     0.000085) fstat(3</usr/lib/locale/C.UTF-8/LC_MESSAGES>, {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0 <0.000031>
64743 13:32:58.761220 (+     0.000072) close(3</usr/lib/locale/C.UTF-8/LC_MESSAGES>) = 0 <0.000031>
64743 13:32:58.761292 (+     0.000071) openat(AT_FDCWD, "/usr/lib/locale/C.UTF-8/LC_MESSAGES/SYS_LC_MESSAGES", O_RDONLY|O_CLOEXEC) = 3</usr/lib/locale/C.UTF-8/LC_MESSAGES/SYS_LC_MESSAGES> <0.000032>
64743 13:32:58.761376 (+     0.000084) fstat(3</usr/lib/locale/C.UTF-8/LC_MESSAGES/SYS_LC_MESSAGES>, {st_mode=S_IFREG|0644, st_size=48, ...}) = 0 <0.000031>
64743 13:32:58.761469 (+     0.000093) mmap(NULL, 48, PROT_READ, MAP_PRIVATE, 3</usr/lib/locale/C.UTF-8/LC_MESSAGES/SYS_LC_MESSAGES>, 0) = 0x7f7b47c19000 <0.000034>
64743 13:32:58.761568 (+     0.000099) close(3</usr/lib/locale/C.UTF-8/LC_MESSAGES/SYS_LC_MESSAGES>) = 0 <0.000035>
64743 13:32:58.761663 (+     0.000094) openat(AT_FDCWD, "/usr/lib/locale/C.UTF-8/LC_MONETARY", O_RDONLY|O_CLOEXEC) = 3</usr/lib/locale/C.UTF-8/LC_MONETARY> <0.000032>
64743 13:32:58.761740 (+     0.000076) fstat(3</usr/lib/locale/C.UTF-8/LC_MONETARY>, {st_mode=S_IFREG|0644, st_size=270, ...}) = 0 <0.000030>
64743 13:32:58.761813 (+     0.000072) mmap(NULL, 270, PROT_READ, MAP_PRIVATE, 3</usr/lib/locale/C.UTF-8/LC_MONETARY>, 0) = 0x7f7b47c18000 <0.000031>
64743 13:32:58.761884 (+     0.000071) close(3</usr/lib/locale/C.UTF-8/LC_MONETARY>) = 0 <0.000030>
64743 13:32:58.761967 (+     0.000082) openat(AT_FDCWD, "/usr/lib/locale/C.UTF-8/LC_COLLATE", O_RDONLY|O_CLOEXEC) = 3</usr/lib/locale/C.UTF-8/LC_COLLATE> <0.000032>
64743 13:32:58.762041 (+     0.000073) fstat(3</usr/lib/locale/C.UTF-8/LC_COLLATE>, {st_mode=S_IFREG|0644, st_size=1519554, ...}) = 0 <0.000030>
64743 13:32:58.762122 (+     0.000081) mmap(NULL, 1519554, PROT_READ, MAP_PRIVATE, 3</usr/lib/locale/C.UTF-8/LC_COLLATE>, 0) = 0x7f7b47aa5000 <0.000031>
64743 13:32:58.762193 (+     0.000071) close(3</usr/lib/locale/C.UTF-8/LC_COLLATE>) = 0 <0.000029>
64743 13:32:58.762286 (+     0.000092) openat(AT_FDCWD, "/usr/lib/locale/C.UTF-8/LC_TIME", O_RDONLY|O_CLOEXEC) = 3</usr/lib/locale/C.UTF-8/LC_TIME> <0.000031>
64743 13:32:58.762370 (+     0.000083) fstat(3</usr/lib/locale/C.UTF-8/LC_TIME>, {st_mode=S_IFREG|0644, st_size=3360, ...}) = 0 <0.000030>
64743 13:32:58.762442 (+     0.000071) mmap(NULL, 3360, PROT_READ, MAP_PRIVATE, 3</usr/lib/locale/C.UTF-8/LC_TIME>, 0) = 0x7f7b47aa4000 <0.000031>
64743 13:32:58.762513 (+     0.000071) close(3</usr/lib/locale/C.UTF-8/LC_TIME>) = 0 <0.000029>
64743 13:32:58.762595 (+     0.000082) openat(AT_FDCWD, "/usr/lib/locale/C.UTF-8/LC_NUMERIC", O_RDONLY|O_CLOEXEC) = 3</usr/lib/locale/C.UTF-8/LC_NUMERIC> <0.000032>
64743 13:32:58.762669 (+     0.000073) fstat(3</usr/lib/locale/C.UTF-8/LC_NUMERIC>, {st_mode=S_IFREG|0644, st_size=50, ...}) = 0 <0.000030>
64743 13:32:58.762740 (+     0.000071) mmap(NULL, 50, PROT_READ, MAP_PRIVATE, 3</usr/lib/locale/C.UTF-8/LC_NUMERIC>, 0) = 0x7f7b47aa3000 <0.000030>
64743 13:32:58.762811 (+     0.000070) close(3</usr/lib/locale/C.UTF-8/LC_NUMERIC>) = 0 <0.000029>
64743 13:32:58.762882 (+     0.000071) openat(AT_FDCWD, "/usr/lib/locale/C.UTF-8/LC_CTYPE", O_RDONLY|O_CLOEXEC) = 3</usr/lib/locale/C.UTF-8/LC_CTYPE> <0.000031>
64743 13:32:58.762965 (+     0.000082) fstat(3</usr/lib/locale/C.UTF-8/LC_CTYPE>, {st_mode=S_IFREG|0644, st_size=346132, ...}) = 0 <0.000030>
64743 13:32:58.763036 (+     0.000071) mmap(NULL, 346132, PROT_READ, MAP_PRIVATE, 3</usr/lib/locale/C.UTF-8/LC_CTYPE>, 0) = 0x7f7b47a4e000 <0.000030>
64743 13:32:58.763117 (+     0.000080) close(3</usr/lib/locale/C.UTF-8/LC_CTYPE>) = 0 <0.000030>
64743 13:32:58.763198 (+     0.000081) ioctl(1</dev/pts/0>, TCGETS, {B38400 opost isig icanon echo ...}) = 0 <0.000033>
64743 13:32:58.763339 (+     0.000141) ioctl(1</dev/pts/0>, TIOCGWINSZ, {ws_row=18, ws_col=217, ws_xpixel=0, ws_ypixel=0}) = 0 <0.000030>
64743 13:32:58.763421 (+     0.000081) openat(AT_FDCWD, ".", O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 3</workspaces/hdf5-tutorial/libs/strace_miner/example> <0.000031>
64743 13:32:58.763507 (+     0.000086) fstat(3</workspaces/hdf5-tutorial/libs/strace_miner/example>, {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0 <0.000092>
64743 13:32:58.763679 (+     0.000173) getdents64(3</workspaces/hdf5-tutorial/libs/strace_miner/example>, 0x55cb1e26cf60 /* 7 entries */, 32768) = 200 <0.000044>
64743 13:32:58.763822 (+     0.000141) getdents64(3</workspaces/hdf5-tutorial/libs/strace_miner/example>, 0x55cb1e26cf60 /* 0 entries */, 32768) = 0 <0.000030>
64743 13:32:58.763895 (+     0.000072) close(3</workspaces/hdf5-tutorial/libs/strace_miner/example>) = 0 <0.000031>
64743 13:32:58.763978 (+     0.000083) fstat(1</dev/pts/0>, {st_mode=S_IFCHR|0620, st_rdev=makedev(0x88, 0), ...}) = 0 <0.000030>
64743 13:32:58.764084 (+     0.000106) write(1</dev/pts/0>, "graph  logs  smp.sh  sms.sh  tes"..., 42) = 42 <0.000227>
64743 13:32:58.764410 (+     0.000326) close(1</dev/pts/0>) = 0 <0.000030>
64743 13:32:58.764493 (+     0.000082) close(2</dev/pts/0>) = 0 <0.000030>
64743 13:32:58.764580 (+     0.000087) exit_group(0) = ?
64743 13:32:58.764792 (+     0.000211) +++ exited with 0 +++
