//
//  TriviaQuestionService.swift
//  Trivia
//
//  Created by Kimberly Sejas on 10/9/23.
//

import Foundation

class TriviaQuestionService{
    static func fetchQuestions(numOfQuestions: Int, completion: (([TriviaQuestion]) -> Void)? = nil){
        let param = "amount=\(numOfQuestions)"
        let url = URL(string: "https://opentdb.com/api.php?\(param)")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
              // this closure is fired when the response is received
              guard error == nil else {
                assertionFailure("Error: \(error!.localizedDescription)")
                return
              }
              guard let httpResponse = response as? HTTPURLResponse else {
                assertionFailure("Invalid response")
                return
              }
              guard let data = data, httpResponse.statusCode == 200 else {
                assertionFailure("Invalid response status code: \(httpResponse.statusCode)")
                return
              }
              // at this point, `data` contains the data received from the response
            let decoder = JSONDecoder()
            let response = try! decoder.decode(QuestionAPIResponse.self, from: data)
            DispatchQueue.main.async {
                completion?(response.results) // call the completion closure and pass in the forecast data model

                  }
//            print(response.results)
            }
            task.resume() // resume the task and fire the request
        
        
    }
    

}
