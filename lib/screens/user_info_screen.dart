import 'package:flutter/material.dart';

import 'package:vehicles_app/components/loader_component.dart';
import 'package:vehicles_app/models/token.dart';
import 'package:vehicles_app/models/user.dart';
import 'package:vehicles_app/screens/user_screen.dart';

class UserInfoScreen extends StatefulWidget {
  final Token token;
  final User user;

  UserInfoScreen({required this.token, required this.user});

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  bool _showLoader = false;
  late User _user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.fullName),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              _showUserInfo(),
              _showButtons(),
            ],
          ),
          _showLoader ? LoaderComponent(text: 'Por favor espere...',) : Container(),
        ],
      ),
    );
  }

  Widget _showUserInfo() {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: FadeInImage(
                  placeholder: AssetImage('assets/vehicles_logo.png'), 
                  image: NetworkImage(_user.imageFullPath),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover
                ),
              ),
              Positioned(
                bottom: 0,
                left: 60,
                child: InkWell(
                  onTap: () => _goEdit(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      color: Colors.green[50],
                      height: 40,
                      width: 40,
                      child: Icon(
                        Icons.edit,
                        size: 30,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                )
              )
            ],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'Email: ', 
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              )
                            ),
                            Text(
                              _user.email, 
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: <Widget>[
                            Text(
                              'Tipo documento: ', 
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              )
                            ),
                            Text(
                              _user.documentType.description, 
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: <Widget>[
                            Text(
                              'Documento: ', 
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              )
                            ),
                            Text(
                              _user.document, 
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: <Widget>[
                            Text(
                              'Dirección: ', 
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              )
                            ),
                            Text(
                              _user.address, 
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: <Widget>[
                            Text(
                              'Teléfono: ', 
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              )
                            ),
                            Text(
                              _user.phoneNumber, 
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: <Widget>[
                            Text(
                              '# Vehículos: ', 
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              )
                            ),
                            Text(
                              _user.vehiclesCount.toString(), 
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _showButtons() {
    return Container(
      
    );
  }

  void _goEdit() async {
    String? result = await Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => UserScreen(
          token: widget.token, 
          user: _user,
        )
      )
    );
    if (result == 'yes') {
      //TODO: Pending refresh user info
    }
  }
}