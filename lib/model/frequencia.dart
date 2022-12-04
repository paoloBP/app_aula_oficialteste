import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class Frequencia {
  String? id;
  String? nome;
  String? idade;
  String? sexo;

  double calculaFreqMax() {
    double idade = double.parse(this.idade!);

    if (sexo == 'Masculino') {
      return 220 - idade;
    } else {
      return 226 - idade;
    }
  }

  double calculaZ1() {
    double freqMax = calculaFreqMax();
    return freqMax * 0.81;
  }

  double calculaZ2() {
    double freqMax = calculaFreqMax();
    return freqMax * 0.88;
  }

  double calculaZ3() {
    double freqMax = calculaFreqMax();
    //formatar pra só duas casas decimais
    return freqMax * 0.93;
  }

  double calculaZ4() {
    double freqMax = calculaFreqMax();
    return freqMax * 0.99;
  }

  double calculaZ5() {
    double freqMax = calculaFreqMax();
    return freqMax * 1.06;
  }

  String calculaFreqAlvo() {
    return ' \nnome: $nome \nidade: $idade  \nsexo: $sexo \nCalculo: ${calculaFreqMax()}    \nZona 1: ${calculaZ1()} \nZona 2: ${calculaZ2()} \nZona 3: ${calculaZ3()} \nZona 4: ${calculaZ4()} \nZona 5: ${calculaZ5()}';
  }

  Frequencia() {
    id = null;
    nome = "";
    idade = "";
    sexo = "";
  }

  Frequencia.init(this.id, this.nome, this.idade, this.sexo);

  factory Frequencia.fromMap(Map<String, dynamic> json) {
    return Frequencia.init(
        json['id'], json['nome'], json['idade'], json['sexo']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'idade': idade,
      'sexo': sexo,
    };
  }

  bool operator ==(Object other) {
    return (other is Frequencia) && (other.id == id);
  }
}
