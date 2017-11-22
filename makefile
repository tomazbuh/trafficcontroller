trafficcontroller:
	exit
install:
	install -Dm744 trafficcontroller /usr/bin/trafficcontroller
	install -Dm644 trafficcontroller.service /usr/lib/systemd/system/trafficcontroller.service
	install -Dm644 trafficcontroller.conf /etc/conf.d/trafficcontroller.conf
clean:
	rm -f trafficcontroller
