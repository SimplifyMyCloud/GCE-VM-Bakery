# GCE VM Golden Image
# Ensure a baked golden image of a base GCE Image including monitoring
source "googlecompute" "gce_base" {
  #project_id              = "smc-bakery"
  project_id          = "simplifymycloud-dev"
  source_image_family = "rocky-linux-8"
  source_image_project_id = [
    "rocky-linux-cloud"
  ]
  ssh_username  = "packer"
  zone          = "us-west1-c"
  image_family  = "smc-gce-base"
  instance_name = "gce-base-{{uuid}}"
  network       = "default"
  use_os_login  = true
}

build {
  sources = ["sources.googlecompute.gce_base"]
}