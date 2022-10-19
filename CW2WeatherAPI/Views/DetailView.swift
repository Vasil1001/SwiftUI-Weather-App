//
//  DetailView.swift
//  CW2WeatherAPI
//
//  Created by Vasil Dzhakov on 11/05/2022.
//

import SwiftUI

struct DetailView: View {
    @State var weatherForView: Weather?
    @State var location: String = ""
    @State var presentAlert = false
    
    @FocusState private var nameIsFocused: Bool
    
    var body: some View {
        ZStack {
            
            RadialGradient(gradient: Gradient(colors: [.pink, .orange]), center: .center, startRadius: 5, endRadius: 500)
                .ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 40)
                .fill(.cyan)
                .offset(y: 320)
            
            VStack {
                HStack {
                    Text("Detailed weather")
                        .font(.headline)
                    
                    Spacer()
                }.padding(.horizontal)
                HStack {
                    TextField("Enter Location", text: $location)
                    //.padding(30)
                    //.frame(height: 80)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .shadow(radius: 7)
                        .focused($nameIsFocused)
                    
                    Button {
                        getWeather()
                        nameIsFocused = false
                        
                    } label: {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .font(.system(size: 55))
                            .foregroundColor(.black)
                    }
                }.padding(.horizontal)
                
                VStack {
                    VStack {
                        Text("Detailed Weather Data")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .padding(.top, 15)
                        
                        Text("\(location)")
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                        
                        AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(weatherForView?.weather.last?.icon ?? "02n")@2x.png")) { image in
                            image
                                .resizable()
                        } placeholder: {
                            Color.clear
                        }.frame(width: 210, height: 195)
                            .padding(-40)
                    }
                    
                    //                    Image("detailCloud")
                    //                        .resizable()
                    //                        .scaledToFit()
                    //                        .frame(width: 350, height: 200)
                    
                    Spacer()
                    Spacer()
                    
                    HStack {
                        rectangleFrame(
                            title: "Temperature",
                            image: "temperature",
                            weatherData: (weatherForView?.main.temp.description ?? "0"),
                            label: "°C")
                        
                        
                        rectangleFrame(
                            title: "Humidity",
                            image: "humidity",
                            weatherData: (weatherForView?.main.humidity.description ?? "0"),
                            label: "%")
                    }
                    
                    HStack {
                        rectangleFrame(
                            title: "Pressure",
                            image: "pressure",
                            weatherData: (weatherForView?.main.pressure.description ?? "0"),
                            label: "hPa")
                        
                        rectangleFrame(
                            title: "Wind Speed",
                            image: "windSpeed",
                            weatherData: (weatherForView?.wind.speed.description ?? "0"),
                            label: "mph")
                    }
                    Spacer()
                }
            }
            .navigationBarTitle("Detail View")
            .cornerRadius(15)
            .shadow(radius: 50)
            
            .onAppear {
                getWeather()
            }
        }
    }
    
    func getWeather() {
        //Change alert status to API response to show alert or not
        
        //https://stackoverflow.com/questions/28570973/how-should-i-remove-all-the-leading-spaces-from-a-string-swift
        let url = setLocationURLString(location: "\(location.replacingOccurrences(of: " ", with: "+"))")
        
        getCurrentWeather(url: url, completion: {_ in
            weatherForView = weather
        })
        
    }
}

struct rectangleFrame: View {
    let title: String
    let image: String
    let weatherData: String
    let label: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 18))
            
            HStack {
                
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 42,height:42)
                
                Text(weatherData)
                Text(label)
            }
        }
        .frame(minWidth: 150, minHeight: 115)
        .shadow(radius: 5)
        .font(.system(size: 23))
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(15)
        .shadow(radius: 2)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(location: "London")
    }
}
