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
    private var dinheiro: Float = 0
    private var semestre:  Int = 1
    private var score: Int = 1000
    private var save: Bool =  false
    
    init() {
        if (UserDefaults.standard.object(forKey: "personagem.nome") != nil) {
            nome = (UserDefaults.standard.object(forKey: "personagem.nome") as? String)!
            print("Personagem com nome: \(nome)")
            save = true
        } else {
            print("Personagem sem nome")
            nome = "Erro"
        }
        if (UserDefaults.standard.object(forKey: "personagem.dinheiro") != nil){
            dinheiro = (UserDefaults.standard.object(forKey: "personagem.dinheiro") as? Float)!
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
}
