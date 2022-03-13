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
        
        // URL
        let url = URL(string: "http://10.50.208.17:9090/api/plugins/telemetry/DEVICE/1211cf00-3350-11ec-b020-4fe1b95b4375/values/timeseries?useStrictDataTypes=false")
        
        //Guard against empty URL
        guard url != nil else { print("Error creating the url" ); return}
        
        //URL request
        var request = URLRequest(url: url!)
        
        //header for the api call
        // just need a new JWT each time
        let header = [
            "Content-Type": "application/json",
            "X-Authorization": "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ6NDc3dzQ3NUB3aWNoaXRhLmVkdSIsInNjb3BlcyI6WyJURU5BTlRfQURNSU4iXSwidXNlcklkIjoiZGU2NjczNzAtMzM0Yy0xMWVjLWIwMjAtNGZlMWI5NWI0Mzc1IiwiZmlyc3ROYW1lIjoiUGhvbmciLCJsYXN0TmFtZSI6IlZvIiwiZW5hYmxlZCI6dHJ1ZSwiaXNQdWJsaWMiOmZhbHNlLCJ0ZW5hbnRJZCI6ImI4NGZlNDEwLTMzNGItMTFlYy1iMDIwLTRmZTFiOTViNDM3NSIsImN1c3RvbWVySWQiOiIxMzgxNDAwMC0xZGQyLTExYjItODA4MC04MDgwODA4MDgwODAiLCJpc3MiOiJ0aGluZ3Nib2FyZC5pbyIsImlhdCI6MTYzODQwMDI1NiwiZXhwIjoxNjM4NDA5MjU2fQ.MoIMfIrFHpv41jbysHflHF7TF5iY0j272pkd_PyPhyQCNZeVsNohNubbZYi_WKNDESYDB0cs8leYHLNlbFqdRQ"
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
    var data_payload: [NodeValue]
}
struct NodeValue: Codable {
    var ts: Int
    var value: String
}
