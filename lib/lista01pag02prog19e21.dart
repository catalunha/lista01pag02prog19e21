void sacar(String valorDoSaque) {
  var notas = valorEmNotas(valorDoSaque);
  var texto = valorEmTexto(valorDoSaque);

  if (notas == null) {
    print('Saque com problemas ! 😬');
  } else {
    print('Saque bem sucedido ! 👍');
    print('Olá');
    print('Você deseja sacar R\$ $valorDoSaque,00 ($texto)');
    print('Portanto irei lhe entregar :');
    for (var element in notas.entries) {
      print(
          '${element.value} nota${element.value > 1 ? 's' : ''} de R\$ ${element.key},00 ${int.parse(element.key) > 1 ? 'reais' : 'real'}');
    }
  }
}

Map<String, int>? valorEmNotas(String valorDoSaque) {
  int value = int.parse(valorDoSaque);
  List<int> listNotas = [200, 100, 50, 20, 10, 5, 2, 1];
  List<int> listQde = List.filled(listNotas.length, 0);
  Map<String, int> mapNotas = {};

  for (var i = 0; i < listNotas.length; i++) {
    // print('valor=$value');
    int qde = value ~/ listNotas[i];
    if (qde > 0 && value > 0) {
      listQde[i] = qde;
      mapNotas[listNotas[i].toString()] = qde;
      value = value - (qde * listNotas[i]);
    }
    // print('i=$i qde=$qde nota=${listNotas[i]} valorRestante=$value');
  }

  int soma = 0;
  for (var element in mapNotas.entries) {
    soma += element.value * int.parse(element.key);
  }
  if (soma.toString() != valorDoSaque) {
    mapNotas.clear();
  }
  return mapNotas.isEmpty ? null : mapNotas;
}

String valorEmTexto(String valorDoSaque) {
  List<String> unidade = [
    '',
    'um',
    'dois',
    'três',
    'quatro',
    'cinco',
    'seis',
    'sete',
    'oito',
    'nove',
    'dez',
    'onze',
    'doze',
    'treze',
    'quatorze',
    'quinze',
    'dezesseis',
    'dezessete',
    'dezoito',
    'dezenove'
  ];
  List<String> dezena = [
    '',
    '',
    'vinte',
    'trinta',
    'quarenta',
    'cinquenta',
    'sessenta',
    'setenta',
    'oitenta',
    'noventa'
  ];
  List<String> centena = [
    '',
    'cento',
    'duzentos',
    'trezentos',
    'quatrocentos',
    'quinhentos',
    'seiscentos',
    'setecentos',
    'oitocentos',
    'novecentos',
  ];
  List<int> valueList =
      valorDoSaque.split('').map((e) => int.parse(e)).toList();
  // print(valueList);
  String valueText = '';
  if (valueList.length == 3) {
    valueText = '${centena[valueList[0]]} e ';
    // print(valueText);
    valueList.removeAt(0);
  }
  if (valueList.length == 2) {
    if (valueList[0] > 1) {
      // print(dezena[valueList[0]]);
      // print(unidade[valueList[1]]);
      valueText =
          '$valueText${dezena[valueList[0]]} e ${unidade[valueList[1]]}';
      // print(valueText);
    } else {
      // print(unidade[valueList[0] * 10 + valueList[1]]);
      valueText = valueText + unidade[valueList[0] * 10 + valueList[1]];

      // print(valueText);
    }
  }
  if (valueList.length == 1) {
    // print(unidade[valueList[0]]);
    valueText = valueText + unidade[valueList[0]];

    // print(valueText);
  }
  return valueText;
}
