# Compartment ID can be found in under Governance and Administraion under governace, you will see Compartmnet Explorer click the compartmnet you will use
# Click the name of your compartment and you will see the OCID

################# VCN #################
resource "oci_core_vcn" "lab-vcn" {
  cidr_block     = "10.0.0.0/20"
  dns_label      = "vcn1"
  compartment_id = ""
  display_name   = "lab-vcn"
}

###################### Subnets ######################
resource "oci_core_subnet" "lab-subnet" {
    cidr_block = "10.0.0.0/24"
    compartment_id = ""
    vcn_id = "${oci_core_vcn.lab-vcn.id}"
  }

###################### Internet Gateway ######################
  resource "oci_core_internet_gateway" "lab-internet_gateway" {
      compartment_id = ""
      vcn_id = "${oci_core_vcn.lab-vcn.id}"
      enabled = "true"
      display_name = "lab-internet_gateway"
  }

###################### Default Route Table ######################
  resource "oci_core_default_route_table" "lab-rt" {
    manage_default_resource_id = "${oci_core_vcn.lab-vcn.default_route_table_id}"

    route_rules {
      destination       = "0.0.0.0/0"
      network_entity_id = "${oci_core_internet_gateway.lab-internet_gateway.id}"
    }
  }

  ###################### Security Lists   ######################
  resource "oci_core_security_list" "lab_sl" {
    compartment_id = ""
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
