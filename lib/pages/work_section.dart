import 'package:jaspr/jaspr.dart';
import 'package:jaspr_lucide/jaspr_lucide.dart' hide Component, List, Target, Text;

typedef Project = ({
  String description,
  String downloads,
  List<String> keyFeatures,
  List<String> platforms,
  double rating,
  List<String> screenshots,
  List<String> tech,
  String title,
  String? url,
});

class WorkSection extends StatelessComponent {
  const WorkSection({super.key});

  static const projects = <Project>[
    (
      title: "Aeon Wallet",
      rating: 3.8,
      description:
          "Secure e-wallet solution with support for QR payments, recurring billing, balance management, and strong security features.",
      tech: ["Flutter", "GetX", "Dio", "MVC"],
      keyFeatures: [
        "Balance & QR Payments",
        "Bill Splitting & Recurring Payments",
        "Root Detection & Screenshot Prevention",
        "Smart Notifications",
      ],
      downloads: "1M+ downloads",
      platforms: ["Android", "iOS"],
      screenshots: [],
      url: null,
    ),
    (
      title: "printing_ffi",
      rating: 0,
      description:
          "A Flutter plugin for direct printer communication using native FFI bindings for macOS, Windows, and Linux.",
      tech: ["Flutter", "FFI", "Printing", "Thermal Printer", "POS Printer"],
      keyFeatures: ["Direct printer communication", "Native FFI bindings", "Cross-platform support"],
      downloads: "593+ downloads",
      platforms: ["Linux", "macOS", "Windows"],
      screenshots: [],
      url: "https://pub.dev/packages/printing_ffi",
    ),
    (
      title: "AudioNotes",
      rating: 4.8,
      description:
          "AI-powered voice note app allowing users to record, transcribe, summarize, and interact with notes. Features real-time multilingual transcription, GPT-based summaries, offline-first sync, and WhatsApp sharing.",
      tech: ["Flutter", "Supabase", "Riverpod", "Bricks(Offline First)", "AI(OpenAI)"],
      keyFeatures: [
        "AI-powered Voice enabled Note Taking",
        "Real-time Transcription",
        "Offline Sync",
        "Transcribe and/or Translate to 30+ languages",
        "Summarize or create custom outputs",
        "Chat with your note",
        "WhatsApp Integration",
      ],
      downloads: "3k+ downloads",
      platforms: ["Android", "iOS", "Web"],
      screenshots: [],
      url: null,
    ),
    (
      title: "HxPert",
      rating: 4.5,
      description:
          "Dual mobile apps for users and partners offering service booking, appointment scheduling, real-time notifications, and secure Razorpay payments.",
      tech: ["Flutter", "Riverpod", "AutoRoute", "Firebase Messaging", "Dio", "Razorpay", "l18n"],
      keyFeatures: [
        "Service Booking",
        "Live Tracking",
        "Razorpay Payments",
        "Real-time Notifications",
        "Provider App Integration",
      ],
      downloads: "5k+ downloads",
      platforms: ["Android", "iOS"],
      screenshots: [],
      url: null,
    ),
    (
      title: "Flutter Sharez",
      rating: 4.4,
      description:
          "Cross-platform file-sharing app with support for encrypted sharing, resumable downloads, QR scanning, and multilingual UI. Built with Riverpod for scalable architecture.",
      tech: ["Flutter", "Riverpod", "AutoRoute", "Dio", "CameraAwesome", "File Sharing", "l18n"],
      keyFeatures: [
        "Multi-platform",
        "Fast File Sharing",
        "Encryption and Decryption",
        "Resumable Download Support",
        "QR Code Scanning",
      ],
      downloads: "1k+ downloads",
      platforms: [],
      screenshots: [],
      url: null,
    ),
    (
      title: "Shippoing",
      rating: 4.8,
      description:
          "Courier and baggage management platform with batch scanning, biometric authentication, and real-time credit control for shippers and logistics teams.",
      tech: ["Flutter", "Riverpod", "AutoRoute", "Dio", "CameraAwesome"],
      keyFeatures: [
        "Batch Scanning",
        "Biometric Authentication",
        "Credit Limit Enforcement",
        "Payment Integration",
        "Real-time Chat",
      ],
      downloads: "1k+ downloads",
      platforms: [],
      screenshots: [],
      url: null,
    ),
    (
      title: "Mawani Port Management",
      rating: 4.2,
      description:
          "An internal app for the Saudi Port Authority to manage vessel and port workflows. Offers offline support, real-time tracking, and calendar integration for port operations.",
      tech: ["Flutter", "Riverpod", "AutoRoute", "Dio", "CameraAwesome", "l18n"],
      keyFeatures: ["Offline Support", "Multi-Port Management", "Calendar Integration", "Port and Vessel Tracking"],
      downloads: "1k+ downloads",
      platforms: ["Android"],
      screenshots: [],
      url: null,
    ),
    (
      title: "Flutter Riverpod Simple Architecture",
      rating: 0,
      description:
          "A clean and extensible Flutter template with Riverpod, AutoRoute, Dio, FlexColorScheme, Hive, and Flash alerts. Ideal for starting scalable projects.",
      tech: ["Dart", "Riverpod", "AutoRoute", "Dio", "FlexColorScheme", "Hive", "Flash", "Mason"],
      keyFeatures: [
        "Best-practice App Architecture",
        "Offline-ready Setup",
        "Pre-configured Theme System",
        "Networking and Routing Built-in",
      ],
      downloads: "1k+ downloads",
      platforms: [],
      screenshots: [],
      url: "https://github.com/shreemanarjun/flutter_riverpod_simple_architecture",
    ),
    (
      title: "talker_rhttp_logger",
      rating: 0,
      description: "A Flutter package for logging HTTP requests and responses using Talker.",
      tech: ["Flutter", "Talker", "HTTP", "Logging"],
      keyFeatures: ["HTTP request logging", "HTTP response logging", "Easy integration with Talker"],
      downloads: "83+ downloads",
      platforms: ["Android", "iOS", "Linux", "macOS", "Windows"],
      screenshots: [],
      url: "https://pub.dev/packages/talker_rhttp_logger",
    ),
    (
      title: "hijri_calendar",
      rating: 0,
      description:
          "A Dart library for Islamic dates. Explore the Hijri calendar with ease. Perfect for integrating Islamic date functionalities into your applications.",
      tech: ["Dart", "Calendar", "Hijri", "Islamic Calendar"],
      keyFeatures: ["Islamic date conversion", "Hijri calendar functionalities", "Easy to integrate"],
      downloads: "0+ downloads",
      platforms: ["Android", "iOS", "Linux", "macOS", "web", "Windows"],
      screenshots: [],
      url: "https://pub.dev/packages/hijri_calendar",
    ),
    (
      title: "git_changie",
      rating: 0,
      description: "A changelog generator for GitHub.",
      tech: ["Dart", "CLI", "Changelog", "Git", "GitHub"],
      keyFeatures: ["Automated changelog generation", "Configurable", "GitHub integration"],
      downloads: "20+ downloads",
      platforms: [],
      screenshots: [],
      url: "https://pub.dev/packages/git_changie",
    ),
  ];

