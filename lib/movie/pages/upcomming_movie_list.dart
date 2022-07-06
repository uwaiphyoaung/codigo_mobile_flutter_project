import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/upcomming/upcomming_bloc.dart';
import '../widget/upcomming_movie_item.dart';

class UpCommingMovieList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UpcommingMovieListState();
}

class UpcommingMovieListState extends State<UpCommingMovieList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcommingBloc, UpcommingState>(
      builder: (context, state) {
        if (state is UpcommingListSuccessState) {
          return SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2.0, crossAxisCount: 1),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return UpcommingMovieItem(state.dataList[index]);
              },
              childCount: state.dataList.length,
            ),
          );
        }

        return const SliverToBoxAdapter();
      },
    );
  }
}
