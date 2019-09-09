# RepEnrich analysis on B cell lymphoma RNA-Seq
RepEnrich analysis on paired end RNA-Seq data


*****************************************
Step by step tutorial for dummies that have no idea how to make their way into operating shell environment and R studio console

Before starting you should ask any kind bioinformatician that is wiling to help you to share some space on your institution's server with you. The kind altruist should also make sure you will not do any damage to the folders situated outside of your own:)
I personally used Fila Zilla to download the raw RNA-seq files into the server. It should be linked to the server you operate in (if unsure how to do it, where to get the IP address just ask the altruist bioinformatician that set you up in the first place). In File Zilla, go to the icon on the left top corner (Open the Site Manager), here you can link to the correct server number and port number, set up your username and passord and make sure you are using the correct protocol for entry: SFTP: SSH File Transfer Protocol. Thats all you really need. These parameters should be saved up for your next log on. It will allow you to access the shell using Putty with the login and password that you have chosen. In File zilla you can actually create folders and just drag and drop your raw data so its available for the analysis, it may take a while.
Download Putty to operate within the shell environment, log in with a user name and passord that you had set up.
Yay- you are in! Congratulaitons on your first empty black screen! 


Now it gets a bit trickier. You need to make sure you have all the required dependencies downloaded in order to run RepEnrich pipeline. Step1 is to clean up your raw data and trim the reads to remove barcodes and poor quality reads. To do this you will need a tool celled TrimGalore. To keep your dependencies in one place you you can create a new folder: "Tools". Now to create a new directory in putty simply type- mkdir Tools- and thats it.
To enter it type- cd Tools- end enter.
To run the trim galore- you will need to download the trim_galore itself + cutadapt + fastqc- only when you have these three files in the folder the trimming of the adapter sequences and trimming bad quality data (below 20%) will be performed
The required dependencies and links are:
https://www.bioinformatics.babraham.ac.uk/projects/trim_galore/
https://github.com/FelixKrueger/TrimGalore/releases

You can download it directly from the website, into your tool folder. Now you need to link it to the .bashrc file in order to make it executable. You need t ocreate a path to the TrimGalore that you have just downloaded in the .bashrc file. The instructions below include some basic commands to operate in Putty (whcih is a Linux based system). 
1. Once you are in your home directory you can open the .bashrc file. If you are unsure that you are just type -cd-. That will take you to your home directory.
2. Edit the .bashrc file -type- more .bashrc
(is an invisible file in your home directory on the server, all invisible files start with ‘.’)
2. Now you have opened your .bashrc you can scroll to the very bottom.
3. To enter any text type: i   (for insert). now you wil lbe able to type inside. This is an example of the path I have written in my .bashrc 

PATH=$PATH:/home/asia/tools/FastQC:/home/asia/tools/TrimGalore:/home/asia/tools/

4. If you dont want to type manually. Before you open the .bashrc, enter your tools folder again type- ls-
This will give a list of files in the directory, make sure your TrimGalore is there. If it is there, type- pwd- Enter. That will give you the path to the directory where you are currently, whcih is also the path to TrimGalore. Copy the link- right click- great now you can use that in your path back in the .bashrc. Once you ready to insert type - PATH=$PATH:(copy your link here)
5. Now save the file by typing: :w
6. Quit the file by typing: :q


And thats it, you are nearly ready to run TrimGalore. You may want to familiarise yourself with TrimGalore manual. If you like you can do that by typing- trim_galore --help (that will open the manual).
The code to the TrimGalore is included in file n#1. In a nuthell the parameters that are written mean e.g.:

#Code:

trim_galore --paired --illumina -q 20 --fastqc -o /home/asia/SC_1_KO_Rep_Enrich/fastq_trim \
LCV2N1_1.fq.gz LCV2N1_2.fq.gz &

#Exmplanation:
#The –o is the path to the directory where the data will be stored
#--illumina- is saying illumine barcodes were used and will be trimmed
#-q 20 is anything below 20% quality mean will be trimmed off
#--fastq- is the file that you are putting in
#My library was paired ended hence I have two files: LCV2N1_1.fq.gz and LCV2N1_1.fq.gz (if you have single end read library, you may have to edit the code according to the creator of RepEnrich:
https://github.com/nskvir/RepEnrich


So you have your raw files downloaded, the trim_galore and cutadapt and fastqc is ready in your Tools directory. Last thing... if yu simply want to run the code you edited from file #1 (trim_galore) you should save it (with the corrected directory and file names that will correspond to your situation) in a .bash file. Bash is like a notebook that will simply store the code, then if you want to run the code stored in .bash you simply call its name (well just read below how). To create one follow steps below:
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



