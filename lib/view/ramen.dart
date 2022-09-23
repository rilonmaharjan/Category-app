import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../controller/getxcontroller.dart';

class Ramen extends StatefulWidget {
  const Ramen({Key? key}) : super(key: key);

  @override
  State<Ramen> createState() => _HomeAndLivingState();
}

class _HomeAndLivingState extends State<Ramen> {
  final controller = Get.put(DummyApiController());


  @override
  void initState() {
    initialise();
    super.initState();
  }

  initialise() async {
    await controller.getDummyItems();
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: GetBuilder(
            init: DummyApiController(),
            builder: (_) {
              return Obx(
                () => controller.isLoading.value
                    ? SizedBox(
                        height:
                            MediaQuery.of(context).size.height - kToolbarHeight,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, left: 8, right: 8),
                            child: Container(
                              color: Colors.white,
                              child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.dummyItems.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Card(
                                      color: Colors.blue,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical : 6.0, horizontal: 10.0),
                                        child: SizedBox(
                                          width: MediaQuery.of(context).size.width,
                                            child: Text(controller
                                                .dummyItems[index].title
                                                .toString())),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                          const SizedBox(
                            height: 80,
                          )
                        ],
                      ),
              );
            }),
      ),
    ));
  }
}
