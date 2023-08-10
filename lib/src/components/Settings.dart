import 'package:flutter/material.dart';

import 'package:ShoppingList/src/components/Confirmation.dart';

import '../model/Api.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Vider la liste'),
            onTap: () {
              showConfirmationDialog(context, 'Confirmation', 'Voulez-vous vraiment supprimer tous les éléments de la liste ?', 'Annuler', 'Supprimer').then((value) {
                if (value != null && value) {
                  setState(() {
                    Api.clearItems();
                  });
                }
              });
            },
          ),

          ListTile(
            title: const Text('A propos'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'ShoppingList',
                applicationVersion: '1.0.0',
                applicationIcon: const Icon(Icons.shopping_cart),
                children: const <Widget>[
                  Text('Application de liste de courses\n\n'
                      'Développée par Sébastien RUET'
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}