#compdef dfm
# shellcheck disable=SC1087,2154,2195,2034,2152,1103,2148

__dfm_commands () {
    _describe 'dfm-commands' '(
        "config:Add, remove, link, or unlink custom config"
        "credentials:Set up credentials for various tools"
        "docker:Interact with a dev container"
        "install:Install dev environment tools"
        "uninstall:Uninstall dev environment tools"
        "vagrant:Interact with a dev virtual machine"
        "version:Check the versions of dev environment tools"
        )' && ret=0
}

__dfm_options () {
    integer ret=1

    case "$words[1]" in
        # (config)
        #     _describe -V 'config-options' '(
        #         "add:Add a custom config file"
        #         "remove:Remove a custom config file"
        #         "link:Create a symlink to a custom config file"
        #         "unlink:Remove a symlink to a custom config file"
        #         "--config-file-path:Override the default config file path (~/.config/dfm/config.sh)"
        #         "--help:Show help for the specified command"
        #         "--list:List the available command options"
        #     )' && ret=0
        # ;;
        # (credentials)
        #     _describe -V 'credentials-options' '(
        #         "gradle:Set up Gradle credentials"
        #         "helm:Add popular Helm repositories"
        #         "npm:Set up NPM credentials"
        #         "--all:Set up credentials for all options"
        #         "--help:Show help for the specified command"
        #         "--list:List the available command options"
        #         "--overwrite:Overwrite credentials config for the specified options"
        #         "--username:Pass a username to the command"
        #         "--password:Pass a password to the command"
        #         "--no-password-confirmation:Opt out of the password confirmation prompt"
        #     )' && ret=0
        # ;;
        (docker)
            _describe -V 'docker-options' '(
               "build:Build the image locally"
                "exec:Exec into a running container"
                "login:Log in to the default Docker registry"
                "remove:Remove a stopped container"
                "run:Run a container (defaults to running in interactive mode)"
                "start:Start an existing container (defaults to starting in interactive mode)"
                "--container:Override the default name of the container"
                "--dockerfile:Override the default Dockerfile used"
                "--environment:Override the default Dockerfile build stage"
                "--help:Show help for the specified command"
                "--mount-path:Override the default volume mount path (current working directory)"
                "--no-password-confirmation:Opt out of the password confirmation prompt"
                "--image:Override the default image"
                "--list:List the available command options"
                "--rm:Will remove the container upon exit"
            )' && ret=0
        ;;
        (install)
            _describe -V 'install-options' '(
                "docker:Install Docker"
                "gradle:Install Gradle"
                "helm:Install Helm"
                "hugo:Install Hugo"
                "istio:Install Istio and Istioctl"
                "java:Install Java"
                "kind:Install Kind"
                "kubectl:Install Kubectl"
                "minikube:Install Minikube"
                "nodejs:Install NodeJS"
                "skaffold:Install Skaffold"
                "terraform:Install Terraform"
                "yarn:Install Yarn"
                "--all:Install the entire tool stack"
                "--all-versions:Check the versions of all available options"
                "--curl-flags:Specify additional flags for the curl installs"
                "--dry-run:Perform a dry run for the specified arguments"
                "--help:Show help for the specified command"
                "--install-path:Override the default install path"
                "--list:List the available command options"
                "--overwrite:Overwrite existing tool installations if encountered"
                "--path:Override the default install and share paths"
                "--sudo:Install tools with sudo privileges"
                "--share-path:Override the default share path"
                "--show-tools-version:Show the version of tools as installation steps are performed"
                "--version:Override the default installation version"
                "--wget-flags:Specify additional flags for the wget installs"
            )' && ret=0
        ;;
        (uninstall)
            _describe -V 'uninstall-options' '(
                "docker:Uninstall Docker"
                "gradle:Uninstall Gradle"
                "helm:Uninstall Helm"
                "hugo:Uninstall Hugo"
                "istio:Uninstall Istio and Istioctl"
                "java:Uninstall Java"
                "kind:Uninstall Kind"
                "kubectl:Uninstall Kubectl"
                "minikube:Uninstall Minikube"
                "nodejs:Uninstall NodeJS"
                "skaffold:Uninstall Skaffold"
                "terraform:Uninstall Terraform"
                "yarn:Install Yarn"
                "--all:Uninstall the entire tool stack"
                "--dry-run:Perform a dry run for the specified arguments"
                "--help:Show help for the specified command"
                "--install-path:Override the default install path"
                "--list:List the available command options"
                "--path:Override the default install and share paths"
                "--sudo:Uninstall tools with sudo privileges"
                "--share-path:Override the default share path"
            )' && ret=0
        ;;
        # (vagrant)
        #     _describe -V 'vagrant-options' '(
        #         "destroy:Destroy a Vagrant virtual machine"
        #         "halt:Stop a Vagrant virtual machine"
        #         "provision:Provision a Vagrant virtual machine"
        #         "resume:Resume a suspended Vagrant virtual machine"
        #         "suspend:Suspend the state of a Vagrant virtual machine"
        #         "ssh:Ssh into a Vagrant virtual machine"
        #         "up:Stand up a Vagrant virtual machine"
        #         "--help:Show help for the specified command"
        #         "--list:List the available command options"
        #     )' && ret=0
        # ;;
        # (version)
        #     _describe -V 'version-options' '(
        #         "docker:Check the Docker version"
        #         "gradle:Check the Gradle version"
        #         "helm:Check the Helm version"
        #         "hugo:Check the Hugo version"
        #         "istio:Check the Istio version"
        #         "java:Check the Java version"
        #         "kind:Check the Kind version"
        #         "kubectl:Check the Kubectl version"
        #         "minikube:Check the Minikube version"
        #         "nodejs:Check the NodeJS version"
        #         "skaffold:Check the Skaffold version"
        #         "terraform:Check the Terraform version"
        #         "yarn:Check the Yarn version"
        #         "--all:Show the versions for all of the tools in the stack"
        #         "--help:Show help for the specified command"
        #         "--list:List the available command options"
        #     )' && ret=0
        # ;;
    esac
}

_dfm () {
    local cur=${words[CURRENT]}
    local curcontext="$curcontext" state
    integer ret=1
    typeset -A opt_args

    _arguments -C \
        '1: :->command' \
        '*:: :->option' && ret=0

    case $state in 
        (command)
            __dfm_commands && ret=0
        ;;
        (option)
            curcontext="${curcontext%:*:*}":dfm-${words[1]}:
            __dfm_options && ret=0
        ;;
    esac
    return ret
}

_dfm "$@"