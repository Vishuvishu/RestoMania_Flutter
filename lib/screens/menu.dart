import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import 'package:resto_mania/common/colors.dart';
import 'package:resto_mania/common/generated_scaffold.dart';
import 'package:resto_mania/common/typography.dart';
import '../common/text_form_field.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int itemCount = 0;

  void incrementItemCount() {
    setState(() {
      itemCount++;
    });
  }

  void decrementItemCount() {
    if (itemCount > 0) {
      setState(() {
        itemCount--;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    bool isDark = false;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var height = MediaQuery
        .of(context)
        .size
        .height;
    return appScaffold(
      appBar: CommonAppBar(
        title: "Menu",
        style: poppins.get23.w500.textColor(AppColors.gold),
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          const Divider(
            height: 3,
            color: AppColors.xffbb9867,
            thickness: 2,
          ),
          Container(
            height: 100,
            width: width,
            color: AppColors.xffF8E1C2,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, right: 15, left: 15),
                  child: SearchAnchor(
                      builder: (BuildContext context,
                          SearchController controller) {
                        return SizedBox(
                          height: 50,
                          child: SearchBar(
                            hintText: "Search Your Dish",
                            hintStyle: MaterialStatePropertyAll(
                                roboto.get16.w400.textColor(
                                    AppColors.xffbb9867)),
                            backgroundColor: const MaterialStatePropertyAll(
                                AppColors.xffF3C991),
                            controller: controller,
                            padding: const MaterialStatePropertyAll<EdgeInsets>(
                                EdgeInsets.symmetric(horizontal: 16.0)),
                            onTap: () {
                              controller.openView();
                            },
                            onChanged: (_) {
                              controller.openView();
                            },
                            trailing: const [
                              Icon(Icons.search, color: AppColors.xffbb9867,
                                size: 30,)
                            ],
                          ),
                        );
                      }, suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                    return List<ListTile>.generate(5, (int index) {
                      final String item = 'item $index';
                      return ListTile(
                        title: Text(item),
                        onTap: () {
                          setState(() {
                            controller.closeView(item);
                          });
                        },
                      );
                    });
                  }),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Stack(
                      children: [
                        Image.asset("assets/icons/label.png"),
                        Padding(
                          padding: const EdgeInsets.only(left: 38, top: 12),
                          child: Text("Fast Food", style: tenorSans.get18.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          Container(
                            height: 35,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadiusDirectional.only(
                                  bottomEnd: Radius.zero),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "Sandwich",
                                    style: poppins.get20.w600.textColor(
                                        AppColors.xffbb9867
                                    )
                                ),
                                Text(
                                    "100", style: poppins.get20.w600.textColor(
                                    AppColors.xffbb9867
                                )
                                ),
                                InkWell(
                                  onTap: () {
                                    bottomDrawer(context);
                                  },
                                  child: Container(
                                    height: 26,
                                    width: width * 0.14,
                                    decoration: BoxDecoration(
                                        color: AppColors.xff9C743D,
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceEvenly,
                                        children: [
                                          Text("ADD", style: poppins.get11.w600
                                              .textColor(AppColors.xffF8E1C2)),
                                          Icon(Icons.add, size: 10,
                                            color: AppColors.xffF8E1C2,)
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                            color: AppColors.xffF3C991,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  void bottomDrawer(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    showModalBottomSheet(
      backgroundColor: AppColors.trans,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: 400,
              decoration: const BoxDecoration(
                color: AppColors.xffFCE9D0,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/image1.png"),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              textBaseline: TextBaseline.alphabetic, // Align based on text's baseline
                              children: [
                                Text(
                                  "Paneer Bhurji",
                                  style: poppins.get19.w600.textColor(AppColors.xffbb9867),
                                ),
                                SizedBox(width: 90),
                                Text(
                                  "Rs.100",
                                  style: poppins.get17.w600.textColor(AppColors.xffbb9867),
                                ),
                              ],
                            )
                            ,
                            Row(
                              children: <Widget>[
                                 Text(
                                  'Total :',
                                  style:  poppins.get19.w600.textColor(AppColors.xffbb9867)
                                 ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            decrementItemCount();
                                          });
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            color: AppColors.xffbb9867,
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                          child: const Column(
                                            children: [
                                              Icon(
                                                size: 20,
                                                Icons.minimize,
                                                color: AppColors.white,
                                              ),
                                            ],
                                          ),
                                        ),

                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Text(
                                          itemCount.toString(),
                                          style: poppins.get23.w400.textColor(AppColors.xffbb9867),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            incrementItemCount();
                                          });
                                        },
                                        child: Container(
                                          height:30 ,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            color: AppColors.xffbb9867,
                                            borderRadius: BorderRadius.circular(4)
                                          ),
                                          child: Icon(Icons.add,color: AppColors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 25),
                    child: Divider(
                      thickness: 2,
                      color:AppColors.xffbb9867 ,
                    ),
                  ),
                  Row(
                    children: [
                      Text("Regular"),

                    ],
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.xffbb9867,
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.gold,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: AppColors.xffbb9867,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
