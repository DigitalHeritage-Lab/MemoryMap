import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:memory_map/components/cemeteries/bloc/cemetery_detail_bloc.dart';
import 'package:memory_map/components/cemeteries/widget/grave_list_tile.dart';
import 'package:memory_map/l10n/l10n.dart';
import 'package:memory_map/shared/shared.dart';

class CemeteryDetailBody extends StatefulWidget {
  const CemeteryDetailBody({super.key});

  @override
  State<CemeteryDetailBody> createState() => _CemeteryDetailBodyState();
}

class _CemeteryDetailBodyState extends State<CemeteryDetailBody>
    with ScrollPaginationMixin<CemeteryDetailBody> {
  @override
  void onReachedBottom() {
    context
        .read<CemeteryDetailBloc>()
        .add(const CemeteryDetailEvent.loadMoreGraves());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CemeteryDetailBloc, CemeteryDetailState>(
      builder: (context, state) {
        if (state.status == LoadingStatus.loading ||
            state.status == LoadingStatus.initial) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.emerald),
            ),
          );
        }

        if (state.status == LoadingStatus.error && state.graves.isEmpty) {
          return TryAgainWidget(
            message: state.errorMessage,
            onRetry: () {
              final bloc = context.read<CemeteryDetailBloc>();
              if (state.cemetery != null) {
                bloc.add(
                  CemeteryDetailEvent.loadCemeteryDetail(
                    state.cemetery!.id,
                  ),
                );
              }
            },
          );
        }

        final cemetery = state.cemetery!;
        final graves = state.graves;

        return CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverAppBar(
              expandedHeight: 220,
              pinned: true,
              backgroundColor: AppColors.slate900,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => context.pop(),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: AppNetworkImage(
                  imageUrl: cemetery.photoUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const ColoredBox(
                    color: AppColors.slate700,
                  ),
                  errorWidget: (context, url, error) => const ColoredBox(
                    color: AppColors.slate700,
                    child: Icon(
                      Icons.image,
                      color: Colors.white24,
                      size: 50,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: _CemeteryHeader(
                cemetery: cemetery,
                gravesCount: graves.length,
              ),
            ),
            if (graves.isEmpty)
              SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Text(
                      context.l10n.emptyGraves,
                      style: const TextStyle(color: AppColors.slate500),
                    ),
                  ),
                ),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (index >= graves.length) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 24),
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.emerald,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                      final grave = graves[index];
                      return GraveListTile(grave: grave);
                    },
                    childCount:
                        state.hasReachedMax ? graves.length : graves.length + 1,
                  ),
                ),
              ),
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
          ],
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Private stateless header with cemetery info and graves count
// ---------------------------------------------------------------------------

class _CemeteryHeader extends StatelessWidget {
  const _CemeteryHeader({
    required this.cemetery,
    required this.gravesCount,
  });

  final Cemetery cemetery;
  final int gravesCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cemetery.name,
            style: const TextStyle(
              color: AppColors.slate50,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: AppColors.emerald,
                size: 16,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  cemetery.location,
                  style: const TextStyle(
                    color: AppColors.slate400,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(
                Icons.gps_fixed,
                color: AppColors.gold,
                size: 14,
              ),
              const SizedBox(width: 6),
              Text(
                '${cemetery.latitude.toStringAsFixed(5)}, '
                '${cemetery.longitude.toStringAsFixed(5)}',
                style: const TextStyle(
                  color: AppColors.slate500,
                  fontSize: 12,
                  fontFamily: 'monospace',
                ),
              ),
            ],
          ),
          const Divider(color: AppColors.slate700, height: 32),
          Text(
            context.l10n.aboutCemetery,
            style: const TextStyle(
              color: AppColors.slate50,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            cemetery.description,
            style: const TextStyle(
              color: AppColors.slate400,
              fontSize: 15,
              height: 1.5,
            ),
          ),
          const Divider(color: AppColors.slate700, height: 32),
          Text(
            context.l10n.digitizedGravesCount(gravesCount),
            style: const TextStyle(
              color: AppColors.slate50,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
