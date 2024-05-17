terraform {
  backend "s3" {
    bucket         = "eks-cluster-bucket-damier"
    key            = "Inhabit/ENV/dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform_state_lock"
  }
}