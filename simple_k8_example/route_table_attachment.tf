resource "oci_core_route_table_attachment" "route_table_attachment1" {
  #Required
  subnet_id = "${oci_core_subnet.public-subnet-1.id}"
  route_table_id = "${oci_core_default_route_table.route_table.id}"
}

resource "oci_core_route_table_attachment" "route_table_attachment2" {
  #Required
  subnet_id = "${oci_core_subnet.public-subnet-2.id}"
  route_table_id = "${oci_core_default_route_table.route_table.id}"
}
