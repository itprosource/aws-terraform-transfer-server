resource "aws_transfer_server" "transfer_server" {
  domain = var.domain
  protocols = var.protocols
  endpoint_details {
    vpc_endpoint_id = aws_vpc_endpoint.transfer.id
    address_allocation_ids = var.address_allocation_ids
    subnet_ids = var.subnet_ids
  }
  endpoint_type = var.endpoint_type
  identity_provider_type = var.identity_provider_type
  logging_role           = aws_iam_role.transfer_server_role.arn
  security_policy_name = var.security_policy_name

  tags = {
    NAME = var.transfer_server_name
  }
}

resource "aws_transfer_user" "transfer_server_user" {
  count = length(var.transfer_server_user_names)

  server_id      = aws_transfer_server.transfer_server.id
  user_name      = element(var.transfer_server_user_names, count.index)
  role           = aws_iam_role.transfer_server_role.arn
  home_directory = "/${var.bucket_name}"
}

resource "aws_transfer_ssh_key" "transfer_server_ssh_key" {
  count = length(var.transfer_server_user_names)

  server_id = aws_transfer_server.transfer_server.id
  user_name = element(aws_transfer_user.transfer_server_user.*.user_name, count.index)
  body      = element(var.transfer_server_ssh_keys, count.index)
}