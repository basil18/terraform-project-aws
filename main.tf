data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "foo" {
  ami           = "ami-022661f8a4a1b91cf"
  instance_type = "t2.micro"
  tags = {
      Name = "Raikhan-Instance-webhook"
  }
}

resource "aws_vpc" "project-vpc"{
    cidr_block = "10.0.0.0/16"
    
    tags ={
        name = "project-vpc"
    }
}
// resource "aws_internet_gateway" "gw" {
//    vpc_id = aws_vpc.project-vpc.id

//   //tags = local.tags
// }
// ///////

// resource "aws_subnet" "private_subnet" {
//     vpc_id     = aws_vpc.project-vpc.id
//     cidr_block = "10.0.1.0/24"
//     //availability_zone       = data.aws_availability_zones.available.names[count.index]
//     //availability_zone = "${var.region}a"
//     tags ={
//         name = "private-subnet"
//     }
// }
// resource "aws_route_table" "private-route" {
//   vpc_id = aws_vpc.project-vpc.id

//    route {
//     cidr_block = "0.0.0.0/0"
//     gateway_id = aws_internet_gateway.gw.id
//   }
//   //tags = local.tags
// }
// // resource "aws_route_table_association" "nat-rt" {
// //   subnet_id      = aws_subnet.private_subnet.id
// //   route_table_id = aws_route_table.private-route.id
// // }
// ////////////
// resource "aws_subnet" "public_subnet" {
//    vpc_id     = aws_vpc.project-vpc.id
//    cidr_block = "10.0.2.0/24"
//    //availability_zone = "${var.region}b"
//    //availability_zone       = data.aws_availability_zones.available.names[count.index]
//    tags ={
//         name = "public-subnet"
//     }
// }

// resource "aws_route_table" "public-route" {
//   vpc_id = aws_vpc.project-vpc.id

//    route {
//     cidr_block = "0.0.0.0/0"
//     gateway_id = aws_internet_gateway.gw.id
//   }
//   //tags = local.tags
// }

// resource "aws_route_table_association" "a" {
//   subnet_id      = aws_subnet.public_subnet.id
//   route_table_id = aws_route_table.public-route.id
 
// }
// //////////////

// resource "aws_eip" "nat_gateway" {      //question
//   domain = "vpc"                 
//   //vpc = true
// }

// resource "aws_nat_gateway" "nat" {
//   allocation_id = aws_eip.nat_gateway.id
//   subnet_id     = aws_subnet.public_subnet.id

//   //tags = local.tags

// //question
//   depends_on = [aws_internet_gateway.gw]        
// }