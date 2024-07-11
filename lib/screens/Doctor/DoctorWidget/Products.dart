import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Cubit/Categories.dart';
import '../classes/curd.dart';
import '../data/model/productsModel.dart';
import '../data/remot/homeData.dart';
import 'ShowProduct.dart';


class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {

    final Curd curd= Curd();
    return BlocProvider(
      create: (context) => CategoriesCubit(HomeData(curd))..fetchCategories(),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CategoriesLoaded) {
            return SizedBox(
              height: 140,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 10,
                ),
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  return CatogryM(
                    i: index,
                    categoryModel: state.categories[index],
                  );
                },
              ),
            );
          } else if (state is CategoriesError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}

class CatogryM extends StatelessWidget {
  final int i;
  final Productsmodel categoryModel;
  const CatogryM({super.key, required this.categoryModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        gotproduct(context, categoryModel.id!);
      },
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.asset(
              "${categoryModel.image}",
              height: 90,
              width: 130,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "${categoryModel.title}",
            style: TextStyle(
                color: Color.fromARGB(255, 39, 80, 116),
                fontWeight: FontWeight.w400,
                fontSize: 16),
          )
        ],
      ),
    );
  }
}

void gotproduct(BuildContext context, int productId) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => ProductDetails(productId: productId),
      settings: RouteSettings(arguments: {

        "productId": productId,
      }),
    ),
  );
}


