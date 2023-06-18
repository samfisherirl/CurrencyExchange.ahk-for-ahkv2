/*
url = "https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/{currencyCode}/{currencyCode}.json"

# Set the currency codes
from_currency = "USD"
to_currency = "EUR"
*/


/*
 *     
 * #Include getExchange.ahk
 * #Include _jxon.ahk
 * #Include WinHttpRequest.ahk

 * Ex := Exchange()
 * exchangeRate := Ex.getEx("USD", "EUR")

 * MsgBox(Ex.getCountryCodes())

 * US := Ex.getAllbyRef("USD")
 * MsgBox(US.string) ;every country and their rate
 * Msgbox(US.list["RUB"])
 * Sleep(1)
 

 *  @currency == country code found in symbols
 *  @method  Exchange.getEx(@currency, @currency2) => 1/rate of exchange
 *  @method  Exchange.getCountryCodes() => this.country_code_string (all)
 *                                             => this.symbols Map(key:countrycode, val:country long name)  (all)
 *  @method  Exchange.getEx(@currency, @currency2) => 1/rate of exchange
 *  @method  Exchange.getAllbyRef(@cur)(@currency, @currency2) => 1/rate of exchange
 */
class Exchange {
    __New() {
        this.api := WinHttpRequest()
        this.storage := ""
        this.Rate := ""
        this.symbols := Map()
        this.country_rate_map := Map()
        this.exchangeRate := Map() ; Map(countries, rate) exchangeRate["rates"]
        this.country_exchange_string := ""
        this.country_codes := ""
    }
    getEx(currencyA, currencyB) {
        storage := this.api.request(Format("https://api.exchangerate.host/latest?symbols={1},{2}/.json", currencyA, currencyB))
        exchangeRate := Jxon_Load(&storage)
        for country, rate in exchangeRate["rates"] {
            this.exchangeRate := Map(country, rate)
            break
        }
        return this.exchangeRate
    }
    getCountryCodes() {
        symbols := this.api.request("https://api.exchangerate.host/symbols")
        temp := Jxon_Load(&symbols)
        symbols := temp["symbols"]
        x := 0
        for country, key in symbols {
            x += 1
            if x > 1 {
                endOfline := "`n"
                x := 0
            }
            else {
                endofLine := " || "
            }
            if key["description"] {
                this.symbols.Set(key["code"], key["description"])
                this.country_codes .= key["code"] " => " key["description"] endofLine
            }
        }
        return this.country_codes

    }


    getAllbyRef(cur) {
        storage := this.api.request(Format("https://api.exchangerate.host/latest?base={1}", cur))
        symbols := Jxon_Load(&storage)
        x := 0
        for country, rate in symbols["rates"] {
            x += 1
            if x > 1 {
                endOfline := "`n"
                x := 0
            }
            else {
                endofLine := " || "
            }
            if country {

                this.country_rate_map.Set(country, rate)
                this.country_exchange_string .= country " => " rate endofLine
            }
        }
        country := {
        list: this.country_rate_map,
        string: this.country_exchange_string
        }
        return country
    }

    getEur() {
        return "https://api.exchangerate.host/latest"
    }

}