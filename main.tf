resource "aws_instance" "test" {

}

Lifecycle{
    create_before_destroy = true
}
Lifecycle{ 
    ignore_changes =[tags]
}

Lifecycle{
    prevent_destroy = true
}

