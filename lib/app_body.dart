import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppBody extends StatelessWidget {
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    final nameController = TextEditingController();
    final nameField = TextField(
      controller: nameController,
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
        labelText: '輸入姓名',
        labelStyle: TextStyle(fontSize: 20),
      ),
    );

    // Button.
    final btn1= RaisedButton(
      child: Text('確定'),
      onPressed: () => _showSnackBar(nameController.text),
    );

    // Arrange widgets.



    final btn = PopupMenuButton(
      itemBuilder: (context) =>
      <PopupMenuEntry>[
        PopupMenuItem(
          child: Text("第一項", style: TextStyle(fontSize: 20),
          ),
          value: 1,
        ),
        PopupMenuDivider(),
        PopupMenuItem(
          child: Text("第二項", style: TextStyle(fontSize: 20),),
          value: 2,
        ),
        PopupMenuDivider(),
        PopupMenuItem(
          child: Text("第三項", style: TextStyle(fontSize: 20),),
          value: 3,
        ),
      ],
      child: Text(
        '開啟選單',
        style: TextStyle(fontSize: 20),
      ),
      color: Colors.yellow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      offset: Offset(120, 30),
      onSelected: (value) {
        if(value==1){
          Fluttertoast.showToast(
              msg: '1',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontSize: 20.0);
        }else if(value==2){
          Fluttertoast.showToast(
              msg: '2',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontSize: 20.0);
        }
        else{
          Fluttertoast.showToast(
              msg: '3',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontSize: 20.0);
        }
      },
      onCanceled: () => _showSnackBar('取消選擇'),
    );


    String dropdownValue = 'One';
   final btn2= DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
       onChanged: (String? newValue){
           if(newValue=='One'){
             Fluttertoast.showToast(
                 msg: 'One',
                 toastLength: Toast.LENGTH_LONG,
                 gravity: ToastGravity.BOTTOM,
                 backgroundColor: Colors.blue,
                 textColor: Colors.white,
                 fontSize: 20.0);
           }else if(newValue=='Two'){
             Fluttertoast.showToast(
                 msg: 'Two',
                 toastLength: Toast.LENGTH_LONG,
                 gravity: ToastGravity.BOTTOM,
                 backgroundColor: Colors.blue,
                 textColor: Colors.white,
                 fontSize: 20.0);
           }
           else if(newValue=='Three'){
             Fluttertoast.showToast(
                 msg: 'Three',
                 toastLength: Toast.LENGTH_LONG,
                 gravity: ToastGravity.BOTTOM,
                 backgroundColor: Colors.blue,
                 textColor: Colors.white,
                 fontSize: 20.0);
           }
           else{
             Fluttertoast.showToast(
                 msg: 'Four',
                 toastLength: Toast.LENGTH_LONG,
                 gravity: ToastGravity.BOTTOM,
                 backgroundColor: Colors.blue,
                 textColor: Colors.white,
                 fontSize: 20.0);
           }
       },


      items: <String>['One', 'Two', 'Three', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );




    final widget = Center(
      child: Column(
        children: <Widget>[
          Container(child: nameField, width: 200, margin: EdgeInsets.symmetric(vertical: 10),),
          Container(child: btn1, margin: EdgeInsets.symmetric(vertical: 20),),
          Container(child: btn, margin: EdgeInsets.symmetric(vertical: 20),),
          Container(child: btn2, margin: EdgeInsets.symmetric(vertical: 20),),
        ],
      ),
    );


    return widget;
  }

  void _showSnackBar(String msg) {
    // 建立SnackBar物件
    final snackBar = SnackBar(
      content: Text(msg),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      action: SnackBarAction(
        label: 'Toast訊息',
        textColor: Colors.white,
        onPressed: () =>
            Fluttertoast.showToast(
                msg: '你按下SnackBar',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                fontSize: 20.0),
      ),
    );

    // 顯示SnackBar
    Scaffold.of(context).showSnackBar(snackBar);
  }
}