output "aws_vpc_id" {
  value = "${aws_vpc.main.id}"
}


output "private_1_a_id" {
  value = "${aws_subnet.private_1_a.id}"
}

output "private_2_a_id" {
  value = "${aws_subnet.private_2_a.id}"
}

output "private_1_b_id" {
  value = "${aws_subnet.private_1_b.id}"
}

output "private_2_b_id" {
  value = "${aws_subnet.private_2_b.id}"
}

output "public_1_a_id" {
  value = "${aws_subnet.public_1_a.id}"
}
output "public_1_b_id" {
  value = "${aws_subnet.public_1_b.id}"
}
