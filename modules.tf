module "s3" {
  source = "./s3"
  environment = "dev"
  region = "${local.region}"
}
