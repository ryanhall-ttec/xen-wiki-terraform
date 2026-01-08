resource "linode_object_storage_bucket" "xenwiki" {
  region = var.region
  label  = "xenwiki"
}

resource "linode_object_storage_key" "xenwiki" {
  label = "xenwiki-key"

  bucket_access {
    bucket_name = linode_object_storage_bucket.xenwiki.label
    region      = linode_object_storage_bucket.xenwiki.region
    permissions = "read_write"
  }
}
