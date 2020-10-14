# Terraform Install 
First Download Terraform for your OS

Mac: https://releases.hashicorp.com/terraform/0.13.4/terraform_0.13.4_darwin_amd64.zip

Windows: https://releases.hashicorp.com/terraform/0.13.4/terraform_0.13.4_windows_amd64.zip

Follow Terraform installation process 

https://learn.hashicorp.com/tutorials/terraform/install-cli

# Oracle Install
Follow installation process for OCI CLI in macOS, Linux, and Unix

https://medium.com/@gmusumeci/how-to-configure-oracle-oci-cli-in-5-minutes-a52bbf5d6d51

## Before running the oci setup config please do the following: 
# You will need to fill out env_variable.sh also
## User OCID:
Go to the three lines in the left hand side in the upper page

Scroll down to Idetify and click Users

Click on your User's Name

You will see your Users OCID

## Fingerprint:
In the same page that you found your OCID scroll down to resources you will click API Keys

You will get this when you begin configuring

Click Add Public Key and use your public key

The key is uploaded and its fingerprint is displayed (for example, d1:b2:32:53:d3:5f:cf:68:2d:6f:8b:5f:77:8f:07:13)

got to dircetory .oci

touch fingerprint

and paste the finger print in that file 

## Key_File:
Use the the directory to where your private key is located 

## Tenancy:
Go to the three lines in the left hand side in the upper page

Scroll down to Administaion and click Tenancy Details

You will see your Tenancy OCID

## Region:
Use the region you plan to be creaing resources
https://docs.cloud.oracle.com/en-us/iaas/Content/General/Concepts/regions.htm

## SSH keys:
Run ssh-keygen in terminal 

Then copy path and past in env_varaible.sh

## Compartment OCID:
Go to the three lines in the upper left hand corner

Scroll down to governance and administraion

Scroll over Governance 

Click on Compratment Explorer 

Then click on your compartnetv you will use 

# database connection 
mysql --host IPAddressOfMySQLDBSystemEndpoint -u Username -p 

# Creation Diagram
![Image of diagram](https://github.com/Nathercia-Goncalves/terraform_oracle/blob/main/OCI-Diagram.png)
