import 'package:dio_wrapper_demo/ui/common_constants/common_colors.dart';
import 'package:dio_wrapper_demo/ui/screen/main_listing_screen/widget/professor_details_card.dart';
import 'package:dio_wrapper_demo/ui/utils/responsive.dart';
import 'package:flutter/material.dart';

class ProfessorListItem extends StatelessWidget {
  const ProfessorListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Card(
            color: Colors.white,
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 6.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    shadowColor: CommonColorConstants.blueLightColor,
                    child: Container(
                      alignment: Alignment.center,
                      height: 45.0,
                      width: 45.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person_outline,
                        size: 28.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          "Full Name Of Professor",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        Text(
                          "Designation",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    "Joining Date",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return ProfessorDetailsShowWidget();
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        color: CommonColorConstants.blueLightColor,
                        borderRadius: BorderRadius.circular(
                          6.0,
                        ),
                      ),
                      child: const Icon(
                        Icons.visibility,
                        size: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 6.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: CommonColorConstants.blueLightColor,
                      borderRadius: BorderRadius.circular(
                        6.0,
                      ),
                    ),
                    child: const Icon(
                      Icons.edit,
                      size: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 6.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: CommonColorConstants.blueLightColor,
                      borderRadius: BorderRadius.circular(
                        6.0,
                      ),
                    ),
                    child: const Icon(
                      Icons.delete,
                      size: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        : Card(
            color: Colors.white,
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 6.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    shadowColor: CommonColorConstants.blueLightColor,
                    child: Container(
                      alignment: Alignment.center,
                      height: 36.0,
                      width: 36.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person_outline,
                        size: 20.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          "Full Name Of Professor",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        Text(
                          "Designation",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return ProfessorDetailsShowWidget();
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        color: CommonColorConstants.blueLightColor,
                        borderRadius: BorderRadius.circular(
                          6.0,
                        ),
                      ),
                      child: const Icon(
                        Icons.visibility,
                        size: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 6.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: CommonColorConstants.blueLightColor,
                      borderRadius: BorderRadius.circular(
                        6.0,
                      ),
                    ),
                    child: const Icon(
                      Icons.edit,
                      size: 14.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 6.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: CommonColorConstants.blueLightColor,
                      borderRadius: BorderRadius.circular(
                        6.0,
                      ),
                    ),
                    child: const Icon(
                      Icons.delete,
                      size: 14.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
