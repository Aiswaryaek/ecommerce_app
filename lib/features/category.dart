import 'package:ecommerce_app/core/ui_state.dart';
import 'package:ecommerce_app/providers/category_providers.dart';
import 'package:ecommerce_app/providers/product_providers.dart';
import 'package:ecommerce_app/providers/sub_category_providers.dart';
import 'package:ecommerce_app/repositories/category_repositories.dart';
import 'package:ecommerce_app/styles/colors.dart';
import 'package:ecommerce_app/widgets/default_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/styles/textstyles.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  GetCategoryProvider allCategoryListProvider =
      GetCategoryProvider(categoryRepository: CategoryRepository());
  SubCategoryProvider subCategoryListProvider =
      SubCategoryProvider(categoryRepository: CategoryRepository());
  ProductProvider productListProvider =
      ProductProvider(categoryRepository: CategoryRepository());
  bool _isSeleted = false;
  List<bool> isCategoryEnabled = [];

  @override
  void initState() {
    allCategoryListProvider.getCategoryList();
    subCategoryListProvider.getSubCategoryList(136);
    productListProvider.getProductsList(190);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(appBar: defaultAppBar(context), body: getProducts()));
  }

  getProducts() {
    return ChangeNotifierProvider<ProductProvider>(
      create: (ctx) {
        return productListProvider;
      },
      child: Consumer<ProductProvider>(builder: (ctx, data, _) {
        var state = data.getProductLiveData().getValue();
        if (state is IsLoading) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 1.3,
            child: const Center(
              child: CircularProgressIndicator(
                color: buttonColor,
              ),
            ),
          );
        } else if (state is Initial) {
          return const Text('This List Is Empty');
        } else if (state is Success) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 3),
              getCategory(),
              getSubCategory(),
              const Divider(thickness: 1),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: data.list.length,
                  itemBuilder: (context, index) => ListTile(
                      contentPadding:
                          const EdgeInsets.only(left: 15.0, right: 0.0),
                      leading: SizedBox(
                        height: 40,
                        width: 85,
                        child: Image.network(
                            data.list[index].images![0].imageUrl!,
                            fit: BoxFit.fill),
                      ),
                      title: Transform.translate(
                        offset: const Offset(2, -5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text(
                              data.list[index].name,
                              overflow: TextOverflow.fade,
                              maxLines: 2,
                              style: titleTextStyle,
                            )),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _isSeleted = !_isSeleted;
                                });
                              },
                              icon: _isSeleted
                                  ? const Icon(
                                      Icons.favorite,
                                      color: redColor,
                                      size: 19,
                                    )
                                  : const Icon(
                                      Icons.favorite_border,
                                      color: redColor,
                                      size: 19,
                                    ),
                            ),
                          ],
                        ),
                      ),
                      subtitle: Transform.translate(
                        offset: const Offset(2, -6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${data.list[index].price!.salePrice}' 'SAR',
                              style: subTitleTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Padding(
                                    padding: EdgeInsets.only(right: 35),
                                    child: Icon(
                                      Icons.add_circle_rounded,
                                      color: buttonColor,
                                      size: 20,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      )),
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 1,
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is Failure) {
          return Center(
            child: Text('${state.error}'),
          );
        } else {
          return Container();
        }
      }),
    );
  }

  getCategory() {
    return ChangeNotifierProvider<GetCategoryProvider>(
      create: (ctx) {
        return allCategoryListProvider;
      },
      child: Consumer<GetCategoryProvider>(builder: (ctx, data, _) {
        var state = data.getCategoryLiveData().getValue();
        if (state is Initial) {
          return const Text('This List Is Empty');
        } else if (state is Success) {
          return Column(
            children: [
              const SizedBox(height: 3),
              Row(
                children: [
                  const SizedBox(width: 3),
                  const Icon(
                    Icons.auto_awesome_mosaic_outlined,
                    size: 25,
                    color: redColor,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: SizedBox(
                      height: 24,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.list.length,
                          separatorBuilder: (context, _) =>
                              const SizedBox(width: 3),
                          itemBuilder: (context, index) {
                            isCategoryEnabled.add(false);
                            return Container(
                                decoration: BoxDecoration(
                                    color: isCategoryEnabled[index]
                                        ? buttonColor
                                        : whiteColor,
                                    border:
                                        Border.all(color: unselectedTextColor),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4))),
                                height: 14,
                                child: ElevatedButton(
                                  onPressed: () {
                                    subCategoryListProvider.getSubCategoryList(
                                        data.list[index].id);
                                    getSubCategory();
                                    isCategoryEnabled.replaceRange(
                                        0, isCategoryEnabled.length, [
                                      for (int i = 0;
                                          i < isCategoryEnabled.length;
                                          i++)
                                        false
                                    ]);
                                    isCategoryEnabled[index] = true;
                                    setState(() {});
                                  },
                                  child: Text(
                                    '${data.list[index].name}',
                                    style: isCategoryEnabled[index]
                                        ? buttonTextStyle
                                        : unSelectedTextStyle,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(3),
                                    elevation: 0,
                                    // primary: pressAttention ? Colors.grey : Colors.blue,
                                    primary: isCategoryEnabled[index]
                                        ? buttonColor
                                        : whiteColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          4), // <-- Radius
                                    ),
                                  ),
                                ));
                          }),
                    ),
                  ),
                ],
              ),
            ],
          );
        } else if (state is Failure) {
          return Center(
            child: Text('${state.error}'),
          );
        } else {
          return Container();
        }
      }),
    );
  }

  getSubCategory() {
    return ChangeNotifierProvider<SubCategoryProvider>(create: (ctx) {
      return subCategoryListProvider;
    }, child: Consumer<SubCategoryProvider>(builder: (ctx, data, _) {
      var state = data.getSubCategoryLiveData().getValue();
      if (state is Initial) {
        return const Text('This List Is Empty');
      } else if (state is Success) {
        return Row(
          children: [
            const SizedBox(width: 3),
            const Icon(
              Icons.filter_alt_rounded,
              size: 25,
              color: redColor,
            ),
            const SizedBox(width: 4),
            Expanded(
              child: SizedBox(
                  height: 23,
                  child: ListView.separated(
                      // shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: data.list.length,
                      separatorBuilder: (context, _) =>
                          const SizedBox(width: 3),
                      itemBuilder: (context, index) {
                        return Container(
                            decoration: BoxDecoration(
                                color: outlinedBorderColor,
                                border: Border.all(color: outlinedBorderColor),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(4))),
                            height: 14,
                            // width: 75,
                            child: ElevatedButton(
                              onPressed: () {
                                productListProvider
                                    .getProductsList(data.list[index].id);
                                getProducts();
                              },
                              child: Text(
                                '${data.list[index].name}',
                                style: buttonTextStyle,
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(4),
                                elevation: 0,
                                // primary: isSelected == false ?buttonColor:whiteColor,
                                primary: buttonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(4), // <-- Radius
                                ),
                              ),
                            ));
                      })),
            ),
          ],
        );
      } else if (state is Failure) {
        return const Center(
          child: SizedBox(
            height: 0,
          ),
        );
      } else {
        return Container();
      }
    }));
  }
}
