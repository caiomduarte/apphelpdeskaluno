import 'package:apphelpdeskaluno/model/Orders.dart';
import 'package:apphelpdeskaluno/util/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderPage extends StatefulWidget {
  // const OrderPage({ Key? key }) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<Orders> listaChamados = [
    Orders(1, 'Problema com monitor', DateTime.now(), true),
    Orders(2, 'Problema com teclado', DateTime.now(), false),
    Orders(3, 'Problema com Internet', DateTime.now(), true),
    Orders(4, 'Falta de energia', DateTime.now(), false),
    Orders(5, 'Sistema operaciona travando', DateTime.now(), true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(152),
          child: Container(
            margin: EdgeInsets.only(top: 50),
            child: ListTile(
              title: Text(
                'HelpDesk',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 40,
                        color: AppColors.textColorBlue,
                        fontWeight: FontWeight.w600)),
              ),
              subtitle: Text(
                'Conta conosco, estamos aqui para ajudar',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 12,
                    color: AppColors.textColorBlue,
                  ),
                ),
              ),
              trailing: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primaryColor),
                child: Icon(Icons.phone_callback_rounded, color: Colors.white),
              ),
            ),
          ),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.only(top: 35),
            child: Column(
              children: [
                Text('Filtre pelo Status do chamado',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textColorBlue))),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 3),
                      width: 124,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.primaryColor),
                      child: Text(
                        'Finalizados',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 3),
                      width: 124,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.buttonRed),
                      child: Text(
                        'Em aberto',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                      itemCount: listaChamados.length,
                      itemBuilder: (context, index) =>
                          buildOrder(listaChamados[index])),
                ))
              ],
            ),
          ),
        ));
  }

  Widget buildOrder(Orders obj) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      width: 340,
      height: 100,
      decoration: BoxDecoration(
          color: Color(0xffF0F2F5),
          border: Border(left: BorderSide(width: 4, color: Colors.red))),
      child: ListTile(
        contentPadding: EdgeInsets.all(8),
        title: Text(obj.descricao,
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColorBlue))),
        subtitle: Container(
          margin: EdgeInsets.only(top: 25),
          child: Text(
            obj.dataChamado.toString(),
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDescriptionCard),
            ),
          ),
        ),
      ),
    );
  }
}
