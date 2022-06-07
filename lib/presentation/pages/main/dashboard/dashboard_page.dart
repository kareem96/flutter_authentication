import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/domain/domain.dart';
import 'package:flutter_auth/presentation/pages/main/dashboard/cubit/users_cubit.dart';
import 'package:flutter_auth/presentation/presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  int _lastPage = 1;
  final List<User> _users = [];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() async {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          if (_currentPage < _lastPage) {
            _currentPage++;
            await context
                .read<UsersCubit>()
                .fetchUsers(UsersParams(page: _currentPage));
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: RefreshIndicator(
        color: Theme.of(context).iconTheme.color,
        onRefresh: () {
          _currentPage = 1;
          _lastPage = 1;
          _users.clear();

          return context
              .read<UsersCubit>()
              .refreshUsers(UsersParams(page: _currentPage));
        },
        child: BlocBuilder<UsersCubit, UsersState>(
          builder: (_, state) {
            switch (state.status) {
              case UserStatus.loading:
                return const Center(child: Loading());
              case UserStatus.success:
                final _data = state.users!;
                _users.addAll(_data.users);
                _lastPage = _data.lastPage;

                return ListView.builder(
                  controller: _scrollController,
                  itemCount: _currentPage == _lastPage
                      ? _users.length
                      : _users.length + 1,
                  padding: EdgeInsets.symmetric(vertical: Dimens.space16),
                  itemBuilder: (_, index) {
                    return index < _users.length
                        ? Container(
                      decoration: BoxDecorations.card.copyWith(
                        color: Theme.of(context).cardColor,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: Dimens.space16,
                        horizontal: Dimens.space24,
                      ),
                      margin: EdgeInsets.symmetric(
                        vertical: Dimens.space8,
                        horizontal: Dimens.space16,
                      ),
                      child: Row(
                        children: [
                          CircleImage(
                            url: _users[index].avatar ?? "",
                            size: Dimens.profilePicture,
                          ),
                          const SpacerHorizontal(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _users[index].name ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                _users[index].email ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                        : Padding(
                      padding: EdgeInsets.all(Dimens.space16),
                      child: const Center(
                        child: CupertinoActivityIndicator(),
                      ),
                    );
                  },
                );
              case UserStatus.failure:
                return Center(child: Empty(errorMessage: state.message ?? ""));

              case UserStatus.empty:
                return const Center(child: Empty());
            }
          },
        ),
      ),
    );
  }
}
