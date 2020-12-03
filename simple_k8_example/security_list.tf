resource "oci_core_security_list" "public_security_list_1" {
  compartment_id = var.compartment_ocid
  vcn_id         = "${oci_core_vcn.vcn.id}"
  display_name   = "public_security_list_1"

  ingress_security_rules {
    protocol  = "all"
    source    = "0.0.0.0/0"
    stateless = "true"
    }

  egress_security_rules {
    protocol  = "all"
    destination = "0.0.0.0/0"
    stateless = "true"
    }
  }

resource "oci_core_security_list" "public_security_list_2" {
  compartment_id = var.compartment_ocid
  vcn_id         = "${oci_core_vcn.vcn.id}"
  display_name   = "public_security_list_2"

  ingress_security_rules {
    protocol  = "all"
    source    = "0.0.0.0/0"
    stateless = "true"
    }

  egress_security_rules {
    protocol  = "all"
    destination = "0.0.0.0/0"
    stateless = "true"
    }
  }
