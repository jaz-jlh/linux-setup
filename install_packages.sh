sudo apt-get update && sudo apt-get install -y $(awk '{print $1'} packages.txt)
