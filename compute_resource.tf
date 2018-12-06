resource "google_compute_instance" "default" {
	name = "go-server"
	machine_type = "n1-standard-1"
	zone = "europe-west2-c"
	boot_disk {
		initialize_params {
			image = "centos-7"
		}
	}
	network_interface {
		network = "default"
		access_config {
			// Ephermal IP
		}
	}
	metadata {
		sshKeys = "terraform:${file("~/.ssh/id_rsa.pub")}"
	}
	connection = {
		type = "ssh"
		user = "terraform"
		private_key = "${file("~/.ssh/id_rsa")}"
	}
	provisioner "remote-exec" {
		inline = [
			"echo Hello World"
		]
	}
	provisioner "remote-exec" {
		scripts = [
			"scripts/script"
		]
	}
}

resource "google_compute_attached_disk" "default" {
	disk = "jenkins-jobs"
  	instance = "go-server"
}
