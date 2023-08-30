import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webtoon/common/layout/default_layout.dart';
import 'package:webtoon/webtoon/component/webtoon_card.dart';
import 'package:webtoon/webtoon/model/webtoon_model.dart';
import 'package:webtoon/webtoon/provider/webtoon_provider.dart';

class HomeScreen extends ConsumerWidget {
  static String get routeName => 'homeScreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final webtoonState = ref.watch(webtoonProvider);

    return DefaultLayout(
      title: "오늘의 웹툰",
      child: webtoonState.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: _buildList(webtoonState)),
              ],
            ),
    );
  }

  ListView _buildList(List<WebtoonModel> webtoonState) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      separatorBuilder: (context, index) => const SizedBox(width: 40),
      scrollDirection: Axis.horizontal,
      itemCount: webtoonState.length,
      itemBuilder: (context, index) {
        return WebtoonCard.fromModel(model: webtoonState[index]);
      },
    );
  }
}
