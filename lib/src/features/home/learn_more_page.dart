import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LearnMorePage extends StatelessWidget {
  const LearnMorePage({super.key});

  @override
  Widget build(BuildContext context) {
    const kPurpleColor = Color(0xFF685F74);

    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: LayoutBuilder(builder: (context, constraints) {
            return Container(
              constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight:
                    (MediaQuery.of(context).size.height * 1.5).toDouble(),
                maxHeight:
                    (MediaQuery.of(context).size.height * 1.8).toDouble(),
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SingleChildScrollView(
                        primary: true,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                                height:
                                    (Theme.of(context).iconTheme.size ?? 28) *
                                        1.5),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'Learn more'.toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(fontWeight: FontWeight.w300),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.zero.copyWith(
                                top: 12,
                                bottom: 6,
                              ),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'How does it work?',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(fontWeight: FontWeight.w400),
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            const MarketingFeaturesCard(
                              title: "You're in control.",
                              description:
                                  'By sharing a link instead of a file, you can lock or unlock it, and control who sees it.',
                            ),
                            const MarketingFeaturesCard(
                              title: 'Update whenever.',
                              description:
                                  'Update your information, information, and information, long after you hit publish.',
                            ),
                            const MarketingFeaturesCard(
                              title: 'Free for all.',
                              description:
                                  'No setup fees, no upsells.\nApp naméssss is 100% free, forever.',
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.all(32)
                                  .copyWith(top: 18, left: 0, right: 0),
                              child: Container(
                                constraints: BoxConstraints(
                                    minHeight: 430,
                                    minWidth: constraints.maxWidth),
                                padding: const EdgeInsets.all(26),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: SingleChildScrollView(
                                  primary: false,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          'FREQUENTLY ASKED',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  color: kPurpleColor,
                                                  fontWeight: FontWeight.w300),
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const Divider(thickness: 2, height: 24),
                                      const SizedBox(height: 16),
                                      const FaqQuestionItemText(
                                          text:
                                              'Can someone search my information?',
                                          description:
                                              'No. There’s no way for them to even know you have one. You need to send them your link directly.'),
                                      const FaqQuestionItemText(
                                          text:
                                              'If I delete my information is there any sort of record of it?',
                                          description: 'No.'),
                                      const FaqQuestionItemText(
                                          text:
                                              'If I update my information, does it update everywhere?',
                                          description:
                                              'Yes. You don’t have to send anyone a new link; Your information will always have the same link. '
                                              'Your information has been updated everywhere!',
                                          isLastIndex: true),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16)
                                      .copyWith(top: 14, bottom: 50),
                              child: InkWell(
                                onTap: () => Navigator.of(context).pop(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(CupertinoIcons.chevron_left,
                                        size: 20, color: kPurpleColor),
                                    Flexible(
                                      child: Text(
                                        'Return home',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              height: .97,
                                              color: kPurpleColor,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            ///
                            const Flexible(
                              flex: 2,
                              child: SizedBox(height: 30),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  ///
                  Align(
                    alignment:
                        const Alignment(0.994, -0.990), // Alignment.topRight,
                    child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        padding: const EdgeInsets.all(12),
                        icon: const Icon(
                          CupertinoIcons.clear_circled,
                          size: 28,
                          color: Colors.black54,
                        )),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class FaqQuestionItemText extends StatelessWidget {
  const FaqQuestionItemText({
    super.key,
    required this.text,
    required this.description,
    this.maxLines = 7,
    this.isLastIndex = false,
  });

  final String text;
  final String description;
  final int maxLines;
  final bool isLastIndex;

  @override
  Widget build(BuildContext context) {
    final height = 1.3;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.headlineMedium!,
          // style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          //   color: Colors.black,
          //   fontWeight: FontWeight.w700,
          //   height: height,
          //   fontFeatures: const [FontFeature.proportionalFigures()],
          // ),
        ),
        // OR
        // Text.rich(
        //   TextSpan(
        //     text: text,
        //     children: [TextSpan(text: 'testinggggg, aa!bb?')],
        //   ),
        //   style: Theme.of(context).textTheme.headlineMedium!,
        // ),
        const SizedBox(height: 8),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w300,
              height: height,
              letterSpacing: -0.1),
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
        ),
        Flexible(
          flex: 2,
          child: SizedBox(height: !isLastIndex ? 32 : 14),
        ),
      ],
    );
  }
}

class MarketingFeaturesCard extends StatelessWidget {
  const MarketingFeaturesCard({
    super.key,
    required this.title,
    required this.description,
  });

  static const double exceptionFontSize = 18;

  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Container(
            color: Colors.blueGrey,
            width: 44,
            height: 44,
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: exceptionFontSize,
                  fontWeight: FontWeight.w600,
                ),
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w400, height: 1.3, letterSpacing: -0.1),
            maxLines: 5,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
