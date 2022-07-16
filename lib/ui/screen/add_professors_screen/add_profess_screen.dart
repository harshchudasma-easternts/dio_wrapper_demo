import 'package:dio_wrapper_demo/ui/common_constants/common_colors.dart';
import 'package:dio_wrapper_demo/ui/screen/add_professors_screen/store/add_professor_store.dart';
import 'package:dio_wrapper_demo/ui/screen/add_professors_screen/widget/add_professor_success_dialogue.dart';
import 'package:dio_wrapper_demo/ui/utils/common_widgets/common_textformfield.dart';
import 'package:dio_wrapper_demo/ui/utils/responsive.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';

class AddProfessorScreen extends StatefulWidget {
  static const routeName = "/add_professor_screen";

  const AddProfessorScreen({super.key});

  @override
  State<AddProfessorScreen> createState() => _AddProfessorScreenState();
}

class _AddProfessorScreenState extends State<AddProfessorScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime? joiningDate = DateTime.now();
  AddProfessorStore? _addProfessorStore;

  final departmentList = [
    "Computer",
    "Mechanical",
    "Mathermatics",
    "Commerce",
  ];
  final genderList = [
    "Male",
    "Female",
  ];

  late final TextEditingController _firstNameTextEditingController = TextEditingController();
  late final TextEditingController _lastNameTextEditingController = TextEditingController();
  late final TextEditingController _emailTextEditingController = TextEditingController();
  late final TextEditingController _joiningDateTextEditingController = TextEditingController();
  late final TextEditingController _passwordTextEditingController = TextEditingController();
  late final TextEditingController _confirmTextEditingController = TextEditingController();
  late final TextEditingController _designationTExtEdtitingcontroller = TextEditingController();
  late final TextEditingController _mobileNoTextEditingController = TextEditingController();
  late final TextEditingController _addressTextEditingController = TextEditingController();
  late final TextEditingController _educationTextEditingController = TextEditingController();

  late final _firstNameFocusNode = FocusNode();
  late final _lastNameFocusNode = FocusNode();
  late final _emailFocusNode = FocusNode();
  late final _joiningDateFocusNode = FocusNode();
  late final _passwordFocusNode = FocusNode();
  late final _confirmPasswordFocusNode = FocusNode();
  late final _designationFocusNode = FocusNode();
  late final _departmentFocusNode = FocusNode();
  late final _genderFocusNode = FocusNode();
  late final _mobileNoFocusNode = FocusNode();
  late final _addressFocusNode = FocusNode();
  late final _educationFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _textFieldFocusNode();
    if (_addProfessorStore == null) {
      _addProfessorStore = Provider.of<AddProfessorStore>(context, listen: false);
      // if (widget.isEdit) {
      //   // _setDataForUpdate();
      // }
    }
  }

  _textFieldFocusNode() {
    _firstNameFocusNode.addListener(() {});
    _lastNameFocusNode.addListener(() {});
    _emailFocusNode.addListener(() {});
    _joiningDateFocusNode.addListener(() {});
    _passwordFocusNode.addListener(() {});
    _confirmPasswordFocusNode.addListener(() {});
    _designationFocusNode.addListener(() {});
    _departmentFocusNode.addListener(() {});
    _genderFocusNode.addListener(() {});
    _mobileNoFocusNode.addListener(() {});
    _addressFocusNode.addListener(() {});
    _educationFocusNode.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12.0),
          height: double.infinity,
          color: CommonColorConstants.backgroundColor,
          child: ResponsiveWidget.isLargeScreen(context) || ResponsiveWidget.isMediumScreen(context)
              ? SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Add Professor",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        Card(
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ),
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  "Basic Information",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: CommonTextFieldWidget(
                                        controller: _firstNameTextEditingController,
                                        textfiledFocusNode: _firstNameFocusNode,
                                        textFieldLableName: "FirstName",
                                        maximumLengthOfField: 20,
                                        textFieldCounterText: "",
                                        textformFieldValidator: (firstNameValue) {
                                          if (firstNameValue!.isEmpty) {
                                            return "Please enter the firstname";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 16.0,
                                    ),
                                    Expanded(
                                      child: CommonTextFieldWidget(
                                        controller: _lastNameTextEditingController,
                                        textfiledFocusNode: _lastNameFocusNode,
                                        textFieldLableName: "LastName",
                                        maximumLengthOfField: 20,
                                        textFieldCounterText: "",
                                        textformFieldValidator: (lastNameValue) {
                                          if (lastNameValue!.isEmpty) {
                                            return "Please enter the lastname";
                                          }
                                          return null;
                                        },
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 32.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: CommonTextFieldWidget(
                                        controller: _emailTextEditingController,
                                        textfiledFocusNode: _emailFocusNode,
                                        textFieldLableName: "Email",
                                        textformFieldValidator: (String? email) {
                                          if (email!.isEmpty) {
                                            return "Please enter the email";
                                          } else if (!EmailValidator.validate(email)) {
                                            return "Please enter the valid email";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 16.0,
                                    ),
                                    Expanded(
                                      child: CommonTextFieldWidget(
                                        textFieldOnTap: () async {
                                          FocusScope.of(context).requestFocus(new FocusNode());
                                          joiningDate = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime(2100),
                                            builder: (BuildContext context, Widget? child) {
                                              return Theme(
                                                data: ThemeData(
                                                  colorScheme: const ColorScheme.light(
                                                    primary: CommonColorConstants.blueLightColor,
                                                  ),
                                                ),
                                                child: child!,
                                              );
                                            },
                                          );
                                          String formatedDate = DateFormat('dd-MM-yyyy').format(joiningDate!);
                                          _joiningDateTextEditingController.text = formatedDate;
                                          print("selected Joining Date ${_joiningDateTextEditingController.text}");
                                        },
                                        controller: _joiningDateTextEditingController,
                                        textfiledFocusNode: _joiningDateFocusNode,
                                        textFieldLableName: "Joining Date",
                                        textformFieldValidator: (joiningDateValue) {
                                          if (joiningDateValue!.isEmpty) {
                                            return "Please enter the joining Date";
                                          }
                                          return null;
                                        },
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 32.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: Consumer<AddProfessorStore>(
                                        builder: (context, providerValue, child) {
                                          return CommonTextFieldWidget(
                                            obsecureText: providerValue.passwordvisibility,
                                            controller: _passwordTextEditingController,
                                            textfiledFocusNode: _passwordFocusNode,
                                            textFieldLableName: "Password",
                                            maximumLengthOfField: 15,
                                            textFieldCounterText: "",
                                            textFieldMaximumLines: 1,
                                            suffixIconWidget: GestureDetector(
                                              onTap: () {
                                                providerValue.setPasswirdVisibility();
                                              },
                                              child: Icon(
                                                providerValue.passwordvisibility ? Icons.visibility : Icons.visibility_off,
                                                color: _passwordFocusNode.hasFocus ? CommonColorConstants.blueLightColor : Colors.grey,
                                              ),
                                            ),
                                            textformFieldValidator: (passValue) {
                                              if (passValue!.isEmpty) {
                                                return "password is empty";
                                              } else if (passValue.length < 8 || passValue.length > 15) {
                                                return "password must be minimum 8 and maximum 15 character required";
                                              }
                                              return null;
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 16.0,
                                    ),
                                    Expanded(
                                      child: Consumer<AddProfessorStore>(
                                        builder: (context, providerValue, child) {
                                          return CommonTextFieldWidget(
                                            obsecureText: providerValue.confirmPasswordVisibility,
                                            controller: _confirmTextEditingController,
                                            textfiledFocusNode: _confirmPasswordFocusNode,
                                            textFieldMaximumLines: 1,
                                            textFieldLableName: "Confirm Password",
                                            textformFieldValidator: (confirmPassValue) {
                                              if (confirmPassValue!.isEmpty) {
                                                return "confirm password is empty";
                                              } else if (confirmPassValue.length < 8 || confirmPassValue.length > 15) {
                                                return "password must be minimum 8 and maximum 15 character required";
                                              } else if (confirmPassValue != _passwordTextEditingController.text) {
                                                return "password must be same as above";
                                              }
                                              return null;
                                            },
                                            suffixIconWidget: GestureDetector(
                                              onTap: () {
                                                providerValue.setConfirmPasswordVisibility();
                                              },
                                              child: Icon(
                                                providerValue.confirmPasswordVisibility ? Icons.visibility : Icons.visibility_off,
                                                color: _confirmPasswordFocusNode.hasFocus ? CommonColorConstants.blueLightColor : Colors.grey,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 32.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: CommonTextFieldWidget(
                                        controller: _designationTExtEdtitingcontroller,
                                        textfiledFocusNode: _designationFocusNode,
                                        textFieldLableName: "Designation",
                                        textformFieldValidator: (designationValue) {
                                          if (designationValue!.isEmpty) {
                                            return "Please enter the designation";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 16.0,
                                    ),
                                    Expanded(
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButtonFormField2(
                                          icon: const Icon(Icons.keyboard_arrow_down_outlined),
                                          isExpanded: true,
                                          focusNode: _departmentFocusNode,
                                          decoration: InputDecoration(
                                            contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                                            labelText: "Department",
                                            labelStyle: TextStyle(
                                              fontSize: 16.0,
                                              color: _departmentFocusNode.hasFocus ? CommonColorConstants.blueLightColor : Colors.grey,
                                            ),
                                            focusedBorder: const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: CommonColorConstants.blueLightColor,
                                              ),
                                            ),
                                          ),
                                          validator: (departmentValue) {
                                            if (departmentValue == null) {
                                              return "Please select the department";
                                            }
                                            return null;
                                          },
                                          items: departmentList
                                              .map(
                                                (item) => DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                          customItemsHeight: 4,
                                          value: _addProfessorStore!.selectedDepartment,
                                          onChanged: (value) {
                                            _addProfessorStore!.selectedDepartmentValue(selectedValue: value as String);
                                          },
                                          buttonHeight: 40,
                                          buttonWidth: 140,
                                          itemHeight: 40,
                                          itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 32.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButtonFormField2(
                                          focusNode: _genderFocusNode,
                                          icon: const Icon(Icons.keyboard_arrow_down_outlined),
                                          isExpanded: true,
                                          decoration: InputDecoration(
                                            contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                                            labelText: "Gender",
                                            labelStyle: TextStyle(
                                              fontSize: 16.0,
                                              color: _genderFocusNode.hasFocus ? CommonColorConstants.blueLightColor : Colors.grey,
                                            ),
                                            focusedBorder: const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: CommonColorConstants.blueLightColor,
                                              ),
                                            ),
                                          ),
                                          validator: (genderValue) {
                                            if (genderValue == null) {
                                              return "Please select the gender";
                                            }
                                            return null;
                                          },
                                          hint: const Text(
                                            'Gender',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          items: genderList
                                              .map(
                                                (item) => DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                          customItemsHeight: 4,
                                          value: _addProfessorStore!.selectedGender,
                                          onChanged: (value) {
                                            _addProfessorStore!.selectedGenderValue(selectedValue: value as String);
                                          },
                                          buttonHeight: 40,
                                          buttonWidth: 140,
                                          itemHeight: 40,
                                          itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 16.0,
                                    ),
                                    Expanded(
                                      child: CommonTextFieldWidget(
                                        controller: _mobileNoTextEditingController,
                                        textfiledFocusNode: _mobileNoFocusNode,
                                        textFieldLableName: "Mobile No.",
                                        textFieldInputFormater: [
                                          FilteringTextInputFormatter.digitsOnly,
                                        ],
                                        maximumLengthOfField: 15,
                                        textFieldCounterText: "",
                                        textformFieldValidator: (value) {
                                          String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                          RegExp regExp = RegExp(patttern);
                                          if (value!.length == 0) {
                                            return 'Please enter mobile number';
                                          } else if (!regExp.hasMatch(value)) {
                                            return 'Please enter valid mobile number';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 32.0,
                                ),
                                CommonTextFieldWidget(
                                  controller: _addressTextEditingController,
                                  textfiledFocusNode: _addressFocusNode,
                                  textFieldLableName: "Address",
                                  textFieldMaximumLines: 4,
                                ),
                                const SizedBox(
                                  height: 32.0,
                                ),
                                CommonTextFieldWidget(
                                  controller: _educationTextEditingController,
                                  textfiledFocusNode: _educationFocusNode,
                                  textFieldLableName: "Education",
                                  textFieldMaximumLines: 4,
                                  textformFieldValidator: (educationValue) {
                                    if (educationValue!.isEmpty) {
                                      return "Please enter the Education Details";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 40.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: CommonColorConstants.orangeLightColor,
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12.0,
                                    ),
                                    Consumer<AddProfessorStore>(
                                      builder: (context, providerValue, child) {
                                        return ElevatedButton(
                                          onPressed: () {
                                            if (_formKey.currentState!.validate()) {
                                              _formKey.currentState!.save();
                                              // addProfessorData(context: context);
                                              _addProfessorStore!.selectedDepartment = null;
                                              _addProfessorStore!.selectedGender =  null;
                                              showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (context) {
                                                  return const Dialog(
                                                    child: AddProfessorSuccessDialogue(),
                                                  );
                                                },
                                              );
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: CommonColorConstants.blueLightColor,
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
                                            child: Text(
                                              "Submit",
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Add Professor",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        Card(
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ),
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  "Basic Information",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                CommonTextFieldWidget(
                                  controller: _firstNameTextEditingController,
                                  textfiledFocusNode: _firstNameFocusNode,
                                  textFieldLableName: "FirstName",
                                  maximumLengthOfField: 20,
                                  textFieldCounterText: "",
                                  textformFieldValidator: (firstNameValue) {
                                    if (firstNameValue!.isEmpty) {
                                      return "Please enter the firstname";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                CommonTextFieldWidget(
                                  controller: _lastNameTextEditingController,
                                  textfiledFocusNode: _lastNameFocusNode,
                                  textFieldLableName: "LastName",
                                  maximumLengthOfField: 20,
                                  textFieldCounterText: "",
                                  textformFieldValidator: (lastNameValue) {
                                    if (lastNameValue!.isEmpty) {
                                      return "Please enter the lastname";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                CommonTextFieldWidget(
                                  controller: _emailTextEditingController,
                                  textfiledFocusNode: _emailFocusNode,
                                  textFieldLableName: "Email",
                                  textformFieldValidator: (String? email) {
                                    if (email!.isEmpty) {
                                      return "Please enter the email";
                                    } else if (!EmailValidator.validate(email)) {
                                      return "Please enter the valid email";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                CommonTextFieldWidget(
                                  textFieldOnTap: () async {
                                    FocusScope.of(context).requestFocus(new FocusNode());
                                    joiningDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2100),
                                      builder: (BuildContext context, Widget? child) {
                                        return Theme(
                                          data: ThemeData(
                                            colorScheme: const ColorScheme.light(
                                              primary: CommonColorConstants.blueLightColor,
                                            ),
                                          ),
                                          child: child!,
                                        );
                                      },
                                    );
                                    String formatedDate = DateFormat('dd-MM-yyyy').format(joiningDate!);
                                    _joiningDateTextEditingController.text = formatedDate;
                                    print("selected Joining Date ${_joiningDateTextEditingController.text}");
                                  },
                                  controller: _joiningDateTextEditingController,
                                  textfiledFocusNode: _joiningDateFocusNode,
                                  textFieldLableName: "Joining Date",
                                  textformFieldValidator: (joiningDateValue) {
                                    if (joiningDateValue!.isEmpty) {
                                      return "Please enter the joining Date";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                Consumer<AddProfessorStore>(
                                  builder: (context, providerValue, child) {
                                    return CommonTextFieldWidget(
                                      obsecureText: providerValue.passwordvisibility,
                                      controller: _passwordTextEditingController,
                                      textfiledFocusNode: _passwordFocusNode,
                                      textFieldLableName: "Password",
                                      maximumLengthOfField: 15,
                                      textFieldCounterText: "",
                                      textFieldMaximumLines: 1,
                                      suffixIconWidget: GestureDetector(
                                        onTap: () {
                                          providerValue.setPasswirdVisibility();
                                        },
                                        child: Icon(
                                          providerValue.passwordvisibility ? Icons.visibility : Icons.visibility_off,
                                          color: _passwordFocusNode.hasFocus ? CommonColorConstants.blueLightColor : Colors.grey,
                                        ),
                                      ),
                                      textformFieldValidator: (passValue) {
                                        if (passValue!.isEmpty) {
                                          return "password is empty";
                                        } else if (passValue.length < 8 || passValue.length > 15) {
                                          return "password must be minimum 8 and maximum 15 character required";
                                        }
                                        return null;
                                      },
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                Consumer<AddProfessorStore>(
                                  builder: (context, providerValue, child) {
                                    return CommonTextFieldWidget(
                                      obsecureText: providerValue.confirmPasswordVisibility,
                                      controller: _confirmTextEditingController,
                                      textfiledFocusNode: _confirmPasswordFocusNode,
                                      textFieldMaximumLines: 1,
                                      textFieldLableName: "Confirm Password",
                                      textformFieldValidator: (confirmPassValue) {
                                        if (confirmPassValue!.isEmpty) {
                                          return "confirm password is empty";
                                        } else if (confirmPassValue.length < 8 || confirmPassValue.length > 15) {
                                          return "password must be minimum 8 and maximum 15 character required";
                                        } else if (confirmPassValue != _passwordTextEditingController.text) {
                                          return "password must be same as above";
                                        }
                                        return null;
                                      },
                                      suffixIconWidget: GestureDetector(
                                        onTap: () {
                                          providerValue.setConfirmPasswordVisibility();
                                        },
                                        child: Icon(
                                          providerValue.confirmPasswordVisibility ? Icons.visibility : Icons.visibility_off,
                                          color: _confirmPasswordFocusNode.hasFocus ? CommonColorConstants.blueLightColor : Colors.grey,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                CommonTextFieldWidget(
                                  controller: _designationTExtEdtitingcontroller,
                                  textfiledFocusNode: _designationFocusNode,
                                  textFieldLableName: "Designation",
                                  textformFieldValidator: (designationValue) {
                                    if (designationValue!.isEmpty) {
                                      return "Please enter the designation";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField2(
                                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                                    isExpanded: true,
                                    focusNode: _departmentFocusNode,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                                      labelText: "Department",
                                      labelStyle: TextStyle(
                                        fontSize: 16.0,
                                        color: _departmentFocusNode.hasFocus ? CommonColorConstants.blueLightColor : Colors.grey,
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: CommonColorConstants.blueLightColor,
                                        ),
                                      ),
                                    ),
                                    validator: (departmentValue) {
                                      if (departmentValue == null) {
                                        return "Please select the department";
                                      }
                                      return null;
                                    },
                                    items: departmentList
                                        .map(
                                          (item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    customItemsHeight: 4,
                                    value: _addProfessorStore!.selectedDepartment,
                                    onChanged: (value) {
                                      _addProfessorStore!.selectedDepartmentValue(selectedValue: value as String);
                                    },
                                    buttonHeight: 40,
                                    buttonWidth: 140,
                                    itemHeight: 40,
                                    itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField2(
                                    focusNode: _genderFocusNode,
                                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                                    isExpanded: true,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                                      labelText: "Gender",
                                      labelStyle: TextStyle(
                                        fontSize: 16.0,
                                        color: _genderFocusNode.hasFocus ? CommonColorConstants.blueLightColor : Colors.grey,
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: CommonColorConstants.blueLightColor,
                                        ),
                                      ),
                                    ),
                                    validator: (genderValue) {
                                      if (genderValue == null) {
                                        return "Please select the gender";
                                      }
                                      return null;
                                    },
                                    hint: const Text(
                                      'Gender',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    items: genderList
                                        .map(
                                          (item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    customItemsHeight: 4,
                                    value: _addProfessorStore!.selectedGender,
                                    onChanged: (value) {
                                      _addProfessorStore!.selectedGenderValue(selectedValue: value as String);
                                    },
                                    buttonHeight: 40,
                                    buttonWidth: 140,
                                    itemHeight: 40,
                                    itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                CommonTextFieldWidget(
                                  controller: _mobileNoTextEditingController,
                                  textfiledFocusNode: _mobileNoFocusNode,
                                  textFieldLableName: "Mobile No.",
                                  textFieldInputFormater: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  maximumLengthOfField: 15,
                                  textFieldCounterText: "",
                                  textformFieldValidator: (value) {
                                    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                    RegExp regExp = RegExp(patttern);
                                    if (value!.length == 0) {
                                      return 'Please enter mobile number';
                                    } else if (!regExp.hasMatch(value)) {
                                      return 'Please enter valid mobile number';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                CommonTextFieldWidget(
                                  controller: _addressTextEditingController,
                                  textfiledFocusNode: _addressFocusNode,
                                  textFieldLableName: "Address",
                                  textFieldMaximumLines: 4,
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                CommonTextFieldWidget(
                                  controller: _educationTextEditingController,
                                  textfiledFocusNode: _educationFocusNode,
                                  textFieldLableName: "Education",
                                  textFieldMaximumLines: 4,
                                  textformFieldValidator: (educationValue) {
                                    if (educationValue!.isEmpty) {
                                      return "Please enter the Education Details";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: CommonColorConstants.orangeLightColor,
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12.0,
                                    ),
                                    Consumer<AddProfessorStore>(
                                      builder: (context, providerValue, child) {
                                        return ElevatedButton(
                                          onPressed: () {
                                            if (_formKey.currentState!.validate()) {
                                              _formKey.currentState!.save();
                                              // addProfessorData(context: context);
                                              _addProfessorStore!.selectedDepartment = null;
                                              _addProfessorStore!.selectedGender =  null;
                                              showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (context) {
                                                  return const Dialog(
                                                    child: AddProfessorSuccessDialogue(),
                                                  );
                                                },
                                              );
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: CommonColorConstants.blueLightColor,
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
                                            child: Text(
                                              "Submit",
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  backtoHomeButtonOnPress(){
    _addProfessorStore!.selectedDepartment = null;
    _addProfessorStore!.selectedGender = null;
  }

}
