//
//  SwiftUIPhoneNumber.swift
//  
//
//  Created by Shanezzar on 06/08/2021.
//
//

import SwiftUI

@available(iOS 13.0, *)
public struct SwiftUIPhoneNumber : View {
    @Binding var countryCode: String
    @Binding var phoneNumber: String
    
    let placeholder: String
    let height: CGFloat
    let backgroundColor: Color
    let textColor: Color
    let textFont: Font
    let titleColor: Color
    let countryColor: Color
    let titleFont: Font
    let countryFont: Font
    
    @State var countryFlag = ""
    @State var y: CGFloat = 0
    
    public init(countryCode: Binding<String>, phoneNumber: Binding<String>, placeholder: String = "Phone Number", height: CGFloat = 600, backgroundColor: Color = Color.white, textColor: Color = Color.black, textFont: Font = Font.body, titleColor: Color = Color.black, countryColor: Color = Color.black, titleFont: Font = Font.title, countryFont: Font = Font.body) {
        self._countryCode = countryCode
        self._phoneNumber = phoneNumber
        
        self.placeholder = placeholder
        self.height = height
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.textFont = textFont
        self.titleColor = titleColor
        self.countryColor = countryColor
        self.titleFont = titleFont
        self.countryFont = countryFont
    }
    
    public var body: some View {
        ZStack {
            HStack (spacing: 0) {
                Text("\(countryFlag) +\(countryCode)")
                    .foregroundColor(textColor)
                    .font(textFont)
                    .onTapGesture {
                        withAnimation (.spring()) {
                            self.y = 0
                        }
                    }
                
                TextField(placeholder, text: $phoneNumber)
                    .keyboardType(.phonePad)
                    .foregroundColor(textColor)
                    .font(textFont)
                    .padding()
            }.padding()
            
            CountryCodes(countryCode: $countryCode, countryFlag: $countryFlag, y: $y, height: height, backgroundColor: backgroundColor, titleColor: titleColor, countryColor: countryColor, titleFont: titleFont, countryFont: countryFont)
                .offset(y: y)
        }
        .onAppear {
            countryFlag = "🇦🇺"
            countryCode = "61"
            self.y = height/2
        }
    }
}
