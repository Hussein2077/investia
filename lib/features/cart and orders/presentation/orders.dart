import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:investa/core/resource_manager/string_manager.dart';
import 'package:investa/core/widgets/app_bar.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> with TickerProviderStateMixin{
  late TabController tabController;
  @override
  void initState() {
    tabController=TabController(length: 2, vsync: this);

    super.initState();
  }
  @override
  void dispose() {
   tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: appBar(context, text: StringManager.orders.tr()),

      body: ,
      ),
    );
  }
}
