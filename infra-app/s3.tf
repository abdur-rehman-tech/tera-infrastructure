resource "aws_s3_bucket" "remote-s3" {
        bucket = "${var.Environment}-${var.bucket_name}"


        tags = {
          name="My Bucket"
          Environment=var.Environment
        }
}