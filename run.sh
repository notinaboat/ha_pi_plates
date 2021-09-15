#!/usr/bin/with-contenv bashio

echo Hello Pi Plates!

python3 -c "import piplates.RELAY as R ; R.getID(0)"
#python3 -m http.server 8492
