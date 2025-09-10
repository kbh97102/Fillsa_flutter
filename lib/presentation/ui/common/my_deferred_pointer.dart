// deferred_pointer_service.dart
// my_deferred_pointer.dart
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DeferredPointerService {
  final List<RenderBox> _targets = [];

  void add(RenderBox target) {
    _targets.add(target);
  }

  void remove(RenderBox target) {
    _targets.remove(target);
  }

  BoxHitTestResult hitTest(Offset position) {
    final result = BoxHitTestResult();

    if (_targets.isEmpty) {
      return result;
    }

    for (final target in _targets.reversed) {
      if (!target.attached) {
        continue;
      }

      final transform = target.getTransformTo(null);
      final paintedBounds = MatrixUtils.transformRect(
        transform,
        target.paintBounds,
      );

      if (paintedBounds.contains(position)) {
        if (target.hitTest(result, position: target.globalToLocal(position))) {
          return result;
        }
      }
    }
    return result;
  }
}

final deferredPointerService = DeferredPointerService();

class MyDeferPointer extends SingleChildRenderObjectWidget {
  const MyDeferPointer({super.key, required super.child});

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderMyDeferPointer();
  }
}

class RenderMyDeferPointer extends RenderProxyBox {
  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    deferredPointerService.add(this);
  }

  @override
  void detach() {
    deferredPointerService.remove(this);
    super.detach();
  }
}

class MyDeferredPointerHandler extends StatelessWidget {
  final Widget child;
  const MyDeferredPointerHandler({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (event) {
        final deferredResult = deferredPointerService.hitTest(event.position);

        if (deferredResult.path.isNotEmpty) {
          GestureBinding.instance.dispatchEvent(event, deferredResult);
        }
      },
      child: child,
    );
  }
}
