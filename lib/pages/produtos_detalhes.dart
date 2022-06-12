import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mandaCakes/models/itens.dart';
import 'package:mandaCakes/repositories/carrinho_repositorie.dart';
import 'package:provider/provider.dart';

import '../models/produtos.dart';
import '../repositories/carrinho_repositorie.dart';

class ProdutosDetalhes extends StatefulWidget {
  Produto produto;
  ProdutosDetalhes({Key? key, required this.produto}) : super(key: key);

  @override
  _ProdutosDetalhesState createState() => _ProdutosDetalhesState();
}

class _ProdutosDetalhesState extends State<ProdutosDetalhes> {
  final _form = GlobalKey<FormState>();
  final _qtde= TextEditingController();
  double quantidade = 0;
  late CarrinhoRepository carrinho;

comprar()async{
  if(_form.currentState!.validate()){
    await carrinho.addProduto(Itens(produto: widget.produto, quantidade: quantidade));
    ScaffoldMessenger .of(context).showSnackBar(SnackBar(content: Text('Produto adicionado ao carrinho')));
  }
      Navigator.pop(context);

}

  @override
  Widget build(BuildContext context) {
    carrinho= Provider.of<CarrinhoRepository>(context, listen: false);
    var produto = widget.produto;
    return Scaffold(
      appBar: AppBar(
        title: Text(produto.nome),
        
      ),
        body: SingleChildScrollView(
          
          child: Container(
           width:  MediaQuery.of(context).size.width,
           height: MediaQuery.of(context).size.height,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                     Text(
                              produto.descricao,
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -1,
                                color: Colors.grey[800],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Card(
                              
                              child: SizedBox(
                              
                                child:
                                    Image.asset('assets/Produtos/${produto.id}.jpg'),
                                width: MediaQuery.of(context).size.width * 0.6,
                              ),
                            ),
                           
                          ],
                        )
                        
                        ),
                       
                        (quantidade > 0)
                        ? SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            child: Text(
                              '$quantidade ${widget.produto.descricao}',
                              style: TextStyle(
                                fontSize: 20,
                  
                                color: Colors.teal,
                              ),
                            ),
                            margin: EdgeInsets.only(bottom: 24),
                            alignment: Alignment.center,
        
                            ),
                            
        
                          )
                          : SizedBox(),
                          SizedBox(
                            width:200,
                            height: 60,
                            child: Form(
                              key:  _form,
                              child: TextFormField(
                               controller: _qtde,
                               style: TextStyle(fontSize: 18),
                               decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Quantidade',
                                prefixIcon: Icon(Icons.add_circle_outline),
                                
                                
                               ),
                             keyboardType: TextInputType.number,
                             inputFormatters: [
                               FilteringTextInputFormatter.digitsOnly],
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Informe a quantidade';
                                }
                                if(value == '0'){
                                  return 'Informe a quantidade';
                                }
                                return null;
                              },
                              onChanged: (value){
                                setState(() {
                                  quantidade =(value.isEmpty)?0: double.parse(value) * widget.produto.valor;
                                }
                                );
                                
                              },
        
                              ),
                              ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
        
                            SizedBox(
                              width: 150,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: comprar,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add_shopping_cart),
                                    Padding(
                                      padding: const EdgeInsets.all(14),
                                      child: Text('Comprar',
                                      style: TextStyle(fontSize: 12),),
                                      
                                    ),
                                  ],
                                ),
                                )
                              )
                            
                       
                  ],
                  
                )
                ),
          ),
        )

            );
  }
}
