#!/bin/bash
user=`whoami`
local_dir=/opt/dbcourse
remote_url=http://www.cs.duke.edu/courses/fall13/compsci316/vm/dbcourse.tgz
if [ $# -eq 1 ]; then
    remote_url=$1
fi

sudo mkdir -p $local_dir
sudo chown $user:$user $local_dir

echo "This script will download data into $local_dir/ and overwrite"
echo "its previous contents.  If you have created any contents, you"
echo "might want to save first (e.g., by copying them elsewhere)."
read -p "Do you wish to continue with download and overwrite $local_dir/ (y/n)? " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 0
fi

wget -O - $remote_url | tar xvfz - -C $local_dir
echo "Done."
