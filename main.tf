resource "google_compute_instance" "default" 
{
	count = "${var.count-no}"
    name  = "${var.instance-name}-${count.index + 1}"
	machine_type = "${var.vm_type}"
	zone         = "${var.zone}"
	boot_disk
	{
		initialize_params {image = "${var.os}"}
	}
    network_interface
    {
		network = "default"
		access_config {}
	}
	tags = ["http-server"]
    metadata 
	{ 
		ssh-keys = "user1:${file("~/.ssh/id_rsa.pub")}"
	}
}