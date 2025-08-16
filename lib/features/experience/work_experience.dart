import 'package:jaspr/jaspr.dart';
import 'package:jaspr_lucide/jaspr_lucide.dart' hide text, component;
import 'package:newportfolio/features/experience/education.dart';

class WorkExperience extends StatefulComponent {
  final String activeTab;
  final bool isVisible;

  const WorkExperience({super.key, required this.activeTab, required this.isVisible});

  @override
  State createState() => WorkExperienceState();
}

class WorkExperienceState extends State<WorkExperience> {
  final workExperience = [
    (
      id: 1,
      title: 'Senior Flutter Developer',
      company: 'Mverse Technologies Private LTD',
      location: 'Mumbai, India',
      period: '09/2024 – present',
      type: 'Full-time',
      description: 'Leading cross-platform mobile development team, architecting scalable Flutter applications for enterprise clients.',
      achievements: [
        'Led development of 5+ enterprise mobile applications serving 100k+ users.',
        'Implemented CI/CD pipelines reducing deployment time by 60%.',
        'Mentored junior developers and established Flutter best practices.',
        'Optimized app performance resulting in 40% faster load times.',
      ],
      technologies: [
        'Flutter',
        'Dart',
        'Riverpod',
        'Firebase',
        'Clean Architecture',
      ],
      logo: '🚀',
    ),
    (
      id: 2,
      title: 'Senior Flutter Developer',
      company: '1811 Labs',
      location: 'Remote',
      period: '03/2024 – 09/2024',
      type: 'Full-time',
      description: 'Developed innovative mobile solutions for startup ecosystem, focusing on rapid prototyping and MVP development.',
      achievements: [
        'Engineered Audionotes (Android & iOS): Developed an AI-powered, offline-first voice note application featuring real-time transcription, smart summaries, and custom GPT outputs, significantly enhancing user productivity.',
        'Reduced development time by 50% using Flutter for cross-platform development.',
        'Integrated complex payment systems and real-time features.',
        'Implemented seamless cloud synchronization ensuring data accessibility across devices, even in offline environments.',
        'Achieved 4.8+ average app store ratings across all projects.',
      ],
      technologies: [
        'Flutter',
        'Dart',
        'RevenueCart',
        'Riverpod',
        'Supabase',
        'REST APIs',
        "Bricks(Offline Sync)",
      ],
      logo: '💡',
    ),
    (
      id: 3,
      title: 'Mobile App Developer',
      company: 'Glocian',
      location: 'Bhubaneswar, India',
      period: '09/2023 – 02/2024',
      type: 'Full-time',
      description: 'Specialized in client-focused mobile app development, delivering custom solutions for diverse industries.',
      achievements: [
        'Developed and maintained Hxpert & Hxpert Partner apps (5K+/100+ downloads, 3.7-star rating), demonstrating proficiency in real-world application development.',
        'Integrated Firebase for enhanced user engagement and Razorpay for secure in-app transactions, showcasing expertise in key mobile development technologies.',
        'Implemented advanced UI/UX designs with smooth animations.',
        'Established quality assurance processes and testing protocols.',
      ],
      technologies: [
        'Flutter',
        'Dart',
        'Hive',
        'Riverpod',
        'ShadCN UI',
        'RazorPay',
      ],
      logo: '📱',
    ),
    (
      id: 4,
      title: 'Junior Flutter Developer',
      company: 'Neumsoft Innovation Private Limited',
      location: 'Bengaluru, India',
      period: '06/2023 – 08/2023',

      type: 'Full-time',
      description: 'Started contributing to various mobile projects and learning industry best practices.',
      achievements: [
        'Contributed to 6+ mobile applications.',
        'Developed and optimized Flutter applications, significantly improving user experience and reducing app size.',
        'Collaborated with design teams to implement pixel-perfect UIs.',
        'Participated in code reviews and agile development processes.',
      ],
      technologies: ['Flutter', 'Dart', 'Firebase', 'Riverpod', 'BLOC', 'Git'],
      logo: '🌱',
    ),
    (
      id: 5,
      title: 'Junior Flutter Developer',
      company: 'LucidPlus IT Solutions',
      location: 'Bengaluru, India',
      period: "12/2021 – 06/2023",

      type: 'Full-time',
      description: 'Started Flutter development journey, contributing to various mobile projects and learning industry best practices.',
      achievements: [
        'Mastered Flutter framework and Dart programming language.',
        'Contributed to 4+ mobile applications.',
        'Accelerated Flutter development and rigorous testing cycles, ensuring rapid feature delivery and high-quality applications.',
        'Actively contributed to team growth by facilitating knowledge transfer and promoting the adoption of Flutter best practices.',
      ],
      technologies: [
        'Flutter',
        'Dart',
        'Firebase',
        'Getx',
        'BLOC',
        'Rivepod',
        'JSON',
        'Git',
      ],
      logo: '🌱',
    ),
  ];
  @override
  Iterable<Component> build(BuildContext context) sync* {
    // Content
    yield div(classes: 'relative', [
      // Work Experience
      div(
        classes: 'transition-all duration-500 ${component.activeTab == 'work' ? 'opacity-100 translate-x-0' : 'opacity-0 translate-x-10 absolute inset-0 pointer-events-none'}',
        [
          div(classes: 'space-y-8', [
            for (var i = 0; i < workExperience.length; i++)
              div(
                classes:
                    'group backdrop-blur-lg bg-white/10 border border-white/20 rounded-2xl p-8 hover:bg-white/20 transition-all duration-500 transform hover:scale-105 hover:shadow-2xl ${component.isVisible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-10'}',
                [
                  div(classes: 'flex flex-col lg:flex-row gap-6', [
                    // Company Logo
                    div(classes: 'flex-shrink-0', [
                      div(
                        classes: 'w-16 h-16 bg-gradient-to-br from-emerald-400 to-cyan-600 rounded-2xl flex items-center justify-center text-2xl group-hover:scale-110 transition-transform duration-300',
                        [text(workExperience[i].logo)],
                      ),
                    ]),

                    // Content
                    div(classes: 'flex-1', [
                      div(
                        classes: 'flex flex-col lg:flex-row lg:items-start lg:justify-between mb-4',
                        [
                          div([
                            h3(
                              classes: 'text-2xl font-bold text-white mb-2 group-hover:text-emerald-300 transition-colors duration-300',
                              [text(workExperience[i].title)],
                            ),
                            div(
                              classes: 'flex flex-wrap items-center gap-4 text-white/70 mb-2',
                              [
                                span(
                                  classes: 'font-semibold text-emerald-400',
                                  [text(workExperience[i].company)],
                                ),
                                div(classes: 'flex items-center gap-1', [
                                  mapPin(classes: 'w-4 h-4'),
                                  span([text(workExperience[i].location)]),
                                ]),
                                div(classes: 'flex items-center gap-1', [
                                  calendar(classes: 'w-4 h-4'),
                                  span([text(workExperience[i].period)]),
                                ]),
                                span(
                                  classes: 'px-3 py-1 bg-emerald-500/20 text-emerald-300 rounded-full text-sm',
                                  [text(workExperience[i].type)],
                                ),
                              ],
                            ),
                          ]),
                        ],
                      ),

                      p(classes: 'text-white/80 leading-relaxed mb-6', [
                        text(workExperience[i].description),
                      ]),

                      // Achievements
                      div(classes: 'mb-6', [
                        h4(
                          classes: 'text-lg font-semibold text-white mb-3 flex items-center gap-2',
                          [
                            award(classes: 'w-4 h-4 text-emerald-400'),
                            text('Key Achievements'),
                          ],
                        ),
                        ul(classes: 'grid md:grid-cols-2 gap-2', [
                          for (var achievement in workExperience[i].achievements)
                            li(classes: 'flex items-start gap-2 text-white/70', [
                              div(
                                classes: 'w-2 h-2 bg-emerald-400 rounded-full mt-2 flex-shrink-0',
                                [],
                              ),
                              span(classes: 'text-sm', [text(achievement)]),
                            ]),
                        ]),
                      ]),

                      // Technologies
                      div([
                        h4(
                          classes: 'text-sm font-semibold text-white/80 mb-3',
                          [text('Technologies Used:')],
                        ),
                        div(classes: 'flex flex-wrap gap-2', [
                          for (var tech in workExperience[i].technologies)
                            span(
                              classes: 'px-3 py-1 bg-white/10 border border-white/20 rounded-full text-xs text-white/80 hover:bg-white/20 transition-colors duration-300',
                              [text(tech)],
                            ),
                        ]),
                      ]),
                    ]),
                  ]),
                ],
              ),
          ]),
        ],
      ),

      Education(activeTab: component.activeTab, isVisible: component.isVisible),
    ]);
  }
}
