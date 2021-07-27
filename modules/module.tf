provider "aws" {
  region = "us-west-2"
}

module "sftp" {
  source = "../"
  transfer_server_name       = "sftp-server-name"

  domain = "S3"
  protocols = ["SFTP"]

  endpoint_type = "PUBLIC"
  identity_provider_type = "SERVICE_MANAGED"
  security_policy_name = "TransferSecurityPolicy-2020-06"
  transfer_server_user_names = ["sftp-user-name-01", "sftp-user-name-02"]
  transfer_server_ssh_keys   = [""]
  bucket_name                = "bucket-name-here"
  bucket_arn                 = "arn:aws:s3:::bucket-name-here"
}