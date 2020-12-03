resource "oci_core_subnet" "public-subnet-1" {
    cidr_block = "10.0.10.0/24"
    compartment_id = "${var.compartment_ocid}"
    vcn_id = "${oci_core_vcn.vcn.id}"
    security_list_ids = [oci_core_security_list.public_security_list_1.id]
    display_name = "public_1"
  }

resource "oci_core_subnet" "public-subnet-2" {
    cidr_block = "10.0.20.0/24"
    compartment_id = "${var.compartment_ocid}"
    vcn_id = "${oci_core_vcn.vcn.id}"
    security_list_ids = [oci_core_security_list.public_security_list_2.id]
    display_name = "public_2"
    availability_domain = "zmkT:US-ASHBURN-AD-1"
  }
