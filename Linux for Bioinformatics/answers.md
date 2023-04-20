Q1. What is your home directory?
A: /home/ec2-user
Q2. What is the output of this command?
A: hello_world.txt
Q3. What is the output of each ls command?
A: The output of ls for myfolder/ is empty.  The output of ls for myfolder2/ is hello_world.txt
Q4. What is the output of each?
A: The outputs of ls for myfolder/ and myfolder2/ are both empty.  The output of ls for myfolder3/ is hello_world.txt
Q5. What editor did you use and what was the command to save your file changes?
A: I used nano as my editor.  In order to save my file changes, I entered ^X to exit, then hit Y when prompted to decide whether to save my changes.
Q6. What is the error?
A: As reported on the terminal, the error is that the server is refusing my key.  More deeply, what has gone wrong is that I have created a user that requires a password for authentication, and am now trying to access that user without specifying its password.
Q7. What was the solution?
A: The solution was to run sudo vi /etc/ssh/sshd_config so as to edit the ssh configuration for the server.  Upon doing so, I set "PasswordAuthentication" to "yes".  This change causes the server to prompt for the user's password upon further attempts to ssh into sudouser.  In order for this new configuration to be adopted, I also reset the server using sudo service sshd restart.
Q8. what does the sudo docker run part of the command do? and what does the salmon swim part of the command do?
A: The sudo docker run part of the command creates a running container from the subsequently specified image with the security rights of root.  This container packages up the dependencies required by the image so as to ensure that its software can be executed within our environment.  The salmon swim part of the command specifies the image being containerized, salmon, and runs its swim command, which is said to "perform super-secret operation", which in the very least generates the featured visual.
Q9. What is the output of this command?
A: serveruser is not in the sudoers file.  This incident will be reported
Q10. What is the output of flask --version?
A: 
Python 3.10.10
Flask 2.2.2
Werkzeug 2.2.2
Q11. What is the output of mamba -V?
A: conda 23.1.0
Q12. What is the output of which python?
A: /home/serveruser/mambaforge/envs/py27/bin/python
Q13. What is the output of which python now?
A: /home/serveruser/mambaforge/bin/python
Q14. What is the output of salmon -h?
A:
salmon v1.4.0

Usage:  salmon -h|--help or
        salmon -v|--version or
        salmon -c|--cite or
        salmon [--no-version-check] <COMMAND> [-h | options]

Commands:
     index      : create a salmon index
     quant      : quantify a sample
     alevin     : single cell analysis
     swim       : perform super-secret operation
     quantmerge : merge multiple quantifications into a single file
Q15. What does the -o athal.fa.gz part of the command do?
A: The -o athal.fa.gz part of the command specfifies that the name of the file downloaded via curl within the directory to which it is downloaded will be athal.fa.gz.
Q16. What is a .gz file?
A: A gz file is an archive that has been compressed using Gnu Zip software.  It can be used to compress only one file; compression of several files would require another extension such as TAR.  gz files can be opened via GZip software that is native to the Linux operating system.
Q17. What does the zcat command do?
A: Like the more familiar cat command, the zcat command displays the contents of some given file on the terminal window.  However, its use is intended for compressed files such as those with a gz extension; it will expand and display the contents of a compressed file without requiring that file to be uncompressed.
Q18. what does the head command do?
A: By default, the head command will print the first 10 lines of a specified input stream.  However, with the -n flag, we can specify some first n lines for head to print.
Q19. what does the number 100 signify in the command?
A: The number 100 signifies that in this case, head will be used to print the first 100 lines of the specified input stream.
Q20. What is | doing? -- Hint using | in Linux is called "piping"
A: | is  inputting the output of the command on its lefthand side to the command on its righthand side.  In this case, it directs the expanded contents of athal.fa.gz output by zcat to head such that only the first 100 lines of those contents will be printed.
Q21. What is a .fa file? What is this file format used for?
A: A .fa file is a file within the FASTA format.  This format is specialized for handling sequences of information like DNA; it uses a > symbol to delimit each sequence, followed by a unique identifier for that sequence.  In some cases like athal.fa.gz, auxiliary information like descriptions can then be added prior to the sequence itself.
Q22. What format are the downloaded sequencing reads in?
A: .sra
Q23. What is the total size of the disk?
A: 7.6G
Q24. How much space is remaining on the disk?
A: 2.6G
Q25. What went wrong?
A: The disk ran out of space.  As reported in the error: "storage exhuasted while writing file within file system module"
Q26: What was your solution?
A: My solution was to add the --gzip flag to the fastq-dump command.  Given that compressed files occupy less space than uncompressed files, this enabled conversion to the fastq format without exceeding the disk storage.
