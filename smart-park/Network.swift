//
//  APIRequest.swift
//  smart-park
//
//  Created by Trong Van  on 11/22/21.
//
import Foundation

class Network {
    
    //    //look into fetchable in swift
    func getParkingLots(completion: @escaping (NodeData) -> ()){
        
        // 400z URL
        //let url = URL(string: "https://thingsboard.cloud:443/api/plugins/telemetry/DEVICE/e8613230-c9aa-11ec-b27f-d3ef2e0c0a7d/values/timeseries?keys=payload")
        
        //NSX URL
        let url = URL(string: "https://thingsboard.cloud:443/api/plugins/telemetry/DEVICE/8b2cf940-ccda-11ec-8c76-ad8278896f52/values/timeseries?keys=payload")
 
        //Guard against empty URL
        guard url != nil else { print("Error creating the url" ); return}
        
        //URL request
        var request = URLRequest(url: url!)
        
        //header for the api call
        // just need a new JWT each time
        let header = [
            "Content-Type": "application/json",
            "X-Authorization": "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJEamF2ZXJ5MTdAZ21haWwuY29tIiwic2NvcGVzIjpbIlRFTkFOVF9BRE1JTiJdLCJ1c2VySWQiOiI4NmY2MzFhMC1iM2E1LTExZWMtODhjYi1hZDgyNzg4OTZmNTIiLCJmaXJzdE5hbWUiOiJEYW1pYW4iLCJsYXN0TmFtZSI6IkF2ZXJ5IiwiZW5hYmxlZCI6dHJ1ZSwiaXNQdWJsaWMiOmZhbHNlLCJpc0JpbGxpbmdTZXJ2aWNlIjpmYWxzZSwicHJpdmFjeVBvbGljeUFjY2VwdGVkIjp0cnVlLCJ0ZXJtc09mVXNlQWNjZXB0ZWQiOnRydWUsInRlbmFudElkIjoiODY5M2VkNjAtYjNhNS0xMWVjLTg4Y2ItYWQ4Mjc4ODk2ZjUyIiwiY3VzdG9tZXJJZCI6IjEzODE0MDAwLTFkZDItMTFiMi04MDgwLTgwODA4MDgwODA4MCIsImlzcyI6InRoaW5nc2JvYXJkLmNsb3VkIiwiaWF0IjoxNjUxODQ3ODQ4LCJleHAiOjE2NTE4NzY2NDh9.EXpSD1Hi3QuHJpfBxzJml066f18HJtGfSO2DGYR1tKwQiYN1cG4kLCsR5hs95DFP3K6oQOpEwz3zqYrcoQV2bQ"
        ]
        //set header
        request.allHTTPHeaderFields = header
        
        //set API call method
        request.httpMethod = "GET"
        
        //Start a singleton session
        let session = URLSession.shared
        
        //create datatask to retrieve from url
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            //guard error and empty data
            guard error == nil else { print(error!.localizedDescription); return }
            guard let data = data else { print("Empty data"); return }
            let decoder = JSONDecoder()
            do {
                let endNode = try decoder.decode(NodeData.self, from: data)
                DispatchQueue.main.async {
                    completion(endNode)
                }
            }
            //error handling
            catch DecodingError.keyNotFound(let key, let context) {
                Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
            } catch DecodingError.valueNotFound(let type, let context) {
                Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
            } catch DecodingError.typeMismatch(let type, let context) {
                Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
            } catch DecodingError.dataCorrupted(let context) {
                Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
            } catch let error as NSError {
                NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
            }
        }
        //fire off datatask
        dataTask.resume()
    }
}

//parsing jSON
struct NodeData: Codable {
//    var data_rssi: [NodeValue]
//    var data_snr: [NodeValue]
    var payload: [NodeValue]
}
struct NodeValue: Codable {
    //var ts: Int
    var value: String
}
