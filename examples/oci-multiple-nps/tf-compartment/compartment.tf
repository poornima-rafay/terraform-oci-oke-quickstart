
resource "oci_identity_compartment" "tf-compartment" {
    # Required
    compartment_id = "ocid1.compartment.oc1..aaaaaaaaep5q2m2ikqcorcw6mo4eo773m3ipywt7xz2mbrlwxymkfbgfqf7a"
    description = "Compartment for Terraform resources."
    name = "qa"
}