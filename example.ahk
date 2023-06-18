#Include getExchange.ahk
#Include _jxon.ahk
#Include WinHttpRequest.ahk

Ex := Exchange()
exchangeRate := Ex.getEx("USD", "EUR")

MsgBox(Ex.getCountryCodes())

US := Ex.getAllbyRef("USD")
MsgBox(US.string) ;every country and their rate
Msgbox(US.list["RUB"])
Sleep(1)
