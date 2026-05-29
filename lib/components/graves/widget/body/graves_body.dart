import 'package:empty_template/components/graves/bloc/graves_bloc.dart';
import 'package:empty_template/components/graves/widget/grave_list_tile.dart';
import 'package:empty_template/l10n/l10n.dart';
import 'package:empty_template/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GravesBody extends StatefulWidget {
  const GravesBody({super.key});

  @override
  State<GravesBody> createState() => _GravesBodyState();
}

class _GravesBodyState extends State<GravesBody>
    with ScrollPaginationMixin<GravesBody> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void onReachedBottom() {
    context.read<GravesBloc>().add(const GravesEvent.loadMoreGraves());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextFieldWidget(
            controller: _searchController,
            labelText: context.l10n.fullName,
            hintText: context.l10n.searchGravesHint,
            prefixIcon: const Icon(Icons.search, color: AppColors.slate500),
            onChanged: (val) {
              context
                  .read<GravesBloc>()
                  .add(GravesEvent.loadGraves(query: val));
            },
          ),
        ),
        Expanded(
          child: BlocBuilder<GravesBloc, GravesState>(
            builder: (context, state) {
              if (state.status == LoadingStatus.error && state.graves.isEmpty) {
                return TryAgainWidget(
                  message: state.errorMessage,
                  onRetry: () {
                    context.read<GravesBloc>().add(
                          GravesEvent.loadGraves(
                            query: _searchController.text,
                          ),
                        );
                  },
                );
              }

              final isLoading = state.status == LoadingStatus.loading;
              final list = isLoading ? _mockGraves : state.graves;

              if (state.status == LoadingStatus.loaded && list.isEmpty) {
                return Center(
                  child: Text(
                    context.l10n.emptyGraves,
                    style: const TextStyle(color: AppColors.slate400),
                  ),
                );
              }

              return Skeletonizer(
                enabled: isLoading,
                child: ListView.builder(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount:
                      state.hasReachedMax ? list.length : list.length + 1,
                  itemBuilder: (context, index) {
                    if (index >= list.length) {
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
                    final grave = list[index];
                    return GraveListTile(
                      grave: grave,
                      isLoading: isLoading,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  static final List<Grave> _mockGraves = List.generate(
    6,
    (index) => Grave(
      id: 'mock-$index',
      cemeteryId: 'cem-1',
      name: 'Шевченко Тарас Григорович',
      birthDate: '1814-03-09',
      deathDate: '1861-03-10',
      latitude: 50.4162,
      longitude: 30.5097,
      bio: 'Український поет...',
      photoUrl: '',
    ),
  );
}
