//
//  textos.swift
//  Mini02
//
//  Created by Rafael Costa on 24/04/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import UIKit
//Mudar "a" e "p" nas funcoes refazer, f1, f2, f3, f4, f5, f6, f7 e f8 após ter o valor inicial delas para cada fase
var pula = false
var a = 0 //Ajuda da tela atual
var p = 1 //Perguntas e possíveis respostas da tela atual
var i : intmax_t!
var r = 0 //Salva a resposta escolida
var c = 0 //Representa a fala inicial da fase
var contadorBanco = 0
var personagem: Personagem = Personagem.shared
//Todas as falas do jogo em ordem de aparição
let texto = [
    //Inicio cap 1
1: "\(Personagem.shared.nome!)… Hoje é um belo dia.\nOs pássaros estão cantando, o céu está ensolarado…\nE o seu salário caiu.",
2: "Fala aí, \(Personagem.shared.nome!)!\nRecebeu hoje, né?",
3: "Ehh… Não foi isso que conversamos ontem, \(Personagem.shared.nome!)",
4: "Olha só, nossa conversa de ontem até que fez efeito!",
5: "De qualquer forma, sua situação está mesmo caótica.\nDesespero nunca é a saída. Mas eu estaria desesperada no seu lugar!",
6: "Pagar conta é massa, mas pensar no futuro também é, sabe?!",
7: "Dói guardar o dinheiro que não tem, né?",
8: "Vou te ajudar nessa, cara. Cola aí!", //Seta pro banco
9: "Mas isso é história para mais tarde.\nAprenda com leveza, \(Personagem.shared.nome!).", //Volta do banco
10: "…PARA DE GASTAR SEM NECESSIDADE!",
11: "Oh? Coitadinho…",
12: "Mas relaxa, dessa vez eu pago pra gente.",
    //Inicio cap 2
13: "\(Personagem.shared.nome!), esse é o seu pior inimigo…\nNão, não o shopping.\nO cartão de crédito.",
14: "Que espaço lindo! Quanto lugar legal!",
15: "E acumular várias dívidas pelos próximos meses!",
16: "…Você por acaso tem saldo na conta pra passar no débito?",
17: "Você tem uma arma poderosa aí na sua carteira. Use-a com responsabilidade.",
18: "O crédito é como se fosse um empréstimo. Você está gastando, em tese, o que não tem!\nDepois, precisa pagar tudo.\nA famosa fatura.",
19: "Mas é bom você não esquecer disso por, pelo menos, 40 dias. Hehe.",
20: "E é bom pagar o mais rápido possível. Em até 40 dias, para ser mais exata.",
21: "Isso porque, se passar desse prazo, você corre o risco de ser negativado.\nNão fica perdido que vou te ajudar nisso!", //Seta pro banco
22: "Enfim! Vamos voltar para lá! A fome é grande, mas comer em casa sai mais barato.\nInclusive, queeem sabe não te dou umas dicas para gastar menos…",
    //Inicio cap 3
23: "...\(Personagem.shared.nome!).",
24: "Poxa… Mas você conseguiu pagar sua fatura. Não é tudo, mas é algo.",
25: "Que bom! Mas ei, você precisa aprender muito ainda.",
26: "Pagar as contas é um alívio, mas você tem que tomar cuidado pra não se afundar em dívidas de novo.",
27: "MUAHAHAH! Eu sei, eu sei! Eu sou demais, mesmo!",
28: "Calma lá. Super Kim está aqui para te ajudar!",
29: "Primeiro passo: você precisa saber o que gasta todo mês.\nSó que é impossível saber exatamente, porque tem gasto que conseguimos prever, tem gasto que não.",
30: "É o que separamos entre despesa fixa e despesa variável.\nVamos ver isso melhor?",
31: "Outra coisa importante é criar uma reserva de emergência.\nVocê só vai usar essa reserva em… emergências! Desemprego, por exemplo.",
32: "Essa reserva pode variar entre 3 a 6 salários atuais.\nPara se organizar melhor, você pode usar uma planilha com todas as entradas e saídas de grana.",
33: "É bom, também, guardar as notinhas para consultar depois. Aí você anota todos os gastos, casuais ou não, e deixa registrado para onde foi seu dinheiro.",
34: "HAHAH! Isso é o que nós vamos ver!",
35: "…Kim te ajudando é uma oportunidade única, okay?",
36: "De qualquer forma, vou tirar um cochilo. Enquanto isso, partiu testar os conhecimentos?",
    //Inicio cap 4
37: "cap4",
38: "fala33",
39: "fala33",
40: "fala33",
41: "fala33",
42: "fala33",
43: "fala33",
44: "fala33",
45: "fala33",
46: "fala33",
47: "fala33",
48: "fala33",
49: "fala33",
50: "fala33",
51: "fala33",
52: "fala33",
53: "fala33",
54: "fala33",
55: "fala33",
56: "fala33",
57: "fala33",
58: "fala33",
59: "fala33",
60: "fala33",
61: "fala33",
62: "fala33",
63: "fala33",
64: "fala33",
65: "fala33",
66: "fala33",
67: "fala33",
68: "fala33",
69: "fala33",
70: "fala33",
71: "fala33",
72: "fala33",
73: "fala33",
74: "fala33",
75: "fala33",
76: "fala33",
77: "fala33",
78: "fala33",
79: "fala33",
80: "fala33",]

