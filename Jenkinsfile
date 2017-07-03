def GIT_CREDENTIAL_ID = "82aa1de0-eeca-4252-8d86-074bb8a684f0"
def PROJECT_USER = "svc-prj-argo"
def PROJECT_NAME = "argo"

node("jenkins-slave-asciidoctor"){

    stage("Checkout"){
        checkout scm

        retry(3){
            sshagent(["$GIT_CREDENTIAL_ID"]) {
                sh '''
                    export GIT_SSH_COMMAND="ssh -oStrictHostKeyChecking=no"
                    git submodule init
                    git submodule update --remote --merge

                '''
            }
        }
    }

    stage("Build documentation"){
        sh '''
            set -e
            jekyll build --config _config.production.yml
        '''
    }

    stage("Deploy documentation"){
        retry(3){
          sshagent(["$GIT_CREDENTIAL_ID"]) {
              sh("scp -r _site/* $PROJECT_USER@forge.b-com.com:/home/groups/$PROJECT_NAME/htdocs/")
          }
        }
    }
}
