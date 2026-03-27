import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shoezy/presentation/widgets/shimmer_loading.dart';

class LoadingStateManager extends StatefulWidget {
  final Widget child;
  final bool isLoading;
  final bool isEmpty;
  final String? emptyMessage;
  final String? lottieAsset;
  final Duration loadingDuration;
  final VoidCallback? onLoadingComplete;

  const LoadingStateManager({
    super.key,
    required this.child, 
    required this.isLoading,
    required this.isEmpty,
    this.emptyMessage,
    this.lottieAsset,
    this.loadingDuration = const Duration(minutes: 1),
    this.onLoadingComplete,
  });

  @override
  State<LoadingStateManager> createState() => _LoadingStateManagerState();
}

class _LoadingStateManagerState extends State<LoadingStateManager> {
  Timer? _loadingTimer;
  late ValueNotifier<bool> _showLoadingNotifier;
  late ValueNotifier<bool> _loadingCompletedNotifier;

  @override
  void initState() {
    super.initState();
    _showLoadingNotifier = ValueNotifier<bool>(true);
    _loadingCompletedNotifier = ValueNotifier<bool>(false);
    _startLoadingTimer();
  }

  @override
  void didUpdateWidget(LoadingStateManager oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    // Reset timer if loading state changes
    if (oldWidget.isLoading != widget.isLoading) {
      _loadingTimer?.cancel();
      if (widget.isLoading) {
        _showLoadingNotifier.value = true;
        _loadingCompletedNotifier.value = false;
        _startLoadingTimer();
      }
    }
  }

  void _startLoadingTimer() {
    if (widget.isLoading) {
      _loadingTimer = Timer(widget.loadingDuration, () {
        if (mounted) {
          _showLoadingNotifier.value = false;
          _loadingCompletedNotifier.value = true;
          widget.onLoadingComplete?.call();
        }
      });
    }
  }

  @override
  void dispose() {
    _loadingTimer?.cancel();
    _showLoadingNotifier.dispose();
    _loadingCompletedNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // If not loading, show content or empty state
    if (!widget.isLoading) {
      if (widget.isEmpty) {
        return AnimationLoading.isEmptyField(
          message: widget.emptyMessage,
          lottieAsset: widget.lottieAsset,
        );
      }
      return widget.child;
    }

    // Use ValueListenableBuilder for reactive state management
    return ValueListenableBuilder<bool>(
      valueListenable: _showLoadingNotifier,
      builder: (context, showLoading, child) {
        return ValueListenableBuilder<bool>(
          valueListenable: _loadingCompletedNotifier,
          builder: (context, loadingCompleted, child) {
            // If loading and timer hasn't completed, show spinner
            if (showLoading) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimationLoading.spinnerAnimation(),
                    const SizedBox(height: 16),
                    const Text(
                      'Loading...',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            } 

            // If loading completed but still loading (1 minute passed), show empty state
            if (loadingCompleted && widget.isEmpty) {
              return AnimationLoading.isEmptyField(
                message: widget.emptyMessage,
                lottieAsset: widget.lottieAsset,
              );
            }

            // If loading completed and has data, show content
            if (loadingCompleted && !widget.isEmpty) {
              return widget.child;
            }

            // Fallback to spinner
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimationLoading.spinnerAnimation(),
                  const SizedBox(height: 16),
                  const Text(
                    'Loading...',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

// Convenience widget for different empty states
class EmptyStateManager extends StatelessWidget {
  final Widget child;
  final bool isEmpty;
  final String? message;
  final EmptyStateType type;

  const EmptyStateManager({
    super.key,
    required this.child,
    required this.isEmpty,
    this.message,
    this.type = EmptyStateType.noData,
  });

  @override
  Widget build(BuildContext context) {
    if (isEmpty) {
      switch (type) {
        case EmptyStateType.noData:
          return AnimationLoading.isEmptyField(message: message);
        case EmptyStateType.emptyBox:
          return AnimationLoading.emptyBoxField(message: message);
        case EmptyStateType.boxEmpty:
          return AnimationLoading.boxEmptyField(message: message);
      }
    }
    return child;
  }
}

enum EmptyStateType {
  noData,
  emptyBox,
  boxEmpty,
}
