#!/bin/bash

#Questions:
# chattr - example of usage ?
#(ACLs) - Access Control List
# ps


# Part1
# 1. How many states could has a process in Linux?
## Type of process
### Foreground process - interactive proc. Control through a terminal sessions
### Background process - non interactive. Automatic process. Example - part of system

# # Type of states
### -created
### -ready
### -waiting
### -running
### -terminated


# 2. Examine the pstree command. Make output (highlight) the chain (ancestors) of the current
# process.
# more https://www.howtoforge.com/linux-pstree-command/?__cf_chl_captcha_tk__=pmd_kcZtIO34SkCWcB4qgi9AG9Ykfo.CELCnX8bZtMe0Lmc-1632395539-0-gqNtZGzNArujcnBszQi9

pstree
pstree -h $PID
pstree -H $PID

# 3. What is a proc file system?
## It's interface between Linux Kernel and user
## in proc we can get any information about Linux Kernel
# more https://losst.ru/fajlovaya-sistema-proc-v-linux
cat /proc/$innerfolder_or_file


# 4. Print information about the processor (its type, supported technologies, etc.).
cat /proc/cpuinfo


# 5. Use the ps command to get information about the process. The information should be as
# follows: the owner of the process, the arguments with which the process was launched for
# execution, the group owner of this process, etc.
ps aux
ps aux | grep $app_name


# 6. How to define kernel processes and user processes?
## more https://andreyex.ru/operacionnaya-sistema-linux/komanda-ps-v-linux/
## https://www.cyberciti.biz/faq/show-all-running-processes-in-linux/
ps aux | head
# aux
## a = show processes for all users
## u = display the process's user/owner
## x = also show processes not attached to a terminal



# 7. Print the list of processes to the terminal. 
# Briefly describe the statuses of the processes.
# more http://www.opennet.ru/docs/RUS/lnx_process/
top
htop
## S - STAT - Status
### R - процесс выполняется или готов к выполнению (состояние готовности)
### D - процесс в "беспробудном сне" - ожидает дискового ввода/вывода
### T - процесс остановлен (stopped) или трассируется отладчиком
### S - процесс в состоянии ожидания (sleeping)
### Z - процесс-зобми
### < - процесс с отрицательным значением nice
### N - процесс с положительным значением nice (о команде nice мы поговорим позже)


# 8. Display only the processes of a specific user.
top | grep $username
## top filterind
top # then Shift+U then enter username 

# 9. What utilities can be used to analyze existing running tasks 
#(by analyzing the help for the ps command)?
man ps
ps | grep $some_app


# 10. What information does top command display?
# more https://www.maketecheasier.com/linux-top-explained/


## PID - process ID
## User - username
## PRI - priority
## NI - nice value -20 < x < 19
## VIRT - virtual memory size 
## RES - resident memory size
## SHARE - shared memory size
## STAT - status of process
## %CPU - cpu time used by the process sinse last update
## %MEM - physical memory used
## TIME - total CPU time used by the task in 100 of a second
## COMMAND - command name / command line


# 12. Display the processes of the specific user using the top command.
# 12. What interactive commands can be used to control the top command? Give a couple of
# examples.
# 13. Sort the contents of the processes window using various parameters (for example, the
# amount of processor time taken up, etc.)
# 14. Concept of priority, what commands are used to set priority?
# 15. Can I change the priority of a process using the top command? If so, how?
# 16. Examine the kill command. How to send with the kill command
# process control signal? Give an example of commonly used signals.
# 17. Commands jobs, fg, bg, nohup. What are they for? Use the sleep, yes command to
# demonstrate the process control mechanism with fg, bg.

# Part2
# 1. Check the implementability of the most frequently used OPENSSH commands in the MS
# Windows operating system. (Description of the expected result of the commands +
# screenshots: command – result should be presented)
# 2. Implement basic SSH settings to increase the security of the client-server connection (at least
# 3. List the options for choosing keys for encryption in SSH. Implement 3 of them.
# 4. Implement port forwarding for the SSH client from the host machine to the guest Linux
# virtual machine behind NAT.
# 5*. Intercept (capture) traffic (tcpdump, wireshark) while authorizing the remote client on the
# server using ssh, telnet, rlogin. Analyze the result.