import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/models/todo.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({
    super.key,
    required this.todo,
    required this.onDelete,
  });

  final Todo todo;
  final Function(Todo) onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.5),
      child: Slidable(
        // startActionPane: ActionPane(
        //   motion: const DrawerMotion(),
        //   extentRatio: 0.25,
        //   children: [
        //     SlidableAction(
        //       label: 'Archive',
        //       backgroundColor: Colors.blue,
        //       icon: Icons.archive,
        //       onPressed: (context) {},
        //     ),
        //   ],
        // ),
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          extentRatio: 0.20,
          children: [
            SlidableAction(
              label: 'Delete',
              backgroundColor: Colors.red,
              icon: Icons.delete,
              onPressed: (context) {
                onDelete(todo);
              },
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey[200],
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                DateFormat(
                  'dd/MM/yyyy - HH:mm',
                ).format(
                  todo.dateTime,
                ),
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                todo.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
