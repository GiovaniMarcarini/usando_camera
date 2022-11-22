import 'package:flutter/cupertino.dart';



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
}