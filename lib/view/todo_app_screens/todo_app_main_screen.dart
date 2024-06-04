import 'add_task_screen.dart';
import 'package:http/http.dart' as http;
import '../../utils/app_urls.dart';

class TodoAppMainScreen extends StatefulWidget {
  const TodoAppMainScreen({super.key});

  @override
  State<TodoAppMainScreen> createState() => _TodoAppMainScreenState();
}

class _TodoAppMainScreenState extends State<TodoAppMainScreen> {
  List items = [];
  @override
  void initState() {
    super.initState();
    fetchTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow.shade100,
          centerTitle: true,
          title: const Text('Todo Main Screen'),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: navigateToAddPage,
          label: const Text('Add Task'),
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index] as Map;
              return Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  title: Text(item['title']),
                  subtitle: Text(item['description']),
                ),
              );
            }));
  }

  void navigateToAddPage() {
    final route =
        MaterialPageRoute(builder: (context) => const AddTaskScreen());
    Navigator.push(context, route);
  }

  Future<void> fetchTodo() async {
    const url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['items'] as List;
      setState(() {
        items = result;
      });
    } else {}
  }
}
