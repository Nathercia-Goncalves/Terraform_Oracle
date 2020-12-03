resource "oci_core_internet_gateway" "internet_gateway" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${oci_core_vcn.vcn.id}"
  enabled = "true"
  display_name = "internet_gateway"
}
