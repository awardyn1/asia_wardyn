#Repenrich vim .bash on paired end data
#Format as below:
#python RepEnrich.py /data/mm9_repeatmasker.txt /data/sample_A sample_A /data/hg19_setup_folder sampleA_multimap_1.fastq --fastqfile2 sampleA_multimap_2.fastq sampleA_unique.bam --cpus 16 --pairedend TRUE
###################################################################
##### FOR ASIA; NOTES FOR RUNNING REPENRICH

# python /root/myPrograms/RepEnrich/RepEnrich.py  \         Path to repenrich
# /root/resources/mm10_repeat/mm10_repeatmasker_clean.txt \ Path to the repeatmasker text file
# /root/daan/repenrich/ \                                   Path to directory where you want to save the results  
# YB2 \                                                     Label of your sample
# /root/resources/mm10_repeat/setup_folder_mm10/ \          Path to rep_enrich directory (the tar file you downloaded)
# /root/daan/bowtie/YB2_multimap.fastq \                    Path to multimap fastq
# /root/daan/bowtie/YB2_uniq.bam \                          Path to uniquely mapped reads bam file
# --cpus 16 --pairedend TRUE                               Number of CPUs and whether your samples are PAIREDEND


#from the example above you do as below
#LCV2 control 1 and 2
python /home/asia/tools/RepEnrich/RepEnrich.py \
/home/asia/Repeatmasker_hg38/hg38_repeatmasker_clean.txt \
/home/asia/RepEnrich/ \
LCV2_N1 \
/home/asia/Repeatmasker_hg38/RepEnrich_setup_hg38 \
/home/asia/bowtie_output/LCV2_N1_multimap_1.fastq --fastqfile2 \
/home/asia/bowtie_output/LCV2_N1_multimap_2.fastq \
/home/asia/bowtie_output/LCV2_N1_uniquely.sam --cpus 16 --pairedend TRUE


python /home/asia/tools/RepEnrich/RepEnrich.py \
/home/asia/Repeatmasker_hg38/hg38_repeatmasker_clean.txt \
/home/asia/RepEnrich/ \
LCV2_N2 \
/home/asia/Repeatmasker_hg38/RepEnrich_setup_hg38 \
/home/asia/bowtie_output/LCV2_N2_multimap_1.fastq --fastqfile2 \
/home/asia/bowtie_output/LCV2_N2_multimap_2.fastq \
/home/asia/bowtie_output/LCV2_N2_uniquely.sam --cpus 16 --pairedend TRUE

#KO clone 5 N1 and N2
python /home/asia/tools/RepEnrich/RepEnrich.py \
/home/asia/Repeatmasker_hg38/hg38_repeatmasker_clean.txt \
/home/asia/RepEnrich/ \
clone5_N1 \
/home/asia/Repeatmasker_hg38/RepEnrich_setup_hg38 \
/home/asia/bowtie_output/clone5N1_multimap_1.fastq --fastqfile2 \
/home/asia/bowtie_output/clone5N1_multimap_2.fastq \
/home/asia/bowtie_output/clone5N1_uniquely.sam --cpus 16 --pairedend TRUE

python /home/asia/tools/RepEnrich/RepEnrich.py \
/home/asia/Repeatmasker_hg38/hg38_repeatmasker_clean.txt \
/home/asia/RepEnrich/ \
clone5_N2 \
/home/asia/Repeatmasker_hg38/RepEnrich_setup_hg38 \
/home/asia/bowtie_output/clone5N2_multimap_1.fastq --fastqfile2 \
/home/asia/bowtie_output/clone5N2_multimap_2.fastq \
/home/asia/bowtie_output/clone5N2_uniquely.sam --cpus 16 --pairedend TRUE

#KO clone 6 N1 and N2
python /home/asia/tools/RepEnrich/RepEnrich.py \
/home/asia/Repeatmasker_hg38/hg38_repeatmasker_clean.txt \
/home/asia/RepEnrich/ \
clone6_N1 \
/home/asia/Repeatmasker_hg38/RepEnrich_setup_hg38 \
/home/asia/bowtie_output/clone6N1_multimap_1.fastq --fastqfile2 \
/home/asia/bowtie_output/clone6N1_multimap_2.fastq \
/home/asia/bowtie_output/clone6N1_uniquely.sam --cpus 16 --pairedend TRUE

python /home/asia/tools/RepEnrich/RepEnrich.py \
/home/asia/Repeatmasker_hg38/hg38_repeatmasker_clean.txt \
/home/asia/RepEnrich/ \
clone6_N2 \
/home/asia/Repeatmasker_hg38/RepEnrich_setup_hg38 \
/home/asia/bowtie_output/clone6N2_multimap_1.fastq --fastqfile2 \
/home/asia/bowtie_output/clone6N2_multimap_2.fastq \
/home/asia/bowtie_output/clone6N2_uniquely.sam --cpus 16 --pairedend TRUE




