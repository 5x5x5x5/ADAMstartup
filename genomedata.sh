# Let's find some data

# from the 1000genomes project using s3cmd

sudo apt-get install -y python-pip tabix
sudo pip install s3cmd

# test FTP basics
tabix ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/technical/working/20120131_omni_genotypes_and_intensities/Omni25_genotypes_2141_samples.b37.vcf.gz 6:31830969-31834280 6:31830969-31834280 | cut -f 1-5

