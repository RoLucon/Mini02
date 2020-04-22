//
//  Personagem.swift
//  Mini02
//
//  Created by Rogerio Lucon on 03/04/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//
import Foundation

class Personagem {
    
    static let shared = Personagem()
    
    let nome: String
    private var dinheiro: Float
    private var poupanca: Float
    private var semestre:  Int
    private var score: Int
    private var save: Bool = false
    
    private init() {
        
        if (UserDefaults.standard.object(forKey: "personagem.nome") != nil) {
            nome = (UserDefaults.standard.object(forKey: "personagem.nome") as? String)!
            save = true
        } else {
            nome = "ERRO"
        }
        if (UserDefaults.standard.object(forKey: "personagem.dinheiro") != nil){
            dinheiro = (UserDefaults.standard.object(forKey: "personagem.dinheiro") as? Float)!
        } else{
            dinheiro = 10
        }
        if (UserDefaults.standard.object(forKey: "personagem.poupanca") != nil){
            poupanca = (UserDefaults.standard.object(forKey: "personagem.poupanca") as? Float)!
        } else {
            poupanca = 0
        }
        if (UserDefaults.standard.object(forKey: "personagem.semestre") != nil){
            semestre = (UserDefaults.standard.object(forKey: "personagem.semestre") as? Int)!
        } else {
            semestre = 1
        }
        if (UserDefaults.standard.object(forKey: "personagem.score") != nil){
            score = (UserDefaults.standard.object(forKey: "personagem.score") as? Int)!
        } else {
            score = 100
        }
    }
    
    func isSave() -> Bool{
        return self.save
    }
    
    func salvar(){
        UserDefaults.standard.set(poupanca, forKey: "personagem.poupanca")
        UserDefaults.standard.set(dinheiro, forKey: "personagem.dinheiro")
        UserDefaults.standard.set(semestre, forKey: "personagem.semestre")
        UserDefaults.standard.set(score, forKey: "personagem.score")
    }
    
    func resetSave(){
        UserDefaults.standard.removeObject(forKey: "personagem.nome")
        UserDefaults.standard.removeObject(forKey: "personagem.dinheiro")
        UserDefaults.standard.removeObject(forKey: "personagem.semestre")
        UserDefaults.standard.removeObject(forKey: "personagem.score")
    }
    
    func semestreAtual() -> Int{
        return semestre
    }
    
    func proximoSemetre(){
        semestre += 1
    }
    
    func mexerDinheiro(valor: Float?) -> Float? {
        if let valor = valor {
            dinheiro += valor
            return nil
        } else {
            return dinheiro
        }
    }
    
    func poupanca(valor: Float?) -> Float? {
        if let valor = valor {
            poupanca += valor
            return nil
        } else {
            return poupanca
        }
    }
    
    func mexerScore(valor: Int?) -> Int?{
        if let valor = valor {
            score += valor
            return nil
        } else {
            return score
        }
    }
}
