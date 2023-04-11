output "controlnodeip" {
  value = aws_instance.nodes[0].public_ip
}