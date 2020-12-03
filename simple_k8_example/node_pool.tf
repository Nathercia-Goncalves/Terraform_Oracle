resource "oci_containerengine_node_pool" "node_pool" {
    cluster_id = "${oci_containerengine_cluster.cluster.id}"
    compartment_id = "${var.compartment_ocid}"
    kubernetes_version = "${var.node_pool_kubernetes_version}"
    name = "${var.node_pool_name}"
    node_shape = "${var.node_pool_node_shape}"
    node_config_details  {
    placement_configs {
        availability_domain = "zmkT:US-ASHBURN-AD-1"
        subnet_id = "${oci_core_subnet.public-subnet-2.id}"
      }
      size = "3"
    }
    node_source_details {
        image_id = "ocid1.image.oc1.iad.aaaaaaaapulaxjedwo2y3koeli6zq6evql6rropyxpni3wu44i2rbffgxgza"
        source_type = "IMAGE"
    }
    ssh_public_key = file("/Users/NatherciaGoncalves/.ssh/id_rsa.pub")
}
