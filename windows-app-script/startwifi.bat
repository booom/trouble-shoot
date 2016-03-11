netsh wlan stop hostednetwork
netsh wlan set hostednetwork mode=disallow

netsh wlan set hostednetwork mode=allow ssid=zenwit key=win10test
netsh wlan start hostednetwork
