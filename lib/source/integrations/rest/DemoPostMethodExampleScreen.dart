import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';  //https://pub.dev/packages/nb_utils
import 'utils/rest_apis.dart';


class DemoPostMethodExampleScreen extends StatefulWidget {
  static String tag = '/DemoPostMethodExampleScreen';

  @override
  DemoPostMethodExampleScreenState createState() => DemoPostMethodExampleScreenState();
}

class DemoPostMethodExampleScreenState extends State<DemoPostMethodExampleScreen> {
  var formKey = GlobalKey<FormState>();
  var autoValidate = false;
  var isLoading = false;

  var nameCont = TextEditingController();
  var salaryCont = TextEditingController();
  var ageCont = TextEditingController();

  var nameNode = FocusNode();
  var salaryNode = FocusNode();
  var ageNode = FocusNode();

  save() async {
    hideKeyboard(context);
    if (formKey.currentState!.validate()) {
      isLoading = true;
      setState(() {});

      Map req = {"name": nameCont.text, "salary": salaryCont.text, "age": ageCont.text};

      await createEmployee(req).then((value) {
        isLoading = false;
        toasty(context, value['message']);

        finish(context);
      }).catchError((e) {
        isLoading = false;
        toasty(context, e.toString());
      });
    } else {
      isLoading = false;
      autoValidate = true;
    }

    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(8),
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    16.height,
                    TextFormField(
                      controller: nameCont,
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      style: primaryTextStyle(),
                      decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                        labelStyle: primaryTextStyle(),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appStore.textSecondaryColor)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appStore.textSecondaryColor)),
                      ),
                      focusNode: nameNode,
                      validator: (s) {
                        if (s!.isEmpty) return 'Field is required';
                        return null;
                      },
                      onFieldSubmitted: (s) => FocusScope.of(context).requestFocus(salaryNode),
                      textInputAction: TextInputAction.next,
                    ),
                    16.height,
                    TextFormField(
                      controller: salaryCont,
                      keyboardType: TextInputType.number,
                      style: primaryTextStyle(),
                      decoration: InputDecoration(
                        labelText: 'Salary',
                        border: OutlineInputBorder(),
                        labelStyle: primaryTextStyle(),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appStore.textSecondaryColor)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appStore.textSecondaryColor)),
                      ),
                      focusNode: salaryNode,
                      validator: (s) {
                        if (s!.isEmpty) return 'Field is required';
                        if (!s.isDigit()) return 'Please enter valid data';
                        return null;
                      },
                      onFieldSubmitted: (s) => FocusScope.of(context).requestFocus(ageNode),
                      textInputAction: TextInputAction.next,
                    ),
                    16.height,
                    TextFormField(
                      controller: ageCont,
                      keyboardType: TextInputType.number,
                      style: primaryTextStyle(),
                      decoration: InputDecoration(
                        labelText: 'Age',
                        border: OutlineInputBorder(),
                        labelStyle: primaryTextStyle(),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appStore.textSecondaryColor)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appStore.textSecondaryColor)),
                      ),
                      focusNode: ageNode,
                      validator: (s) {
                        if (s!.isEmpty) return 'Field is required';
                        if (!s.isDigit()) return 'Please enter valid data';
                        return null;
                      },
                    ),
                    16.height,
                    GestureDetector(
                      onTap: () {
                        save();
                      },
                      child: Container(
                        margin: EdgeInsets.all(16),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(color: appStore.appColorPrimary, borderRadius:BorderRadius.circular(16)),
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: Text("Submit", style: primaryTextStyle(color: white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          CircularProgressIndicator().center().visible(isLoading)
        ],
      ),
    );
  }
}

AppStore appStore = AppStore();
class AppStore{

  Color textPrimaryColor = Color(0xFF212121);
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