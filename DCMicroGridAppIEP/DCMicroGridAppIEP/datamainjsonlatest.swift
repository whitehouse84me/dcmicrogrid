//
//  datamainjsonlatest.swift
//  DCMicroGridAppIEP
//
//  Created by White Dana on 23/7/21.
//

import Foundation

struct datamainjsonlatest: Codable, Identifiable {
    var id: String
    var times: String
    var Voltage: String
    var Current: String
    var Temperature: String
}


class Api : ObservableObject{
    @Published var datamainjsonlatests = [datamainjsonlatest]()
    
    func loadData(completion:@escaping ([datamainjsonlatest]) -> ()) {
        guard let url = URL(string: "https://dcmicrogridiep.000webhostapp.com/datamainlatestjson.php") else {
            print("Invalid url...")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            let datamainjsonlatests = try! JSONDecoder().decode([datamainjsonlatest].self, from: data!)
            print(datamainjsonlatests)
            DispatchQueue.main.async {
                completion(datamainjsonlatests)
            }
        }.resume()
        
    }
}
