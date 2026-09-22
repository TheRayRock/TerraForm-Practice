resource "aws_s3_bucket" "my_remote" {
  bucket = "my-s3-remote-bucket-unique-db"

  tags = {
    Name        = "my-s3-remote-bucket"
  }
}