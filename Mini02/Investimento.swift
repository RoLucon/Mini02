//
//  Investimento.swift
//  Mini02
//
//  Created by Gustavo Rigor on 07/04/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import Foundation

var progresso = Investimento()

class Investimento {
    //0-CDB, 1-LCI, 2-CRI, 3-Deb
    var progresso: Int = 0 {
        didSet {
            UserDefaults.standard.set(progresso, forKey: "progresso")
        }
        
    }
    var investimentoSelecionado: Int = 0 {
        didSet {
            UserDefaults.standard.set(investimentoSelecionado, forKey: "Investimento.investimentoSelecionado")
        }
        
    }
    private var aplicada = [10.00,20.00,30.00,40.00] {
        didSet {
            UserDefaults.standard.set(aplicada, forKey: "Investimento.aplicada")
        }
    }
    private var liquido = [13.00,23.00,34.00,28.00] {
        didSet {
            UserDefaults.standard.set(aplicada, forKey: "Investimento.liquido")
        }
    }
    private var imposto = [2.00,0.00,1.00,2.00] {
        didSet {
            UserDefaults.standard.set(imposto, forKey: "Investimento.imposto")
        }
    }
    private var bruto = [15.00,23.00,35.00,30.00] {
        didSet {
            UserDefaults.standard.set(bruto, forKey: "Investimento.bruto")
        }
    }
    private var lucro = [0.0,0.0,0.0,0.0] {
        didSet {
            UserDefaults.standard.set(lucro, forKey: "Investimento.lucro")
        }
    }
    private var save: Bool = false
    
    init() {
        if (UserDefaults.standard.object(forKey: "Investimento.investimentoSelecionado") != nil) {
            investimentoSelecionado = (UserDefaults.standard.object(forKey: "Investimento.investimentoSelecionado") as? Int)!
            save = true
        }
        if (UserDefaults.standard.object(forKey: "progresso") != nil){
            progresso = (UserDefaults.standard.object(forKey: "progresso") as? Int)!
        }
        if (UserDefaults.standard.object(forKey: "Investimento.aplicada") != nil){
            aplicada = (UserDefaults.standard.object(forKey: "Investimento.aplicada") as? [Double])!
        }
        if (UserDefaults.standard.object(forKey: "Investimento.imposto") != nil){
            imposto = (UserDefaults.standard.object(forKey: "Investimento.imposto") as? [Double])!
        }
        if (UserDefaults.standard.object(forKey: "Investimento.bruto") != nil){
            bruto = (UserDefaults.standard.object(forKey: "Investimento.bruto") as? [Double])!
        }
        if (UserDefaults.standard.object(forKey: "Investimento.lucro") != nil){
            lucro = (UserDefaults.standard.object(forKey: "Investimento.lucro") as? [Double])!
        }
        if (UserDefaults.standard.object(forKey: "Investimento.liquido") != nil){
            liquido = (UserDefaults.standard.object(forKey: "Investimento.liquido") as? [Double])!
        }
        
    }
    
    func isSave() -> Bool{
        return self.save
    }
    func resetSave(){
        UserDefaults.standard.removeObject(forKey: "Investimento.investimentoSelecionado")
        UserDefaults.standard.removeObject(forKey: "Investimento.aplicada")
        UserDefaults.standard.removeObject(forKey: "Investimento.imposto")
        UserDefaults.standard.removeObject(forKey: "Investimento.bruto")
        UserDefaults.standard.removeObject(forKey: "Investimento.lucro")
        UserDefaults.standard.removeObject(forKey: "Investimento.liquido")
    }
    func getAplicada() -> Double{
        return aplicada[investimentoSelecionado]
    }
    func setAplicada(_ x:Double){
        aplicada[investimentoSelecionado] = x
    }
    func getImposto() -> Double{
        return imposto[investimentoSelecionado]
    }
    func setImposto(_ x:Double){
        imposto[investimentoSelecionado] = x
    }
    func getBruto() -> Double{
        return bruto[investimentoSelecionado]
    }
    func setBruto(_ x:Double){
        bruto[investimentoSelecionado] = x
    }
    func getLucro() -> Double{
        return lucro[investimentoSelecionado]
    }
    func setLucro(_ x:Double){
        lucro[investimentoSelecionado] = x
    }
    func getLiquido() -> Double{
        return liquido[investimentoSelecionado]
    }
    func setLiquido(_ x:Double){
        liquido[investimentoSelecionado] = x
    }
}


