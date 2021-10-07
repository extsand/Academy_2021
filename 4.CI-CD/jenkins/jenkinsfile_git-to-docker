pipeline {
    agent any
		// agent {
		// 	label: python
		// }


		// chek git repo every minute
    triggers {
			// every 1 minute
			pollSCM('* * * * *')
			// every 10 sec
			// pullSCM('*/0.5 * * * *')
		}

    environment {
        PROJECT = "docker.page"
        DESCRIPTIONS = "GitHub -> Jenkins -> Docker -> -> AWS"
        OWNER = "extsand"
        GIT_REPO = "https://github.com/extsand/docker_page.app.git"  
				DOCKER_HUB_IMAGE_NAME = "extsand/academy_docker.page:latest"
    } 

		options {
        buildDiscarder(logRotator(
					numToKeepStr: '3', 
					artifactNumToKeepStr: '3'
					))
        timestamps()
    }

    stages {
        stage('Introducting') {
            steps {
                echo "Hello User!\n It is ${PROJECT} project.\n We will use pipeline ${DESCRIPTIONS}.\n You can see files in ${GIT_REPO}."
            }
        }

				stage('Clone Git Repository'){
					steps {
						echo '======== Clone app from git Repository ============='
						echo "Get app files from ${GIT_REPO}"
						git branch: 'main', 
						credentialsId: 'extsand_git_credentials', 
						url: 'git@github.com:extsand/page.app.git'
					}
				}
				stage('DockerHub login'){
					steps{
						echo '============ Log in Docker Hub ===================='
						withCredentials(
							[usernamePassword(
									credentialsId: 'dockerhub_extsand', 
									passwordVariable: 'dockerhub_password', 
									usernameVariable: 'dockerhub_username')]) {
								// Login to dockerhub
								sh 'docker login -u $dockerhub_username -p $dockerhub_password '
						}
					}
				}

				stage('Create docker image'){
					steps {
						echo '=========== Start docker to build docker image ============'
						dir ('./docker.page'){
							// sh 'docker-compose build'
							// sh 'docker-compose up'	
							// sh 'docker build .'
							// add tag from docker-hub
							sh 'docker build -t $DOCKER_HUB_IMAGE_NAME . '
						}
					}
				}

				stage('Publish docker image'){
					steps {
						echo '=========== Push Docker image to DockerHub ============'
						sh 'docker push $DOCKER_HUB_IMAGE_NAME'
					}
				}

				stage('Upload docker to Local server'){
					steps {
						echo '=========== Set Docker image in local server ============'
						sshPublisher(
							publishers: [
								sshPublisherDesc(
									configName: 'VM_192.168.1.6', 
									transfers: [
										sshTransfer(
											cleanRemote: false, 
											excludes: '', 
											// execCommand: '''docker-compose build; docker-compose up -d''', 
											execCommand: '''cd /home/alpha/docker_workfolder; docker-compose build; docker-compose up ''', 
											// execCommand: '''whoami; id ; who ''', 
											execTimeout: 1200000, 
											flatten: false, 
											makeEmptyDirs: false, 
											noDefaultExcludes: false, 
											patternSeparator: '[, ]+', 
											remoteDirectory: '', 
											remoteDirectorySDF: false, 
											removePrefix: '', 
											sourceFiles: 'docker-compose.yaml'
										)
									], 
									usePromotionTimestamp: false, 
									useWorkspaceInPromotion: false, 
									verbose: true
								)
							]
						)
						

					}
				}

		








    





    
    }
    
}