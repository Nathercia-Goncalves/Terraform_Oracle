resource "oci_core_instance" "lab-instance" {
  compartment_id      = "${var.compartment_ocid}"
  availability_domain = "${var.availability_domain}"
  display_name        = "lab-instance"
  shape               = "VM.Standard.E2.1.Micro"

metadata = {
    ssh_authorized_keys = file("/Users/NatherciaGoncalves/.ssh/id_rsa.pub")
}

create_vnic_details {
   subnet_id           = "${oci_core_subnet.lab-subnet.id}"
}

source_details {
    source_id = "${var.source_id}"
    source_type = "image"
}

}
