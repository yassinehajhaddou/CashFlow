import SwiftUI

struct MonthDetailView: View {
  var year: FinancialYear
  @State private var currentMonth: Int = 1 // jetztiger Stand Januar
  @State private var newItemName: String = ""
  @State private var newItemAmount: String = ""
  @ObservedObject var viewModel: FinancialViewModel
    
  var body: some View {
    ZStack {
      LinearGradient(
        gradient: Gradient(colors: [
          Color(UIColor(red: 42/255, green: 60/255, blue: 152/255, alpha: 1)),
          Color(UIColor(red: 22/255, green: 31/255, blue: 75/255, alpha: 1))
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
      )
      .ignoresSafeArea()
        
      VStack {
        TabView(selection: $currentMonth) {
          ForEach(1...12, id: \.self) { month in
            VStack {
              HStack {
                Text(monthName(month))
                  .font(.title)
                  .foregroundColor(.white)
                  .padding()
                  
                Spacer()
                  
//                Text(sumOfItemsInMonth(month).formatted(.currency(code: "EUR")))
//                  .font(.title)
//                  .foregroundColor(sumOfItemsInMonth(month) >= 0 ? .green : .red)
//                  .padding()
              }
                
//              ScrollView {
//                ForEach(year.entries.filter { $0.month == month }) { entry in
//                  ForEach(entry.transactions) { item in
//                    TransactionView(item: .constant(item))
//                      .padding(.bottom, 8)
//                  }
//                }
//              }
              Spacer()
                
              Divider()
                .background(Color.white)
                .frame(width: 300)
                .padding(.horizontal)
              Spacer()
            }
          }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive))
          
        Button("NEUER EINTRAG") {
          
        }
        .frame(height: 50)
        .font(.title)
        .foregroundColor(.white)
        .cornerRadius(10)
        .padding()
      }
    }
  }
    
  func monthName(_ month: Int) -> String {
    return MonthDetailView.dateFormatter.monthSymbols[month - 1]
  }
//    
//  func sumOfItemsInMonth(_ month: Int) -> Double {
//    let entries = year.entries.filter { $0.month == month }
//    let items = entries.flatMap { $0.transactions }
//    return items.reduce(0, { $0 + $1.amount })
//  }
    
  private static let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "de_DE")
    return formatter
  }()
}

struct YearDetailView_Previews: PreviewProvider {
  static var previews: some View {
    let sampleItems = [
      Transaction(name: "Trinkgeld", amount: 200.00),
      Transaction(name: "Miete", amount: -500.00),
      Transaction(name: "Nebeneinkommen", amount: 3000.00),
      Transaction(name: "Lebensmittel", amount: -1200.00)
    ]
    let sampleEntries = [
      FinancialEntry(month: "Januar", transactions: sampleItems),
      FinancialEntry(month: "Februar", transactions: sampleItems),
      FinancialEntry(month: "März", transactions: sampleItems)
    ]
    let sampleYear = FinancialYear(year: "2024", entries: sampleEntries)
    MonthDetailView(year: sampleYear, viewModel: FinancialViewModel())
  }
}
