pushd () {
  command pushd "$@" > /dev/null
}

popd () {
  command popd "$@" > /dev/null
}

pushd /mnt/c/Users/benfi/Programming/routeros/
source .venv/bin/activate
python dhcp.py
deactivate
popd

