import 'package:flutter/material.dart';
import 'package:fooddelivery/main.dart';
import 'package:fooddelivery/model/pref.dart';

import 'language/langDeu.dart';
import 'language/langArabic.dart';
import 'language/langEsp.dart';
import 'language/langFrench.dart';
import 'language/langKorean.dart';
import 'language/langPort.dart';
import 'language/langRus.dart';

class LangData{
  String name;
  String engName;
  String image;
  bool current;
  int id;
  TextDirection direction;
  LangData({this.name, this.engName, this.image, this.current, this.id, this.direction});
}

class Lang {

  static var english = 1;
  static var german = 2;
  static var espanol = 3;
  static var french = 4;
  static var korean = 5;
  static var arabic = 6;
  static var portugal = 7;
  static var rus = 8;

  var direction = TextDirection.ltr;

  List<LangData> langData = [
    LangData(name: "English", engName: "English", image: "assets/usa.png", current: false, id: english, direction: TextDirection.ltr),
    LangData(name: "Deutsh", engName: "German", image: "assets/ger.png", current: false, id: german, direction: TextDirection.ltr),
    LangData(name: "Spana", engName: "Spanish", image: "assets/esp.png", current: false, id: espanol, direction: TextDirection.ltr),
    LangData(name: "Français", engName: "French", image: "assets/fra.png", current: false, id: french, direction: TextDirection.ltr),
    LangData(name: "한국어", engName: "Korean", image: "assets/kor.png", current: false, id: korean, direction: TextDirection.ltr),
    LangData(name: "عربى", engName: "Arabic", image: "assets/arabic.png", current: false, id: arabic, direction: TextDirection.rtl),
    LangData(name: "Português", engName: "Portuguese", image: "assets/portugal.png", current: false, id: portugal, direction: TextDirection.ltr),
    LangData(name: "Русский", engName: "Russian", image: "assets/rus.jpg", current: false, id: rus, direction: TextDirection.ltr),
  ];

