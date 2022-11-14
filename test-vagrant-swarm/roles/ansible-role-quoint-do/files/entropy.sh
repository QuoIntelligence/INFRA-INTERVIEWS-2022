#!/bin/sh
docker run --rm --name entropy --privileged=true -d alpine /bin/sh -c "apk add haveged; haveged -F"
exit $?