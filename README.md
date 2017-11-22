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

USAGE: $0 [-hcspf] [-a <adapter>] [-d <rate>] [-u <rate>] [-t <delay>] [-j <jitter>] [-J <corelation>] [-l <loss>] [-m <value>]

trafficcontroller [-hcspf] [-a <adapter>] [-d <rate>] [-u <rate>] [-t <delay>] [-j <jitter>] [-J <corelation>] [-l <loss>] [-m <value>]

The following command line options are allowed:

- `-h` Display help

- `-a <adapter>` Set the adapter

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


OPTIONS:
   -h               Show this message  
   -a <adapter>     Set the adpter  
   -d <rate>        Set maximum download rate (in Kbps)  
   -u <rate>        Set maximum upload rate (in Kbps)  
   -t <delay>       Set latency (in ms)  
   -j <jitter>      Set (average) latency variation (jitter) (in ms)  
                    Use with -t option.   
   -J <corelation>  Set jitter corelation (in %) or 0 for normal  
                    distribution  
                    Use with -j option   
   -l <loss>        Set packet loss (in %)  
   -m <value>       Set mean loss burst size factor. Valid values:  
                    4.00 3.33 3.00 2.85 2.50 2.22 2.00 1.82 1.66 1.54   
                    1.50 1.43 1.33 1.30 1.25 1.17 1.11 1.05 1.00  
   -f               Use fair queuing - SFQ instead od pfifo   
   -p               Use presets in /etc/conf.d/trafficcontroller.conf  
   -c               Clear the limits from adapter  
   -s               Show the current status of adapter  



The different modes are:

	trafficcontroller -a <adapter> -d <rate> -u <rate>

	trafficcontroller -c -a <adapter>

	trafficcontroller -s -a <adapter>

Some examples:

	#Limit bandwith  

	trafficcontroller -a eth0 -d 1024 -u 512  

	#Include delay and jitter  

	trafficcontroller -a eth0 -t 120 -j 30  

	#Include packet loss  

	trafficcontroller -a eth0 -l 50  

	#Clear all settings  

	trafficcontroller -c -a eth0  
