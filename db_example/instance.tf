resource "oci_core_instance" "lab-instance" {
  compartment_id      = "${var.compartment_ocid}"
  availability_domain = "${var.availability_domain}"
  display_name        = "lab-instance"
  shape               = "VM.Standard.E2.1.Micro"

metadata = {
    ssh_authorized_keys = file("/Users/NatherciaGoncalves/.ssh/id_rsa.pub")
     user_data = base64encode(file("/Users/NatherciaGoncalves/Projects/3HTP-Terraform/Oracle/OCI_db/vm.cloud-config"))
}

create_vnic_details {
   subnet_id           = "${oci_core_subnet.public-lab-subnet.id}"
}

source_details {
    source_id = "ocid1.image.oc1.iad.aaaaaaaahu5qjlssg7gheegnyty5nvuafd6zlwcz2f3oa4flu7dijeqzgt6a"
    source_type = "image"
}

}
