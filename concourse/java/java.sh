#!/bin/sh
# we don't to anything with the artifact yet - we just want to build it.
set -ueo pipefail

export GREEN='\033[1;32m'
export NC='\033[0m'
export CHECK="√"
export M2_LOCAL_REPO=".m2"

mvn -f source/pom.xml install 
echo -e "${GREEN}${CHECK} Maven install${NC}"

cp -a source/target/devops-exam-app-1.0-SNAPSHOT.jar ./app/devops-exam-app-1.0-SNAPSHOT.jar
cp -a source/Dockerfile ./app/Dockerfile
