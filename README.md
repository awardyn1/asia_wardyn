Step by Step workflow for RepEnrich Analysis for Dummies
based on original protocol by Steven Criscione:
https://github.com/nskvir/RepEnrich


# RepEnrich analysis on B cell lymphoma RNA-Seq
RepEnrich analysis on paired end RNA-Seq data


*****************************************
Step by step tutorial for dummies that have no idea how to make their way into operating shell environment and R studio console

Step 1: Setting up Working in the Shell Console- Putty

Before starting you should ask any kind bioinformatician that is wiling to help you to share some space on your institution's server with you. The kind altruist should also make sure you will not do any damage to the folders situated outside of your own:)
I personally used Fila Zilla to download the raw RNA-seq files into the server. It should be linked to the server you operate in (if unsure how to do it, where to get the IP address just ask the altruist bioinformatician that set you up in the first place). In File Zilla, go to the icon on the left top corner (Open the Site Manager), here you can link to the correct server number and port number, set up your username and passord and make sure you are using the correct protocol for entry: SFTP: SSH File Transfer Protocol. Thats all you really need. These parameters should be saved up for your next log on. It will allow you to access the shell using Putty with the login and password that you have chosen. In File zilla you can actually create folders and just drag and drop your raw data so its available for the analysis, it may take a while.
Download Putty to operate within the shell environment, log in with a user name and passord that you had set up.
Yay- you are in! Congratulaitons on your first empty black screen! 


Step 3- TrimGalore RNASeq data cleanup

Now it gets a bit trickier. You need to make sure you have all the required dependencies downloaded in order to run RepEnrich pipeline. Step1 is to clean up your raw data and trim the reads to remove poor quality reads. To do this you will need a tool called TrimGalore. To keep your dependencies in one place you can create a new folder: "Tools". Now to create a new directory in putty simply type: mkdir Tools     ->and thats it.
To enter the directory type: cd Tools    -> end enter.
Please read this Readme file from the creator of trim galore for instructions how to download and the unser manual:
https://github.com/FelixKrueger/TrimGalore



To run the trim galore- you will need to download the trim_galore itself + cutadapt + fastqc- only when you have these three files are installed the trimming of the adapter sequences and trimming bad quality data (below 20%) will be performed
The required dependencies and links are:
https://www.bioinformatics.babraham.ac.uk/projects/trim_galore/
https://github.com/FelixKrueger/TrimGalore/releases

You can download it directly from the website, into your tool folder. Now you need to link it to the .bashrc file in order to make it executable in the shell. You need to create a path to the TrimGalore that you have just downloaded in the executable .bashrc file. The instructions below include some basic commands to operate in Putty (whcih is a Linux based system):
1. Once you are in your home directory you can open the .bashrc file. If you are unsure that you are just type: cd. That will take you to your home directory. You can type: ls   -> to check the list of available folders and files.
2. Edit the .bashrc file type: more .bashrc
(.bashrc is an invisible file in your home directory, all invisible files start with ‘.’)
3. Now you have opened your .bashrc you can scroll to the very bottom of the file (you can only operate with arrows and Enter)
4. To enter any text at the very end of .bashrc type: i   (for insert). now you will able to type inside. This is an example of the path I have written in my .bashrc to link FastQC and TrimGalore tools:

PATH=$PATH:/home/asia/tools/FastQC:/home/asia/tools/TrimGalore:/home/asia/tools/

5. Note: If you dont want to type manually, before you open the .bashrc, enter your tools folder again type: ls
This will give a list of files in the directory, make sure your TrimGalore is there. If it is there, type- pwd- Enter. That will give you the path to the directory where you are currently in, which is also the path to TrimGalore. Copy the link: right click. Great now you can use that in your path back in the .bashrc. Once you ready to insert type - PATH=$PATH:(copy your link here)
5. Once you are done with the Path, press: ESC. 
6. Now save the file by typing: :w
7. Quit the file by typing: :q


And thats it, you are nearly ready to run TrimGalore. You may want to familiarise yourself with TrimGalore manual. If you like you can do that by typing: trim_galore --help (that will open the manual).
The code to the TrimGalore is included in file n#1. In a nutshell the parameters that are written mean e.g.:

#Code:

trim_galore --paired --illumina -q 20 --fastqc -o /home/asia/SC_1_KO_Rep_Enrich/fastq_trim \
LCV2N1_1.fq.gz LCV2N1_2.fq.gz &

#Explanation:
#The –o is the path to the directory where the data will be stored
#--illumina- is saying illumine barcodes were used and will be trimmed
#-q 20 is anything below 20% quality mean will be trimmed off
#--fastq- is the file that you are putting in
#My library was paired ended hence I have two files: LCV2N1_1.fq.gz and LCV2N1_1.fq.gz (if you have single end read library, you may #have to edit the code according to the creator of RepEnrich:
#https://github.com/nskvir/RepEnrich
#more TrimGalore options can be found in the manual

So you have your raw RNASeq files downloaded, the trim_galore and cutadapt and fastqc is ready in your Tools directory. Last thing... if you simply want to run the code you edited from file #1 (trim_galore) you should save it (with the corrected directory and file names that will correspond to your situation) in a .bash file. Bash is like a notebook that will simply store the code, then if you want to run the code stored in .bash you simply call its name (well just read below how). To create one follow steps below:
A) Type- vim trim_galore.bash
B) This will open a notebook-like window (similar to .bashrc), now type: i
C) you are now able to insert the copied code
D) Press: Esc
E) type: :w (to save)
F) type: :q (to quit)


And thats it, done!

Now to run your code (even after you log out), you need to run it in so called "screen" so its running in the background.
Its super easy to open a screen in Putty. Simply type:  screen -S name (name it something e.g. trimgalore). If you want to double check the screen that you have created is attached just type: screen -r name (whatever you called it before) and the system will give you the info about the opened screens that your user is using.
Great so you are in the screen now. Last and simpliest thing you have to do type: bash trim_galore (if thats the name of the vim file with the code you have created) and press: ENTER
Now you can exit the screen (it wont stop running the code) by pressing: Ctr+A, Ctr+D (if you make a mistake and type Ctr+D, Ctr+D your screen is killed... so be careful not to mix these up). 
If you want to check if your code is running just type: htop  
That will show you the processes associated with your server activity and your trim_galore should be there. To exit this window type: Ctr+C
and you should be back in home directory, you can now close Putty and relax until your trim_galore is done


NOTE: IMPORTANT:
In the code you will be writing in this Tutorial, whenever you refer to the target files you may or may not provide the full path to their location. That will depend on where are you executing the code (literally). In my example the input files are not linked to any path, this means that I can only run the trimgalore.bash once I physically enter the folder where my files are located! If you wont do that, without providing a path to the input files the trimgalore.bash wont be able to find it! Importantly, your trimgalore.bash file (or whatever you have called it) should also be located in the same folder as the input files.
Alternatively, you can simply provide the path to EACH of the input file and that should solve any problems. Just keep that in mind since I have spent a while trying to figure this one out! That is a linux operating basic ladies and gentleman! :-) You are getting there.



Step 2: Bowtie alingment

For bowtie alinmgment we need to align the RNAseq reads to the human (in this case) genome hg38. Creata folder in your home directory called human_genome_hg38: mkdir human_genome_hg38
Then download the genome data:



