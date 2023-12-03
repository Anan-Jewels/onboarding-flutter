import 'package:onboarding_project/dialogs/succes_dialog.dart';
import 'package:onboarding_project/mixins/base_mixin.dart';

import '../../utils/exported_imports.dart';

class OnBoardingPage extends StatelessWidget with BaseClass {
  OnBoardingPage({super.key});

  final OnboardingController onboardingController =
      Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Skip",
              style: TextStyle(color: AppColors.black),
            ),
          )
        ],
      ),
      body: GetBuilder<OnboardingController>(
          init: onboardingController,
          builder: (snapshot) {
            return snapshot.onBoardingModelList == null
                ? const OnBoardShimmer()
                : Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Pick your favourite products",
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "Select upto 10 out of 100",
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Expanded(
                          child: StaggeredGridView.countBuilder(
                            crossAxisCount: 3,
                            itemCount: snapshot.onBoardingModelList!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  snapshot.updateOnboardingItemSelectionStatus(
                                    index,
                                  );
                                },
                                child: SizedBox(
                                  height: 200,
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          color: AppColors.imageBackgroundGrey,
                                          border: Border.all(
                                            color: snapshot.onBoardingModelList!
                                                    .elementAt(index)
                                                    .isSelected!
                                                ? AppColors.yellow
                                                : Colors.white,
                                            width: 2,
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        child: Stack(
                                          children: [
                                            CachedNetworkImage(
                                              height: 100,
                                              width: 100,
                                              progressIndicatorBuilder:
                                                  (context, url, progress) =>
                                                      Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  value: progress.progress,
                                                  color: AppColors.yellow,
                                                ),
                                              ),
                                              imageUrl: snapshot
                                                  .onBoardingModelList!
                                                  .elementAt(index)
                                                  .image!,
                                            ),
                                            snapshot.onBoardingModelList!
                                                    .elementAt(index)
                                                    .isSelected!
                                                ? const Positioned(
                                                    right: 0,
                                                    top: 0,
                                                    child:
                                                        CheckCheckBoxWidget())
                                                : Container(),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        snapshot.onBoardingModelList!
                                            .elementAt(index)
                                            .name!,
                                        style: const TextStyle(
                                            color: AppColors.black),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            staggeredTileBuilder: (int index) =>
                                const StaggeredTile.fit(1),
                            mainAxisSpacing: 15.0,
                            crossAxisSpacing: 15.0,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        _getFooter(context),
                      ],
                    ),
                  );
          }),
    );
  }

  Widget _getFooter(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          const Divider(
            color: AppColors.indicatorGrey,
          ),
          DotsIndicator(
            dotsCount: 9,
            position: 1,
            decorator: const DotsDecorator(
              color: AppColors.indicatorGrey, // Inactive color
              activeColor: AppColors.yellow,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextButtonWithoutBorder(
                  buttonText: "Previous",
                  containsIcon: true,
                  onButtonClick: () {},
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: RoundedEdgedButton(
                  buttonText: "Next",
                  onButtonClick: () {
                    if(onboardingController.getSelectedItemsList.isNotEmpty) {
                      SuccessDialog.dialog(
                          context, onboardingController.getSelectedItems(),onOkTap: (){
                            Get.back();
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
