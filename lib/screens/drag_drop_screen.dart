import 'package:flutter/material.dart';
import 'package:reorderables/reorderables.dart';

class DragDropScreen extends StatefulWidget {
  const DragDropScreen({
    Key? key,
  }) : super(key: key);

  @override
  _DragDropScreenState createState() => _DragDropScreenState();
}

class _DragDropScreenState extends State<DragDropScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            "Which value of x satisfies the equation",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Wrap(
            children: [
              Draggable<String>(
                child: Text(
                  "Yes",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                feedback: const SizedBox(),
              ),
              Draggable<Text>(
                child: Text(
                  "No",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                feedback: const SizedBox(),
              ),
            ],
          ),
          DataTable(columns: const [
            DataColumn(
              label: Text(
                "S no",
              ),
            ),
            DataColumn(
              label: Text(
                "Equation",
              ),
            ),
            DataColumn(
              label: Text(
                "Value of variable",
              ),
            ),
            DataColumn(
              label: Text(
                "Solution Yes/No",
              ),
            ),
          ], rows: [
            DataRow(
              cells: [
                DataCell(
                  Text(
                    "i",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                DataCell(
                  Text(
                    "x + 10 = 30",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                DataCell(
                  Text(
                    "x = 30",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                DataCell(
                  DragTarget<String>(
                    builder: (BuildContext context, List<String?> candidateData,
                        List rejectedData) {
                      return Text(
                        candidateData.toString(),
                        style: Theme.of(context).textTheme.bodyText1,
                      );
                    },
                    onWillAccept: (data) => true,
                    onAccept: (data) {},
                  ),
                ),
              ],
            )
          ]),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(),
            child: Text(
              "Check",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          )
        ],
      ),
    );
  }
}

class RowExample extends StatefulWidget {
  const RowExample({Key? key}) : super(key: key);

  @override
  _RowExampleState createState() => _RowExampleState();
}

class _RowExampleState extends State<RowExample> {
  final List<Widget> _columns = List.generate(
    5,
    (index) => Material(
      key: ValueKey(index),
      child: Container(
        color: Colors.purple,
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(18.0),
        child: Text(
          "${index + 11} ",
        ),
      ),
    ),
  );

  @override
  void initState() {
    super.initState();
  }

  void _onReorder(int oldIndex, int newIndex) {
    Widget col = _columns.removeAt(oldIndex);
    print("Re arranging ...");
    setState(() {});
    _columns.insert(newIndex, col);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableRow(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _columns,
      onReorder: _onReorder,
      onNoReorder: (int index) {},
    );
  }
}

