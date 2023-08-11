import 'package:ShoppingList/src/model/Item.dart';
import 'package:flutter/material.dart';

import 'package:ShoppingList/src/components/Confirmation.dart';

import 'package:ShoppingList/src/data/db.dart' as db;
import 'package:ShoppingList/src/data/FilePersistence.dart' as FilePersistence;

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
                showConfirmationDialog(context, 'Confirmation', 'Voulez-vous vraiment supprimer tous les éléments de la liste ET du panier ?', 'Annuler', 'Supprimer').then((value) async {
                  if (value != null && value) {
                    if (!await db.deleteAllItems(db.list) || !await db.deleteAllItems(db.cart)) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Erreur lors de la suppression des éléments de la liste')));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Liste vidée')));
                    }
                  }
                });
              },
            ),
          ),

          const Text('\nSauvegarde et restauration (NON IMPLEMENTE)', style: TextStyle(fontWeight: FontWeight.bold)),

          Card(
            color: Colors.white60,
            child: ListTile(
              title: const Text('Sauvegarde vers un fichier et partager'),
              onTap: () async {
                FilePersistence.saveToFile();
              },
            ),
          ),

          Card(
            color: Colors.white60,
            child: ListTile(
              title: const Text('Importer depuis un fichier'),
              onTap: () {
                showConfirmationDialog(context, 'Confirmation', 'Voulez vous continuer ? Cela va supprimer vos données existantes', 'Annuler', 'Continuer').then((value) {
                  if (value != null && value) {
                    FilePersistence.readFromFile().then((value) {
                      if (value) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Données importées')));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Erreur lors de l\'importation des données')));
                      }
                    });
                  }
                });
              }
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
