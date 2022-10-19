//
//  ContentView.swift
//  CW2WeatherAPI
//
//  Created by Vasil Dzhakov on 11/05/2022.
//

import SwiftUI

struct WeatherSimpleView: View {
    @State var weatherForView: Weather?
    @State var location: String = ""
    @FocusState private var nameIsFocused: Bool
    
    @State var presentAlert = false
    
    var body: some View {
        NavigationView {
            ZStack {
                PlayerView()
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Text("Current day forecast")
                            .font(.headline)
                        
                        Spacer()
                    }
                    
                    HStack {
                        TextField("Enter Location", text: $location)
                            .focused($nameIsFocused)
                        
                            .cornerRadius(10)
                            .frame(height:80)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .shadow(radius: 7)
                        
                        Button {
                            getWeather()
                            nameIsFocused = false
                            
                        } label: { Image(systemName: "magnifyingglass.circle.fill")
                                .font(.system(size: 55))
                                .foregroundColor(.black)
                                .shadow(radius: 7)
                        }
                    }
                    
                    VStack {
                        
                        HStack {
                            AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(weatherForView?.weather.last?.icon ?? "02n")@2x.png")) { image in
                                image
                                    .resizable()
                            } placeholder: {
                                Color.clear
                            }.frame(width: 210, height: 195)
                                .padding(-40)
                            
                            Spacer()
                            
                            HStack {
                                Text(weatherForView?.main.temp.description ?? "0")
                                    .font(.system(size: 45))
                                Text("°")
                                    .font(.system(size: 45))
                            }
                        }
                    }
                    .padding(.leading,15)
                    .padding(15)
                    .background(.ultraThinMaterial)
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    
                    VStack {
                        HStack {
                            Text("Pressure")
                                .font(.system(size: 25))
                            
                            Spacer()
                            
                            Text("Humidity")
                                .font(.system(size: 25))
                        }
                        HStack {
                            VStack {
                                
                                HStack {
                                    Image("pressure")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 52,height:52)
                                    
                                    Text(weatherForView?.main.pressure.description ?? "0")
                                        .font(.system(size: 25))
                                    
                                    Text("hPa")
                                        .font(.system(size: 25))
                                }
                            }
                            .shadow(radius: 5)
                            
                            Spacer()
                            
                            VStack {
                                HStack {
                                    Image("humidity")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 42,height:42)
                                    
                                    Text(weatherForView?.main.humidity.description ?? "0")
                                        .font(.system(size: 25))
                                    
                                    Text("%")
                                        .font(.system(size: 25))
                                }
                            }
                            .shadow(radius: 5)
                        }
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    
                    Spacer()
                    
                    HStack {
                        
                        NavigationLink(destination: DetailView(location: location)) {
                            Text("Detail View")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 15)
                                .padding(.horizontal, 1)
                                .foregroundColor(.white)
                                .background(.ultraThinMaterial)
                                .cornerRadius(16)
                                .shadow(radius: 5)
                        }
                        
                        NavigationLink(destination: ForecastFiveDays(location: location)) {
                            Text("5 Day Forecast")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 15)
                                .padding(.horizontal, 1)
                                .foregroundColor(.white)
                                .background(.ultraThinMaterial)
                                .cornerRadius(16)
                                .shadow(radius: 5)
                        }
                    }
                }
                .padding(.horizontal)
                .navigationTitle("Weather Search").shadow(radius: 3)
                
                .alert("Error", isPresented: $presentAlert){
                    Button("OK", role: .cancel) { }
                }
            }
        }
    }
    
    func getWeather() {
        //Change alert status to API response to show alert or not
        //presentAlert = showWeatherAlert
        
        //https://stackoverflow.com/questions/28570973/how-should-i-remove-all-the-leading-spaces-from-a-string-swift
        let url = setLocationURLString(location: "\(location.replacingOccurrences(of: " ", with: "+"))")
        presentAlert = showWeatherAlert
        
        getCurrentWeather(url: url, completion: {_ in
            presentAlert = showWeatherAlert
            
            weatherForView = weather
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherSimpleView().preferredColorScheme(.light)
    }
}
