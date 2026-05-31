import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:memory_map/l10n/l10n.dart';
import 'package:memory_map/shared/bloc/camera/camera_cubit.dart';
import 'package:memory_map/shared/bloc/camera/camera_state.dart';
import 'package:memory_map/shared/shared.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    var currentIndex = 0;
    if (location.startsWith('/cemeteries')) {
      currentIndex = 0;
    } else if (location.startsWith('/map')) {
      currentIndex = 1;
    } else if (location.startsWith('/graves')) {
      currentIndex = 3;
    } else if (location.startsWith('/profile')) {
      currentIndex = 4;
    } else if (location.startsWith('/digitize')) {
      currentIndex = 0;
    }

    return BlocProvider(
      create: (context) => GetIt.I.get<CameraCubit>(),
      child: BlocListener<CameraCubit, CameraState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == LoadingStatus.error && state.failure != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.failure!.message.toLocalizedError(context) ??
                      state.failure!.message,
                ),
                backgroundColor: AppColors.red,
              ),
            );
          } else if (state.status == LoadingStatus.loaded &&
              state.imagePath != null) {
            context.go('/digitize', extra: state.imagePath);
          }
        },
        child: Builder(
          builder: (context) {
            return AppScaffold(
              body: child,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: Container(
                padding: EdgeInsets.all(6.w),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.slate900,
                ),
                child: SizedBox(
                  width: 64.w,
                  height: 64.w,
                  child: FloatingActionButton(
                    onPressed: () => context.read<CameraCubit>().pickImage(),
                    backgroundColor: AppColors.emerald,
                    shape: const CircleBorder(),
                    elevation: 0,
                    child: Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                      size: 32.w,
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: currentIndex,
                onTap: (index) {
                  switch (index) {
                    case 0:
                      context.go('/cemeteries');
                    case 1:
                      context.go('/map');
                    case 2:
                      // Do nothing, center button handles its own press
                      break;
                    case 3:
                      context.go('/graves');
                    case 4:
                      context.go('/profile');
                  }
                },
                backgroundColor: AppColors.slate800,
                selectedItemColor: AppColors.emerald,
                unselectedItemColor: AppColors.slate500,
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                unselectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                items: [
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.account_balance_outlined),
                    activeIcon: const Icon(Icons.account_balance),
                    label: context.l10n.navCemeteries,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.map_outlined),
                    activeIcon: const Icon(Icons.map),
                    label: context.l10n.navMap,
                  ),
                  const BottomNavigationBarItem(
                    icon: SizedBox.shrink(),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.search_outlined),
                    activeIcon: const Icon(Icons.search),
                    label: context.l10n.navGraves,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.person_outline),
                    activeIcon: const Icon(Icons.person),
                    label: context.l10n.navProfile,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
