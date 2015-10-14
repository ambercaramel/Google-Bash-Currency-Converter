#!/bin/bash
wget https://currency-api.appspot.com/api/BTC/GBP.json?amount=0.3131 -o wgetlog  
# -o surpresses output to stderror and creates a log
# the log should get replaced each time rather than grow in size
sed 's/{"success":true,"source":"BTC","target":"GBP","rate":164.0811,"amount"://' GBP.json?amount=0.3131 > tmp1
sed 's/,"message":""}//' tmp1 >tmp2
# sed aka stream editor chops off the useless stuff, essentially parsing the downloading string.
echo -n £
# -n prevents a newline, so we can get the desired display e.g. £150.00 rather than £ on one line and 150.00 on the next
cat tmp2
# tmp2 now contains the number which represents how much currency we have
# if you set "amount" to 1, then this represents the conversation rate, e.g. GBP per USD
rm tmp1
rm tmp2
rm GBP.json?amount=0.3131
# remove my inelegant temporary files
echo
# start the command prompt on a new line
