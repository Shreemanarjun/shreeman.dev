// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:js_interop';

import 'package:jaspr/jaspr.dart';
import 'package:jaspr_lucide/jaspr_lucide.dart' hide section, text;
import 'package:newportfolio/features/projects/data/platforms.dart';
import 'package:newportfolio/features/projects/data/project.dart';
import 'package:universal_web/web.dart' as web; // Required for .toJS, .toJS, and JS types
import 'package:universal_web/web.dart' as webc;

/// A modern Jaspr component that mirrors the functionality of the original React version.
/// It uses the standard `package:web` for browser API interaction.
class Projects extends StatefulComponent {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  // Component state
  bool _isVisible = true;
  String _activeFilter = 'All';
  web.IntersectionObserver? _observer;

  final List<String> _categories = const [
    'All',
    'AI & Productivity',
    'E-Commerce & Management',
    'Developer Tools',
    'Communication',
  ];

  final List<Project> _projects = [
    const Project(
      id: 10,
      title: "Aeon Wallet",
      description: "Secure e-wallet solution with support for QR payments, recurring billing, balance management, and strong security features.",
      image: "https://zmozkivkhopoeutpnnum.supabase.co/storage/v1/object/public/images/aeon.webp",
      category: 'Developer Tools',
      technologies: ["Flutter", "GetX", "Dio", "MVC"],
      features: [
        "Balance & QR Payments",
        "Bill Splitting & Recurring Payments",
        "Root Detection & Screenshot Prevention",
        "Smart Notifications",
      ],
      downloads: '1M+',
      rating: 3.8,
      platforms: Platforms(
        android: "https://play.google.com/store/apps/details?id=today.wander.acs",
      ),
      demo: "https://play.google.com/store/apps/details?id=today.wander.acs",
    ),
    const Project(
      id: 3,
      title: 'AudioNotes',
      description: "AI-powered voice note app allowing users to record, transcribe, summarize, and interact with notes. Features real-time multilingual transcription, GPT-based summaries, offline-first sync, and WhatsApp sharing.",
      image: "https://zmozkivkhopoeutpnnum.supabase.co/storage/v1/object/public/images//audionotes1.avif",
      category: 'AI & Productivity',
      technologies: ["Flutter", "Supabase", "Riverpod", "Bricks(Offline First)", "AI(OpenAI)"],
      features: [
        "AI-powered Voice enabled Note Taking",
        "Real-time Transcription",
        "Offline Sync",
        "Transcribe and/or Translate to 30+ languages",
        "Summarize or create custom outputs",
        "Chat with your note",
        "WhatsApp Integration",
      ],
      downloads: '3k+',
      rating: 4.8,
      platforms: Platforms(
        android: "https://play.google.com/store/apps/details?id=com.labs.audionotes",
        ios: "https://apps.apple.com/us/app/audionotes-ai-minutes-notes/id6736822144",
        web: "https://www.audionotes.app",
      ),
      demo: 'https://home.audionotes.app/login',
    ),
    const Project(
      id: 4,
      title: 'HxPert',
      description: "Dual mobile apps for users and partners offering service booking, appointment scheduling, real-time notifications, and secure Razorpay payments.",
      image: "https://zmozkivkhopoeutpnnum.supabase.co/storage/v1/object/public/images//hxpert.webp",
      category: 'E-Commerce & Management',
      technologies: ["Flutter", "Riverpod", "AutoRoute", "Firebase Messaging", "Dio", "Razorpay", "l18n"],
      features: [
        "Service Booking",
        "Live Tracking",
        "Razorpay Payments",
        "Real-time Notifications",
        "Provider App Integration",
      ],
      downloads: '5k+',
      rating: 4.5,
      platforms: Platforms(
        android: 'https://play.google.com/store/apps/details?id=com.hxpert.userapp&pcampaignid=web_share',
        ios: "https://apps.apple.com/in/app/hxpert/id6642649667",
        web: 'https://www.hxpert.in',
      ),
      demo: 'https://play.google.com/store/apps/details?id=com.hxpert.userapp&pcampaignid=web_share',
    ),

    const Project(
      id: 5,
      title: "Flutter Sharez",
      description: "Cross-platform file-sharing app with support for encrypted sharing, resumable downloads, QR scanning, and multilingual UI. Built with Riverpod for scalable architecture.",
      image: "https://raw.githubusercontent.com/Shreemanarjun/flutter_sharez/refs/heads/main/screenshot/3.png",
      category: 'Developer Tools',
      technologies: ["Flutter", "Riverpod", "AutoRoute", "Dio", "CameraAwesome", "File Sharing", "l18n"],
      features: [
        'Multi-platform',
        'Fast File Sharing',
        'Encryption and Decryption',
        'Resumable Download Support',
        'QR Code Scanning',
      ],
      downloads: '1k+',
      rating: 4.4,
      platforms: Platforms(
        android: "https://github.com/Shreemanarjun/flutter_sharez/releases",
      ),
      github: "https://github.com/Shreemanarjun/flutter_sharez",
      demo: "https://github.com/Shreemanarjun/flutter_sharez",
    ),
    const Project(
      id: 1,
      title: 'Shippoing',
      description: "Courier and baggage management platform with batch scanning, biometric authentication, and real-time credit control for shippers and logistics teams.",
      image: "https://play-lh.googleusercontent.com/CGK67Wck_OaTn4hpfORqPj1LH7-2dWLUIby7AtHy5n-G-jWDH33Rb3tvrvmjs3iEsA=w1052-h592-rw",
      category: 'E-Commerce & Management',
      technologies: ["Flutter", "Riverpod", "AutoRoute", "Dio", "CameraAwesome"],
      features: [
        'Batch Scanning',
        'Biometric Authentication',
        'Credit Limit Enforcement',
        'Payment Integration',
        'Real-time Chat',
      ],
      downloads: '1k+',
      rating: 4.8,
      platforms: Platforms(
        android: "https://play.google.com/store/apps/details?id=com.masstech.shippoing",
      ),
      demo: "https://play.google.com/store/apps/details?id=com.masstech.shippoing",
    ),
    const Project(
      id: 2,
      title: 'Mawani Port Management',
      description: "An internal app for the Saudi Port Authority to manage vessel and port workflows. Offers offline support, real-time tracking, and calendar integration for port operations.",
      image: "https://play-lh.googleusercontent.com/1pE56MMEVlmqnrWd-9HUDc-QVbqaL9g_5uJkILLMdWgU5ZDbZZQA-i5C73RWWu4M3rU=w1052-h592-rw",
      category: 'E-Commerce & Management',
      technologies: ["Flutter", "Riverpod", "AutoRoute", "Dio", "CameraAwesome", "l18n"],
      features: [
        'Offline Support',
        'Multi-Port Management',
        'Calendar Integration',
        'Port and Vessel Tracking',
      ],
      downloads: '1k+',
      rating: 4.2,
      platforms: Platforms(
        android: "https://play.google.com/store/apps/details?id=com.tabadul.mawani.pmis",
      ),
    ),
    const Project(
      id: 6,
      title: "Flutter Riverpod Simple Architecture",
      description: "A clean and extensible Flutter template with Riverpod, AutoRoute, Dio, FlexColorScheme, Hive, and Flash alerts. Ideal for starting scalable projects.",
      image: 'https://images.pexels.com/photos/3944466/pexels-photo-3944466.jpeg?auto=compress&cs=tinysrgb&w=800',
      category: 'Developer Tools',
      technologies: ["Dart", "Riverpod", "AutoRoute", "Dio", "FlexColorScheme", "Hive", "Flash", "Mason"],
      features: [
        'Best-practice App Architecture',
        'Offline-ready Setup',
        'Pre-configured Theme System',
        'Networking and Routing Built-in',
      ],
      downloads: '1k+',

      platforms: Platforms(
        web: "https://brickhub.dev/bricks/riverpod_simple_architecture/2.1.5",
      ),
      github: "https://github.com/Shreemanarjun/river_bricks/tree/master/bricks/riverpod_simple_architecture",
      demo: "https://brickhub.dev/bricks/riverpod_simple_architecture/2.1.5",
    ), // Add to the existing _projects list
    const Project(
      id: 7,
      title: "Golden Games",
      description: "Enhanced the Golden Games Windows app by optimizing network responses and implementing real-time updates using WebSockets and Rhttp. Improved printer event handling and app responsiveness.",
      image: "https://zmozkivkhopoeutpnnum.supabase.co/storage/v1/object/public/images//goldengame.png",
      category: 'AI & Productivity',
      technologies: ["Flutter", "Rhttp", "WebSockets", "Windows"],
      features: [
        "Live Game Updates",
        "Real-time WebSocket Communication",
        "Printer Event Handling",
        "Optimized API Response Times",
      ],
      downloads: 'N/A',

      platforms: Platforms(
        // Placeholder or internal distribution
        windows: "https://github.com/Shreemanarjun",
      ),
    ),

    const Project(
      id: 9,
      title: "Lead Flow",
      description: "Loan processing platform for borrowers and lenders. Includes document upload, geotagging, and dynamic application flow.",
      image: "https://images.pexels.com/photos/4968633/pexels-photo-4968633.jpeg?auto=compress&cs=tinysrgb&w=800",
      category: 'E-Commerce & Management',
      technologies: ["Flutter", "Riverpod", "VelocityX", "Dio", "MVC"],
      features: [
        "Loan Document Submission",
        "Geotagging Images",
        "Scanned Document Upload",
        "Dynamic Form Workflow",
      ],
      downloads: 'N/A',

      platforms: Platforms(
        web: "https://lucidplus.com/leadflow.aspx",
      ),
    ),
  ];

