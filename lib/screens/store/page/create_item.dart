import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:gide/core/models/store_model.dart';
import 'package:gide/core/models/user_model.dart';
import 'package:gide/core/services/auth_service.dart';
import 'package:gide/core/services/store_service.dart';
import 'package:gide/core/services/user_service.dart';
import 'package:uuid/uuid.dart';

class CreateItem extends StatefulWidget {
  const CreateItem({ Key? key }) : super(key: key);

  @override
  State<CreateItem> createState() => _CreateItemState();
}

class _CreateItemState extends State<CreateItem> {
  String name = "";
  String description = "";

  double? lat = null;
  double? lng = null;

  final geo = Geoflutterfire();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildTextField("Name of store...", (value) {
                  setState(() {
                    name = value;
                  });
                }, false),
                _buildTextFormField("Description", (value) {
                  setState(() {
                    description = value;
                  });
                }),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: _buildTextField("Latitude", 
                          (value) {
                            setState(() {
                              try {
                                lat = double.parse(value);
                              } catch (e) {
                                lat = null;
                              }
                            });
                          }, 
                          true
                        ),
                      )
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: _buildTextField("Longitude", 
                          (value) {
                            setState(() {
                              try {
                                lng = double.parse(value);
                              } catch (e) {
                                lng = null;
                              }
                            });
                          }, 
                          true
                        ),
                      )
                    ),
                  ],
                ),
                TextButton(onPressed: () {
                  // _createStore();
                }, child: Text("Create Store"))
              ],
            ),
          ),
        )
      ),
    );
  }

  Widget _buildTextField(String placeholderText, Function onChange, bool numOnly) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        onChanged:(value) {
          onChange(value);
        },
        inputFormatters: numOnly ? [
          FilteringTextInputFormatter(RegExp(r'(^\-?\d*\.?\d*)'), allow: true)
        ] : [],
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(5.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(5.5),
          ),
          hintText: placeholderText,
          hintStyle: const TextStyle(color: Color.fromARGB(255, 206, 206, 206)),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildTextFormField(String placeholderText, Function onChange) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.top,
        onChanged:(value) {
          onChange(value);
        },
        expands: true,
        maxLines: null,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(5.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(5.5),
          ),
          hintText: placeholderText,
          hintStyle: const TextStyle(color: Color.fromARGB(255, 206, 206, 206)),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  /*
  void _createStore() {
    if (lat != null && lng != null && name.isNotEmpty && description.isNotEmpty) {
      print(geo.point(latitude: lat!, longitude: lng!));
      Store store = Store(
        id: const Uuid().v4(),
        name: name,
        description: description,
        ownerId: AuthenticationService.getCurrentUser()!.uid,
        location: geo.point(latitude: lat!, longitude: lng!),
        announcements: const [],
        items: const []
      );

      StoreSerice.updateStore(store);

      User currUser = AuthenticationService.userInfo!;
      User tempUser = User(
        id: currUser.id, 
        username: currUser.username, 
        credits: currUser.credits, 
        favoriteStores: currUser.favoriteStores,
        storeId: store.id
      );

      UserService.updateUser(tempUser);

      Navigator.of(context).pop();

      return;
    }

    showDialog(
      context: context, 
      builder: (_) => AlertDialog(
        title: const Text("Whoops!"),
        content: Text("Missing information..."),
        actions: [
          TextButton(onPressed: () {
            Navigator.of(context).pop(false);
          }, child: Text("Ok"))
        ],
      ),
      barrierDismissible: true
    );
  }
  */
}