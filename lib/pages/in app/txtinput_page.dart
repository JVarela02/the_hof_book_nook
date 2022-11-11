import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


class TextbookInputPage extends StatefulWidget {
  const TextbookInputPage({super.key});

  @override
  State<TextbookInputPage> createState() => _TextbookInputPageState();
}

class _TextbookInputPageState extends State<TextbookInputPage> {

  final user = FirebaseAuth.instance.currentUser!;

  List<String> items = <String>["Like New","Slightly Used", "Acceptable"];
  String dropdownValue = "Condition";

  // input controllers 
  final _isbnInputController = TextEditingController();
  final _conditionController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void dispose() {
    _isbnInputController.dispose();
    _conditionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  bool isbnLengthCorrect(){
    if(_isbnInputController.text.toString().length == 13 || _isbnInputController.text.toString().length == 10){
      return true;
    }
    else{
      return false;
    }
  }

  bool conditionCorrect(){
    if(_conditionController.text.toString().toLowerCase() == "like new" || _conditionController.text.toString().toLowerCase() == "slightly used" || _conditionController.text.toString().toLowerCase() == "acceptable") {
      return true;
    }
    else{
      return false;
    }
  }

  Future textbookUpload() async {
    if (isbnLengthCorrect() && conditionCorrect()) {
      textbookToFirebase(
        user.email.toString(),
        _isbnInputController.text.toString(), 
        _conditionController.text.toLowerCase(),
        _priceController.text.toString(),);
      showDialog(context: context, builder: (context){
        return const AlertDialog(
          content: Text("Textbook Uploaded"),
        );
      });
    }
    else{
      if(isbnLengthCorrect() && !conditionCorrect()){
        showDialog(context: context, builder: (context){
        return const AlertDialog(
          content: Text("Condition is not correct. Please make sure it says either 'like new', 'slightly used', or 'acceptable' and try again"),
        );
      });
      }
      if(!isbnLengthCorrect() && conditionCorrect()){
        showDialog(context: context, builder: (context){
        return const AlertDialog(
          content: Text("ISBN number is not valid. Please make sure that the length is either 10 or 13 characters long and try again"),
        );
      });
      }
      else{
        showDialog(context: context, builder: (context){
        return const AlertDialog(
          content: Text("ISBN number and Condition are not valid. Please make sure it says either 'like new', 'slightly used', or 'acceptable' and that the length is either 10 or 13 characters long and try again "),
        );
      });
      }
    }
  }

  Future textbookToFirebase(String Txtseller, String ISBNnumber, String Txtcondition, String Txtprice) async {
    await FirebaseFirestore.instance.collection("textbooks").add({
      'Seller' : Txtseller,
      'ISBN' : ISBNnumber,
      'Condition': Txtcondition,
      'Price' : Txtprice,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
         const FittedBox(
           child: Padding(
             padding: EdgeInsets.only(left: 1.0),
             child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Upload Listing")
              ),
           ),
         ),
      ),
      

    body: 
      SafeArea(
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // DropdownButton<String>(
            //   value: dropdownValue,
            //   icon: const Icon(Icons.keyboard_arrow_down), 
            //   onChanged:
            //   (String? Newalue) {
            //     // This is called when the user selects an item.
            //       setState(() {
            //         dropdownValue = Newalue!;
            //       });
            //   },
            //   items: 
            //   items.map<DropdownMenuItem<String>>((String value) {
            //   return DropdownMenuItem<String>(
            //     value: value,
            //     child: Text(value),
            //   );}).toList(),
            //   ),
      
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                color: Color.fromARGB(255, 207, 230, 247),
                border: Border.all(color: Color.fromARGB(255, 235, 235, 235),
                width: 3),
                borderRadius: BorderRadius.circular(6),
                ),
              child: Padding(
                padding: const EdgeInsets.only(left:6.0),
                child: TextField(
                controller: _isbnInputController,
                decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "ISBN Number",
            ),),),),),
      
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                color: Color.fromARGB(255, 207, 230, 247),
                border: Border.all(color: Color.fromARGB(255, 235, 235, 235),
                width: 3),
                borderRadius: BorderRadius.circular(6),
                ),
              child: Padding(
                padding: const EdgeInsets.only(left:6.0),
                child: TextField(
                controller: _conditionController,
                decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Condition (Like New, Slightly Used, Acceptable)",
            ),),),),),
      
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                color: Color.fromARGB(255, 207, 230, 247),
                border: Border.all(color: Color.fromARGB(255, 235, 235, 235),
                width: 3),
                borderRadius: BorderRadius.circular(6),
                ),
              child: Padding(
                padding: const EdgeInsets.only(left:6.0),
                child: TextField(
                controller: _priceController,
                decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Price",
            ),),),),),  
      
          const SizedBox(height: 20),
                 
          ElevatedButton(
            onPressed: textbookUpload, 
            child: Container(
              height: 50,
              width: 110,
              decoration: BoxDecoration(
                color:Color.fromARGB(255, 105, 173, 222),
              ),
            child: const Center(
              child: Text("Upload Listing",
                style: TextStyle(color: Color.fromARGB(255, 235, 235, 235)),
          ),),),),
      
          ],
        ),
          ),
      ),

    );
  }
}