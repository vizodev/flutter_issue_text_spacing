import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'learn_more_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();
  final fullWidthBigButton = const Size(double.infinity, 54);
  final kButtonColor = const Color(0xffEA9F7E);

  void openSecondPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LearnMorePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: LayoutBuilder(builder: (context, constraints) {
            return ListView(
              shrinkWrap: false,
              controller: _controller, // primary: true,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  width: constraints.maxWidth,
                  height: MediaQuery.of(context).size.height * 1.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            minHeight: MediaQuery.of(context).size.height * .07,
                            maxHeight: MediaQuery.of(context).size.height * .3),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text.rich(
                                const TextSpan(
                                  text: 'App.\nnamésss,\n',
                                  children: [
                                    TextSpan(text: 'in test.'),
                                  ],
                                ),
                                style:
                                    Theme.of(context).textTheme.displayLarge!),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Say no to files you can’t control — and yes to our app, '
                          'this elegant solution that auto-updates with you.',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(letterSpacing: -0.1, height: 1.4),
                          maxLines: 5,
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: InkWell(
                            onTap: openSecondPage,
                            borderRadius: BorderRadius.circular(12),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Text(
                                      'Learn more',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            fontWeight: FontWeight.w300,
                                          ),
                                      maxLines: 1,
                                    ),
                                  ),
                                  const Icon(CupertinoIcons.chevron_right,
                                      size: 16),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      ///
                      const SectionOnlyFeatures(),

                      ///
                      Flexible(
                        flex: 4,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: ElevatedButton(
                                onPressed: openSecondPage,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: kButtonColor,
                                  minimumSize: fullWidthBigButton,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                                child: const Text('CREATE NEW'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: ElevatedButton(
                                onPressed: openSecondPage,
                                style: ElevatedButton.styleFrom(
                                  minimumSize: fullWidthBigButton,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                                child: const Text('SIGN IN'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class SectionOnlyFeatures extends StatelessWidget {
  const SectionOnlyFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    const kPurpleColor = Color(0xFF685F74);

    return Theme(
      data: Theme.of(context).copyWith(
        appBarTheme: Theme.of(context)
            .appBarTheme
            .copyWith(backgroundColor: Colors.transparent),
        textTheme: Theme.of(context).textTheme.apply(
            displayColor: kPurpleColor,
            bodyColor: kPurpleColor,
            decorationColor: kPurpleColor),
      ),
      child: Container(
        color: Colors.white,
        child: Builder(builder: (context) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'App. namésss, reinvented.',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!,
                        // style: Theme.of(context)
                        //     .textTheme
                        //     .headlineMedium!,
                        // style: Theme.of(context).textTheme.headlineSmall!,
                        maxLines: 3,
                      ),
                    ),
                    questionItem(context, text: 'Privacy, Controls!'),
                    questionItem(context, text: 'Stays, up, to date!'),
                    questionItem(context,
                        text: 'Hey. Choose from beautiful templates!'),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Padding questionItem(BuildContext context,
          {required String text, double? iconSize}) =>
      Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 24),
        child: Row(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 20,
              height: 20,
              color: Colors.blueGrey,
            ),
            const SizedBox(width: 12),
            Flexible(
              flex: 8,
              child: Text(
                text,
                style:
                    Theme.of(context).textTheme.titleLarge!.copyWith(height: 1),
                maxLines: 3,
              ),
            ),
          ],
        ),
      );
}
