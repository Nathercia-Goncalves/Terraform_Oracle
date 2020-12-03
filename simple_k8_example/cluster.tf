resource "oci_containerengine_cluster" "cluster" {
    compartment_id = "${var.compartment_ocid}"
    kubernetes_version = "${var.cluster_kubernetes_version}"
    name = "cluster-test"
    vcn_id = "${oci_core_vcn.vcn.id}"

    options {
        service_lb_subnet_ids = ["${oci_core_subnet.public-subnet-1.id}"]
    }
}
