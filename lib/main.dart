import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  List<Widget> _contentWidgets = [
    Widget_Column(),
    Widget_ListView(),
    Widget_ListViewSeparated(),
  ];

  void _changeContent(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List App'),
      ),
      body: Center(
        child: _contentWidgets[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _changeContent,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.table_rows),
            label: 'Column',
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_rows_rounded),
            label: 'ListView',
            backgroundColor: Colors.lightGreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_rows_outlined),
            label: 'ListViewSeparated',
            backgroundColor: Colors.yellow,
          ),
        ],
      ),
    );
  }
}

class Widget_Column extends StatefulWidget {
  @override
  Widget_ColumnState createState() => Widget_ColumnState();
}

class Widget_ColumnState  extends State<Widget_Column> {
  final items = List.generate(100, (index) => 'Item ${index + 1}');
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:[


          Expanded(
            child:SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      items.length,
                          (index) => GestureDetector(
                        key: ValueKey(items[index]),
                        onTap: () => setState(() => items.removeAt(index)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 100),
                          child: Text(items[index]),
                    ),
                  ))
                      .toList(),
                ),
              ),
            ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Enter new item',
                  ),
                ),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    items.add(_controller.text);
                    _controller.clear();
                  });
                },
                child: Text('Add'),
              ),
            ],
          ),
        ),
      ],
      ),
    );
  }
}

class Widget_ListView extends StatefulWidget {
  @override
  Widget_ListViewState createState() => Widget_ListViewState();
}

class Widget_ListViewState extends State<Widget_ListView> {
  final items = List.generate(100, (index) => 'Item ${index + 1}');
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      items.removeAt(index);
                    });
                  },
                  child: ListTile(
                    title: Text(items[index]),
                  ),
                );
              }
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter new item',
                    ),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      items.add(_controller.text);
                      _controller.clear();
                    });
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class Widget_ListViewSeparated extends StatefulWidget {
  @override
  Widget_ListViewSeparatedState createState() => Widget_ListViewSeparatedState();
}

class Widget_ListViewSeparatedState extends State<Widget_ListViewSeparated> {
  final items = List.generate(100, (index) => 'Item ${index + 1}');
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
                itemCount: items.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        items.removeAt(index);
                      });
                    },
                    child: ListTile(
                      title: Text(items[index]),
                    ),
                  );
                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter new item',
                    ),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      items.add(_controller.text);
                      _controller.clear();
                    });
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
