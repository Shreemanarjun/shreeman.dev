import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:newportfolio/components/animated_bg.dart';
import 'package:newportfolio/features/view_cv/view_cv_page.dart';

import 'components/header.dart';

import 'pages/home.dart';

// The main component of your application.
class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    // This method is rerun every time the component is rebuilt.
    //
    // Each build method can return multiple child components as an [Iterable]. The recommended approach
    // is using the [sync* / yield] syntax for a streamlined control flow, but its also possible to simply
    // create and return a [List] here.

    // Renders a <div class="main"> html element with children.
    return ProviderScope(
      child: div([
        div(
          classes: 'main min-h-screen bg-gradient-to-br from-gray-900 via-blue-900 to-purple-900 text-white overflow-x-hidden',
          [
            AnimatedBg(),
            div(classes: "relative z-10", [
              Router(
                routes: [
                  ShellRoute(
                    builder: (context, state, child) => Component.fragment(
                      [
                        const Header(),
                        child,
                      ],
                    ),
                    routes: [
                      Route(
                        path: '/',
                        title: 'Home',
                        builder: (context, state) => const Home(),
                      ),
                      Route(
                        path: '/cv',
                        title: 'CV',
                        builder: (context, state) => ViewCvPage(),
                      ),
                    ],
                  ),
                ],
              ),
            ]),
          ],
        ),
      ]),
    );
  }
}
