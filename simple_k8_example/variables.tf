#####################
# provider
#####################
variable "tenancy_ocid"{}
variable "user_ocid"{}
variable "fingerprint"{}
variable "private_key_path"{}
variable "region"{}
variable "compartment_ocid"{}
#####################
# instance
#####################
variable "availability_domain"{
default = "zmkT:US-ASHBURN-AD-3"
}
variable "ssh_public_key"{}

#####################
# networking
#####################
variable "route_table_route_rules_destination"{
default = "0.0.0.0/0"
}

variable "route_table_route_rules_destination_type"{
default = "CIDER_BLOCK"
}
#####################
# database_db_system
#####################
variable "db_admin_password"{
default = "Root1234!"
}

variable "db_admin_username"{
default = "root"
}

variable "db_availability_domain"{
default = "zmkT:US-ASHBURN-AD-1"
}

variable "db_configuration_id"{
default = "ocid1.mysqlconfiguration.oc1..aaaaaaaah6o6qu3gdbxnqg6aw56amnosmnaycusttaa7abyq2tdgpgubvsgi"
}

variable "db_shape_name"{
default = "VM.Standard.E2.1"
}

variable "db_storage_size"{
default = "50"
}

variable "db_display_name"{
default = "lab-db"
}

variable "db_fault_domain"{
default = "FAULT-DOMAIN-3"
}

variable "db_hostname_label"{
default = "lab"
}

variable "db_system_port"{
default = "3306"
}

variable "db_system_port_x"{
default = "33060"
}

#####################
# cluster
#####################
variable "cluster_kubernetes_version"{
default = "v1.18.10"
}
#####################
# node pool
#####################
variable "node_pool_kubernetes_version"{
default = "v1.18.10"
}

variable "node_pool_name"{
default = "pool1"
}

variable "node_pool_node_shape"{
default = "VM.Standard.E2.1"
}

variable "node_pool_initial_node_labels_key"{
default = "name"
}
variable "node_pool_initial_node_labels_value"{
default = "pool1"
}