  Map<int, String> langEng = {
    10: "Mercados de fornecedores",
    82: "Você pode adicionar ao carrinho apenas produtos de um único mercado. Deseja redefinir o carrinho? E adicionar novo produto.",
    142: "Curtindo o mercado?",
    143: "Como você avaliaria este mercado?",
    200: "Principais adegas desta semana",
    247: "Retirada do mercado",
    259: "O Mercado:",
    267: "Mercado",

    15: "USUÁRIO",
    16: "SENHA",
    17: "Esqueci a senha",
    18: "Continuar",
    19: "VOCÊ NÃO POSSUI UMA CONTA? \n CRIE UMA AGORA MESMO!",
    20: "Esqueci a senha",
    21: "Endereço de e-mail",
    22: "LOGIN",
    23: "ENVIAR",
    24: "Crie uma conta!",
    25: "Confirme a senha",
    26: "CRIAR CONTA",
    27: "Para continuar digite seu número de telefone",
    28: "Número de telefone",
    29: "CONTINUAR",
    30: "Verificar número de telefone",
    33: "Vitrine",
    34: "Pesquisar",
    35: "Notificações",
    36: "Meus pedidos",
    37: "Conta",
    38: "Favoritos",
    39: "Perto de você",
    42: "Destaque",
    43: "Comentários recentes",
    44: "Não tenho notificações",
    45: "Notificações",
    46: "Esta é uma informação muito importante",
    47: "Mapa",
    48: "Endereço",
    51: "Ajuda e suporte",
    57: "Nome de usuário",
    58: "E-mail",
    62: "Idiomas",
    63: "Idioma do aplicativo",
    69: "Informações",
    70: "segunda-feira",
    71: "terça-feira",
    72: "quarta-feira",
    73: "quinta-feira",
    74: "sexta-feira",
    75: "sábado",
    76: "domingo",
    77: "Comentários",
    79: "Ingredientes",
    80: "Nutrição",
    81: "Telefone Móvel",
    83: "Reiniciar",
    84: "Cancelar",
    85: "Comentários",
    86: "Não há nenhum item em seu carrinho",
    87: "Confira nossos novos itens e atualize sua coleção",
    88: "Continuar comprando",
    89: "Extras",
    90: "Adicionar ao carrinho",
    91: "Produtos",
    93: "Subtotal",
    94: "Custos de compra",
    95: "Impostos",
    96: "Total",
    97: "Finalizar compra",
    98: "Cesta",
    99: "Carrinho de compras",
    100: "Verifique sua quantidade e clique em finalizar compra",
    106: "Telefone",
    118: "Concluído",
    119: "Meus pedidos",
    120: "Pedido recebido",
    121: "Preparação de pedidos",
    122: "Pedido pronto",
    123: "A caminho",
    124: "Entrega",
    125: "Você deve fazer login para acessar esta seção",
    127: "OK",
    128: "Algo deu errado.",
    130: "Este produto foi adicionado ao carrinho",
    131: "Este produto já foi adicionado ao carrinho",
    132: "Sair",
    133: "Tudo",
    134: "As senhas são diferentes.",
    135: "Uma carta com uma nova senha foi enviada para o e-mail especificado",
    136: "Usuário com este e-mail não foi encontrado!",
    137: "Falha ao enviar e-mail. Tente novamente mais tarde. \ N",
    138: "Adicionar Comentário",
    140: "Como você classificaria este produto?",
    141: "Digite seu comentário",
    145: "Alterar senha",
    146: "Editar Perfil",
    147: "Alterar senha",
    148: "Senha antiga",
    149: "Digite sua senha antiga",
    150: "Nova senha",
    152: "Digite sua nova senha",
    153: "Confirmar nova senha",
    154: "Digite sua nova senha",
    155: "Cancelar",
    156: "Editar perfil",
    157: "Nome de usuário",
    158: "Digite seu nome de usuário",
    159: "E-mail",
    160: "Digite seu e-mail de usuário",
    161: "Digite o telefone do usuário",
    162: "Mudar",
    163: "Abrir Galeria",
    164: "Abrir câmera",
    166: "Alteração de senha",
    167: "Senhas não são iguais",
    168: "A senha antiga está incorreta",
    169: "O comprimento da senha deve ter mais de 5 caracteres",
    170: "Digite a nova senha",
    171: "Alteração do perfil do usuário",
    172: "Digite o Login",
    173: "Digite a senha",
    174: "Login ou senha incorretos",
    175: "Digite seu Login",
    176: "Digite seu e-mail",
    177: "Digite sua senha",
    178: "Seu e-mail está incorreto",
    179: "Não tenho produtos favoritos",
    180: "Não tenho pedidos",
    181: "Selecione um lugar no mapa ou encontre o endereço na Pesquisa",
    182: "Endereço de entrega:",
    183: "sem endereço",
    184: "Selecionar Endereço",
    185: "Digite o número do telefone",
    186: "Inserir comentários",
    188: "Pagamento",
    189: "Pagamento na entrega",
    191: "Razorpay",
    192: "Visa, Mastercard",
    194: "Todas as transações são seguras e criptografadas.",
    195: "Id #",
    196: "Cancelado",
    197: "e",
    198: "itens",
    199: "Mais vendidos da semana",
    201: "Eu mesmo pegarei os produtos",
    202: "Quando seu pedido estiver pronto, você receberá a mensagem: \"Seu pedido estava pronto \". Então"
        "quando você chegar ao local de retirada, abra o aplicativo. Abra \" Meus pedidos \"e toque em \" Pedido \"para ver os detalhes."
        "Clique no botão \"Cheguei \"",
    203: "Eu cheguei",
    204: "Envio de notificação ...",
    205: "Bate-papo",
    206: "Carteira",
    207: "Complete e aproveite esses benefícios",
    208: "Pagamento fácil",
    209: "Peça o produto com 1 clique",
    210: "Entrega sem dinheiro",
    211: "Evite o incômodo do dinheiro",
    212: "Reembolsos instantâneos",
    213: "Quando você precisa cancelar um pedido",
    214: "Completar",
    215: "EQUILÍBRIO",
    216: "Encha agora",
    217: "Insira o valor",

    218: "Nota! \ NA distância de entrega",
    219: "Chegando em 30-60 min",
    220: "Alterar>",
    221: "Agora",
    222: "Mais tarde",
    223: "Confirmar",
    224: "Chegando em",
    225: "Insira as informações do veículo",
    226: "Ajude-nos a localizar seu veículo quando você chegar.",
    227: "Selecione o tipo de veículo:",
    228: "Selecione a cor do veículo",
    229: "SUV",
    230: "Sedan",
    231: "Coupé",
    232: "Rastrear",
    233: "Bicicleta",
    234: "Outro",
    235: "Preto",
    236: "Vermelho",
    237: "Branco",
    238: "Cinza",
    239: "Prata",
    240: "Verde",
    241: "Azul",
    242: "marrom",
    243: "Ouro",
    244: "Salvar informações do veículo",
    245: "Tipo de veículo:",
    246: "Cor do veículo",
    248: "Selecione o tipo de veículo",
    249: "PayPal",
    250: "Pagamento PayPal",
    251: "PayStack",
    252: "Compra concluída!",
    253: "Pedido nº #",
    254: "Você fez o pedido com sucesso",
    255: "Você pode verificar o status do seu pedido usando nosso recurso de status de entrega. Você receberá uma mensagem de confirmação do pedido.",
    256: "Mostrar todos os meus pedidos",
    257: "Voltar à loja",
    258: "Cupom",
    260: "a distância máxima de entrega é",
    261: "é muito longo.",
    262: "Produto",
    263: "não participa da promoção",
    264: "O valor mínimo da compra deve ser",
    265: "Yandex.Kassa",
    266: "Instamojo",
    268: "Categorias",
    269: "Faça login com o Google",
    270: "Faça login com o Facebook",
    271: "ou",
    272: "Este e-mail já está cadastrado!",
    273: "Faça login com o Google",
    274: "Faça login com o Facebook",
    275: "Mostrar área de entrega",
    276: "Este filtro funcionará em todo o aplicativo.",
    277: "Selecionar Endereço no Mapa",
    278: "Adicionar Endereço",
    279: "Latitude",
    280: "Longitude",
    281: "Casa",
    282: "Trabalho",
    283: "Outro",
    284: "Padrão",
    285: "Endereços não encontrados",
    286: "Insira o endereço",
    287: "padrão",
    288: "Número do telefone",
    289: "enviar SMS com código. Digite o código",
    290: "Falha ao verificar o número de telefone",
    291: "Falha ao entrar",
    292: "Digite o número do veículo",
    293: "Número do veículo",
    294: "Valor mínimo do pedido",
    295: "Variantes",
    296: "Veja também",
    297: "Comentários",
    298: "Faça login com a Apple",
    299: "Entrar com a Apple",
    300: "por",
    301: "Taxa de entrega",
    302: "De",
    303: "Para",
    304: "Distância",
    305: "Mostrar pedido no mapa",
    306: "Deseja mesmo sair?",
    307: "Sair",
    308: "Data de chegada:",
    309: "Selecionar distância máxima:",
    310: "Convidado",
    311: "Pesquisar produtos",
    312: "Filtro",
    313: "Quantidade",
    314: "Compartilhe este aplicativo",
    315: "Selecione sua cidade",
    316: "Salvar",
    317: "Selecione sua cidade",
    318: "Selecionar cidade",
    319: "Todas as cidades",
    320: "Você tem mais de 18 anos?",
    321: "É proibido venda de bebidas alcoólicas para menores",

    //
    1010: "Restaurantes",
    1082: "Você pode adicionar ao carrinho, apenas produtos de um único restaurante. Deseja redefinir o carrinho? E adicionar novo produto.",
    1142: "Gostando do restaurante?",
    1143: "Como você avaliaria este Restaurante?",
    1200: "Melhores restaurantes desta semana",
    1247: "Recolha no restaurante",
    1259: "O Restaurante:",
    1267: "Restaurante",

    //
    2010: "Mercado",
    2082: "Você pode adicionar ao carrinho, apenas produtos do mercado único. Deseja redefinir o carrinho? E adicionar novo produto.",
    2142: "Curtindo o mercado?",
    2143: "Como você avaliaria este mercado?",
    2200: "Mercado principal esta semana",
    2247: "Retirada do mercado",
    2259: "O mercado:",
    2267: "Mercado",

    //
    3010: "Mercados",
    3082: "Você pode adicionar ao carrinho, apenas produtos do mercado único. Deseja redefinir o carrinho? E adicionar novo produto.",
    3142: "Curtindo o mercado?",
    3143: "Como você avaliaria este mercado?",
    3200: "Mercado principal esta semana",
    3247: "Retirada do mercado",
    3259: "O Mercado:",
    3267: "Mercado",
    99001: "Todos os produtos",
  };

