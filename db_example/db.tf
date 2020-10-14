resource "oci_mysql_mysql_db_system" "lab_mysql_db_system" {
    admin_password = var.db_admin_password
    admin_username = var.db_admin_username
    availability_domain = var.db_availability_domain
    compartment_id = var.compartment_ocid
    configuration_id = var.db_configuration_id
    shape_name = var.db_shape_name
    subnet_id = oci_core_subnet.private-lab-subnet.id
    data_storage_size_in_gb = var.db_storage_size
    display_name = var.db_display_name
    fault_domain = var.db_fault_domain
    hostname_label = var.db_hostname_label

    port = var.db_system_port
    port_x = var.db_system_port_x
}
