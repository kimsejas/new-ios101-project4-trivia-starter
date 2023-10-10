//
//  TriviaQuestion.swift
//  Trivia
//
//  Created by Mari Batilando on 4/6/23.
//

import Foundation


struct QuestionAPIResponse: Decodable {
    let results: [TriviaQuestion]
}

struct TriviaQuestion: Decodable {
  var category: String
  var question: String
  var correctAnswer: String
  var incorrectAnswers: [String]
    private enum CodingKeys: String, CodingKey {
            case correctAnswer = "correct_answer"
            case incorrectAnswers = "incorrect_answers"
            case category = "category"
            case question = "question"
//            case type = "type"
//            case difficulty = "difficulty"
        }
}
