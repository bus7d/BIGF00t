# BIGF00t
BIGF00t.sh is a FootPrinting Tool to handle large masscan output


BIGF00t.sh is meant to be used when scanning a wide scope of IPs and ports with masscan so nmap too


https://github.com/robertdavidgraham/masscan

----------

FEATURES:

----------
_Open TCP Ports found: BIGF00t.sh display the number of open TCP Ports on the range(s)

_Tcp Port Number List: BIGF00t.sh make a list of TCP Port Numbers

_Alive Host List: BIGF00t.sh make a list of alive hosts

_Host Port Ranking: BIGF00t.sh make a list of alive hosts by number of open ports descending

_Host Files: BIGF00t.sh creates one file for each alive IP found with a list of their open ports

_Host by Open Port Search Engine: BIGF00t.sh allow you to list and enumerate hosts IPs by ports + create a file with the search result

------------

REQUIREMENTS:

--------------
_mkdir BIGF00t

_copy/paste BIGF00t.sh in BIGF00t/ directory

_Launch masscan and add ">>largescan.dat" at the end of your masscan or nmap -n -v command

_copy largescan.dat to BIGF00t/ directory

_chmod 755 BIGF00t.sh

_ ./BIGF00T.sh

-------------------
