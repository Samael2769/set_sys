#!/usr/bin/bash

dir=$`pwd`/
sed -i 's:REPLACE-WITH-PATH:'`pwd`':' set_sys
chmod +x set_sys
cp set_sys /usr/bin/