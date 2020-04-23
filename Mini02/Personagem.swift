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
    
    private(set) var nome: String!
    private var dinheiro: Float!
    private var poupanca: Float!
    private var semestre:  Int!
    private var score: Int!
    private var save: Bool = false
    
    private init() {
        
        if (UserDefaults.standard.object(forKey: "personagem.nome") != nil) {
            nome = (UserDefaults.standard.object(forKey: "personagem.nome") as? String)!
            save = true
        } else {
            self.resetAtributos()
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
    
    func salvarNome(nome: String){
        self.nome = nome
        UserDefaults.standard.set(nome, forKey: "personagem.nome")
    }
    
    func salvar(){
        UserDefaults.standard.set(poupanca, forKey: "personagem.poupanca")
        UserDefaults.standard.set(dinheiro, forKey: "personagem.dinheiro")
        UserDefaults.standard.set(semestre, forKey: "personagem.semestre")
        UserDefaults.standard.set(score, forKey: "personagem.score")
    }
    
    func resetAtributos(){
        nome = ""
        dinheiro = 10
        poupanca = 0
        semestre = 1
        score = 1000
    }
    
    func resetSave(){
        save = false
        resetAtributos()
        UserDefaults.standard.removeObject(forKey: "personagem.nome")
    }
    
    func semestreAtual() -> Int{
        return semestre
    }
    
    func proximoSemetre(){
        semestre += 1
    }
    
    func dinheiro(_ valor: Float? = nil) -> Float? {
        if let valor = valor {
            dinheiro += valor
            return nil
        } else {
            return dinheiro
        }
    }
    
    @available(*, deprecated, renamed: "dinheiro()")
    func mexerDinheiro(valor: Float? = nil) -> Float? {
        if let valor = valor {
            dinheiro += valor
            return nil
        } else {
            return dinheiro
        }
    }
    
    func poupanca(_ valor: Float? = nil) -> Float? {
        if let valor = valor {
            poupanca += valor
            return nil
        } else {
            return poupanca
        }
    }
    
    @available(*, deprecated, renamed: "poupanca()")
    func poupanca(valor: Float? = nil) -> Float? {
        if let valor = valor {
            poupanca += valor
            return nil
        } else {
            return poupanca
        }
    }
    
    func score(_ valor: Int? =  nil) -> Int? {
        if let valor = valor {
            score += valor
            return nil
        } else {
            return score
        }
    }
    
    @available(*, deprecated, renamed: "score()")
    func mexerScore(valor: Int? =  nil) -> Int? {
        if let valor = valor {
            score += valor
            return nil
        } else {
            return score
        }
    }
}
