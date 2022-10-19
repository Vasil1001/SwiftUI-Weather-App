//
//  ForecastFiveDays.swift
//  CW2WeatherAPI
//
//  Created by Vasil Dzhakov on 12/05/2022.
//

import SwiftUI

struct ForecastFiveDays: View {
    @State var location: String
    @State var apiData: forecastWeather?
    @State var dateFormat: Date = Date()
    
    var body: some View {
        ZStack {
            Image("screenBackground")
            Color(red: 0.12, green: 0.2417, blue: 0.34)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("Forecast")
                        .font(.title)
                        .bold()
                        .padding(.leading, 29)
                        .foregroundColor(.white)

                    Spacer()

                }
                HStack {
                    
                    Text("\(location)")
                        .font(.title)
                        .padding(.leading, 29)
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                
                List(apiData?.list ?? []) { segment in
                    HStack {
                        
                        Text(formatDate(date: segment.dt))
                            .padding(.leading)
                        
                        Spacer()
                        
                        AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(segment.weather.last?.icon ?? "02n")@2x.png")) { image in
                            image
                                .resizable()
                        } placeholder: {
                            Color.clear
                        }.frame(width: 100, height: 100)
                        
                        Spacer()
                        
                        Text(segment.main.temp.description)
                            .font(.title)
                        Text("°")
                            .padding(.trailing)
                        
                    }
                    .frame(minWidth:325)
                    .padding(3)
                    .background(Color.cyan.opacity(0.5))
                    .cornerRadius(20)
                }
            }
        }
        .onAppear {
            getForecastW()
        }
//        .navigationTitle("Forecast").shadow(radius: 3)
        
        .toolbar {
            Text("\(location)")
                .foregroundColor(.white)

        }
        Spacer()
    }
    
    func formatDate(date: Int) -> String {
        
        //Formatting code from video
        let utcDateFormatter = DateFormatter()
        
        //https://www.codegrepper.com/code-examples/swift/format+date+swiftui
        utcDateFormatter.dateFormat = "E MMM d, h:mm a"
        
        let formattedDate = Date(timeIntervalSince1970: Double(date))
        
        let dateShorten = (utcDateFormatter.string(from: formattedDate))
        
        return ("\(dateShorten)")
    }
    
    func getForecastW() {
        
        let url = forecastSetLocationURLString(location: "\(location.replacingOccurrences(of: " ", with: "+"))")
        //getForecast(city: "London")
        get3HSegmentsForecast(url: url){ _ in
            apiData = forecast3HSegments
            //print("Days ..... \(days?.list.description)")
        }
    }
    
    //struct _DayForecast_Previews: PreviewProvider {
    //    static var previews: some View {
    //        ForecastFiveDays(location: "London", data: "sd")
    //    }
    //}
}
