import 'package:aviotrack/widgets/appikorn_widgets/appikorn_loader.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class appikornTable extends StatelessWidget {
  appikornTable({required this.titleWidget, required this.loading, required this.contentWidget, required this.count, required this.onpageChanged, this.headerColor});

  final List titleWidget;
  final List contentWidget;
  Colors? headerColor;
  final int count;
  final Function(int) onpageChanged;
  bool loading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PaginatedDataTable2(
          sortAscending: true,
          rowsPerPage: 20,
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 1400,
          onPageChanged: onpageChanged,
          onRowsPerPageChanged: (s) {
            print(s);
          },
          columns: [
            for (var l in titleWidget)
              DataColumn2(
                label: Center(
                  child: Text(
                    l,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                size: ColumnSize.L,
              )
          ],
          source: source(contentWidget: contentWidget, count: count),
        ),
        if (loading)
          Padding(
            padding: const EdgeInsets.only(top: 60.0, bottom: 60),
            child: Container(
              color: Colors.black.withOpacity(0.6),
              child: appikorn_loader(),
            ),
          )
      ],
    );
  }
}

class source extends DataTableSource {
  source({required this.contentWidget, required this.count});
  final List contentWidget;
  final int count;

  @override
  DataRow? getRow(int index) {
    return DataRow2(cells: [
      for (var l in contentWidget) DataCell(Center(child: l(index: index))),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => count;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}

//////////////////////////////// HOW to USE /////////////////////////////////////////

// class test extends StatelessWidget {
//   test({Key? key}) : super(key: key);
//
//   var titleWidget = ["Institute ID", "Name", "Email ID", "Contact Person", "Ph Number", "Status", "Actions"];
//
//   static Widget txt({index}) {
//     return "content $index".text.make().onTap(() {
//       print(index);
//     });
//   }
//
//   static Widget action({index}) {
//     return HStack([
//       Icon(Icons.add).onTap(() {
//         print(index);
//       }),
//       Icon(Icons.subdirectory_arrow_left),
//       Icon(Icons.update)
//     ]);
//   }
//
//   var contentWidget = [txt, txt, txt, txt, txt, txt, action];
//
//   @override
//   Widget build(BuildContext context) {
//     return VxBox(
//         child: appikornTable(
//           count: 30,
//           titleWidget: titleWidget,
//           contentWidget: contentWidget,
//         )).blue300.make().whFull(context);
//   }
// }