  @override
  Component build(BuildContext context) {
    return section(
      id: 'work',
      classes: "py-32 px-6 bg-slate-50", // Changed background to make cards pop
      [
        div(
          classes: "max-w-6xl mx-auto",
          [
            div(
              classes: "space-y-16",
              [
                div(
                  classes: "text-center space-y-4",
                  [
                    h2(classes: "text-4xl md:text-5xl font-light text-gray-900", [text("Featured Work")]),
                    div(classes: "w-16 h-0.5 bg-gray-900 mx-auto", []),
                  ],
                ),
                div(
                  classes: "", // Spacing is now handled by each card individually
                  projects.map((project) => _ProjectCard(project: project)).toList(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

/// A helper component to render a star rating.
class _StarRating extends StatelessComponent {
  const _StarRating({required this.rating});

  final double rating;

  @override
  Component build(BuildContext context) {
    if (rating <= 0) {
      return text(''); // Render nothing if rating is 0 or less
    }

    final stars = <Component>[];
    final fullStars = rating.floor();
    final hasHalfStar = (rating - fullStars) >= 0.5;
    final starColor = Color('#ffc107'); // amber-500
    final emptyStarColor = Color('#e5e7eb'); // gray-200

    for (var i = 0; i < 5; i++) {
      if (i < fullStars) {
        stars.add(
          Star(
            height: 16.px,
            width: 16.px,
            styles: Styles(color: starColor, raw: {'fill': starColor.value}),
          ),
        );
      } else if (i == fullStars && hasHalfStar) {
        stars.add(
          StarHalf(
            height: 16.px,
            width: 16.px,
            styles: Styles(color: starColor, raw: {'fill': starColor.value}),
          ),
        );
      } else {
        stars.add(
          Star(
            height: 16.px,
            width: 16.px,
            styles: Styles(color: emptyStarColor, raw: {'fill': emptyStarColor.value}),
          ),
        );
      }
    }

    return div(
      classes: "flex items-center gap-1.5",
      [
        ...stars,
        span(classes: "ml-1 text-xs", [text('($rating)')]),
      ],
    );
  }
}

/// A component to display a single project card.
class _ProjectCard extends StatelessComponent {
  const _ProjectCard({required this.project});

  final Project project;

  @override
  Component build(BuildContext context) {
    final List<Component> infoItems = [];

    if (project.rating > 0) {
      infoItems.add(_StarRating(rating: project.rating));
    }

    if (project.downloads.isNotEmpty) {
      if (infoItems.isNotEmpty) {
        infoItems.add(div(classes: "w-1 h-1 bg-gray-300 rounded-full", []));
      }
      infoItems.add(text(project.downloads));
    }

    if (project.platforms.isNotEmpty) {
      if (infoItems.isNotEmpty) {
        infoItems.add(div(classes: "w-1 h-1 bg-gray-300 rounded-full", []));
      }
      infoItems.add(text(project.platforms.join(', ')));
    }

    final cardContent = div(
      // Added bg-white, a default shadow-lg, and enhanced the hover shadow to shadow-2xl for better elevation and card feel.
      classes:
          "project-card group bg-white p-6 lg:p-8 rounded-lg transition-all duration-300 shadow-lg hover:shadow-2xl hover:-translate-y-2 mb-12",
      [
        div(
          // On mobile, stack content and button vertically with a smaller gap.
          // On large screens, arrange horizontally with a larger gap.
          classes: "flex flex-col lg:flex-row lg:items-center justify-between gap-y-4 lg:gap-8",
          [
            div(
              classes: "flex-1 space-y-4",
              [
                if (infoItems.isNotEmpty) // Only render if there's info to show
                  div(
                    classes: "flex items-center flex-wrap gap-x-4 gap-y-2 text-sm text-gray-500",
                    infoItems,
                  ),
                div(
                  classes: "text-2xl font-medium text-gray-900 group-hover:text-gray-600 transition-colors",
                  [text(project.title)],
                ),
                p(
                  classes: "text-gray-600 leading-relaxed max-w-2xl",
                  [text(project.description)],
                ),
                if (project.keyFeatures.isNotEmpty)
                  ul(
                    classes: "space-y-2",
                    project.keyFeatures.map((feature) {
                      return li(
                        classes: "flex items-start text-gray-600",
                        [
                          Check(
                            height: 18.px,
                            width: 18.px,
                            classes: "mr-3 mt-0.5 flex-shrink-0 text-green-500",
                          ),
                          span([text(feature)]),
                        ],
                      );
                    }).toList(),
                  ),
                div(
                  classes: "flex flex-wrap items-center gap-x-3 gap-y-2 text-sm text-gray-600",
                  [
                    ...() {
                      final techWidgets = <Component>[];
                      for (var i = 0; i < project.tech.length; i++) {
                        techWidgets.add(text(project.tech[i]));
                        if (i < project.tech.length - 1) {
                          techWidgets.add(
                            span(classes: "w-1 h-1 bg-gray-400 rounded-full", []),
                          );
                        }
                      }
                      return techWidgets;
                    }(),
                  ],
                ),
              ],
            ),
            // If a URL exists, render the external link icon wrapped in an anchor tag.
            if (project.url case final url?)
              a(
                href: url,
                target: Target.blank,
                classes: "icon-link group-hover:translate-x-1 group-hover:-translate-y-1 transition-transform",
                [
                  button([
                    ExternalLink(
                      height: 24.px,
                      width: 24.px,
                      styles: Styles(
                        raw: {
                          "strokeWidth": "1.5.px",
                        },
                      ),
                    ),
                  ]),
                ],
              ),
          ],
        ),
      ],
    );
    return cardContent;
  }
}
