import 'package:dio_wrapper_demo/ui/common_constants/common_colors.dart';
import 'package:dio_wrapper_demo/ui/screen/main_listing_screen/main_add_professor_screen.dart';
import 'package:dio_wrapper_demo/ui/utils/responsive.dart';
import 'package:flutter/material.dart';

class AddProfessorSuccessDialogue extends StatefulWidget {
  const AddProfessorSuccessDialogue({Key? key,}) : super(key: key);

  @override
  State<AddProfessorSuccessDialogue> createState() => _AddProfessorSuccessDialogueState();
}

class _AddProfessorSuccessDialogueState extends State<AddProfessorSuccessDialogue> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.all(16.0),
        width: ResponsiveWidget.isLargeScreen(context) || ResponsiveWidget.isMediumScreen(context)
            ? deviceSize.width * 0.2
            : ResponsiveWidget.isSmallScreen(context)
                ? deviceSize.width * 0.5
                : deviceSize.width * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check,
              color: Colors.green,
              size: 50.0,
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Success",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Professor Added Successfully",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, MainListingScreen.routeName);
              },
              style: ElevatedButton.styleFrom(
                primary: CommonColorConstants.blueLightColor,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "Back to Home",
                   style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                   ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
