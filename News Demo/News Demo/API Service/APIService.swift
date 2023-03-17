//
//  APIService.swift
//  News Demo
//
//  Created by Harindra Pittalia on 16/02/23.
//

import Foundation


class APIService {
    
    static let shared = APIService()
    
    
    func getNews() {
        let url = URL(string: "http://couplepartygame.com/api/guestLogin")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        // Set POST data in request body
//        guest_id = {1245784777}
//        device_token = {12345}
//        device_type = 1
        let postString = "guest_id=1245784777&device_token=12345&device_type=1"
        request.httpBody = postString.data(using: .utf8)

        // Create URLSession task
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error!)")
                return
            }

            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("HTTP status code: \(httpStatus.statusCode)")
            }

            // Handle response data here
            print(String(data: data, encoding: .utf8)!)
            do {
                let result = try? JSONDecoder().decode(QuestionModel.self, from: data)
                print(result)
            }
            catch {
                print(error)
            }
        }

        // Start URLSession task
        task.resume()
    }
    
    func getNewsData(category: String) {
        
//        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=in&category=\(category)&apiKey=f259da26368a46e88a0d8abdf28a74b6") else {
//            return
//        }
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=in&category=\(category)&apiKey=f259da26368a46e88a0d8abdf28a74b6")!

        // Create URLSession task
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error!)")
                return
            }

            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("HTTP status code: \(httpStatus.statusCode)")
            }

            // Handle response data here
            print(String(data: data, encoding: .utf8)!)
            do {
                let result = try? JSONDecoder().decode(News.self, from: data)
                print(result?.status)
            }
            catch {
                print(error)
            }
        }

        // Start URLSession task
        task.resume()
        
        
        
//        var components = URLComponents()
//        components.scheme = "https"
//        components.host = "newsapi.org"
//        components.path = "/v2/top-headlines"
//
//        components.queryItems = [
//            URLQueryItem(name: "country", value: "in"),
//            URLQueryItem(name: "category", value: category),
//            URLQueryItem(name: "apiKey", value: "f259da26368a46e88a0d8abdf28a74b6"),
//        ]
//
//        let url = components.string
//        print(url)
//        guard let url = url else {return}
//        var request = URLRequest(url: URL(string: url)!)
//        request.httpMethod = "GET"
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            guard data != nil else {
//                print("data is nil")
//
//                return
//            }
//
//            guard error != nil else {
//                print("error occured")
//                print(error)
//
//                return
//            }
//
//
//                print(data)
//                print(response)
//                let decoder = JSONDecoder()
//                let decodedData = try? decoder.decode(News.self, from: data!)
//                print(decodedData)
//
//                completion(decodedData)
//
//
//
//        }.resume()
    }
}
