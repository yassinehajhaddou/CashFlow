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
                                Text(sumOfItemsInMonth(month).formatted(.currency(code: "€")))
                                    .font(.title)
                                    .foregroundColor(.green)
                                    .padding()
                            }
                            
                            ScrollView {
                                ForEach(year.entries.filter { $0.month == month }) { entry in
                                    ForEach(entry.items) { item in
                                        AmountLayoutView(item: .constant(item))
                                            .padding(.bottom, 8)
                                    }
                                }
                            }
                            
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
                    addItem()
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
    
    func sumOfItemsInMonth(_ month: Int) -> Double {
        let entries = year.entries.filter { $0.month == month }
        let items = entries.flatMap { $0.items }
        return items.reduce(0, { $0 + $1.amount })
    }
    
    func addItem() {
        guard let amount = Double(newItemAmount), !newItemName.isEmpty else { return }
        let newItem = Item(name: newItemName, amount: amount)
        if let firstMonth = year.entries.first?.month {
            viewModel.addItem(year: year.year, month: firstMonth, item: newItem)
        }
        newItemName = ""
        newItemAmount = ""
    }
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "de_DE")
        return formatter
    }()
}

struct YearDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleItems = [Item(name: "Trinkgeld", amount: 100.00)]
        let sampleEntries = [FinancialEntry(month: 1, items: sampleItems)]
        let sampleYear = FinancialYear(year: 2024, entries: sampleEntries)
        MonthDetailView(year: sampleYear, viewModel: FinancialViewModel())
    }
}






