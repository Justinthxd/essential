import 'package:essential/core/utils/constants.dart';
import 'package:flutter/material.dart';

showAddDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: backgroundColor,
          title: const Text('Add new folder'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Folder name',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Folder description',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Folder money',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      });
}