  //
  //
  //
  setLang(int id){
    pref.set(Pref.language, "$id");
    if (id == english) {
      defaultLang = langPort;
      init = true;
    }
    if (id == german) {
      defaultLang = langDeu;
      init = true;
    }
    if (id == espanol) {
      defaultLang = langEsp;
      init = true;
    }
    if (id == french) {
      defaultLang = langFrench;
      init = true;
    }
    if (id == korean) {
      defaultLang = langKorean;
      init = true;
    }
    if (id == arabic) {
      defaultLang = langArabic;
      init = true;
    }
    if (id == portugal){
      defaultLang = langPort;
      init = true;
    }
    if (id == rus){
      defaultLang = langRus;
      init = true;
    }
    for (var lang in langData) {
      lang.current = false;
      if (lang.id == id) {
        lang.current = true;
        direction = lang.direction;
      }
    }
  }

  Map<int, String> defaultLang;
  var init = false;

  String get(int id){
    if (!init) return "";
    if (theme.appTypePre == "restaurants"){
      switch (id){
        case 10: id = 1010; break;
        case 82: id = 1082; break;
        case 142: id = 1142; break;
        case 143: id = 1143; break;
        case 200: id = 1200; break;
        case 247: id = 1247; break;
        case 259: id = 1259; break;
        case 267: id = 1267; break;
      }
    }
    if (theme.appTypePre == "market"){
      switch (id){
        case 10: id = 2010; break;
        case 82: id = 2082; break;
        case 142: id = 2142; break;
        case 143: id = 2143; break;
        case 200: id = 2200; break;
        case 247: id = 2247; break;
        case 259: id = 2259; break;
        case 267: id = 2267; break;
      }
    }
    if (theme.appTypePre == "markets"){
      switch (id){
        case 10: id = 3010; break;
        case 82: id = 3082; break;
        case 142: id = 3142; break;
        case 143: id = 3143; break;
        case 200: id = 3200; break;
        case 247: id = 3247; break;
        case 259: id = 3259; break;
        case 267: id = 3267; break;
      }
    }
    var str = defaultLang[id];
    if (str == null)
      str = "";

    return str;
  }
}