//Textos das interações da fase no banco
let texto2 = [
    
    //Capítulo 1
    1: "Essa é sua conta bancária, \(personagem.nome!). Seu salário já tá na mão! Uhuuul!",
    2:"...Mas não fica empolgado, não.",
    3:"Aqui, você vê o seu saldo corrente.",
    4:"E aqui, você está vendo a sua poupança.",
    5:"A conta poupança é o lugar ideal para deixar o dinheiro que você não quer ou não pode gastar.",
    6:"Vamos, coloque um pouquinho de dinheiro aqui.",
    7:"Aqui é onde vc pode fazer investimentos, mas vamos deixar isso pra outra hora",
    8:"Agora, vamos para a parte que dói.",
    9:"Tah-dah! É isso que te faz sofrer todos os dias.",
    10:"Eu sei, \(personagem.nome!), eu sei. Tem sido difícil...",
    11:"Mas vai piorar! Clica naquele botão ali.",
    12:"Essa é a fatura do seu cartão de crédito. Aqui, você consegue ver todo o seu histórico de gastos.",
    13:"Triste histórico de gastos...",
    14:"Agora fecha isso, tá me dando gatilho.",
    15:"",
    16:"",
    17:"",
    18:"",
    19:"",
    20:"",
]


//Todas perguntas do jogo e as respostas possíveis em ordem
let per = [
    //Cap 1
1: "Partiu gastar tudo no bar?", 2: "É ISSO AÍ!", 3: "Não!!! Já tô atolado nas contas…", 4: " ",
5: "Você já sabe o que fazer com o dinheiro que recebeu, né?", 6: "Pagar as dívidas do cartão, né.", 7: "Acho que vou guardar um pouco…", 8: " ",
9: "Bora tomar um sorvete?", 10: "Opa!", 11: "Não posso, né…", 12: " ",
    //Cap 2
13: "Quanta coisa caaara!", 14: "Se passar no crédito, dá pra pagar", 15: "Se passar no débito, dá pra pagar", 16: " ",
17: "Lembra daquela sua fatura triste? Triste, triste fatura…", 18: "Não me lembra disso…", 19: "Realmente, está bem triste.", 20: " ",
    //Cap 3
21: "Você tá triste?", 22: "Sim."/*Preocupado com as contas*/, 23: "Eu não."/*Paguei a fatura! Preciso de mais nada!*/, 24: " ",
25: "Já pensou em bons hábitos?", 26: "Sim!"/*Colocar tudo nas mãos da Kim!*/, 27: "Para ser sincero, não.", 28: " ",
29: "Sua grana nunca mais vai sumir pro espaço!\nEntendeu?", 30: "Sim! Entendido.", 31: "Não entendi, não", 32: " ",
33: "Pergunta 9", 34: "Resposta 1 p9", 35: "Resposta 2 p9", 36: "Resposta 3 p9",
    //Cap 4
37: "Pergunta 10", 38: "Resposta 1 p10", 39: "Resposta 2 p10", 40: "Resposta 3 p10",
41: "Pergunta 11", 42: "Resposta 1 p11", 43: "Resposta 2 p11", 44: "Resposta 3 p11",
45: "Pergunta 12", 46: "Resposta 1 p12", 47: "Resposta 2 p12", 48: "Resposta 3 p12",
49: "Pergunta 13", 50: "Resposta 1 p13", 51: "Resposta 2 p13", 52: "Resposta 3 p13",
53: "Pergunta 14", 54: "Resposta 1 p14", 55: "Resposta 2 p14", 56: "Resposta 3 p14",
57: "Pergunta 15", 58: "Resposta 1 p15", 59: "Resposta 2 p15", 60: "Resposta 3 p15",
61: "Pergunta 16", 62: "Resposta 1 p16", 63: "Resposta 2 p16", 64: "Resposta 3 p16",
65: "Pergunta 17", 66: "Resposta 1 p17", 67: "Resposta 2 p17", 68: "Resposta 3 p17",
69: "Pergunta 18", 70: "Resposta 1 p18", 71: "Resposta 2 p18", 72: "Resposta 3 p18",
73: "Pergunta 19", 74: "Resposta 1 p19", 75: "Resposta 2 p19", 76: "Resposta 3 p19",
77: "Pergunta 20", 78: "Resposta 1 p20", 79: "Resposta 2 p20", 80: "Resposta 3 p20",
81: "Pergunta 21", 82: "Resposta 1 p21", 83: "Resposta 2 p21", 84: "Resposta 3 p21",
85: "Pergunta 22", 86: "Resposta 1 p22", 87: "Resposta 2 p22", 88: "Resposta 3 p22",
89: "Pergunta 23", 90: "Resposta 1 p23", 91: "Resposta 2 p23", 92: "Resposta 3 p23",
93: "Pergunta 23", 94: "Resposta 1 p23", 95: "Resposta 2 p23", 96: "Resposta 3 p23",
97: "Pergunta 23", 98: "Resposta 1 p23", 99: "Resposta 2 p23", 100: "Resposta 3 p23",
101: "Pergunta 23", 102: "Resposta 1 p23", 103: "Resposta 2 p23", 104: "Resposta 3 p23",
105: "Pergunta 23", 106: "Resposta 1 p23", 107: "Resposta 2 p23", 108: "Resposta 3 p23",
109: "Pergunta 23", 110: "Resposta 1 p23", 111: "Resposta 2 p23", 112: "Resposta 3 p23",
113: "Pergunta 23", 114: "Resposta 1 p23", 115: "Resposta 2 p23", 116: "Resposta 3 p23",
117: "Pergunta 23", 118: "Resposta 1 p23", 119: "Resposta 2 p23", 120: "Resposta 3 p23",
121: "Pergunta 23", 122: "Resposta 1 p23", 123: "Resposta 2 p23", 124: "Resposta 3 p23",
125: "Pergunta 23", 126: "Resposta 1 p23", 127: "Resposta 2 p23", 128: "Resposta 3 p23",
129: "Pergunta 23", 130: "Resposta 1 p23", 131: "Resposta 2 p23", 132: "Resposta 3 p23",
133: "Pergunta 23", 134: "Resposta 1 p23", 135: "Resposta 2 p23", 136: "Resposta 3 p23",
137: "Pergunta 23", 138: "Resposta 1 p23", 139: "Resposta 2 p23", 140: "Resposta 3 p23",
141: "Pergunta 23", 142: "Resposta 1 p23", 143: "Resposta 2 p23", 144: "Resposta 3 p23",
145: "Pergunta 23", 146: "Resposta 1 p23", 147: "Resposta 2 p23", 148: "Resposta 3 p23",
149: "Pergunta 23", 150: "Resposta 1 p23", 151: "Resposta 2 p23", 152: "Resposta 3 p23",
153: "Pergunta 23", 154: "Resposta 1 p23", 155: "Resposta 2 p23", 156: "Resposta 3 p23",
157: "Pergunta 23", 158: "Resposta 1 p23", 159: "Resposta 2 p23", 160: "Resposta 3 p23",
]


