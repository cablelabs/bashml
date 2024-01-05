#! /bin/bash
cd dist
PORT=${1:-8888}
python3 -m http.server ${PORT}
