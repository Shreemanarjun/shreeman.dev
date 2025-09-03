import 'package:jaspr/jaspr.dart';
import 'package:newportfolio/features/about/about.dart';
import 'package:newportfolio/features/contact/contact.dart';
import 'package:newportfolio/features/experience/experience.dart';
import 'package:newportfolio/features/footer/footer.dart';
import 'package:newportfolio/features/hero/view/hero.dart';
import 'package:newportfolio/features/projects/projects.dart';
import 'package:newportfolio/features/skills/skills.dart';

class Home extends StatelessComponent {
  const Home({super.key});

  @override
  Component build(BuildContext context) {
    return section(
      [
        const HeroSection(),
        const About(),
        const Projects(),
        const Experience(),
        const Skills(),

        const Contact(),
        const Footer(),
      ],
    );
  }
}
