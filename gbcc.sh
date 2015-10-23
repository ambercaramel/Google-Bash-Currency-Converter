#!/bin/bash
wget https://currency-api.appspot.com/api/BTC/GBP.json?amount=0.313 -o wgetlog --output-document=tmp0
# -o surpresses output to stderror and creates a log
# the log should get replaced each time rather than grow in size
sed 's/^{.*.amount"://' tmp0 > tmp1
sed 's/,"m.*//' tmp1 >tmp2
# sed aka stream editor chops off the useless stuff, essentially parsing the downloaded string.
echo -n £
# -n prevents a newline, so we can get the desired display e.g. £150.00 rather than £ on one line and 150.00 on the next
cat tmp2
# tmp2 now contains the number which represents how much currency we have
# however, if the downloaded number ends in a zero, e.g $123.40, then the last zero 
# will have been truncated at this point.
# if you set "amount" to 1, then this represents the conversation rate, e.g. GBP per USD
rm tmp1
rm tmp2
rm tmp0
# remove my inelegant temporary files
echo
# restart the command prompt on a new line
