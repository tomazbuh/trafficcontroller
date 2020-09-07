The Traffic Controller 1.0
==============

Copyright
-------------
Tomaz Buh <hubber.devel@gmail.com>
bert hubert <ahu@ds9a.nl> http://lartc.org/wondershaper (c) Copyright 2002
magnific0 http://www.github.com/magnific0 (c) Copyright 2012
Licenced under the GPL

About
--------------

Traffic Controller is a script that allows the user to modify several factors of network traffic handling on a system. It does so by using iproute's tc command, but greatly simplifies its operation. It modifies factors such as: bandwidth, latency, jitter, packet loss and mean loss burst size. It can also use SFQ mechanism to shape traffic. Traffic Controller is based on Wonder Shaper tool which was first released by Bert Hubert in 2002 and then updated by magnific0 http://www.github.com/magnific0. The old REDAME files are also included for those who'd like some more background information.



Installation
--------------

You can run trafficcontroller (as any user with sufficient permissions) without
installation. However if you want to install the script onto your system you can
simply run:

        sudo make install

Usage
--------------

trafficcontroller [-hcspf] [-a <adapter>] [-d <rate>] [-u <rate>] [-t <delay>] [-j <jitter>] [-J <corelation>] [-l <loss>] [-m <value>] [-i <src_port,...>] [-o <dst_port,...>] [-r <src_port:dst_port,...>] <-b> <-c> <-s> <-f>

The following command line options are allowed:

- `-h` Display help

- `-a <adapter>` Set the adapter

- `-b <protocol,...>` Apply impairments on specific protocols. Otherwise all traffic is impaired. 
                      Currently supported protocol filters: icmp, udp and tcp). 
                      To specify ports for tcp and udp see options: -i, -o and -r. Otherwise 
                      all ports will be used. 
- `-w <type>`         Select interface/traffic types for applying filters.
                      Currently supported types: all (default), ip and vlan). 
                      By default 'all' interface types are fitered. If you specify 'vlan' only
                      vlan tagged traffic will be impaired, if you specify 'ip' only untagged 
                      traffic will be impaired.
- `-i <port,...>`     Set source port numbers for tcp or udp (see -b)
                      (if no protocol is specified with -b option both protocols are selected)
- `-o <port,...>`     Set destination port numbers for tcp or udp (see -b)
                      (if no protocol is specified with -b option both protocols are selected)
- `-r <srcp:dstp,...>`Set source/destination port number pairs for tcp or udp (see -b)
                      (if no protocol is specified with -b option both protocols are selected)

- `-d <rate>` Set maximum download rate (in Kbps)

- `-u <rate>` Set maximum upload rate (in Kbps)

- `-t <delay>` Set latency (in ms)

- `-j <jitter>` Set (average) latency variation (jitter) (in ms)
		Use with -t option.
 
- `-J <corelation>` Set jitter corelation (in %) or 0 for normal
		    distribution. Use with -j option.  

- `-l <loss>` Set packet loss (in %). 

- `-m <value>` Set mean loss burst size factor. Valid values:
                    4.00 3.33 3.00 2.85 2.50 2.22 2.00 1.82 1.66 1.54
                    1.50 1.43 1.33 1.30 1.25 1.17 1.11 1.05 1.00 

- `-f` Use fair queuing - SFQ instead od pfifo. 

- `-p` Use the presets in /etc/conf.d/trafficcontroller.conf

- `-c` Clear the limits from adapter

- `-s` Show the current status of adapter

The different modes are:

	trafficcontroller -a <adapter> -d <rate> -u <rate>

	trafficcontroller -c -a <adapter>

	trafficcontroller -s -a <adapter>

Some examples:

	#Limit bandwith  

	trafficcontroller -a eth0 -d 1024 -u 512  

	#Include delay and jitter  

	trafficcontroller -a eth0 -t 120 -j 30  
	
        #Specify the same impairment on traffic on ip traffic with source port 6000 AND destination port 7000  

	trafficcontroller -a eth0 -t 120 -j 30  -r 6000:7000
	
        #Specify the same impairment on traffic on ip traffic with destination port 5060

	trafficcontroller -a eth0 -t 120 -j 30  -o 5060
        
        #Specify the same impairment on traffic on udp and icmp traffic with destination port 5060
	trafficcontroller -a eth0 -t 120 -j 30  -o 5060 -b udp,icmp

	#Include packet loss  

	trafficcontroller -a eth0 -l 50  

	#Clear all settings  

	trafficcontroller -c -a eth0  
