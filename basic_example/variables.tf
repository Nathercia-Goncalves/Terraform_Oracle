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

variable "source_id"{
default = "ocid1.image.oc1.iad.aaaaaaaahu5qjlssg7gheegnyty5nvuafd6zlwcz2f3oa4flu7dijeqzgt6a"
}
#####################
# networking
#####################
variable "vcn_cidr_block"{
default = "10.0.0.0/20"
}
variable "subnet_cidr_block"{
default = "10.0.0.0/24"
}
