import 'dart:js_interop';

import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:universal_web/web.dart' as web;
import 'package:paper_port/pages/home.dart'; // For SectionIndicatorState

// For SectionIndicatorState.sections

/// A provider to calculate the granular scroll progress specifically within the 'work' section.
/// This avoids duplicating complex DOM calculations in multiple widgets.

final workScrollProgressProvider = Provider.autoDispose<double>((ref) {
  // Re-establish the dependency on the main scroll provider.
  // This ensures this provider re-evaluates whenever a scroll event occurs.
  ref.watch(scrollProvider);

  final workElement = web.document.getElementById('work');
  final skillsElement = web.document.getElementById('skills');

  if (workElement.isA<web.HTMLElement>() && skillsElement.isA<web.HTMLElement>()) {
    final workHtmlElement = workElement as web.HTMLElement;
    final skillsHtmlElement = skillsElement as web.HTMLElement;

    final workStart = workHtmlElement.offsetTop.toDouble();
    final workEnd = skillsHtmlElement.offsetTop.toDouble();
    final viewHeight = web.window.innerHeight.toDouble();

    // The effective scrollable distance for the work section is its start to its end, minus one viewport height.
    final workScrollableDist = (workEnd - workStart - viewHeight).clamp(0.0, double.infinity);
    final scrollY = web.window.scrollY.toDouble();

    // Calculate how far we've scrolled past the start of the work section.
    final scrollAmountInWork = (scrollY - workStart).clamp(0.0, workScrollableDist);
    final workProgress = workScrollableDist > 0 ? scrollAmountInWork / workScrollableDist : 0.0;

    // Map this 0-1 progress to the visual range defined for the work section.
    final workSectionDef = SectionIndicatorState.sections.firstWhere((s) => s.id == 'work');
    final skillsSectionDef = SectionIndicatorState.sections.firstWhere((s) => s.id == 'skills');
    final workRange = (skillsSectionDef.position - workSectionDef.position) / 100.0;

    return (workSectionDef.position / 100.0) + (workProgress * workRange);
  }

  return SectionIndicatorState.sections.firstWhere((s) => s.id == 'work').position / 100.0;
});
