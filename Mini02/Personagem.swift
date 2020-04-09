//
//  Personagem.swift
//  Mini02
//
//  Created by Rogerio Lucon on 03/04/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//
import Foundation

class Personagem {
    let nome: String
    private var dinheiro: Float = 0 { didSet {UserDefaults.standard.set(dinheiro, forKey: "personagem.dinheiro")}}
    private var poupanca: Float = 0 { didSet {UserDefaults.standard.set(poupanca, forKey: "personagem.poupanca")}}
    private var semestre:  Int = 1 { didSet {UserDefaults.standard.set(semestre, forKey: "personagem.semestre")}}
    private var score: Int = 1000 { didSet {UserDefaults.standard.set(score, forKey: "personagem.score")}}
    private var save: Bool = false
    
    init() {
        if (UserDefaults.standard.object(forKey: "personagem.nome") != nil) {
            nome = (UserDefaults.standard.object(forKey: "personagem.nome") as? String)!
            save = true
        } else {
            print("Personagem sem nome")
            nome = "Erro"
        }
        if (UserDefaults.standard.object(forKey: "personagem.dinheiro") != nil){
            dinheiro = (UserDefaults.standard.object(forKey: "personagem.dinheiro") as? Float)!
        }
        if (UserDefaults.standard.object(forKey: "personagem.poupanca") != nil){
            poupanca = (UserDefaults.standard.object(forKey: "personagem.poupanca") as? Float)!
        }
        if (UserDefaults.standard.object(forKey: "personagem.semestre") != nil){
            semestre = (UserDefaults.standard.object(forKey: "personagem.semestre") as? Int)!
        }
        if (UserDefaults.standard.object(forKey: "personagem.score") != nil){
            score = (UserDefaults.standard.object(forKey: "personagem.score") as? Int)!
        }
        
    }
    
    func isSave() -> Bool{
        return self.save
    }
    
    func semestreAtual() -> Int{
        return semestre
    }
    
    func resetSave(){
        UserDefaults.standard.removeObject(forKey: "personagem.nome")
        UserDefaults.standard.removeObject(forKey: "personagem.dinheiro")
        UserDefaults.standard.removeObject(forKey: "personagem.semestre")
        UserDefaults.standard.removeObject(forKey: "personagem.score")
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
