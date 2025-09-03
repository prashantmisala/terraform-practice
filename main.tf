resource "aws_instance" "terraform_example" {
   ami           = var.ami 

   instance_type = var.instance_type
   
   tags = {
     Name = "TerraformExample"
   }
}  