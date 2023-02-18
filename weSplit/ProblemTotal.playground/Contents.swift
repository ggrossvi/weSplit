import SwiftUI
import PlaygroundSupport

let problemTotal = 42.99
let fixedTotal   = 42.12

// Original code with deprecated currencyCode
let problem = Text(problemTotal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))

// Updated code with currency.identifier
let fixed   = Text(fixedTotal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))

struct CurrencyView: View {
    var body: some View {
        VStack(spacing: 12) {
            problem  // <- This is the view with the deprecated currency
            fixed    // <- This is the updated code.
        }
    }
}

PlaygroundPage.current.setLiveView(CurrencyView() )  // <-
