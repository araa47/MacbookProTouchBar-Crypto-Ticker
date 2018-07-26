# Macbook Pro Touchbar Crytpo Ticker 


## Introduction

The following program is a simple guide that uses BetterTouchTool to display crypto currency prices on your macbook touchbar. The end result will look something like the image below. 


![alt text](/images/touchbar.jpg)

## What you will need 

You will need a macbook with touchbar and you will also need BetterTouchTool installed which you can find over here https://folivora.ai/


## Getting Started

1) Install better touch tool 

2) Install json-helper to make scripting easier, https://itunes.apple.com/dk/app/json-helper-for-applescript/id453114608?mt=12

3) Click the touchbar tab on BTT

4) Click on the +Widget button 

5) In the Select Widget drop down select Run Apple Script and Show Value, and click on Advanced configuration

6) Name the widget , for our first one we can call it "BTC"

7) Copy paste the following code

```
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
```

The above script simply calls the coinmarketcap api url endpoint for bitcoin and then parses the usdPrice value and rounds this value. You can look at the files inside the AppleScript folder for more examples.  

8) Save 

9) Now you can work on adding a cool logo. I found my logo's by going to coinmarketcap and downloading each coins logo

10) You can now simply add the logo by clicking on the logo option in BTT and dragging the corresponding image file. 

11) Now if you want to define an action when you click on the touchbar for this coin, you can simply define an action. I wanted mine to load up coinmarketcap bitcoin page, so i choose "run apple script (async in background)" in the "predfined action" section. 

12) Now I copy paste the following code to tell chrome to open the corresponding website.

```
tell application "Google Chrome"
	if it is running then
		open location "https://coinmarketcap.com/"
	else
		activate
		open location "https://coinmarketcap.com/"
		delay 1
		activate
	end if
end tell
```

13) Next I repeated steps 4-12 for all the other coins I wanted to track by simply chaning the url on the applescript to the corresponding coin I wanted to track. 

12) You are ready to go, you should have a crypto ticker active on your touchbar  


