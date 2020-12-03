resource "oci_core_dhcp_options" "dhcp_options" {
  compartment_id = "${var.compartment_ocid}"
  options {
    type = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
}

options {
    type = "SearchDomain"
    search_domain_names = [ "cluster-test.oraclevcn.com" ]
}
  vcn_id = "${oci_core_vcn.vcn.id}"
  display_name = "dhcp"
}
