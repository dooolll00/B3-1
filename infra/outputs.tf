output "public_ip" { value = aws_instance.web.public_ip }
output "health_url" { value = "http://${aws_instance.web.public_ip}/health" }
output "inventory" {
  value = {
    region         = "ap-northeast-2"
    vpc_id         = aws_vpc.main.id
    subnet_id      = aws_subnet.public.id
    route_table_id = aws_route_table.public.id
    igw_id         = aws_internet_gateway.main.id
    sg_id          = aws_security_group.web.id
    instance_id    = aws_instance.web.id
    volume_id      = aws_instance.web.root_block_device[0].volume_id
    key_name       = aws_key_pair.learner.key_name
    public_ip      = aws_instance.web.public_ip
    ssh_cidr       = var.ssh_cidr
  }
}
