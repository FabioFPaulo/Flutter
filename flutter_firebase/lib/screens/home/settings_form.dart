import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/user.dart';
import 'package:flutter_firebase/services/database.dart';
import 'package:flutter_firebase/shared/constants.dart';
import 'package:flutter_firebase/shared/loading.dart';
import 'package:provider/provider.dart';

class SettingsFormState extends StatefulWidget {
  const SettingsFormState({super.key});

  @override
  State<SettingsFormState> createState() => _SettingsFormStateState();
}

class _SettingsFormStateState extends State<SettingsFormState> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  String? _currentName;
  String? _currentSugars;
  int? _currentStrength;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData userData = snapshot.data!;

          return Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  "Update your brew settings.",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  initialValue: userData.name,
                  decoration: textInputDecoration,
                  validator:
                      (val) => val!.isEmpty ? 'Please enter a name' : null,
                  onChanged:
                      (val) => setState(() {
                        _currentName = val;
                      }),
                ),
                SizedBox(height: 20),
                DropdownButtonFormField(
                  value: _currentSugars ?? userData.sugars,
                  items:
                      sugars.map((sugar) {
                        return DropdownMenuItem(
                          value: sugar,
                          child: Text("$sugar sugars"),
                        );
                      }).toList(),
                  onChanged: (v) {
                    setState(() {
                      _currentSugars = v ?? '0';
                    });
                  },
                  decoration: textInputDecoration,
                ),
                SizedBox(height: 20),
                Slider(
                  value: (_currentStrength ?? userData.strength).toDouble(),
                  activeColor:
                      Colors.brown[_currentStrength ?? userData.strength],
                  inactiveColor:
                      Colors.brown[_currentStrength ?? userData.strength],
                  min: 100.0,
                  max: 900.0,
                  divisions: 8,
                  onChanged: (val) {
                    setState(() => _currentStrength = val.round());
                    print(_currentStrength);
                  },
                ),

                SizedBox(height: 20),

                FilledButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await DatabaseService(uid: user.uid).updateUserData(
                        _currentSugars ?? userData.sugars,
                        _currentName ?? userData.name,
                        _currentStrength ?? userData.strength,
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Update', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
