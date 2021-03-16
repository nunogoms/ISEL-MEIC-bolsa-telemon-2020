import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telemon_app/src/data/model/settings/isetting.dart';
import 'package:telemon_app/src/ui/viewmodels/settings_viewmodel.dart';

class SettingsDropdownButton<T> extends StatefulWidget {
  final String _title;
  final ISetting<T> _setting;

  SettingsDropdownButton(this._title, this._setting);

  @override
  _SettingsDropdownButtonState<T> createState() => _SettingsDropdownButtonState<T>();
}

class _SettingsDropdownButtonState<T> extends State<SettingsDropdownButton<T>> {

  @override
  Widget build(BuildContext context) {
    SettingsViewModel settingsViewModel =
    Provider.of<SettingsViewModel>(this.context);
    return Row(
      children: [
        Text(this.widget._title),
        DropdownButton<String>(
          value: widget._setting.getCurrValueAsString(),
          icon: Icon(Icons.arrow_drop_down_circle_outlined),
          //iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? s) {
            widget._setting.setNewValue(s!);
            settingsViewModel.updateValues();
          },
          items: widget._setting.getPossibleValues()
              .map<DropdownMenuItem<String>>((T value) {
            return DropdownMenuItem<String>(
              value: value.toString(),
              child: Text(value.toString().split(".").last),
            );
          }).toList(),
        )
      ],
    );
  }
}