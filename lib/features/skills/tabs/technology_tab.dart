import 'package:jaspr/jaspr.dart' hide code;
import 'package:jaspr_lucide/jaspr_lucide.dart' hide text;
import 'package:newportfolio/components/custom_text.dart';

class TechnologyTab extends StatefulComponent {
  const TechnologyTab();

  @override
  State createState() => TechnologyTabState();
}

class TechnologyTabState extends State<TechnologyTab> {
  final technologies = [
    (smartphone(height: 32.px, width: 32.px), 'Flutter', '#02569B'),
    (code(height: 32.px, width: 32.px), 'Dart', '#0175C2'),
    (smartphone(height: 32.px, width: 32.px), 'Android', '#3DDC84'),
    (smartphone(height: 32.px, width: 32.px), 'iOS', '#000000'),
    (monitor(height: 32.px, width: 32.px), 'Windows', '#00BCF2'),
    //(code(height: 32.px, width: 32.px), 'React', '#61DAFB'),
    // (smartphone(height: 32.px, width: 32.px), 'React Native', '#61DAFB'),
    //  (server(height: 32.px, width: 32.px), 'Node.js', '#339933'),
    (database(height: 32.px, width: 32.px), 'Firebase', '#FFCA28'),
    (database(height: 32.px, width: 32.px), 'SQLite', '#003B57'),
    (database(height: 32.px, width: 32.px), 'GraphQL', '#E10098'),
    (database(height: 32.px, width: 32.px), 'MongoDB', '#47A248'),
    (database(height: 32.px, width: 32.px), 'PostgreSQL', '#336791'),
    (gitBranch(height: 32.px, width: 32.px), 'Git', '#F05032'),
    (github(height: 32.px, width: 32.px), 'GitHub', '#181717'),
    (gitMerge(height: 32.px, width: 32.px), 'GitLab', '#FC6D26'),
    (fileCode(height: 32.px, width: 32.px), 'VS Code', '#007ACC'),
    (fileCode(height: 32.px, width: 32.px), 'Android Studio', '#3DDC84'),
    (fileCode(height: 32.px, width: 32.px), 'Xcode', '#147EFB'),
    (figma(height: 32.px, width: 32.px), 'Figma', '#F24E1E'),
    (palette(height: 32.px, width: 32.px), 'Adobe XD', '#FF61F6'),
    (zap(height: 32.px, width: 32.px), 'Postman', '#FF6C37'),
    (package(height: 32.px, width: 32.px), 'Docker', '#2496ED'),
    //  (cloud(height: 32.px, width: 32.px), 'AWS', '#FF9900'),
    // (cloud(height: 32.px, width: 32.px), 'Google Cloud', '#4285F4'),
    (creditCard(height: 32.px, width: 32.px), 'Stripe', '#635BFF'),
    (creditCard(height: 32.px, width: 32.px), 'PayPal', '#00457C'),
    (wifi(height: 32.px, width: 32.px), 'Socket.io', '#010101'),
    (hardDrive(height: 32.px, width: 32.px), 'Redis', '#DC382D'),
    (globe(height: 32.px, width: 32.px), 'HTML5', '#E34F26'),
    (palette(height: 32.px, width: 32.px), 'CSS3', '#1572B6'),
    (code(height: 32.px, width: 32.px), 'JavaScript', '#F7DF1E'),
    (calendar(height: 32.px, width: 32.px), 'Jira', '#0052CC'),
    (messageSquare(height: 32.px, width: 32.px), 'Slack', '#4A154B'),
    // (fileText(height: 32.px, width: 32.px), 'Notion', '#000000'),
    //   (trello(height: 32.px, width: 32.px), 'Trello', '#0079BF'),
  ];

  Component buildTechItem(icon, label, color) {
    return div(
      classes: 'group flex flex-col items-center gap-3 p-6 backdrop-blur-md bg-white/10 border border-white/20 rounded-xl hover:bg-white/20 transition-all duration-300 transform hover:scale-110 hover:shadow-xl min-w-[120px]',
      styles: Styles(raw: {'--tech-color': color}),
      [
        div(
          classes: 'w-12 h-12 text-white/80 group-hover:text-white transition-all duration-300 group-hover:scale-110',
          styles: Styles(raw: {'color': color}),
          [icon],
        ),
        CustomText(
          label,
          classes: 'text-white/70 text-sm font-medium group-hover:text-white transition-colors duration-300 text-center',
        ),
      ],
    );
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(classes: 'transition-all duration-500 opacity-100 translate-x-0', [
      div(
        classes: 'backdrop-blur-lg bg-white/10 border border-white/20 rounded-2xl p-8',
        [
          h3(classes: 'text-2xl font-bold text-white mb-8 text-center', [
            text('Technology Stack'),
          ]),

          // Marquee
          div(classes: 'relative overflow-hidden center', [
            div(
              classes: 'absolute left-0 top-0 bottom-0 w-16 bg-gradient-to-r from-white/10 to-transparent z-10 pointer-events-none',
              [],
            ),
            div(
              classes: 'absolute right-0 top-0 bottom-0 w-16 bg-gradient-to-l from-white/10 to-transparent z-10 pointer-events-none',
              [],
            ),
            div(classes: 'flex animate-marquee hover:pause-marquee', [
              div(classes: 'flex gap-8 min-w-max', [
                for (var tech in technologies) buildTechItem(tech.$1, tech.$2, tech.$3),
              ]),
              div(classes: 'flex gap-8 min-w-max ml-8', [
                for (var tech in technologies) buildTechItem(tech.$1, tech.$2, tech.$3),
              ]),
            ]),
          ]),

          // Categories
          div(classes: 'grid md:grid-cols-3 gap-6 mt-12', [
            div(
              classes: 'backdrop-blur-md bg-white/10 border border-white/20 rounded-xl p-6',
              [
                h4(
                  classes: 'text-lg font-semibold text-white mb-4 flex items-center gap-2',
                  [
                    smartphone(classes: 'text-blue-400'),
                    text('Mobile Development'),
                  ],
                ),
                div(classes: 'space-y-2 text-white/70 text-sm', [
                  text('• Flutter & Dart'),
                  text('• Android & iOS Native'),
                  text('• React Native'),
                  text('• Cross-Platform UI'),
                ]),
              ],
            ),
            div(
              classes: 'backdrop-blur-md bg-white/10 border border-white/20 rounded-xl p-6',
              [
                h4(
                  classes: 'text-lg font-semibold text-white mb-4 flex items-center gap-2',
                  [
                    database(classes: 'text-orange-400'),
                    text('Backend & Cloud'),
                  ],
                ),
                div(classes: 'space-y-2 text-white/70 text-sm', [
                  text('• Firebase Services'),
                  text('• AWS & Google Cloud'),
                  text('• REST & GraphQL APIs'),
                  text('• Database Management'),
                ]),
              ],
            ),
            div(
              classes: 'backdrop-blur-md bg-white/10 border border-white/20 rounded-xl p-6',
              [
                h4(
                  classes: 'text-lg font-semibold text-white mb-4 flex items-center gap-2',
                  [
                    gitBranch(classes: 'text-orange-500'),
                    text('Development Tools'),
                  ],
                ),
                div(classes: 'space-y-2 text-white/70 text-sm', [
                  text('• Git & Version Control'),
                  text('• IDE & Code Editors'),
                  text('• Design Tools'),
                  text('• Project Management'),
                ]),
              ],
            ),
          ]),
        ],
      ),
    ]);
  }
}
