import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:paper_port/pages/blogs.dart';
import 'package:paper_port/pages/packages.dart';
import 'package:paper_port/pages/view_cv_page.dart';

import 'components/header.dart';
import 'pages/home.dart';

// The main component of your application.
class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    // This method is rerun every time the component is rebuilt.

    // Renders a <div class="main"> html element with children.
    return ProviderScope(
      child: div(classes: 'main', [
        Router(
          routes: [
            ShellRoute(
              builder: (context, state, child) => Component.fragment([
                const Header(),
                child,
              ]),
              routes: [
                Route(
                  path: '/',
                  title: 'Home',
                  builder: (context, state) => const Home(),
                ),
                Route(
                  path: '/cv',
                  title: 'About',
                  builder: (context, state) => ViewCvPage(),
                ),
              ],
            ),
            Route(
              path: '/blogs',
              title: 'Blogs',
              builder: (context, state) => Blogs(),
            ),
            Route(
              path: '/packages',
              title: 'Packages',
              builder: (context, state) => Packages(),
            ),
          ],
        ),
      ]),
    );
  }
}
