# Compartment ID can be found in under Governance and Administraion under governace, you will see Compartmnet Explorer click the compartmnet you will use
# Click the name of your compartment and you will see the OCID

# To find the availability domain that can be found Under Compute --> Instances, then scroll down to find possible availability domain

# You will have to create your own ssh keys and will use the one that ends with .pub in the configuration and use the private key to ssh into the instance

# the Source ID image is centos 7 but you can find others at https://docs.cloud.oracle.com/en-us/iaas/images/

resource "oci_core_instance" "lab-instance"
  compartment_id      = ""
  availability_domain = ""
  display_name        = "lab-instance"
  shape               = "VM.Standard.E2.1.Micro"

metadata = {
    ssh_authorized_keys = file("")
}

create_vnic_details {
   subnet_id           = "${oci_core_subnet.lab-subnet.id}"
}

source_details {
    source_id = "ocid1.image.oc1.iad.aaaaaaaahu5qjlssg7gheegnyty5nvuafd6zlwcz2f3oa4flu7dijeqzgt6a"
    source_type = "image"
}

}
