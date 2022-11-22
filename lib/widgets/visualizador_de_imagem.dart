import 'dart:html';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import '../model/contato.dart';

class VisualizadorImagem extends StatefulWidget{
  final String tipoImagem;
  final String? caminhoImagem;
  final double size;

  const VisualizadorImagem({Key? key, required this.tipoImagem, this.caminhoImagem, this.size = 50}) : super (key: key);

  State<StatefulWidget> createState() => _VisualizadorImagemState();

}

class _VisualizadorImagemState extends State<VisualizadorImagem>{
  @override
  Widget build(BuildContext context){
    return Container(
      width: widget.size,
        height: widget.size,
      decoration: BoxDecoration(
        image: _criaWidgetImagem(),
      ),
    );
  }
  DecorationImage? _criaWidgetImagem() {
    if (widget.tipoImagem == Contato.tipoImagemNetwork){
      final radom = Random();
      return DecorationImage(
        image: NetworkImage(
          'https://picsum.photos/200?random=${radom.nextInt(100)+1}',
        )
      );
    }else if(widget.tipoImagem == Contato.tipoImagemFile){
      if(widget.caminhoImagem?.isNotEmpty == true){
        //final file = File(widget.caminhoImagem!);
       // return DecorationImage(
        //    image: FileImage(file),
       // );

    }else{
      return null;
      }
    }
    else{
      final random = Random();
      return DecorationImage(
          image: AssetImage('assets/imagem_${random.nextInt(3)+1}.jpg')
      );
    }
  }
}