#mvn install:install-file
#-Dfile=<path-to-file>
#-DgroupId=<group-id>
#-DartifactId=<artifact-id>
#-Dversion=<version>
#-Dpackaging=<packaging>
#-DgeneratePom=true

#example: sh ./dev-script/mvn-import.sh /e/download/stanford-corenlp-full-2015-12-09/stanford-corenlp-3.6.0-models.jar edu.stanford.nlp stanford-corenlp-models 3.6.0

mvn install:install-file -Dfile=$1 -DgroupId=$2 -DartifactId=$3 -Dversion=$4 -Dpackaging=jar -DgeneratePom=true