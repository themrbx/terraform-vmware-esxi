# Upando Máquina Virtual

# Nome do DC que foi configurado dentro do vcenter
data "vsphere_datacenter" "datacenter" {
    name = var.data_center
}

# Local onde será provisionado os arquivos e discos das VMs criadas
data "vsphere_datastore" "datastore" {
    name          = var.data_store
    datacenter_id = data.vsphere_datacenter.datacenter.id
}

# Pool de recursos criado para as VMs
data "vsphere_resource_pool" "pool" {}

# Nome da network que as VMs utilizarão para se comunicar com rede interna e externa
data "vsphere_network" "networking" {
    name          = var.mgmt_lan
    datacenter_id = data.vsphere_datacenter.datacenter.id
}

# Local onde é criado a máquina virtual, especificando as informações das mesmas
resource "vsphere_virtual_machine" "virtualmachine" {
    count                      = var.vm_count
    name                       = "${var.name_new_vm}-${count.index + 1}"
    resource_pool_id           = data.vsphere_resource_pool.pool.id
    datastore_id               = data.vsphere_datastore.datastore.id
    force_power_off            = true
    shutdown_wait_timeout      = 1
    num_cpus                   = var.num_cpus
    memory                     = var.num_mem
    wait_for_guest_net_timeout = 0
    guest_id                   = var.guest_id
    nested_hv_enabled          = true

    network_interface {
        network_id   = data.vsphere_network.networking.id
        adapter_type = var.net_adapter_type
    }

    cdrom {
        datastore_id = data.vsphere_datastore.datastore.id
        path         = var.custom_iso_path
    }

    disk {
        size             = var.disk_size
        label            = "first-disk.vmdk"
        eagerly_scrub    = false
        thin_provisioned = true
    }
}