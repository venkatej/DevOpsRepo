
#### top

  root@ip-172-31-36-138:~# top
  top - 02:40:22 up 6 min,  1 user,  load average: 0.08, 0.38, 0.24
  Tasks:  92 total,   1 running,  55 sleeping,   0 stopped,   0 zombie
  %Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
  KiB Mem :  1007540 total,   234920 free,   240748 used,   531872 buff/cache
  KiB Swap:        0 total,        0 free,        0 used.   603772 avail Mem

    PID USER      PR  NI    VIRT    RES    SHR S %CPU %MEM     TIME+ COMMAND
      1 root      20   0  225084   9036   6932 S  0.0  0.9   0:03.59 systemd
      2 root      20   0       0      0      0 S  0.0  0.0   0:00.00 kthreadd
      3 root      20   0       0      0      0 I  0.0  0.0   0:00.03 kworker/0:0
      4 root       0 -20       0      0      0 I  0.0  0.0   0:00.00 kworker/0:0H
      5 root      20   0       0      0      0 I  0.0  0.0   0:00.05 kworker/u30:0
      6 root       0 -20       0      0      0 I  0.0  0.0   0:00.00 mm_percpu_wq
      7 root      20   0       0      0      0 S  0.0  0.0   0:00.19 ksoftirqd/0
      8 root      20   0       0      0      0 I  0.0  0.0   0:00.61 rcu_sched
      9 root      20   0       0      0      0 I  0.0  0.0   0:00.00 rcu_bh
     10 root      rt   0       0      0      0 S  0.0  0.0   0:00.00 migration/0
     11 root      rt   0       0      0      0 S  0.0  0.0   0:00.00 watchdog/0
     12 root      20   0       0      0      0 S  0.0  0.0   0:00.00 cpuhp/0
     13 root      20   0       0      0      0 S  0.0  0.0   0:00.00 kdevtmpfs
     14 root       0 -20       0      0      0 I  0.0  0.0   0:00.00 netns
     15 root      20   0       0      0      0 S  0.0  0.0   0:00.00 rcu_tasks_kthre
     16 root      20   0       0      0      0 S  0.0  0.0   0:00.00 kauditd
     17 root      20   0       0      0      0 S  0.0  0.0   0:00.00 xenbus
     18 root      20   0       0      0      0 S  0.0  0.0   0:00.01 xenwatch
     20 root      20   0       0      0      0 S  0.0  0.0   0:00.00 khungtaskd
     21 root      20   0       0      0      0 S  0.0  0.0   0:00.00 oom_reaper
     22 root       0 -20       0      0      0 I  0.0  0.0   0:00.00 writeback
     23 root      20   0       0      0      0 S  0.0  0.0   0:00.00 kcompactd0
     24 root      25   5       0      0      0 S  0.0  0.0   0:00.00 ksmd
     25 root      39  19       0      0      0 S  0.0  0.0   0:00.00 khugepaged
     26 root       0 -20       0      0      0 I  0.0  0.0   0:00.00 crypto
     27 root       0 -20       0      0      0 I  0.0  0.0   0:00.00 kintegrityd
     28 root       0 -20       0      0      0 I  0.0  0.0   0:00.00 kblockd
     29 root       0 -20       0      0      0 I  0.0  0.0   0:00.00 ata_sff
     30 root       0 -20       0      0      0 I  0.0  0.0   0:00.00 md
     31 root       0 -20       0      0      0 I  0.0  0.0   0:00.00 edac-poller
     32 root       0 -20       0      0      0 I  0.0  0.0   0:00.00 devfreq_wq
     33 root       0 -20       0      0      0 I  0.0  0.0   0:00.00 watchdogd
     34 root      20   0       0      0      0 I  0.0  0.0   0:00.04 kworker/u30:1
     36 root      20   0       0      0      0 S  0.0  0.0   0:00.37 kswapd0
     37 root      20   0       0      0      0 S  0.0  0.0   0:00.00 ecryptfs-kthrea
     79 root       0 -20       0      0      0 I  0.0  0.0   0:00.00 kthrotld
     80 root       0 -20       0      0      0 I  0.0  0.0   0:00.00 nvme-wq
     81 root      20   0       0      0      0 S  0.0  0.0   0:00.00 scsi_eh_0
     82 root       0 -20       0      0      0 I  0.0  0.0   0:00.00 scsi_tmf_0


#### `apt-get install sysstat -y`

#### mpstat

    root@ip-172-31-36-138:~# mpstat
    Linux 4.15.0-1021-aws (ip-172-31-36-138)        12/18/18        _x86_64_        (1 CPU)

    02:40:48     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
    02:40:48     all   20.52    9.43    7.38    7.01    0.00    0.09    2.31    0.00    0.00   53.25


#### mpstat -P ALL

    root@ip-172-31-36-138:~# mpstat -P ALL
    Linux 4.15.0-1021-aws (ip-172-31-36-138)        12/18/18        _x86_64_        (1 CPU)

    02:41:15     CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
    02:41:15     all   19.30    8.87    6.94    6.60    0.00    0.09    2.17    0.00    0.00   56.03
    02:41:15       0   19.30    8.87    6.94    6.60    0.00    0.09    2.17    0.00    0.00   56.03


#### iostat

    root@ip-172-31-36-138:~# iostat
    Linux 4.15.0-1021-aws (ip-172-31-36-138)        12/18/18        _x86_64_        (1 CPU)

    avg-cpu:  %user   %nice %system %iowait  %steal   %idle
              17.88    8.20    6.59    6.18    2.01   59.14

    Device             tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
    loop0            19.70        21.82         0.00      10664          0
    loop1             6.68         7.33         0.00       3580          0
    loop2            24.87        26.99         0.00      13187          0
    loop3             7.13         7.78         0.00       3801          0
    xvda            153.24      1806.56      3924.49     882775    1917704
    
####  ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10

    root@ip-172-31-36-138:~# ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10
    %CPU   PID USER     COMMAND
     0.2   793 tomcat   /usr/lib/jvm/java-11-openjdk-amd64//bin/java -Djava.util.logging.config.file=/opt/tomcat/latest/conf/logging.properties -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager -Djava.security.egd=file:///dev/urandom -Djava.awt.headless=true -Djdk.tls.ephemeralDHKeySize=2048 -Djava.protocol.handler.pkgs=org.apache.catalina.webresources -Dorg.apache.catalina.security.SecurityListener.UMASK=0027 -Xms512M -Xmx1024M -server -XX:+UseParallelGC -Dignore.endorsed.dirs= -classpath /opt/tomcat/latest/bin/bootstrap.jar:/opt/tomcat/latest/bin/tomcat-juli.jar -Dcatalina.base=/opt/tomcat/latest -Dcatalina.home=/opt/tomcat/latest -Djava.io.tmpdir=/opt/tomcat/latest/temp org.apache.catalina.startup.Bootstrap start
     0.1     1 root     /lib/systemd/systemd --system --deserialize 38
     0.0 17762 root     head -10
     0.0 17761 root     sort -k 1 -r
     0.0 17760 root     ps -eo pcpu,pid,user,args
     0.0 17736 root     -bash
     0.0 17735 root     sudo -i
     0.0 17722 ubuntu   -bash
     0.0 17721 ubuntu   sshd: ubuntu@pts/0

#### iostat -xtc 5 3

#### `apt-get install htop`

  * htop
  
#### `apt-get install nmon`

  * nmon
