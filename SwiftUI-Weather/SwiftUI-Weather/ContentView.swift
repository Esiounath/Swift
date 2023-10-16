import SwiftUI
struct WeatherData{
    let id = UUID()
    var temperature : Int
    var symbols : String
    var Day : String
}
struct ContentView: View {
    let WeatherArray = [
        WeatherData(temperature:Int.random(in: 15..<25), symbols:"cloud.sun.fill", Day:"Tue"),
        WeatherData(temperature:Int.random(in: 20..<40), symbols:"sun.max.fill", Day:"Wed"),
        WeatherData(temperature:Int.random(in: 5..<15), symbols:"wind", Day:"Thu"),
        WeatherData(temperature:Int.random(in: 10..<20), symbols:"sun.haze.fill", Day:"Fri"),
        WeatherData(temperature:Int.random(in: 0..<10), symbols:"snowflake", Day:"Sat"),
    ]
    var body: some View {
        GeometryReader{screen in
            let height = screen.size.height
            let width = screen.size.width
            ZStack{
                LinearGradient(colors: [.blue,.blue.opacity(0.8),.cyan.opacity(0.4)], startPoint: .topTrailing, endPoint: .bottomTrailing)
                VStack(alignment:.center,spacing:height * 0.08){
                    Spacer()
                    Text("Cupertino CA").font(.system(size: 40,weight:.medium,design: .serif)).foregroundColor(.white)
                        .padding(.all)
                    VStack(spacing:height * 0.009){
                        Image(systemName:"cloud.sun.fill")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:width * 0.5,height:width * 0.5 / 2)
                        Text("\(Int.random(in: 10..<50))°").foregroundColor(.white)
                            .font(.system(size:(width * 0.07 > 70 ? width * 0.07 : 50 ),weight:.medium, design:.default))
                    }
                    Spacer()
                    HStack(alignment: .center,spacing:width * 0.08){
                        ForEach(WeatherArray,id:\.self.id){ array in
                            VStack(alignment:.center, spacing:width * 0.04){
                                Text(array.Day.uppercased()).foregroundColor(.white)
                                Image(systemName: array.symbols)
                                    .renderingMode(.original)
                                    .font(.system(size: width * 0.08))
                                Text("\(array.temperature)°").foregroundColor(.white)
                                    .font(.system(size:width * 0.06,weight:.semibold,design: .default))
                            }
                        }
                    }.padding()
                    Button {
                        
                    } label: {
                            Text("Change Time of Day")
                        
                    }
                    .frame(width:width * 0.85,height:height * 0.07)
                    .background(Color.white)
                    .foregroundColor(.blue)
                    .font(.system(size:width * 0.06,weight:.semibold,design:.default))
                    .cornerRadius(10)
                    .padding()
                    Spacer()
                }.padding()
            }
            .frame(width:width,height:height)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 14"))
                .previewDisplayName("iPhone 14")
            ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
        }
    }
}
