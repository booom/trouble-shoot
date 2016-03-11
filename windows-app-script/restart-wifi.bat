netsh wlan stop hostednetwork
netsh wlan set hostednetwork mode=disallow

netsh wlan set hostednetwork mode=allow ssid=wifissid key=passwd
netsh wlan start hostednetwork
