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
3. To enter any text type- i- for insert, now you wil lbe able to type inside. This is an example of the path I have written in my .bashrc 

PATH=$PATH:/home/asia/tools/FastQC:/home/asia/tools/TrimGalore:/home/asia/tools/

4. If you dont want to type manually. Before you open the .bashrc, enter your tools folder again type- ls-
This will give a list of files in the directory, make sure your TrimGalore is there. If it is there, type- pwd- Enter. That will give you the path to the directory where you are currently, whcih is also the path to TrimGalore. Copy the link- right click- great now you can use that in your path back in the .bashrc. Once you ready to insert type - PATH=$PATH:(copy your link here)
5. Now save the file by typing- :w
6. Quit the file by typing- :q

