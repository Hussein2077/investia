import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:investa/core/resource_manager/colors.dart';
import 'package:investa/core/resource_manager/string_manager.dart';
import 'package:investa/core/utils/app_size.dart';
import 'package:investa/core/widgets/app_bar.dart';
import 'package:investa/features/home/presentation/widget/recent_order_details.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);

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
        body: Padding(
          padding: EdgeInsets.all(AppSize.defaultSize!),
          child: Column(
            children: [
              SizedBox(
                height: AppSize.defaultSize! * 2,
              ),
              Center(
                child: Container(
                  height: AppSize.defaultSize! * 4,
                  width: AppSize.defaultSize! * 24,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.greyColor),
                      borderRadius:
                          BorderRadius.circular(AppSize.defaultSize! * 2)),
                  child: TabBar(
                    controller: tabController,
                    indicatorColor: AppColors.primaryColor,
                    dividerColor: Colors.transparent,
                    indicatorWeight: .5,
                    unselectedLabelColor: AppColors.greyColor,
                    labelColor: AppColors.primaryColor,
                    tabs: [
                      Tab(
                        text: StringManager.onWay.tr(),
                      ),
                      Tab(
                        text: StringManager.history.tr(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppSize.defaultSize! * 2,
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    RecentOrderDetails(
                      scroll: true,
                    ),
                    RecentOrderDetails(
                      scroll: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
