::netsh wlan set hostednetwork mode=allow ssid=smartaxent key=testwin10
::netsh wlan start hostednetwork
netsh wlan stop hostednetwork
::netsh wlan set hostednetwork mode=disallow
