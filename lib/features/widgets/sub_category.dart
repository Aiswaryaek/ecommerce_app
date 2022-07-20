// // ignore_for_file: must_be_immutable
//
// import 'package:ecommerce_app/core/ui_state.dart';
// import 'package:ecommerce_app/features/category_page.dart';
// import 'package:ecommerce_app/providers/sub_category_providers.dart';
// import 'package:ecommerce_app/repositories/category_repositories.dart';
// import 'package:ecommerce_app/styles/colors.dart';
// import 'package:ecommerce_app/styles/textstyles.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter/material.dart';
//
// class SubCategory extends StatefulWidget {
//   dynamic id;
//
//   SubCategory(this.id, {Key? key}) : super(key: key);
//
//   @override
//   State<SubCategory> createState() => _SubCategoryState();
// }
//
// class _SubCategoryState extends State<SubCategory> {
//   SubCategoryProvider subCategoryListProvider =
//       SubCategoryProvider(categoryRepository: CategoryRepository());
//
//   @override
//   void initState() {
//     subCategoryListProvider.getSubCategoryList(widget.id);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: getSubCategory(),
//     );
//   }
//
//   getSubCategory() {
//     return ChangeNotifierProvider<SubCategoryProvider>(create: (ctx) {
//       return subCategoryListProvider;
//     }, child: Consumer<SubCategoryProvider>(builder: (ctx, data, _) {
//       var state = data.getSubCategoryLiveData().getValue();
//       if (state is Initial) {
//         return const Text('This List Is Empty');
//       } else if (state is Success) {
//         return Row(
//           children: [
//             const SizedBox(width: 3),
//             const Icon(
//               Icons.filter_alt_rounded,
//               size: 25,
//               color: redColor,
//             ),
//             const SizedBox(width: 4),
//             Expanded(
//               child: SizedBox(
//                 height: 23,
//                 child: ListView.separated(
//                     // shrinkWrap: true,
//                     scrollDirection: Axis.horizontal,
//                     itemCount: data.list.length,
//                     separatorBuilder: (context, _) => const SizedBox(width: 4),
//                     itemBuilder: (context, index) => InkWell(
//                           child: Container(
//                               decoration: BoxDecoration(
//                                   color: outlinedBorderColor,
//                                   border:
//                                       Border.all(color: outlinedBorderColor),
//                                   borderRadius: const BorderRadius.all(
//                                       Radius.circular(4))),
//                               height: 14,
//                               // width: 75,
//                               child: ElevatedButton(
//                                 onPressed: () {},
//                                 child: Text(
//                                   '${data.list[index].name}',
//                                   style: buttonTextStyle,
//                                 ),
//                                 style: ElevatedButton.styleFrom(
//                                   padding: const EdgeInsets.all(4),
//                                   elevation: 0,
//                                   // primary: isSelected == false ?buttonColor:whiteColor,
//                                   primary: buttonColor,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius:
//                                         BorderRadius.circular(4), // <-- Radius
//                                   ),
//                                 ),
//                               )),
//                           onTap: () {
//                             const CategoryPage();
//                             // setState(() {
//                             //   'isSelected' = !'isSelected';
//                             // });
//                             // Navigator.of(context).push(MaterialPageRoute(
//                             //     builder: (context) => const AssignWorkOrder()));
//                           },
//                         )),
//               ),
//             )
//           ],
//         );
//       } else if (state is Failure) {
//         return Center(
//           child: Text('${state.error}'),
//         );
//       } else {
//         return Container();
//       }
//     }));
//   }
// }