//Todas as explicações presentes nas fases
let help = [
"Ajuda 1 p1", "Ajuda 2 p1", "Ajuda 3 p1",
"Ajuda 1 p2", "Ajuda 2 p2", "Ajuda 3 p2",
"Ajuda 1 p3", "Ajuda 2 p3", "Ajuda 3 p3",
"Ajuda 1 p4", "Ajuda 2 p4", "Ajuda 3 p4",
"Ajuda 1 p5", "Ajuda 2 p5", "Ajuda 3 p5",
"Ajuda 1 p6", "Ajuda 2 p6", "Ajuda 3 p6",
"Ajuda 1 p7", "Ajuda 2 p7", "Ajuda 3 p7",
"Ajuda 1 p8", "Ajuda 2 p8", "Ajuda 3 p8",
"Ajuda 1 p9", "Ajuda 2 p9", "Ajuda 3 p9",
"Ajuda 1 p10", "Ajuda 2 p10", "Ajuda 3 p10",
"Ajuda 1 p11", "Ajuda 2 p11", "Ajuda 3 p11",
"Ajuda 1 p12", "Ajuda 2 p12", "Ajuda 3 p12",
"Ajuda 1 p13", "Ajuda 2 p13", "Ajuda 3 p13",
"Ajuda 1 p14", "Ajuda 2 p14", "Ajuda 3 p14",
"Ajuda 1 p15", "Ajuda 2 p15", "Ajuda 3 p15",
"Ajuda 1 p16", "Ajuda 2 p16", "Ajuda 3 p16",
"Ajuda 1 p17", "Ajuda 2 p17", "Ajuda 3 p17",
"Ajuda 1 p18", "Ajuda 2 p18", "Ajuda 3 p18",
"Ajuda 1 p19", "Ajuda 2 p19", "Ajuda 3 p19",
"Ajuda 1 p20", "Ajuda 2 p20", "Ajuda 3 p20",
"Ajuda 1 p21", "Ajuda 2 p21", "Ajuda 3 p21",
"Ajuda 1 p22", "Ajuda 2 p22", "Ajuda 3 p22",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
]
var prog = 1 // Representa o progresso do jogador
//Arrays que definem o posicionamento das perguntas durante os dialogos
//Casa 0: Fala inicial; Casa 1: Última fala antes da primeira pergunta; Casa 2: Última casa antes da segunda pergunta...
//Colocar 0 caso já tenha acabado
var q = Array(repeating: 0, count:6)
var q1 = [1, 2, 5, 9, 12, 0]
var q2 = [13, 13, 18, 22, 0, 0]
var q3 = [23, 23, 26, 33, 36, 0]
var q4 = [37, 15, 16, 17, 0, 0]
var q5 = [18, 19, 20, 21, 0, 0]
var q6 = [22, 23, 24, 25, 0, 0]
var q7 = [26, 27, 28, 29, 0, 0]
var q8 = [30, 31, 32, 33, 0, 0]

