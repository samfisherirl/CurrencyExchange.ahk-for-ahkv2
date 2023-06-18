# CurrencyExchange.ahk-for-ahkv2

Currency Exchange API
This repository contains a script written in AutoHotkey (AHK) that utilizes the Currency Exchange API to retrieve exchange rates between different currencies. The script is designed to work with the API provided by https://api.exchangerate.host/.

Prerequisites
To use this script, ensure that you have the following:

AutoHotkey installed on your system
Required AHK libraries: getExchange.ahk, _jxon.ahk, and WinHttpRequest.ahk
Usage
Include the necessary AHK libraries at the beginning of your script:

```autohotkey 
#Include getExchange.ahk
#Include _jxon.ahk
#Include WinHttpRequest.ahk
```


Create an instance of the Exchange class:
```autohotkey
Ex := Exchange()
```


Get the exchange rate between two currencies:
```autohotkey 
exchangeRate := Ex.getEx("USD", "EUR")
```

Display all available country codes:
```autohotkey 
MsgBox(Ex.getCountryCodes())
```

Retrieve exchange rates for all countries using a specific currency as the reference:
```autohotkey 
US := Ex.getAllbyRef("USD")
MsgBox(US.string) ; Displays every country and their exchange rate
MsgBox(US.list["RUB"]) ; Retrieve the exchange rate for a specific country
Class Methods
Exchange.getEx(@currencyA, @currencyB): Retrieves the exchange rate between two currencies and returns it as 1/rate of exchange.
```

Exchange.getCountryCodes(): Retrieves all available country codes and their corresponding long names. Returns a string containing the country codes and descriptions.

Exchange.getAllbyRef(@cur): Retrieves exchange rates for all countries using the specified currency as the reference. Returns a map with country codes as keys and exchange rates as values.

Note
Make sure to replace the @currencyA and @currencyB placeholders in the Exchange.getEx() method with the desired currency codes.

For more information about the Currency Exchange API, refer to the official documentation at https://api.exchangerate.host/.





