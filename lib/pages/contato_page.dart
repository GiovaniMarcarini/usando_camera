import 'package:contato_cadastro/model/contato.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:video_player/video_player.dart';

import '../dao/contato_dao.dart';

class FormContatoPage extends StatefulWidget{
  static const imagem = 'imagem';
  static const video = 'video';

  final Contato? contato;

  const FormContatoPage({Key? key, this.contato}) : super (key: key);

  _FormContatoPageState createState() => _FormContatoPageState();
}

class _FormContatoPageState extends State <FormContatoPage>{
  final _formKey = GlobalKey<FormState>();
  final _dao = ContatoDao();
  final _nomeController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefoneFormater = MaskTextInputFormatter(
    mask: '(##) ?####-####',
    filter: {'#' : RegExp(r'[0-9]'), '?': RegExp(r'[0-9]?')},
  );
  var _salvando = false;
  late String _tipoImagem;
  String? _caminhoImagem;
  String? _caminhoVideo;
  final _picker = ImagePicker();
  VideoPlayerController? _videoPalyerController;
  bool _reproduzindoVideo = false;

  @override
  void initState(){
    super.initState();
    if(widget.contato != null){
      _nomeController.text = widget.contato!.nome;
      _telefoneController.text = widget.contato!.telefone ?? '';
      _emailController.text = widget.contato!.email ?? '';
      _tipoImagem = widget.contato!.tipoImagem;
      _caminhoImagem = widget.contato!.caminhoImagem;
      _caminhoVideo = widget.contato!.caminhoVideo;
    }else{
      _tipoImagem = Contato.tipoImagemAssets;
    }
    //_inicializarVideoPlayerController();
  }

  @override
  void dispose(){
    _videoPalyerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: _criarAppBar(),
      body: _criarBody(),
    );
  }

  AppBar _criarAppBar(){
    final String title;
    if(widget.contato == null){
      title = 'Novo Contato';
    }else{
      title = 'Alterar Contato';
    }
    final Widget titleWidget;
    if(_salvando){
      titleWidget = Row(
        children: [
          Expanded(
              child: Text(title)),
          const SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(
              color: Colors.red,
              strokeWidth: 2,
            ),
          )
        ],
      );
    }else{
      titleWidget = Text(title);
    }
    return AppBar(
          title: titleWidget,
        actions: [
          if(!_salvando)
            IconButton(onPressed: _salvar, icon:Icon(Icons.check),
            ),
        ],
      );
  }
  Widget _criarBody(){
    return LayoutBuilder(
        builder: (_, BoxConstraints contraints){
          return Padding(
              padding: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                TextFormField(
                  decoration:InputDecoration(labelText: 'Nome'),
                  controller: _nomeController,

                )
              ],
            ),
          ),
          );
        }

    );
  }
  void _salvar(){

  }
}