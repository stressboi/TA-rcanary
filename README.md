# TA-rcanary
Simple ransomware canary for Splunk UF on Windows

This TA uses fschange, a deprecated feature of the Splunk UF (which does still work) to monitor a single randomly-named .docx file in a hidden directory on the Windows filesystem. Upon first run, the .docx file is created in this directory. Then, an fschange entry is added to the inputs.conf and every 15 seconds, this file is monitored for any changes. If any changes occur to it (copy of it, delete of it, rename of it, etc) an event is generated and indexed in Splunk, as shown below.

![alt text](https://github.com/stressboi/TA-rcanary/blob/main/rcanary1.png?raw=true)

Note: there is a filter regex so that you do not see false alerts for initial setup - basically, any output from sourcetype of "rcanary-fschange" is suspect!
Note: on some versions of UF the "host" value will be set to $decideOnStartup - in this case you may have to hard-code the machine hostname in the input stanza in inputs.conf.

brodsky@splunk.com
2JUL2021
