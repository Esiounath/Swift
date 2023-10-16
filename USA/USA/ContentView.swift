//
//  ContentView.swift
//  USA
//
//  Created by esiounath on 16/10/2023.
//

import SwiftUI
struct City {
    var name: String
    var state: String
    var image: String
    var gradient: [Color]
    var desc: String
}
struct ContentView: View {
    let data : [City] = [
          City(name: "Chicago", state: "Illinois", image: "chicago", gradient: [.clear, .blue], desc: "Windy City, ou la ville venteuse. Chicago est une des plus grandes villes Américaines. Elle est implantée au bord du lac Michigan. La Sears Tower fut la plus haute des USA jusqu'à 2013."),
        City(name: "Washington DC", state: "Washington DC", image: "dc", gradient: [.clear, .yellow], desc: "Washington DC n'est pas la plus grande ville des Etats Unis mais en est la capitale. Elle y habite la maison blanche, le pentagone et nombre d'autres batiments d'Etat. Fun fact: aucun batiment ne peut être plus haut que le toit du capitole."),
        City(name: "San Francisco", state: "Californie", image: "frisco", gradient: [.clear, .red], desc: "Berceau des Hippies, de la tech et point d'entrée de la Silicon Valley. La diversité est le maître mot de San Francisco, la belle aux rues tortueuses et son Golden Gate. Sans oublier la fameuse prison d'Alcatraz."),
        City(name: "Los Angeles", state: "Californie", image: "la", gradient: [.clear, .orange], desc: "City Of Angels: La ville des anges. Lorsque l'on pense à Los Angeles, on voit les immenses plages de Long Beach, le signe Hollywood, les quartiers chics de Beverly Hills, le walk of fame de Hollywood Boulevard. Le rêve américain en somme."),
         City(name: "New York City", state: "New York", image: "nyc", gradient: [.clear, .purple], desc: "Big Apple, la statue de la liberté, la ville qui ne dort jamais. Quand on pense aux USA, l'image de New York est souvent celle qui nous vient. De la 5eme avenue au Bronx, cette ville saura vous enchanter.")
          
    ]
    @State var arrayValue = 0
    var body: some View {
        GeometryReader{screen in
                                let width = screen.size.width
            HStack{
                VStack{
                    Image(data[arrayValue].image)
                                    .resizable()
                                    .aspectRatio(contentMode:.fill)
                                    .frame(width:width * 0.8,height: width * 0.8)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(data[arrayValue].gradient.last ?? .clear,lineWidth:4))
                    Spacer()
                    HStack{
                        
                        VStack(alignment:.leading){
                            //Spacer()
                            //Spacer()
                            Text(data[arrayValue].name).font(.system(size:width * 0.09,weight: .bold,design:.default)).foregroundColor(.white)
                            Text(data[arrayValue].state).font(.system(size:width * 0.09,weight: .regular,design:.default)).foregroundColor(.white)
                        }.padding()
                        Spacer()
                    }
                    Text(data[arrayValue].desc).font(.system(size:width * 0.09 / 2.5 < width ? width * 0.09 / 2.2 : width * 0.09 / 2.5,weight: .semibold,design:.rounded)).foregroundColor(.white).lineLimit(.max).multilineTextAlignment(.center)
                                Spacer()
                            Button {
                                arrayValue = Int.random(in: 0..<data.count)
                            } label: {
                                Text("Autre ville").foregroundColor(data[arrayValue].gradient.last == .blue ? .purple : .blue)
                            }.padding(.bottom)
                }
            }

                
                
        }.background(LinearGradient(colors: data[arrayValue].gradient, startPoint: .top, endPoint: .bottomLeading))
            .background(Image(data[arrayValue].image))
            .padding(EdgeInsets(top:60 , leading: 0, bottom: 0, trailing: 0))
        .edgesIgnoringSafeArea(.all)
        
        
 


            
//        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 14")).previewDisplayName("iPhone 14")
            ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 8")).previewDisplayName("iPhone 8")
            
        }
    }
}
