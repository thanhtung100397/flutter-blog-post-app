import 'package:flutter/material.dart';

class PagerConfig {
  final Duration animatePageDuration;
  final Curve animatePageCurve;

  const PagerConfig({
    this.animatePageDuration = const Duration(milliseconds: 500),
    this.animatePageCurve = Curves.easeInOut
  });
}

class AppPagerWidget<T extends Widget> extends StatefulWidget {
  final List<Widget> pages;
  final PagerConfig config;
  final int currentPage;
  final void Function(int pageIdx)? onPageChanged;

  const AppPagerWidget({
    Key? key,
    required this.pages,
    this.config = const PagerConfig(),
    this.onPageChanged,
    this.currentPage = 0,
  }) : super(key: key);

  @override
  State<AppPagerWidget> createState() => _AppPagerWidgetState();
}

class _AppPagerWidgetState extends State<AppPagerWidget> {
  ValueNotifier<int> currentPageIdx = ValueNotifier<int>(0);
  ValueNotifier<bool> pageAnimating = ValueNotifier<bool>(false);
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    currentPageIdx = ValueNotifier<int>(widget.currentPage);
    currentPageIdx.addListener(() {
      animatePagerToNewPage(currentPageIdx.value);
    });
  }

  Future<void> animatePagerToNewPage(int newPageIndex) async {
    if (pageAnimating.value) {
      return;
    }
    pageAnimating.value = true;
    Future<void> animateProgress = controller.animateToPage(
        newPageIndex,
        duration: widget.config.animatePageDuration,
        curve: widget.config.animatePageCurve
    );
    animateProgress.whenComplete(() => setState(() {
      pageAnimating.value = false;
    }));
    return animateProgress;
  }

  handlePageChange(int page) {
    if (!pageAnimating.value) {
      widget.onPageChanged?.call(page);
    }
  }

  @override
  Widget build(BuildContext context) {
    currentPageIdx.value = widget.currentPage;
    return PageView(
      controller: controller,
      onPageChanged: handlePageChange,
      children: widget.pages,
    );
  }
}