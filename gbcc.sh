#!/bin/bash
rm GBP.json?amount=0.3131
wget https://currency-api.appspot.com/api/BTC/GBP.json?amount=0.3131 -o wgetlog

# cat GBP.json?amount=0.3131  this is test code
sed 's/{"success":true,"source":"BTC","target":"GBP","rate":164.0811,"amount"://' GBP.json?amount=0.3131 > tmp1
sed 's/,"message":""}//' tmp1 >tmp2
echo -n £
cat tmp2
rm tmp1
rm tmp2
echo
