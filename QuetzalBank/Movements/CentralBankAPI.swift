//
//  CentralBankAPI.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 01/06/23.
//

import Foundation

class CentralBankAPI: ObservableObject  {
    @Published var movements = [Movement]()
    let url_base = "http://172.16.105.13:3000/movements"
    
    func fetchMovements(completion: @escaping ([Movement]) -> ()) {
        guard let url = URL(string: url_base) else {
            print("URL no válida")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) {
            data, response, error in
            if let error = error {
                print("Ocurrió un error", error.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                return
            }
            
            if response.statusCode == 200 {
                guard let data = data else {return}
                DispatchQueue.main.async {
                    do {
                        let movements = try  JSONDecoder().decode([Movement].self, from: data)
                        completion(movements)
                    } catch {
                        print("Emanuel error")
                    }
                }
                return
            }
        }.resume()
    }
    
    func login(request: LoginRequest) async throws -> LoginResponse? {
        guard let url = URL(string: url_base) else {
            print("URL no válida")
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        
        do {
            urlRequest.httpBody = try encoder.encode(request)
        } catch {
            print("Falló encoder")
            return nil
        }
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 201 else {
            return nil
        }
        
        let loginResponse = try decoder.decode(LoginResponse.self, from: data)
        return loginResponse
    }
}
