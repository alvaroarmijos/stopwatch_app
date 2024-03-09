import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stopwatch_app/src/packages/core/ui/ui.dart';
import 'package:stopwatch_app/src/packages/features/stopwatch/lib/src/bloc/stopwatch_bloc.dart';
import 'package:stopwatch_app/src/packages/features/stopwatch/lib/src/widgets/widgets.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage>
    with TickerProviderStateMixin {
  late final StopwatchBloc bloc;
  late final AnimationController _controller;
  late final ScrollController _scrollController;

  @override
  void initState() {
    bloc = context.read<StopwatchBloc>();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _scrollController = ScrollController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: kIsWeb
          ? _LargeContent(
              scrollController: _scrollController,
              bloc: bloc,
              controller: _controller,
            )
          : _SmallContent(
              scrollController: _scrollController,
              bloc: bloc,
              controller: _controller,
            ),
    );
  }
}

class _SmallContent extends StatelessWidget {
  const _SmallContent({
    required ScrollController scrollController,
    required this.bloc,
    required AnimationController controller,
  })  : _scrollController = scrollController,
        _controller = controller;

  final ScrollController _scrollController;
  final StopwatchBloc bloc;
  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Container(
          color: theme.colorScheme.background,
          padding: const EdgeInsets.symmetric(vertical: AppDimens.dimen_20),
          child: SafeArea(
            child: BlocBuilder<StopwatchBloc, StopwatchState>(
              builder: (context, state) {
                return Time(
                  duration: state.duration,
                );
              },
            ),
          ),
        ),
        Expanded(
          child: BlocBuilder<StopwatchBloc, StopwatchState>(
            builder: (context, state) {
              return ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.dimen_20,
                ),
                itemCount: state.laps.length,
                itemBuilder: (context, index) => LapItem(
                  index: state.laps[index].index,
                  duration: state.laps[index].duration,
                ),
              );
            },
          ),
        ),
        Container(
          color: theme.colorScheme.background,
          padding: const EdgeInsets.symmetric(vertical: AppDimens.dimen_32),
          child: BlocBuilder<StopwatchBloc, StopwatchState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: state.showStopFlagButton
                    ? MainAxisAlignment.spaceEvenly
                    : MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: state.showStopFlagButton,
                    child: FloatingActionButton(
                      onPressed: () {
                        if (state.isStoped) {
                          bloc.add(const ResetTimerEvent());
                        } else {
                          bloc.add(AddLapEvent(state.duration.inSeconds));
                        }
                      },
                      child: SWAnimatedIcon(
                        status: state.isStoped,
                        initialIcon: Icons.flag,
                        endIcon: Icons.stop,
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      if (state.canStart) {
                        bloc.add(const StartTimerEvent());
                        _controller.forward();
                      } else {
                        bloc.add(const StopTimerEvent());
                        _controller.reverse();
                      }
                    },
                    child: SWAnimatedIcon(status: !state.canStart),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class _LargeContent extends StatelessWidget {
  const _LargeContent({
    required ScrollController scrollController,
    required this.bloc,
    required AnimationController controller,
  })  : _scrollController = scrollController,
        _controller = controller;

  final ScrollController _scrollController;
  final StopwatchBloc bloc;
  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 600,
        ),
        child: ListView(
          children: [
            Container(
              height: size.height * 0.3,
              color: theme.colorScheme.background,
              padding: const EdgeInsets.symmetric(vertical: AppDimens.dimen_20),
              child: SafeArea(
                child: BlocBuilder<StopwatchBloc, StopwatchState>(
                  builder: (context, state) {
                    return Time(
                      duration: state.duration,
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.6,
              child: BlocBuilder<StopwatchBloc, StopwatchState>(
                builder: (context, state) {
                  return ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.dimen_20,
                    ),
                    itemCount: state.laps.length,
                    itemBuilder: (context, index) => LapItem(
                      index: state.laps[index].index,
                      duration: state.laps[index].duration,
                    ),
                  );
                },
              ),
            ),
            Container(
              color: theme.colorScheme.background,
              padding: const EdgeInsets.symmetric(vertical: AppDimens.dimen_32),
              child: BlocBuilder<StopwatchBloc, StopwatchState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: state.showStopFlagButton
                        ? MainAxisAlignment.spaceEvenly
                        : MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: state.showStopFlagButton,
                        child: FloatingActionButton(
                          onPressed: () {
                            if (state.isStoped) {
                              bloc.add(const ResetTimerEvent());
                            } else {
                              bloc.add(AddLapEvent(state.duration.inSeconds));
                            }
                          },
                          child: SWAnimatedIcon(
                            status: state.isStoped,
                            initialIcon: Icons.flag,
                            endIcon: Icons.stop,
                          ),
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          if (state.canStart) {
                            bloc.add(const StartTimerEvent());
                            _controller.forward();
                          } else {
                            bloc.add(const StopTimerEvent());
                            _controller.reverse();
                          }
                        },
                        child: SWAnimatedIcon(status: !state.canStart),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
