#!/bin/bash
sudo apt-get install protobuf-compiler python-pil python-lxml python-tk
pip3 install --user Cython
pip3 install --user contextlib2
pip3 install --user jupyter
pip3 install --user matplotlib
protoc object_detection/protos/*.proto --python_out=.
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
export PYTHONPATH=$PYTHONPATH:$SCRIPTPATH:$SCRIPTPATH/slim
echo Completed Install. Testing.
python object_detection/builders/model_builder_test.py
