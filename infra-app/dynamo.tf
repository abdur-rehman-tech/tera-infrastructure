resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name         = "${var.Environment}-infra-app-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = var.hash_key

  attribute {
    name = var.hash_key
    type = "S"
  }
  tags = {
    Name= "${var.Environment}-infra-app-table"
    Environment=var.Environment
  }
}