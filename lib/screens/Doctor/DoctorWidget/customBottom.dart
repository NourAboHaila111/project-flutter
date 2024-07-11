
/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/home_cubit.dart';
import '../Cubit/home_state.dart';
import 'customBottomAppbar.dart';

class CustommApprList extends StatelessWidget {
  const CustommApprList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoaded) {
          return BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(state.listpage.length + 1, (index) {
                int i = index > 2 ? index - 1 : index;
                if (index == 2) {
                  return const Spacer();
                } else {
                  return MyBottomAppbar(
                    icon: state.listIcons[i],
                    text: state.listitel[i],
                    onPresse: () {
                      context.read<HomeCubit>().changePage(i);
                    },
                    active: state.currentPage == i,
                  );
                }
              }).cast<Widget>(),
            ),
          );
        }
        return SizedBox.shrink(); // or some loading indicator
      },
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Cubit/home_cubit.dart';
import '../Cubit/home_state.dart';

import 'customBottomAppbar.dart';

class CustommApprList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoaded) {
          return BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(state.listpage.length + 1, (index) {
                int i = index > 2 ? index - 1 : index;
                if (index == 2) {
                  return const Spacer();
                } else {
                  return MyBottomAppbar(
                    icon: state.listIcons[i],
                    text: state.listitel[i],
                    onPresse: () {
                      context.read<HomeCubit>().changePage(i);
                    },
                    active: state.currentPage == i,
                  );
                }
              }).cast<Widget>(),
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
