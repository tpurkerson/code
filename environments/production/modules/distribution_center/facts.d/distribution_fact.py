#!/usr/bin/env python
import socket;
hname = socket.gethostname()

if hname=="pe-201642-master.puppetdebug.vlan":
  data = { "distrib_center" : "Portland" }
else:
  data = { "distrib_center" : "Eugene" }

for k in data:
    print "%s=%s" % (k,data[k])

