/*
******************************************************************
Passes instance device name and Jenkins version to jenkins-init.sh
so that Jenkins can be installed after the vm is ready.
******************************************************************
*/
data "template_file" "jenkins-init" {
  template = "${file("scripts/jenkins-init.sh")}"
  vars {
    DEVICE = "${var.INSTANCE_DEVICE_NAME}"
    JENKINS_VERSION = "${var.JENKINS_VERSION}"
  }
}
data "template_cloudinit_config" "cloudinit-jenkins" {

  gzip = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.jenkins-init.rendered}"
  }
}
