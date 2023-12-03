

import 'package:shimmer/shimmer.dart';

import '../utils/exported_imports.dart';

class OnBoardShimmer extends StatelessWidget {
  const OnBoardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: true,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 60,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  StaggeredGridView.countBuilder(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 12,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: AppColors.imageBackgroundGrey,
                                border:
                                    Border.all(color: Colors.white, width: 1),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "",
                              style: TextStyle(color: AppColors.black),
                            ),
                          ],
                        ),
                      );
                    },
                    staggeredTileBuilder: (int index) =>
                        const StaggeredTile.fit(1),
                    mainAxisSpacing: 15.0,
                    crossAxisSpacing: 15.0,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
