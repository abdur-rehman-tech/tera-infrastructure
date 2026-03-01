module "dev-infra" {
    source ="./infra-app"
    Environment = "dev"
    bucket_name = "tws-infra-app-0000000"
    instance_count = 1
    instance_type = "t2.micro"
    hash_key = "studentID"
    ec2_ami_id = "ami-0b6c6ebed2801a5cb"
}
module "prod-infra" {
    source ="./infra-app"
    Environment = "prod"
    bucket_name = "tws-infra-app-0000000"
    instance_count = 2
    instance_type = "t2.small"
    hash_key = "studentID"
    ec2_ami_id = "ami-0b6c6ebed2801a5cb"
}
module "staging-infra" {
    source ="./infra-app"
    Environment = "staging"
    bucket_name = "tws-infra-app-0000000"
    instance_count = 1
    instance_type = "t2.micro"
    hash_key = "studentID"
    ec2_ami_id = "ami-0b6c6ebed2801a5cb"
}

