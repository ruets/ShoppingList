import 'package:flutter/material.dart';

import 'package:ShoppingList/src/components/Confirmation.dart';

import '../model/Api.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
      ),
      body: ListView(
        children: <Widget>[
          const Text('\nGestion des données',style: TextStyle(fontWeight: FontWeight.bold)),

          Card(
            color: Colors.red,
            child: ListTile(
              title: const Text('Vider la liste'),
              onTap: () {
                showConfirmationDialog(context, 'Confirmation', 'Voulez-vous vraiment supprimer tous les éléments de la liste ?', 'Annuler', 'Supprimer').then((value) {
                  if (value != null && value) {
                    Api.clearItems();
                  }
                });
              },
            ),
          ),

          const Text('\nSauvegarde et restauration', style: TextStyle(fontWeight: FontWeight.bold)),

          Card(
            color: Colors.white60,
            child: ListTile(
              title: const Text('Sauvegarde vers un fichier'),
              onTap: () {
                showConfirmationDialog(context, 'Confirmation', 'Voulez-vous vraiment sauvegarder la liste ?', 'Annuler', 'Sauvegarder').then((value) {
                  if (value != null && value) {
                    // TODO: save to file
                  }
                });
              },
            ),
          ),

          Card(
            color: Colors.white60,
            child: ListTile(
              title: const Text('Importer depuis un fichier'),
              onTap: () {
                showConfirmationDialog(context, 'Confirmation', 'Voulez-vous vraiment sauvegarder la liste ?', 'Annuler', 'Sauvegarder').then((value) {
                  if (value != null && value) {
                    // TODO: import from file
                  }
                });
              },
            ),
          ),

          const Text(''),
          Card(
            color: Colors.white60,
            child: ListTile(
              title: const Text('Sauvegarde sur le cloud'),
              onTap: () {
                showConfirmationDialog(context, 'Confirmation', 'Voulez-vous vraiment sauvegarder la liste ?', 'Annuler', 'Sauvegarder').then((value) {
                  if (value != null && value) {
                    // TODO: save to cloud
                  }
                });
              },
            ),
          ),

          Card(
            color: Colors.white60,
            child: ListTile(
              title: const Text('Restauration depuis le cloud'),
              onTap: () {
                showConfirmationDialog(context, 'Confirmation', 'Voulez-vous vraiment sauvegarder la liste ?', 'Annuler', 'Sauvegarder').then((value) {
                  if (value != null && value) {
                    // TODO: restore from cloud
                  }
                });
              },
            ),
          ),

          const Text('\nDivers', style: TextStyle(fontWeight: FontWeight.bold)),

          Card(
            color: Colors.white60,
            child: ListTile(
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
          )
        ],
      ),
    );
  }
}

// stateless widget
// class Settings extends StatelessWidget {
//   const Settings({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar()
//     );
//   }
// }
