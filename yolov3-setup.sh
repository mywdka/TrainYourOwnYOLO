#!/bin/bash
NAME='TrainYourOwnYOLO'

helpFunction()
{
  echo ""
  echo "Usage: $0 -f folder"
  echo -e "\t-f Folder where YOLOv3 should be installed. eg. ~/MachineLearning"
  exit 1
}

while getopts "f:" opt
do
  case "$opt" in
    f ) FOLDER="$OPTARG" ;;
    ? ) helpFunction ;; # print help function in case parameter is non-existent
  esac
done

# print helpFunction in case parameters are empty
if [ -z  "$FOLDER" ]
then
  echo "Some or all of the required parameters are empty"
  helpFunction
fi

# begin script if required parameters are present
echo "$FOLDER"

# clone git
git clone https://github.com/mywdka/TrainYourOwnYOLO.git $FOLDER/$NAME

# setup conda env
cd $FOLDER/$NAME
conda env create -f yolov3.yml

echo "[DONE]"
echo -e "\tProject is installed at: $FOLDER/$NAME/"