  /// This method is attached to the component's `onConnected` lifecycle event.
  /// It creates and starts the IntersectionObserver using the exact logic provided.
  void _onSectionConnected() {
    final element = webc.document.getElementById('projects');
    if (element == null) {
      return;
    }

    // Create the observer with the specified callback and options.
    _observer = web.IntersectionObserver(
      ((
            JSArray<web.IntersectionObserverEntry> entries,
            web.IntersectionObserver observer,
          ) {
            web.console.log("Observer callback triggered".toJS);
            final entry = entries[0];
            web.console.log("Entry intersecting: ${entry.isIntersecting}".toJS);

            if (entry.isIntersecting) {
              // Check if the component is still in the tree before updating state.
              if (mounted) {
                setState(() => _isVisible = true);
                web.console.log("isVisible set to true".toJS);
              }
              // Disconnect the observer after the animation is triggered to save resources.
              observer.disconnect();
              _observer = null;
            }
          })
          .toJS,
      // Use the exact options from the user's snippet.
      web.IntersectionObserverInit(
        threshold: [0.1].jsify()!,
        rootMargin: '50px',
      ),
    );

    // Start observing the target element.
    _observer!.observe(element);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      if (mounted) {
        _onSectionConnected();
      }
    });
  }

  /// This is called when the component is removed from the DOM.
  /// It's used for cleanup to prevent memory leaks.
  @override
  void dispose() {
    _observer?.disconnect();
    _observer = null;
    super.dispose();
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    // Filter projects based on the active category.
    final filteredProjects = _activeFilter == 'All' ? _projects : _projects.where((p) => p.category == _activeFilter).toList();

    yield section(
      id: 'projects',
      classes: 'py-20 relative overflow-hidden',
      events: {},
      // Attach lifecycle callbacks.

      // The onDisconnected callback is now handled by the dispose method.
      [
        // Background Elements
        div(classes: 'absolute inset-0', [
          div(
            classes: 'absolute top-0 right-1/4 w-80 h-80 bg-purple-500/10 rounded-full filter blur-3xl',
            [],
          ),
          div(
            classes: 'absolute bottom-0 left-1/4 w-96 h-96 bg-pink-500/10 rounded-full filter blur-3xl',
            [],
          ),
        ]),

        div(classes: 'container mx-auto px-6 relative z-10', [
          div(classes: 'max-w-7xl mx-auto', [
            // Section Header
            div(
              classes: 'text-center mb-16 transition-all duration-1000 ${_isVisible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-10'}',
              [
                h2(
                  classes: 'text-4xl md:text-5xl font-bold bg-gradient-to-r from-purple-400 to-pink-600 bg-clip-text text-transparent mb-6',
                  [text('Featured Projects')],
                ),
                p(
                  classes: 'text-xl text-white/80 max-w-3xl mx-auto leading-relaxed',
                  [
                    text(
                      'A showcase of mobile applications I\'ve built with Flutter',
                    ),
                  ],
                ),
              ],
            ),

            // Filter Buttons
            div(
              classes: 'flex flex-wrap justify-center gap-4 mb-12 transition-all duration-1000 delay-300 ${_isVisible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-10'}',
              [
                for (final category in _categories)
                  button(
                    onClick: () {
                      setState(() {
                        _activeFilter = category;
                      });
                    },
                    classes:
                        'px-6 py-3 rounded-full text-sm font-medium transition-all duration-300 transform hover:scale-105 ${_activeFilter == category ? 'bg-gradient-to-r from-purple-500 to-pink-600 text-white shadow-lg' : 'backdrop-blur-md bg-white/10 border border-white/20 text-white/80 hover:bg-white/20'}',
                    [text(category)],
                  ),
              ],
            ),

            // Projects Grid
            div(classes: 'grid md:grid-cols-2 lg:grid-cols-3 gap-8', [
              for (var (index, project) in filteredProjects.indexed)
                div(
                  key: Key(project.id.toString()),
                  classes:
                      'group backdrop-blur-lg bg-white/10 border border-white/20 rounded-2xl overflow-hidden hover:bg-white/20 transition-all duration-500 transform hover:scale-105 hover:shadow-2xl ${_isVisible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-10'}',
                  styles: Styles(raw: {'transition-delay': '${index * 150}ms'}),
                  [
                    // Project Image
                    div(classes: 'relative overflow-hidden', [
                      img(
                        src: project.image,
                        alt: project.title,
                        classes: 'w-full h-64 object-cover group-hover:scale-110 transition-transform duration-500',
                      ),
                      div(
                        classes: 'absolute inset-0 bg-gradient-to-t from-black/50 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300',
                        [],
                      ),
                      div(classes: 'absolute top-4 right-4 flex gap-2', [
                        div(
                          classes: 'backdrop-blur-md bg-white/20 rounded-full px-3 py-1 text-xs text-white font-medium',
                          [text(project.category)],
                        ),
                      ]),
                    ]),
                    // Project Content
                    div(classes: 'p-6', [
                      div(classes: 'flex items-start justify-between mb-3', [
                        h3(
                          classes: 'text-xl font-bold text-white group-hover:text-purple-300 transition-colors duration-300',
                          [text(project.title)],
                        ),
                        div(
                          classes: 'flex items-center gap-1 text-yellow-400 text-sm',
                          [
                            star(
                              height: 14.px,
                              width: 14.px,
                              classes: 'fill-current',
                            ),
                            if (project.rating != null) span([text('${project.rating}')]),
                          ],
                        ),
                      ]),
                      p(classes: 'text-white/70 text-sm leading-relaxed mb-4', [
                        text(project.description),
                      ]),
                      div(classes: 'flex flex-wrap gap-2 mb-4', [
                        for (final tech in project.technologies)
                          span(
                            classes: 'px-2 py-1 bg-white/10 rounded-full text-xs text-white/80',
                            [text(tech)],
                          ),
                      ]),
                      div(classes: 'mb-4', [
                        h4(classes: 'text-sm font-semibold text-white mb-2', [
                          text('Key Features:'),
                        ]),
                        div(
                          classes: 'grid grid-cols-2 gap-1 text-xs text-white/70',
                          [
                            for (final feature in project.features)
                              div(classes: 'flex items-center gap-1', [
                                div(
                                  classes: 'w-1 h-1 bg-purple-400 rounded-full',
                                  [],
                                ),
                                text(feature),
                              ]),
                          ],
                        ),
                      ]),
                      div(classes: 'flex items-center justify-between mb-6', [
                        div(
                          classes: 'flex items-center gap-2 text-sm text-white/70',
                          [
                            smartphone(height: 14.px, width: 14.px),
                            span([text('${project.downloads} downloads')]),
                          ],
                        ),
                        div(classes: 'flex items-center gap-1', [
                          if (project.platforms.android != null)
                            div(
                              classes: 'w-2 h-2 bg-green-400 rounded-full',
                              attributes: {'title': 'Android'},
                              [],
                            ),
                          if (project.platforms.ios != null)
                            div(
                              classes: 'w-2 h-2 bg-gray-300 rounded-full',
                              attributes: {'title': 'iOS'},
                              [],
                            ),
                          if (project.platforms.web != null)
                            div(
                              classes: 'w-2 h-2 bg-blue-400 rounded-full',
                              attributes: {'title': 'Web'},
                              [],
                            ),
                          if (project.platforms.windows != null)
                            div(
                              classes: 'w-2 h-2 bg-cyan-400 rounded-full',
                              attributes: {'title': 'Windows'},
                              [],
                            ),
                        ]),
                      ]),
                      div(classes: 'mb-4', [
                        h4(classes: 'text-sm font-semibold text-white mb-3', [
                          text('Available on:'),
                        ]),
                        div(classes: 'flex flex-wrap gap-2', [
                          if (project.platforms.android != null)
                            a(
                              href: project.platforms.android!,
                              target: Target.blank,
                              classes: 'flex items-center gap-2 px-3 py-2 bg-green-500/20 border border-green-500/30 rounded-lg text-green-300 text-xs font-medium hover:bg-green-500/30 transition-all duration-300',
                              [
                                smartphone(height: 14.px, width: 14.px),
                                text('Android'),
                              ],
                            ),
                          if (project.platforms.ios != null)
                            a(
                              href: project.platforms.ios!,
                              target: Target.blank,
                              classes: 'flex items-center gap-2 px-3 py-2 bg-gray-500/20 border border-gray-500/30 rounded-lg text-gray-300 text-xs font-medium hover:bg-gray-500/30 transition-all duration-300',
                              [
                                smartphone(height: 14.px, width: 14.px),
                                text('iOS'),
                              ],
                            ),
                          if (project.platforms.web != null)
                            a(
                              href: project.platforms.web!,
                              target: Target.blank,
                              classes: 'flex items-center gap-2 px-3 py-2 bg-blue-500/20 border border-blue-500/30 rounded-lg text-blue-300 text-xs font-medium hover:bg-blue-500/30 transition-all duration-300',
                              [globe(height: 14.px, width: 14.px), text('Web')],
                            ),
                          if (project.platforms.windows != null)
                            a(
                              href: project.platforms.windows!,
                              target: Target.blank,
                              classes: 'flex items-center gap-2 px-3 py-2 bg-cyan-500/20 border border-cyan-500/30 rounded-lg text-cyan-300 text-xs font-medium hover:bg-cyan-500/30 transition-all duration-300',
                              [
                                monitor(height: 14.px, width: 14.px),
                                text('Windows'),
                              ],
                            ),
                        ]),
                      ]),
                      div(classes: 'flex gap-3', [
                        if (project.demo != null)
                          a(
                            href: project.demo!,
                            target: Target.blank,
                            classes:
                                'flex-1 flex items-center justify-center gap-2 py-3 bg-gradient-to-r from-purple-500 to-pink-600 rounded-lg text-white text-sm font-medium hover:from-purple-600 hover:to-pink-700 transition-all duration-300 transform hover:scale-105',
                            [
                              externalLink(height: 16.px, width: 16.px),
                              text('Live Demo'),
                            ],
                          ),
                        if (project.github != null)
                          a(
                            href: project.github!,
                            target: Target.blank,
                            classes: 'flex items-center justify-center gap-2 px-4 py-3 backdrop-blur-md bg-white/10 border border-white/20 rounded-lg text-white text-sm font-medium hover:bg-white/20 transition-all duration-300',
                            [github(height: 16.px, width: 16.px), text('Source')],
                          ),
                      ]),
                    ]),
                  ],
                ),
            ]),
            // View More Button
            div(classes: 'text-center mt-12', [
              button(
                classes: 'px-8 py-4 backdrop-blur-md bg-white/10 border border-white/20 rounded-full text-white font-semibold hover:bg-white/20 transition-all duration-300 transform hover:scale-105',
                [text('View All Projects on GitHub')],
              ),
            ]),
          ]),
        ]),
      ],
    );
  }
}
