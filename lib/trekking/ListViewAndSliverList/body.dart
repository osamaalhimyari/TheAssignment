import 'package:flutter/material.dart';

class ScrollWidgetBody extends StatelessWidget {
  final Widget? header;
  final Widget? bodyContent;
  final Widget? bodyListView;

  const ScrollWidgetBody(
      {this.header, this.bodyContent, this.bodyListView, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          if (header != null)
            SliverToBoxAdapter(
              child: header,
            ),
          if (bodyContent != null)
            SliverList(
                delegate: SliverChildListDelegate(
              [bodyContent!],
            )),
          bodyListView ?? const SliverToBoxAdapter(child: Text('')),
        ],
      ),
    );
  }
}

// Widget bodyScrollView2(Widget? header, Widget? bodyContent, bodyListView) {
  // return SafeArea(
  //   child: CustomScrollView(
  //     slivers: [
  //       if (header != null)
  //         SliverToBoxAdapter(
  //           child: header,
  //         ),
  //       if (bodyContent != null)
  //         SliverList(
  //             delegate: SliverChildListDelegate(
  //           [bodyContent],
  //         )),
  //       // if (bodyListView !=null)
  //       bodyListView ?? const SliverToBoxAdapter(child: Text('')),
  //     ],
  //   ),
  // );
// }
