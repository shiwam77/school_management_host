import 'package:flutter/material.dart';
import 'package:school_management_flutter/src/dashboard/widget/dashboard_body.dart';

String? selectedRoute = '/Dashboard';
Map<int, bool> subSelected = {0: true};

class DashBoard extends StatelessWidget {
  const DashBoard({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return DashBoardView(
      child: child,
    );
  }
}

class DashBoardView extends StatefulWidget {
  const DashBoardView({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DashBoardBody(
      child: widget.child,
    );
  }
}

// List<AdminMenuItem> navePane = [
//   AdminMenuItem(title: 'Main Options', icon: "", isHeader: true),
//   AdminMenuItem(
//     title: 'Dashboard',
//     route: '/Dashboard',
//     icon: Assets.iconMultidoor,
//   ),
//   AdminMenuItem(
//       title: 'Inventory Management',
//       icon: Assets.iconInventoryIcon,
//       children: [
//         AdminMenuItem(title: 'Inventory', route: '/InventoryDashboard'),
//         // AdminMenuItem(title: 'Wastage', route: '/InventoryWastageScreen')
//       ]),
//   AdminMenuItem(title: 'SRM', icon: Assets.iconSrmIcon, children: [
//     AdminMenuItem(
//       title: 'Supplier',
//       route: '/SRMSCreen',
//     ),
//     AdminMenuItem(
//       title: 'Purchase Order',
//       route: '/purchaseOrder',
//     ),
//   ]),
//   AdminMenuItem(
//       title: 'Production Management',
//       icon: Assets.iconProductionIcon,
//       children: [
//         AdminMenuItem(
//           title: 'Recipe',
//           route: '/RecipeScreen',
//         ),
//         AdminMenuItem(
//           title: 'Templates',
//           route: '/TemplateScreen',
//         ),
//         AdminMenuItem(
//           title: 'Stock',
//           route: '/StockScreen',
//         ),
//       ]),
//   AdminMenuItem(title: 'POS', icon: Assets.iconPosIcon, children: [
//     // AdminMenuItem(
//     //   title: 'Discount',
//     //   route: '9',
//     // ),
//     AdminMenuItem(
//       title: 'Payment',
//       route: '/POSPaymentScreen',
//     ),
//     AdminMenuItem(
//       title: 'Table',
//       route: '/TableSelectionScreen',
//     ),
//   ]),
//   AdminMenuItem(title: 'CRM', icon: Assets.iconCrmIcon, children: [
//     AdminMenuItem(
//       title: 'CRM',
//       route: '/CRMScreen',
//     ),
//     AdminMenuItem(
//       title: 'Promotion',
//       route: '/PromotionScreen',
//     ),
//   ]),
//   AdminMenuItem(title: 'HRM', icon: Assets.iconHrmIcon, children: [
//     AdminMenuItem(
//       title: 'Employee',
//       route: '/EmployeScreen',
//     ),
//     AdminMenuItem(
//       title: 'Schedule',
//       route: '/EmployeScheduleScreen',
//     ),
//   ]),
//   AdminMenuItem(title: 'Finance', icon: Assets.iconFinanceIcon, children: [
//     AdminMenuItem(
//       title: 'Account',
//       route: '/AccountList',
//     ),
//     AdminMenuItem(
//       title: 'Purchase Voucher',
//       route: '/PurchaseList',
//     ),
//     AdminMenuItem(
//       title: 'Sales Voucher',
//       route: '/SalesList',
//     ),
//     AdminMenuItem(
//       title: 'Journal Entry',
//       route: '/JournalEntryList',
//     ),
//     AdminMenuItem(
//       title: 'Trail Balance',
//       route: '/TrailBalance',
//     ),
//   ]),
//   AdminMenuItem(
//     title: 'Report',
//     route: '/ReportDashboard',
//     icon: Assets.iconReportIcon,
//     // children: [
//     //   AdminMenuItem(
//     //     title: 'Sales',
//     //     route: '/SalesScreen',
//     //   ),
//     //   AdminMenuItem(
//     //     title: 'Purchase',
//     //     route: '/PurchaseReportScreen',
//     //   ),
//     // ],
//   ),
// ];
