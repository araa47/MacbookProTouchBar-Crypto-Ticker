set mJson to do shell script "curl -s 'https://api.coinmarketcap.com/v1/ticker/bitcoin/'"
set AppleScript's text item delimiters to {","}
set keyValueList to (every text item in mJson) as list
set AppleScript's text item delimiters to ""

set theKeyValuePair to item 5 of keyValueList
set AppleScript's text item delimiters to {": "}
set theKeyValueBufferList to (every text item in theKeyValuePair) as list
set AppleScript's text item delimiters to ""
set usdPrice to item 2 of theKeyValueBufferList
set usdPrice to text 2 thru -2 of usdPrice
set usdPrice to round (usdPrice)
return "$" & usdPrice