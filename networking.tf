#################
# VCN
#################
resource "oci_core_vcn" "lab-vcn" {
  cidr_block     = "${var.vcn_cidr_block}"
  dns_label      = "vcn1"
  compartment_id = "${var.compartment_ocid}"
  display_name   = "lab-vcn"
}

######################
# Subnets
######################
resource "oci_core_subnet" "lab-subnet" {
    cidr_block = "${var.subnet_cidr_block}"
    compartment_id = "${var.compartment_ocid}"
    vcn_id = "${oci_core_vcn.lab-vcn.id}"
  }

######################
# Internet Gateway
######################
  resource "oci_core_internet_gateway" "lab-internet_gateway" {
      compartment_id = "${var.compartment_ocid}"
      vcn_id = "${oci_core_vcn.lab-vcn.id}"
      enabled = "true"
      display_name = "lab-internet_gateway"
  }

######################
# Default Route Table
######################
  resource "oci_core_default_route_table" "lab-rt" {
    manage_default_resource_id = "${oci_core_vcn.lab-vcn.default_route_table_id}"

    route_rules {
      destination       = "0.0.0.0/0"
      network_entity_id = "${oci_core_internet_gateway.lab-internet_gateway.id}"
    }
  }

######################
# Security Lists
######################
  resource "oci_core_security_list" "lab_sl" {
    compartment_id = "${var.compartment_ocid}"
    vcn_id = "${oci_core_vcn.lab-vcn.id}"
    display_name = "lab-sl"
    egress_security_rules {
       protocol    = "all"
      destination = "0.0.0.0/0"
    }
    ingress_security_rules {
      protocol = "6"
      source   = "0.0.0.0/0"

      tcp_options {
        min = 80
        max = 80
      }
    }

  ingress_security_rules {
      protocol = "6"
      source   = "0.0.0.0/0"

      tcp_options {
        min = 22
        max = 22
      }
    }
  }
