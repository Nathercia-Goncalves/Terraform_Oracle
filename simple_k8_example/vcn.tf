#################
# VCN
#################
resource "oci_core_vcn" "vcn" {
  cidr_block     = "10.0.0.0/16"
  dns_label      = "vcn"
  compartment_id = "${var.compartment_ocid}"
  display_name   = "vcn"
}
