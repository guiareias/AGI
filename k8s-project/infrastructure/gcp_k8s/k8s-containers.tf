/*
resource "docker_image" "frontend" {
    name = "frontend"

    build {
        path = "/home/vagrant/calculator-project/vuecalc"
        tag  = ["vuecalc:latest"]
        dockerfile = "Dockerfile"
    }
}


resource "docker_image" "expressed" {
    name = "expressed"

    build {
        path = "/home/vagrant/calculator-project/expressed"
        tag  = ["expressed:agisit"]
        dockerfile = "Dockerfile"
    }
}

resource "docker_image" "bootstart" {
    name = "bootstart"

    build {
        path = "/home/vagrant/calculator-project/bootstorage"
        dockerfile = "Dockerfile"
    }
}

resource "docker_image" "happy" {
    name = "happy"

    build {
        path = "/home/vagrant/calculator-project/happy"
        dockerfile = "Dockerfile"
    }
}
*/