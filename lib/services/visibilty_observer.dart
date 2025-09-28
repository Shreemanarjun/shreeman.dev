import 'package:jaspr/jaspr.dart';
import 'package:js_interop_utils/js_interop_utils.dart';

import 'dart:js_interop' as web;

import 'package:universal_web/web.dart' as webc;

typedef VisibilityCallback = void Function(String id);

mixin VisibilityObserverMixin<T extends StatefulComponent> on State<T> {
  static webc.IntersectionObserver? __observer;
  static webc.IntersectionObserver get _observer => __observer ??= _createObserver();
  static final _callbacks = <State, VisibilityCallback>{};

  // A map to track all currently intersecting elements and their ratios.
  static final _intersectingEntries = <String, double>{};

  @override
  void initState() {
    super.initState();
    // No need to do anything here, the static observer is already initialized.
  }

  /// Observes a single element by its [id] and sets the callback.
  void observeSection(String id, VisibilityCallback onVisible) {
    _registerAndObserve(id, onVisible);
  }

  /// Observes a list of elements by their [sectionIds] and sets the callback.
  void observeSections(List<String> sectionIds, VisibilityCallback onVisible) {
    // When observing multiple sections, we still only need one callback per component.
    _callbacks[this] = onVisible;
    for (var id in sectionIds) {
      _observeElementById(id);
    }
  }

  @override
  void dispose() {
    _callbacks.remove(this);
    // The observer is static and shared, so we don't disconnect it here.
    // It will live for the duration of the app.
    super.dispose();
  }

  void _registerAndObserve(String id, VisibilityCallback onVisible) {
    _callbacks[this] = onVisible;
    _observeElementById(id);
  }

  static void _observeElementById(String id) {
    final element = webc.document.getElementById(id);
    if (element != null) {
      _observer.observe(element);
    }
  }

  static webc.IntersectionObserver _createObserver() {
    return webc.IntersectionObserver(
      ((
            web.JSArray<webc.IntersectionObserverEntry> entries,
          ) {
            // Update the map of intersecting entries with the latest data.
            for (var i = 0; i < entries.length; i++) {
              final entry = entries[i];
              if (entry.isIntersecting) {
                _intersectingEntries[entry.target.id] = entry.intersectionRatio;
              } else {
                _intersectingEntries.remove(entry.target.id);
              }
            }

            // Determine the most visible section from the entire map.
            String mostVisibleId = '';
            double maxRatio = -1.0; // Use -1 to ensure the first entry always wins
            _intersectingEntries.forEach((id, ratio) {
              if (ratio > maxRatio) {
                maxRatio = ratio;
                mostVisibleId = id;
              }
            });

            // Notify all listeners with the single, most visible section ID.
            for (var callback in _callbacks.values) {
              callback(mostVisibleId);
            }
          })
          .toJS,
      webc.IntersectionObserverInit(
        threshold: [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0].toJSDeep,
        // This margin creates a detection zone that starts 40% down from the top of the viewport
        // and extends all the way to the bottom. This prevents the last element from being
        // de-selected prematurely on wide/short screens.
        rootMargin: '0% 0px 0% 0px',
      ),
    );
  }
}
