//
//  ContentView.swift
//  SelectMonthAndYear
//
//  Created by Cem Saltık on 26.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var show = false

    var body: some View {
        
        
        ZStack {
            Button(action: {
                show.toggle()
                
//                var month = MonthPicker().monthSelection
//                var year = MonthPicker().yearSelection
//                var strMonth = String(month)
//
//                print(year)
            }, label: {
                Text("Select Month")
                    .bold()
                    .foregroundColor(Color.white)
                    .frame(width: 200, height: 50)
                    .background(Color.blue)
            })
            .sheet(isPresented: $show) {
                MonthPicker()
            }



//            BottomCard(cardShown: $cardShown, cardDismisal: $cardDismisal) {
//                 CardContent()
//                    .padding()
//            }
        }
        
        
    }
}

struct MonthPicker: View {
    
    @State var monthSelection = 1
    @State var yearSelection = 2022
    @State var cardShown = false
    @State var cardDismisal = false

    var months = [Int](0..<13)
    var years = [Int](0..<2090)
    
    private let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.usesGroupingSeparator = false
        return nf
    }()
    
    var body: some View {

        GeometryReader { geometry in
            HStack{
                Picker(selection: self.$monthSelection, label: Text("")) {
                    ForEach(1 ..< 13) { index in
                         
                        switch index {
                        case 1:
                            Text("January")
                        case 2:
                            Text("February")
                        case 3:
                            Text("March")
                        case 4:
                            Text("April")
                        case 5:
                            Text("May")
                        case 6:
                            Text("June")
                        case 7:
                            Text("July")
                        case 8:
                            Text("August")
                        case 9:
                            Text("September")
                        case 10:
                            Text("October")
                        case 11:
                            Text("November")
                        case 12:
                            Text("December")
                        default:
                            Text("Test")
                        }

                    }
                }
                .frame(width: geometry.size.width/2, height: 100, alignment: .center)
                .pickerStyle(WheelPickerStyle())
                
                Picker(selection: self.$yearSelection, label: Text("")) {
                    ForEach(1800 ..< 2050) { index in
                        Text( "\(self.yearString(at: index))" )
                    }
                }
                .frame(width: geometry.size.width/2, height: 750, alignment: .center )
                .pickerStyle(WheelPickerStyle())
            }
        }
    }
    
    func monthString(at index: Int) -> String {
        let selectedMonth = months[index]
        return numberFormatter.string(for: selectedMonth) ?? selectedMonth.description
    }
    
    func yearString(at index: Int) -> String {
        let selectedYear = years[index]
        return numberFormatter.string(for: selectedYear) ?? selectedYear.description
    }
}

//struct CardContent: View {
//    var body: some View {
//         Text("Select Month")
//            .bold()
//            .font(.system(size: 30))
//    }
//}
//
//struct BottomCard<Content: View>: View {
//    let content: Content
//    @Binding var cardShown
//    @Binding var cardDismisal
//
//
//    init(cardShown: Binding<Bool>,
//         cardDismisal: Binding<Bool>,
//        @ViewBuilder content: () -> Content
//    ) {
//        _cardDismisal = cardDismisal
//        _cardShown = cardShown
//        self.content= content()
//    }
//
//    var body: some View {
//        ZStack {
//            GeometryReader { _ in
//                EmptyView()
//            }
//            .background(Color.red.opacity(0.3))
//            .opacity(cardShown ? 1 : 0)
//            .animation(Animation.easeIn)
//            .onTapGesture {
//
//            }
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
