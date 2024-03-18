# Source from https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/containerengine_cluster

resource "oci_containerengine_cluster" "oke-cluster" {
    # Required
    compartment_id = "ocid1.compartment.oc1..aaaaaaaaep5q2m2ikqcorcw6mo4eo773m3ipywt7xz2mbrlwxymkfbgfqf7a"
    kubernetes_version = "v1.27.2"
    name = "poornima-cluster-mar13"
    vcn_id = module.vcn.vcn_id

    # Optional
    options {
        add_ons{
            is_kubernetes_dashboard_enabled = false
            is_tiller_enabled = false
        }
        kubernetes_network_config {
            pods_cidr = "10.244.0.0/16"
            services_cidr = "10.96.0.0/16"
        }
        service_lb_subnet_ids = [oci_core_subnet.vcn-public-subnet.id]
    }  
}