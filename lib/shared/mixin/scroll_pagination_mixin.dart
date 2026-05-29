import 'package:flutter/material.dart';

/// Mixin that adds infinite-scroll pagination behaviour to any [State].
///
/// Usage:
/// ```dart
/// class _MyBodyState extends State<MyBody> with ScrollPaginationMixin {
///   @override
///   void onReachedBottom() {
///     context.read<MyBloc>().add(const MyEvent.loadMore());
///   }
/// }
/// ```
/// Use [scrollController] in your [ListView] / [CustomScrollView].
mixin ScrollPaginationMixin<T extends StatefulWidget> on State<T> {
  late final ScrollController scrollController = ScrollController();

  /// Override this to dispatch the "load more" event when the list reaches
  /// 90% of its scroll extent.
  void onReachedBottom();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) onReachedBottom();
  }

  bool get _isBottom {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final current = scrollController.offset;
    return current >= maxScroll * 0.9;
  }
}
