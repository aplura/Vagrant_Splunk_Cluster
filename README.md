Let's use vagrant to auto-provision a Splunk Clustered Environment.

* 1 Master Node
* 3 Indexers
* 3 Search Heads

#How-To
Simply run init.sh. This takes about 15 minutes on my machine. The virtual machines use an internal network to communicate with each other, but can also communicate to the outside if needed. The subnet is 10.10.50.0/24. You can access each individual machine using its corresponding port based by IP. In other terms, if the machine IP is 10.10.50.130, the local port to access it is 50130. Any number from 50130-5139 is reserved for any other port that may be needed on that machine. These systems are Cent OS 7 (x64) running Splunk 6.2.3. This can be changed by editing the local variables at the top of the Vagrantfile. Each VM can be ssh'd into using the command "vagrant ssh <hostname>". In the list below, each <hostname> is the first bullet point. master, idx1, idx2, etc. 

The license is a Trial License, so License Master will not work until you grant a valid license.

The Vagrantfile will stand up the entire Indexer Cluster, Search Head Cluster, and Master Node, and configure each as needed.

* master
    * VM IP: 10.10.50.130
    * Web: https://127.0.0.1:50130
    * Management: https://127.0.0.1:50131
    * Functions: Master Node, License Master (Trial license), Deployer.
* idx1
    * VM IP: 10.10.50.100
    * Web: https://127.0.0.1:50100
    * Management: https://127.0.0.1:50101
    * Functions: Indexer
* idx2
    * VM IP: 10.10.50.110
    * Web: https://127.0.0.1:50110
    * Management: https://127.0.0.1:50111
    * Functions: Indexer
* idx3
    * VM IP: 10.10.50.120
    * Web: https://127.0.0.1:50120
    * Management: https://127.0.0.1:50121
    * Functions: Indexer
* shc1
    * VM IP: 10.10.50.140
    * Web: https://127.0.0.1:50140
    * Management: https://127.0.0.1:50141
    * Functions: Search Head
* shc1
    * VM IP: 10.10.50.150
    * Web: https://127.0.0.1:50150
    * Management: https://127.0.0.1:50151
    * Functions: Search Head
* shc3
    * VM IP: 10.10.50.160
    * Web: https://127.0.0.1:50160
    * Management: https://127.0.0.1:50161
    * Functions: Search Head, Captain


#REQUIREMENTS:
* vagrant
* virtualbox

#Run time:
real	14m25.687s
user	0m22.346s
sys	0m10.949s

