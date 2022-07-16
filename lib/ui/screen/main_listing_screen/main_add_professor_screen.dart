import 'dart:math';

import 'package:dio_wrapper_demo/ui/common_constants/common_colors.dart';
import 'package:dio_wrapper_demo/ui/screen/add_professors_screen/add_profess_screen.dart';
import 'package:dio_wrapper_demo/ui/screen/main_listing_screen/store/main_listing_screen_store.dart';
import 'package:dio_wrapper_demo/ui/screen/main_listing_screen/widget/professor_list_item.dart';
import 'package:dio_wrapper_demo/ui/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainListingScreen extends StatefulWidget {
  static const routeName = "/";

  const MainListingScreen({super.key});

  @override
  State<MainListingScreen> createState() => _MainListingScreenState();
}

class _MainListingScreenState extends State<MainListingScreen> {
  final DataTableSource _data = ProfessorDataTable();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveWidget.isLargeScreen(context) || ResponsiveWidget.isMediumScreen(context)
            ? Container(
                padding: const EdgeInsets.all(12.0),
                height: double.infinity,
                color: CommonColorConstants.backgroundColor,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Professors",
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
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "All Professors",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        AddProfessorScreen.routeName,
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: CommonColorConstants.blueLightColor,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8.0,
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Text(
                                            "Add New",
                                            style: TextStyle(
                                              fontSize: 14.0,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 6.0,
                                          ),
                                          Icon(
                                            Icons.add,
                                            size: 20.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12.0,
                                  ),
                                  Consumer<MainScreenStore>(
                                    builder: (_, providerValue, child) {
                                      return GestureDetector(
                                        onTap: () {
                                          providerValue.setExpandedValue();
                                        },
                                        child: Icon(
                                          providerValue.isExpandedList == true ? Icons.keyboard_arrow_down_outlined : Icons.keyboard_arrow_up_outlined,
                                          size: 32.0,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              Consumer<MainScreenStore>(
                                builder: (_, providerValue, child) {
                                  return providerValue.isExpandedList == true
                                      ? Container(
                                          margin: EdgeInsets.only(top: 16.0),
                                          child: PaginatedDataTable(
                                            source: _data,
                                            columns: const [
                                              DataColumn(
                                                label: Text(
                                                  'ID',
                                                  style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  'Profile',
                                                  style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  'Name',
                                                  style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  'department',
                                                  style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  'Gender',
                                                  style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  'Degree',
                                                  style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  'Mobile No',
                                                  style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  'Email',
                                                  style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  'Joining Date',
                                                  style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                  'Action',
                                                  style: TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
                                                ),
                                              )
                                            ],
                                            columnSpacing: 100,
                                            horizontalMargin: 10,
                                            rowsPerPage: 10,
                                            showCheckboxColumn: false,
                                          ),
                                        )
                                      : const SizedBox();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : ResponsiveWidget.isSmallScreen(context)
                ? Container(
                    height: double.infinity,
                    color: CommonColorConstants.backgroundColor,
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Professors",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    AddProfessorScreen.routeName,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: CommonColorConstants.blueLightColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Text(
                                        "Add New",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 6.0,
                                      ),
                                      Icon(
                                        Icons.add,
                                        size: 20.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: 15,
                                itemBuilder: (context,index){
                                  return ProfessorListItem();
                                },),
                          )
                        ],
                      ),
                    ),
                  )
                : Container(
                    height: double.infinity,
                    color: CommonColorConstants.backgroundColor,
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Professors",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    AddProfessorScreen.routeName,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: CommonColorConstants.blueLightColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 6.0,
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Text(
                                        "Add New",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 6.0,
                                      ),
                                      Icon(
                                        Icons.add,
                                        size: 18.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: 10,
                                itemBuilder: (context,index){
                                  return ProfessorListItem();
                                }
                            ),
                          ),
                        ],
                      ),
                    ),
        ),
      ),
    );
  }
}

class ProfessorDataTable extends DataTableSource {
  // ProfessorDataTable({required this.list});

  // Generate some made-up data
  final List<Map<String, dynamic>> _data = List.generate(200, (index) => {"id": index + 1, "title": "Item $index", "price": Random().nextInt(10000)});

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 1;

  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(_data[index]['id'].toString())),
      DataCell(Text(_data[index]["title"])),
      DataCell(Text(_data[index]["title"])),
      DataCell(Text(_data[index]["title"])),
      DataCell(Text(_data[index]["title"])),
      DataCell(Text(_data[index]["title"])),
      DataCell(Text(_data[index]["title"])),
      DataCell(Text(_data[index]["title"])),
      DataCell(Text(_data[index]["price"].toString())),
      DataCell(
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(6.0),
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
              width: 12.0,
            ),
            Container(
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: CommonColorConstants.orangeLightColor,
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
    ]);
  }
}
