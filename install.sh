set -e
python3 -m build
pip3 install ./dist/*whl --force-reinstall
rm -r ./dist/ ./runnr.egg-info/

