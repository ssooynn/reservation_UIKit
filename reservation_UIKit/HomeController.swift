//
//  HomeController.swift
//  reservation_UIKit
//

import UIKit
import SwiftUI
import Foundation

struct Home : View {
    
    @State var txt = ""
    @State var profile = false
    
    var body : some View{
        
        VStack(){
            HStack{
             
                Image("title").renderingMode(.original).resizable().frame(width: 130, height: 45)
                    Spacer()
                Button(action:{
                    self.profile.toggle()
                }){
                    Image(systemName: "person.fill").foregroundColor(Color("mintColor")).padding(.trailing)
                }
            }.padding(.top, 40)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 15){
                    
                    HStack(spacing: 15){
                        
                        HStack{
        
                            TextField("동물병원 검색하기", text: $txt).padding(.horizontal)
                            Spacer()
                            Image(systemName: "magnifyingglass").font(.body)
                                .foregroundColor(Color("mintColor"))
                            
                        }.padding(10)
                        .background(Color("grayColor"))
                        .cornerRadius(20)
                        
                    }
                    
        //

                    
                    HomeBottomView()
                }
            }
            
            }.padding(.horizontal).navigationBarTitle("").navigationBarHidden(true)
}
}

struct HomeBottomView : View {
    var body:some View{
        VStack(spacing: 15){
            
            HStack(spacing: 15){

                Text("병원 목록").fontWeight(.bold).foregroundColor(Color("mintColor"))
                
                Spacer()
                
            }.padding(.vertical, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 15){
                    
                    ForEach(info){i in
                        
                        HospitalView(data: i)
                    }
                }
            }
            
        }
    }
}

struct HospitalView : View {
    
    var data: hospitals
    @State var show = false
    
    var body : some View{
        
   
        ZStack{
            
           /* NavigationLink(destination: Home_detail(show: self.$show), isActive: self.$show) {
                
                Text("")
            }*/
            
            VStack(spacing: 10){
                
                Image(data.image).resizable().frame(width: 180, height: 180)
                Text(data.name)
                
                
            }.onTapGesture {
                
                self.show.toggle()
            }
            
        }
    }
}


var ads = ["1","2","3","4"]

struct  hospitals: Identifiable {
    var id: Int
    var name : String
    var image : String
}

var info = [
hospitals(id: 0, name: "우리동물병원", image: "hos1" ),
hospitals(id: 1, name: "나리동물병원", image: "hos2"),
hospitals(id: 2, name: "사랑동물병원", image: "hos3"),
hospitals(id: 3, name: "우정동물병원", image: "hos4"),
hospitals(id: 4, name: "별동물병원", image: "hos5")
]
    


class HomeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
               let hostingController = UIHostingController(rootView: Home())
               hostingController.view.translatesAutoresizingMaskIntoConstraints = false
               hostingController.view.frame = view.bounds
        
               addChild(hostingController)
               view.addSubview(hostingController.view)
    }


}
