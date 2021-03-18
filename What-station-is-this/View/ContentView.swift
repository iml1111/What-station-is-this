//
//  ContentView.swift
//  What-station-is-this
//
//  Created by 신희재 on 2021/03/14.
//
// - 현재역 표시 버튼 -> 재수정 필요(노선 리사이징, 디자인 배치 등)
// - 설정 창 ?

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        return GeometryReader { gm in
            NavigationView {
                    ZStack {
                        Color.accentColor.edgesIgnoringSafeArea(.all)
                        VStack {
                            Text("지금 무슨 역이지?")
                                .font(.largeTitle)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.white)
                                .padding()
                                .padding(.top, 20)
                            Spacer().frame(height: gm.size.height / 3.5)
                            StationCard(station: testStartStation)
                            NavigationLink(
                                destination: SelectPageView()
                            ){
                                HStack {
                                    SearchPageButton()
                                }
                            }
                            Spacer().frame(height: gm.size.height / 3.5)
                        }
                    }
                    .navigationBarHidden(true)
                    //.navigationTitle("지금 무슨 역이지?")
                }
            }
        }
}


struct NavigationBarModifier: ViewModifier {

    var backgroundColor: UIColor?
    var titleColor: UIColor?

    init(backgroundColor: UIColor?, titleColor: UIColor?) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = backgroundColor
        coloredAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .white]

        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }

    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}

extension View {

    func navigationBarColor(backgroundColor: UIColor?, titleColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, titleColor: titleColor))
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