//Arrays que salvarão as respostas
var resposta1 = Array(repeating: 0, count:3)
var resposta2 = Array(repeating: 0, count:3)
var resposta3 = Array(repeating: 0, count:3)
var resposta4 = Array(repeating: 0, count:3)
var resposta5 = Array(repeating: 0, count:3)
var resposta6 = Array(repeating: 0, count:3)
var resposta7 = Array(repeating: 0, count:3)
var resposta8 = Array(repeating: 0, count:3)



//Explicações detalhadas dos tipos de investimento
let CDBEx = """
CDB - O Certificado de Depósito Bancário é um tipo de investimento em renda fixa oferecidos por bancos e com a proteção do Fundo Garantidor de Créditos. Este investimento é de baixo risco e sem taxas de administração, mas com a necessidade de ser declarado no imposto de renda. O CDB é, na prática, um empréstimo de dinheiro ao banco, e este te paga com juros. E este juros, o lucro do investimento, é acordado com a instituição financeira quando o CDB é adquirido.
    (Colocar a regra do jogo, pelo que é apresentado nas pesquisa que fiz, no ano passado o lucro médio de um bom CDB estava em torno 15 a 20% dependendo do tempo do investimento. Eu gostaria de deixar mais ou menos entre 1 e 1,5% ao mês).
    Sendo que o Imposto de renda é de 15% (na vida real este valor varia com o tempo em que a pessoa fica com o CDB Variando de 22,5 a 15%) em cima do lucro que você tiver neste investimento.
"""
let LCIEx = """
LCI/LCA - Letras de Crédito Imobiliário e Letras de Crédito do Agronegócio é um tipo de investimento em renda fixa oferecidos por bancos e com a proteção do Fundo Garantidor de Créditos. Este investimento é de baixo risco e sem taxas. Os LCI e LCA são na prática, um empréstimo destinado ao setor do agronegócio e do setor imobiliário. O lucro do investimento é acordado com a instituição financeira quando é adquirido.
    (Colocar a regra do jogo, pelo que é apresentado nas pesquisa que fiz, no ano passado o lucro médio de um bom LCI/LCA estava em torno 5 a 10% dependendo do tempo do investimento. Eu gostaria de deixar mais ou menos entre 0,5 e 1% ao mês).
    Não há impostos neste tipo de investimento, ou seja, o valor líquido é o mesmo que o valor bruto.
"""
let CRIEx = """
CRI/CRA - Certificado de Recebíveis Imobiliários e Certificado de Recebíveis do Agronegócio é um tipo de investimento em renda fixa oferecidos por securitizadoras. Os CRI e CRA são, na prática, um empréstimo destinado ao agronegócio ao setor imobiliário para que estes setores tenham capital, por exemplo, para realizar o financiamento de um imóvel. O lucro do investimento é acordado com a corretora quando é adquirido. Este investimento  não é protegido pelo Fundo Garantidor de Créditos o que pode significar perdas financeiras caso os devedores não cumpram sua parte no acordo.
    (Colocar a regra do jogo, pelo que é apresentado nas pesquisa que fiz, não achei um valor certo do valor do lucro, aparentemente porque depende do tempo que está investindo e da confiabilidade que a securitizadora tem, pois pode haver um calote. Os dados que eu encontrei são baseados no CDI, que é um valor que flutua. Eu gostaria de deixar mais ou menos entre 1,5 e 2% ao mês).
    Não há impostos neste tipo de investimento, mas pode haver uma cobrança de uma taxa administrativa da corretora (Os valores estão na casa de 2% do valor investido).
"""
let DEBEx = """
Debêntures - Debêntures é um tipo de investimento em renda fixa oferecidos por corretoras. As debêntures são, na prática, um empréstimo para empresas que estão arrecadando recursos para financiar o desenvolvimento de seu negócio. O lucro do investimento é acordado com a corretora quando é adquirido. Este investimento  não é protegido pelo Fundo Garantidor de Créditos o que pode significar perdas financeiras caso os devedores não cumpram sua parte no acordo.
    (Colocar a regra do jogo, pelo que é apresentado nas pesquisa que fiz, no ano passado o lucro médio de um bom Debênture estava em torno 10 a 20% dependendo do tempo do investimento. Eu gostaria de deixar mais ou menos 1,5 % ao mês).
    Sendo que o Imposto de renda é de 15% (na vida real este valor varia com o tempo em que a pessoa fica com o CDB Variando de 22,5 a 15%) em cima do lucro que você tiver neste investimento.
"""

