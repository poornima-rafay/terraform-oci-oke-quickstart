# Source from https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/containerengine_node_pool

resource "oci_containerengine_node_pool" "oke-node-pool" {

    for_each = var.nps

    cluster_id = oci_containerengine_cluster.oke-cluster.id
    compartment_id = "ocid1.compartment.oc1..aaaaaaaaep5q2m2ikqcorcw6mo4eo773m3ipywt7xz2mbrlwxymkfbgfqf7a"
    kubernetes_version = "v1.27.2"
    name = each.value["name"]

    node_config_details{
        placement_configs{
            availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
            subnet_id = oci_core_subnet.vcn-private-subnet.id
        } 
        placement_configs{
            availability_domain = data.oci_identity_availability_domains.ads.availability_domains[1].name
            subnet_id = oci_core_subnet.vcn-private-subnet.id
        }
         placement_configs{
            availability_domain = data.oci_identity_availability_domains.ads.availability_domains[2].name
            subnet_id = oci_core_subnet.vcn-private-subnet.id
        }
        size = 3
    }
    node_shape = "VM.Standard2.1"

    # Using image Oracle-Linux-7.x-<date>
    # Find image OCID for your region from https://docs.oracle.com/iaas/images/ 
    node_source_details {
         image_id = "ocid1.image.oc1.phx.aaaaaaaacah6lzcramrfdceid4wytrwv4kp27sdast3lysv2cefyy4trsfwq"
         source_type = "image"
    }
 
    # Optional
    initial_node_labels {
        key = "name"
        value = "poornima-cluster-mar13"
    }    
}