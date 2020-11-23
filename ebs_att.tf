resource "aws_volume_attachment" "ebs_attachment" {
    device_name = "/dev/xvdf"
    volume_id   =  aws_ebs_volume.my_volume.id
    instance_id = aws_instance.centos8.id
    force_detach =true     
   depends_on=[ aws_ebs_volume.my_volume,aws_ebs_volume.my_volume]
}

resource "aws_ebs_volume" "my_volume" {
    availability_zone = aws_instance.centos8.availability_zone
    size              = 1
    tags = {
        Name = "centos8-ps"
    }
}
