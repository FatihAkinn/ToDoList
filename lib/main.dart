import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDoList',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textController = TextEditingController();

  //listeler
  List<bool> _isCheckedList = [];
  List<String> _textList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("ToDoList")),
      ),
      body: Column(
        children: [
          TextField(
            
            controller: _textController,
            decoration: InputDecoration(
              hintText: 'Yazı Ekleyiniz',
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: _textList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  
                  leading: Checkbox(
                    value: _isCheckedList[index],
                    onChanged: (value) {
                      setState(() {
                        _isCheckedList[index] = value!;
                      });
                    },
                  ),
                  title: Text(
                    
                    _textList[index],
                    style: TextStyle(
                      color: _isCheckedList[index] ? Colors.green : Colors.red,
                    ),
                  ),
                  trailing: _isCheckedList[index]
                      ? IconButton(
                          
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              _textList.removeAt(index);
                              _isCheckedList.removeAt(index);
                            });
                          },
                        )
                      : SizedBox.shrink(), 
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String text = _textController.text;
          if (text.trim().length > 0) {
            setState(() {
              _textList.add(text);
              _isCheckedList.add(false);
              _textController.clear();
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
