import 'package:jaspr/jaspr.dart';
import 'package:jaspr_lucide/jaspr_lucide.dart' hide Text, Component;
import 'package:newportfolio/features/experience/certification.dart';

class Education extends StatefulComponent {
  final String activeTab;
  final bool isVisible;

  const Education({super.key, required this.activeTab, required this.isVisible});

  @override
  State createState() => EducationState();
}

class EducationState extends State<Education> {
  final education = [
    (
      id: 1,
      degree: 'Master of Computer Application',
      institution: 'Indira Gandhi Institute of Technology,',
      location: 'Dhenkanal,Odisha,India',
      period: '2019 – 2021',
      gpa: '9.07 / 10',
      description: 'Specialized in Mobile Computing and Human-Computer Interaction with focus on cross-platform development.',
      courses: [
        'Advanced Mobile Application Development',
        'Human-Computer Interaction',
        'Software Engineering Principles',
        'Database Systems',
        'Computer Graphics',
        'Machine Learning Fundamentals',
      ],
      achievements: [
        'Dean\'s List for 4 consecutive semesters',
        'Research Assistant in Mobile Computing Lab',
        'Best Project (Food Delivery) Award ',
        'Winner of University Hackathon 2020',
      ],
      logo: '🎓',
    ),
    (
      id: 2,
      degree: 'Bachelor of Science in Computer Science',
      institution: "Government College (Autonomous),Angul",
      location: 'Angul,Odisha,India',
      period: '2016 – 2019',
      gpa: '8.36 / 10.0',
      description: 'Comprehensive software engineering education with emphasis on mobile development and user experience design.',
      courses: [
        'Object-Oriented Programming',
        'Data Structures and Algorithms',
        'Mobile Application Development',
        'User Interface Design',
        'Software Testing',
        'Project Management',
      ],
      achievements: [
        'Built first mobile app and backend server for Student Result Publishing.',
      ],
      logo: '📚',
    ),
  ];
  @override
  Component build(BuildContext context) {
    // Education
    return div(
      classes: 'transition-all duration-500 ${component.activeTab == 'education' ? 'opacity-100 translate-x-0' : 'opacity-0 -translate-x-10 absolute inset-0 pointer-events-none'}',
      [
        div(classes: 'space-y-8', [
          // Degrees
          for (var i = 0; i < education.length; i++)
            div(
              classes:
                  'group backdrop-blur-lg bg-white/10 border border-white/20 rounded-2xl p-8 hover:bg-white/20 transition-all duration-500 transform hover:scale-105 hover:shadow-2xl ${component.isVisible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-10'}',
              [
                div(classes: 'flex flex-col lg:flex-row gap-6', [
                  // Institution Logo
                  div(classes: 'flex-shrink-0', [
                    div(
                      classes: 'w-16 h-16 bg-gradient-to-br from-blue-400 to-purple-600 rounded-2xl flex items-center justify-center text-2xl group-hover:scale-110 transition-transform duration-300',
                      [text(education[i].logo)],
                    ),
                  ]),

                  // Content
                  div(classes: 'flex-1', [
                    div(
                      classes: 'flex flex-col lg:flex-row lg:items-start lg:justify-between mb-4',
                      [
                        div([
                          h3(
                            classes: 'text-2xl font-bold text-white mb-2 group-hover:text-blue-300 transition-colors duration-300',
                            [text(education[i].degree)],
                          ),
                          div(
                            classes: 'flex flex-wrap items-center gap-4 text-white/70 mb-2',
                            [
                              span(classes: 'font-semibold text-blue-400', [
                                text(education[i].institution),
                              ]),
                              div(classes: 'flex items-center gap-1', [
                                MapPin(classes: 'w-4 h-4'),
                                span([text(education[i].location)]),
                              ]),
                              div(classes: 'flex items-center gap-1', [
                                Calendar(classes: 'w-4 h-4'),
                                span([text(education[i].period)]),
                              ]),
                              span(
                                classes: 'px-3 py-1 bg-blue-500/20 text-blue-300 rounded-full text-sm',
                                [text('GPA: ${education[i].gpa}')],
                              ),
                            ],
                          ),
                        ]),
                      ],
                    ),
                    p(classes: 'text-white/80 leading-relaxed mb-6', [
                      text(education[i].description),
                    ]),
                    div(classes: 'grid md:grid-cols-2 gap-6', [
                      // Courses
                      div([
                        h4(classes: 'text-lg font-semibold text-white mb-3', [
                          text('Relevant Coursework'),
                        ]),
                        ul(classes: 'space-y-1', [
                          for (var course in education[i].courses)
                            li(classes: 'flex items-start gap-2 text-white/70', [
                              div(
                                classes: 'w-2 h-2 bg-blue-400 rounded-full mt-2 flex-shrink-0',
                                [],
                              ),
                              span(classes: 'text-sm', [text(course)]),
                            ]),
                        ]),
                      ]),

                      // Achievements
                      div([
                        h4(
                          classes: 'text-lg font-semibold text-white mb-3 flex items-center gap-2',
                          [
                            Award(classes: 'w-4 h-4 text-blue-400'),
                            text('Achievements'),
                          ],
                        ),
                        ul(classes: 'space-y-1', [
                          for (var achievement in education[i].achievements)
                            li(classes: 'flex items-start gap-2 text-white/70', [
                              div(
                                classes: 'w-2 h-2 bg-blue-400 rounded-full mt-2 flex-shrink-0',
                                [],
                              ),
                              span(classes: 'text-sm', [text(achievement)]),
                            ]),
                        ]),
                      ]),
                    ]),
                  ]),
                ]),
              ],
            ),

          Certification(),
        ]),
      ],
    );
  }
}
