import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import 'FUserListScreen.dart';
import 'model/FBusermodel.dart';

class FAddUserScreen extends StatefulWidget {
  FBUserModel? data;

  FAddUserScreen({this.data});

  @override
  _FAddUserScreenState createState() => _FAddUserScreenState();
}

class _FAddUserScreenState extends State<FAddUserScreen> {
  final _addItemFormKey = GlobalKey<FormState>();
  List<int> ageList = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingValue agevalue = TextEditingValue();

  FocusNode nameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();

  bool isUpdate = false;

  int age = 1;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    for (int i = 0; i <= 100; i++) {
      ageList.add(i);
    }
    isUpdate = widget.data != null;

    if (isUpdate) {
      nameController.text = widget.data!.name.validate();
      emailController.text = widget.data!.email.validate();
      age = widget.data!.age.validate();
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();

    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        isUpdate ? 'Update user' : 'Add user',
        color: appStore.appBarColor,
        elevation: 0,
        actions: !isUpdate
            ? null
            : [
                IconButton(
                  color: Colors.white,
                  onPressed: () {
                    showConfirmDialogCustom(context, onAccept: (contexts) {
                      snackBar(
                        context,
                        title: "Deleted Successfully",
                        backgroundColor: context.iconColor,
                      );
                      userService.removeDocument(widget.data!.id.validate()).then((value) {
                        finish(context);
                      }).catchError((e) {
                        toasty(context, e.toString());
                      });
                    }, dialogType: DialogType.DELETE, title: 'Are you sure you want to delete this user?');
                  },
                  icon: Icon(Icons.delete, color: context.iconColor),
                )
              ],
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _addItemFormKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              AppTextField(
                textFieldType: TextFieldType.NAME,
                keyboardType: TextInputType.text,
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: primaryTextStyle(size: 18),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: black,
                    ),
                  ),
                ),
                focus: nameFocus,
                nextFocus: emailFocus,
                errorThisFieldRequired: 'This field is required',
              ),
              16.height,
              AppTextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                textFieldType: TextFieldType.EMAIL,
                focus: emailFocus,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: primaryTextStyle(size: 18),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: black,
                    ),
                  ),
                ),
              ),
              16.height,
              DropdownButtonFormField(
                autovalidateMode: AutovalidateMode.always,
                decoration: InputDecoration(
                    labelText: 'age',
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: black,
                      ),
                    )),
                value: age,
                items: List.generate(ageList.length, (index) {
                  return DropdownMenuItem(
                    value: ageList[index],
                    child: Text('$index', style: primaryTextStyle()),
                  );
                }),
                onChanged: (dynamic value) {
                  age = value;
                  setState(() {});
                },
              ),
              24.height,
              AppButton(
                width: context.width(),
                text: isUpdate ? 'Update User' : 'Add User',
                textColor: Colors.white,
                color: appStore.appColorPrimary,
                onTap: () async {
                  if (_addItemFormKey.currentState!.validate()) {
                    _addItemFormKey.currentState!.save();

                    hideKeyboard(context);
                    FBUserModel data = FBUserModel();
                    data.name = nameController.text;
                    data.email = emailController.text;
                    data.age = age;

                    if (isUpdate) {
                      data.id = widget.data!.id.validate();
                    }

                    log(data.toJson());

                    if (!isUpdate) {
                      showConfirmDialogCustom(context, onAccept: (contexts) async {
                        await userService.addDocument(data.toJson()).then((value) {
                          snackBar(
                            context,
                            title: "Added Successfully",
                            backgroundColor: context.iconColor,
                          );

                          finish(context);
                        }).catchError((e) {
                          log(e.toString());
                        });
                      }, dialogType: DialogType.ADD, title: 'Are you sure you want to add this user?');
                    } else {
                      showConfirmDialogCustom(context, onAccept: (contexts) async {
                        await userService.updateDocument(data.toJson(), widget.data!.id.validate()).then((value) {
                          snackBar(
                            context,
                            title: "Updated successfully",
                            backgroundColor: context.iconColor,
                          );

                          finish(context);
                        }).catchError((e) {
                          log(e.toString());
                        });
                      }, dialogType: DialogType.UPDATE, title: 'Are you sure you want to update this user?');
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

AppStore appStore = AppStore();
class AppStore{

  Color textPrimaryColor = Color(0xFF212121);
  Color primaryColor = Color(0xFFFF4E54);
  Color iconColorPrimaryDark = Color(0xFF212121);
  Color scaffoldBackground = Color(0xFFEBF2F7);
  Color backgroundColor = Colors.black;
  Color backgroundSecondaryColor = Color(0xFF131d25);
  Color appColorPrimaryLightColor = Color(0xFFF9FAFF);
  Color textSecondaryColor = Color(0xFF5A5C5E);
  Color appBarColor = Colors.white;
  Color iconColor = Color(0xFF212121);
  Color iconSecondaryColor = Color(0xFFA8ABAD);
  Color cardColor = Colors.white;
  Color appColorPrimary = Color(0xFF1157FA);
  Color scaffoldBackgroundColor = Color(0xFFEFEFEF);

  AppStore();

}