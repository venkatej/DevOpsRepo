* docker machine installtion on RHEL

      curl -L https://github.com/docker/machine/releases/download/v0.14.0/docker-machine-`uname -s`-`uname -m` > /tmp/docker-machine

      chmod +x /tmp/docker-machine

      sudo cp /tmp/docker-machine /usr/local/bin/docker-machine

      export PATH=/usr/local/bin:$PATH

      docker-machine version
