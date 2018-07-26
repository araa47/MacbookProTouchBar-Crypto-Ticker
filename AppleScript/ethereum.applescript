tell application "JSON Helper"
	
	
	set jsonData to fetch JSON from "https://api.coinmarketcap.com/v1/ticker/ethereum"
	set jsonData to item 1 of jsonData
	set priceUsd to price_usd of jsonData
	set priceUsd to round (priceUsd)
	return "$" & priceUsd
	#set percentage_change to percent_change_24h of jsonData
	
end tell