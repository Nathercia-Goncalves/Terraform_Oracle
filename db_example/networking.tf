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
resource "oci_core_subnet" "public-lab-subnet" {
    cidr_block = "10.0.0.0/24"
    compartment_id = "${var.compartment_ocid}"
    vcn_id = "${oci_core_vcn.lab-vcn.id}"
    security_list_ids = [oci_core_security_list.public_security_list.id]
    dns_label = "public"
  }

resource "oci_core_subnet" "private-lab-subnet" {
    cidr_block = "10.0.2.0/24"
    compartment_id = "${var.compartment_ocid}"
    vcn_id = "${oci_core_vcn.lab-vcn.id}"
    prohibit_public_ip_on_vnic = "true"
    security_list_ids = [oci_core_security_list.private_security_list.id]
    dns_label = "private"
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
# Security List
######################
resource "oci_core_security_list" "private_security_list" {
  compartment_id = var.compartment_ocid
  vcn_id         = "${oci_core_vcn.lab-vcn.id}"
  display_name   = "private_security_list"

  ingress_security_rules {
    protocol  = "all" // tcp
    source    = "${oci_core_subnet.public-lab-subnet.cidr_block}"
  }

}

resource "oci_core_security_list" "public_security_list" {
  compartment_id = var.compartment_ocid
  vcn_id         = "${oci_core_vcn.lab-vcn.id}"
  display_name   = "public_security_list"

  // allow inbound ssh traffic from a specific port
  ingress_security_rules {
    protocol  = "all" // tcp
    source    = "0.0.0.0/0"
    }

    egress_security_rules {
       protocol  = "all"
       destination = "0.0.0.0/0"
       }
  }
