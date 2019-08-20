
#### Make sure Java is already installed on your machine.

#### Download Gradle

    wget https://services.gradle.org/distributions/gradle-4.9-bin.zip

#### Create a directory gradle under the directory /opt.

    mkdir /opt/gradle

#### Install unzip package if it is not installed on your machine.

    yum install unzip

#### Unzip gradle zip to the directiry /opt/gradle

    unzip -d /opt/gradle gradle-4.9-bin.zip

#### List the file of gradle

    ls /opt/gradle/gradle-4.9

#### Path setup

    export PATH=$PATH:/opt/gradle/gradle-4.9/bin

#### Check the gradle version

    gradle -v

