##################################
#          Install               #
##################################
#1
tar -C /usr/local -xzf go1.13.7.linux-amd64.tar.gz #criará o  /usr/local/go

#2 Add line:
export PATH=$PATH:/usr/local/go/bin/
#Option 1 -> file: "/etc/profile" --> em todo o sistema ####
#or
#Option 2 ->  file:  $HOME/.profile -> uso imediato


#3 Test your installation
    #3.1 Specific your workspace directory: GOPATH=$HOME    
    go env -w GOPATH=$HOME   
    cd $HOME/Desktop/COMMANDS/06-GOLANG
    mkdir -p src/hello
    cd src/hello
    touch hello.go
    go build
    #hello.go => source code
    #hello => binary(executable)
    ./hello
    go clean -i #remove the binary

    










