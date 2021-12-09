import 'package:ecommerce/constant/color_properties.dart';
import 'package:ecommerce/utils/keyboard.dart';
import 'package:ecommerce/utils/scroll_configuration.dart';
import 'package:ecommerce/utils/size_config.dart';
import 'package:ecommerce/utils/validation_mixin.dart';
import 'package:ecommerce/widgets/default_button.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  static const routeName = '/editProfile';
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = new GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.heightMultiplier * 2,
            vertical: SizeConfig.heightMultiplier,
          ),
          child: Column(
            children: [
              // SizedBox(height: SizeConfig.heightMultiplier),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColorDark,
                    foregroundColor:
                        Theme.of(context).textTheme.headline6!.color,
                    child: IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 5,
                  ),
                  Text(
                    'Your Profile',
                    style: Theme.of(context).textTheme.headline6!,
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier,
              ),
              Hero(
                tag: 'profile-image',
                child: CircleAvatar(
                  radius: SizeConfig.imageSizeMultiplier * 15,
                  backgroundColor: secondaryColor,
                  child: Icon(
                    Icons.person,
                    size: SizeConfig.imageSizeMultiplier * 20,
                    color: canvasColor,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 5,
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: EditProfileForm(_formKey),
                ),
              ),
              DefaultButton(
                text: "Submit",
                press: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    KeyboardUtil.hideKeyboard(context);
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditProfileForm extends StatefulWidget {
  const EditProfileForm(this.formKey, {Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final _validationMixin = ValidationMixin();
  String? name;
  String? email;
  String? phoneNumber;
  String? address;
  List<String> genders = ["Male", "Female", "Others"];
  String? gender;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildNameFormField(),
            SizedBox(
              height: SizeConfig.heightMultiplier * 3,
            ),
            buildEmailFormField(),
            SizedBox(
              height: SizeConfig.heightMultiplier * 3,
            ),
            buildPhoneNumberFormField(),
            SizedBox(
              height: SizeConfig.heightMultiplier * 3,
            ),
            buildAddressFormField(),
            SizedBox(
              height: SizeConfig.heightMultiplier * 3,
            ),
            buildGenderDropDownField(),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2.5,
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      keyboardType: TextInputType.streetAddress,
      textInputAction: TextInputAction.done,
      onSaved: (newValue) => address = newValue,
      validator: (value) => _validationMixin.validateAddress(value!),
      decoration: InputDecoration(
        isDense: true,
        labelText: "Address",
        hintText: "Enter your address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.contact_mail_outlined,
          ),
        ),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      onSaved: (newValue) => phoneNumber = newValue,
      validator: (value) => _validationMixin.validateMobile(value!),
      decoration: InputDecoration(
        isDense: true,
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.phone_outlined,
          ),
        ),
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      onSaved: (newValue) => name = newValue,
      validator: (value) => _validationMixin.validateName(value!),
      decoration: InputDecoration(
        isDense: true,
        labelText: "Name",
        hintText: "Enter your Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.person_outlined,
          ),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onSaved: (newValue) => email = newValue,
      validator: (value) => _validationMixin.validateEmail(value!),
      decoration: InputDecoration(
        isDense: true,
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.email_outlined,
          ),
        ),
      ),
    );
  }

  buildGenderDropDownField() {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2 * SizeConfig.heightMultiplier),
        border: Border.all(
          color: Theme.of(context).textTheme.headline1!.color == colorWhite
              ? colorGrey
              : primaryColor,
          // color:
          //     Theme.of(context).inputDecorationTheme.border!.borderSide.color,
          width: 1,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: SingleChildScrollView(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton<String>(
              iconDisabledColor: Colors.grey,
              isExpanded: true,
              hint: Text(
                'Select Gender',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              value: gender,
              style: TextStyle(
                fontSize: 2 * SizeConfig.textMultiplier,
                fontWeight: FontWeight.w400,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  gender = newValue!;
                });
              },
              items: genders.map((genderType) {
                return DropdownMenuItem(
                  child: Text(
                    genderType,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  value: genderType,
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
