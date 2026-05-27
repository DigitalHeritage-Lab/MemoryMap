import 'package:cached_network_image/cached_network_image.dart';
import 'package:empty_template/components/cemeteries/bloc/cemeteries_bloc.dart';
import 'package:empty_template/l10n/l10n.dart';
import 'package:empty_template/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CemeteriesBody extends StatefulWidget {
  const CemeteriesBody({super.key});

  @override
  State<CemeteriesBody> createState() => _CemeteriesBodyState();
}

class _CemeteriesBodyState extends State<CemeteriesBody> {
  final TextEditingController _searchController = TextEditingController();

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
            labelText: context.l10n.navCemeteries,
            hintText: context.l10n.searchCemeteriesHint,
            prefixIcon: const Icon(Icons.search, color: AppColors.slate500),
            onChanged: (val) {
              context
                  .read<CemeteriesBloc>()
                  .add(CemeteriesEvent.loadCemeteries(query: val));
            },
          ),
        ),
        Expanded(
          child: BlocBuilder<CemeteriesBloc, CemeteriesState>(
            builder: (context, state) {
              if (state.status == LoadingStatus.error) {
                return TryAgainWidget(
                  message: state.errorMessage,
                  onRetry: () {
                    context.read<CemeteriesBloc>().add(
                          CemeteriesEvent.loadCemeteries(
                            query: _searchController.text,
                          ),
                        );
                  },
                );
              }

              final isLoading = state.status == LoadingStatus.loading;
              final list = isLoading ? _mockCemeteries : state.cemeteries;

              if (state.status == LoadingStatus.loaded && list.isEmpty) {
                return Center(
                  child: Text(
                    context.l10n.emptyCemeteries,
                    style: const TextStyle(color: AppColors.slate400),
                  ),
                );
              }

              return Skeletonizer(
                enabled: isLoading,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final cemetery = list[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: AppColors.slate800,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppColors.slate700,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              if (!isLoading) {
                                context.go('/cemeteries/${cemetery.id}');
                              }
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: cemetery.photoUrl,
                                  height: 160,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    color: AppColors.slate700,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const ColoredBox(
                                    color: AppColors.slate700,
                                    child: Icon(
                                      Icons.image_not_supported_outlined,
                                      color: Colors.white24,
                                      size: 40,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cemetery.name,
                                        style: const TextStyle(
                                          color: AppColors.slate50,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            size: 14,
                                            color: AppColors.emerald,
                                          ),
                                          const SizedBox(width: 4),
                                          Expanded(
                                            child: Text(
                                              cemetery.location,
                                              style: const TextStyle(
                                                color: AppColors.slate400,
                                                fontSize: 13,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        cemetery.description,
                                        style: const TextStyle(
                                          color: AppColors.slate500,
                                          fontSize: 13,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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

  static const List<Cemetery> _mockCemeteries = [
    Cemetery(
      id: 'mock-1',
      name: 'Байкове кладовище',
      location: 'Київ, вул. Байкова, 6',
      description: 'Один із найстаріших та найпрестижніших некрополів Києва.',
      latitude: 50.4162,
      longitude: 30.5097,
      photoUrl: '',
    ),
    Cemetery(
      id: 'mock-2',
      name: 'Личаківський цвинтар',
      location: 'Львів, вул. Мечникова, 33',
      description: 'Державний історико-культурний музей-заповідник.',
      latitude: 49.8328,
      longitude: 24.0552,
      photoUrl: '',
    ),
  ];
}
