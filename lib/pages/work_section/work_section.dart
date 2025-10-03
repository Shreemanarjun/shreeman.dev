import 'package:jaspr/jaspr.dart';
import 'package:paper_port/pages/work_section/project_card.dart';
import 'package:paper_port/pages/work_section/deploy.dart';
import 'package:paper_port/pages/work_section/project.dart';

class WorkSection extends StatelessComponent {
  const WorkSection({super.key});

  static final projects = <Project>[
    Project(
      title: "Aeon Wallet",
      rating: 3.8,
      description:
          "Secure e-wallet solution with support for QR payments, recurring billing, balance management, and strong security features.",
      tech: const ["Flutter", "GetX", "Dio", "MVC"],
      keyFeatures: const [
        "Balance & QR Payments",
        "Bill Splitting & Recurring Payments",
        "Root Detection & Screenshot Prevention",
        "Smart Notifications",
      ],
      downloads: "1M+ downloads",
      platforms: [
        AndroidDeploy(
          url: "https://play.google.com/store/apps/details?id=today.wander.acs",
        ),
        IosDeploy(
          url: "https://apps.apple.com/my/app/aeon-wallet-malaysia/id1371474291",
        ),
        WebDeploy(
          url: "https://myaeoncredit.com.my/download-aeon-wallet-app/",
        ),
      ],
      screenshots: const [],
    ),
    Project(
      title: "printing_ffi",
      rating: 0,
      description:
          "A Flutter plugin for direct printer communication using native FFI bindings for macOS, Windows, and Linux.",
      tech: const ["Flutter", "FFI", "Printing", "Thermal Printer", "POS Printer"],
      keyFeatures: const ["Direct printer communication", "Native FFI bindings", "Cross-platform support"],
      downloads: "593+ downloads",
      platforms: [
        PubDeploy(url: "https://pub.dev/packages/printing_ffi"),
      ],
      screenshots: const [],
    ),
    Project(
      title: "AudioNotes",
      rating: 4.8,
      description:
          "AI-powered voice note app allowing users to record, transcribe, summarize, and interact with notes. Features real-time multilingual transcription, GPT-based summaries, offline-first sync, and WhatsApp sharing.",
      tech: const ["Flutter", "Supabase", "Riverpod", "Bricks(Offline First)", "AI(OpenAI)"],
      keyFeatures: const [
        "AI-powered Voice enabled Note Taking",
        "Real-time Transcription",
        "Offline Sync",
        "Transcribe and/or Translate to 30+ languages",
        "Summarize or create custom outputs",
        "Chat with your note",
        "WhatsApp Integration",
      ],
      downloads: "3k+ downloads",
      platforms: [
        AndroidDeploy(
          url: "https://play.google.com/store/apps/details?id=com.labs.audionotes",
        ),
        IosDeploy(
          url: "https://apps.apple.com/us/app/audionotes-ai-minutes-notes/id6736822144",
        ),
        WebDeploy(
          url: "https://www.audionotes.app",
        ),
      ],
      screenshots: const [],
    ),
    Project(
      title: "HxPert",
      rating: 4.5,
      description:
          "Dual mobile apps for users and partners offering service booking, appointment scheduling, real-time notifications, and secure Razorpay payments.",
      tech: const ["Flutter", "Riverpod", "AutoRoute", "Firebase Messaging", "Dio", "Razorpay", "l18n"],
      keyFeatures: const [
        "Service Booking",
        "Live Tracking",
        "Razorpay Payments",
        "Real-time Notifications",
        "Provider App Integration",
      ],
      downloads: "5k+ downloads",
      platforms: [
        AndroidDeploy(
          url: 'https://play.google.com/store/apps/details?id=com.hxpert.userapp&pcampaignid=web_share',
        ),
        IosDeploy(url: "https://apps.apple.com/in/app/hxpert/id6642649667"),
        WebDeploy(url: 'https://www.hxpert.in'),
      ],
      screenshots: const [],
    ),
    Project(
      title: "Flutter Sharez",
      rating: 4.4,
      description:
          "Cross-platform file-sharing app with support for encrypted sharing, resumable downloads, QR scanning, and multilingual UI. Built with Riverpod for scalable architecture.",
      tech: const ["Flutter", "Riverpod", "AutoRoute", "Dio", "CameraAwesome", "File Sharing", "l18n"],
      keyFeatures: const [
        "Multi-platform",
        "Fast File Sharing",
        "Encryption and Decryption",
        "Resumable Download Support",
        "QR Code Scanning",
      ],
      downloads: "1k+ downloads",
      platforms: [
        AndroidDeploy(
          url: "https://github.com/Shreemanarjun/flutter_sharez/releases",
        ),
      ],
      screenshots: const [],
    ),
    Project(
      title: "Shippoing",
      rating: 4.8,
      description:
          "Courier and baggage management platform with batch scanning, biometric authentication, and real-time credit control for shippers and logistics teams.",
      tech: const ["Flutter", "Riverpod", "AutoRoute", "Dio", "CameraAwesome"],
      keyFeatures: const [
        "Batch Scanning",
        "Biometric Authentication",
        "Credit Limit Enforcement",
        "Payment Integration",
        "Real-time Chat",
      ],
      downloads: "1k+ downloads",
      platforms: [
        AndroidDeploy(
          url: "https://play.google.com/store/apps/details?id=com.masstech.shippoing",
        ),
      ],
      screenshots: const [],
    ),
    Project(
      title: "Mawani Port Management",
      rating: 4.2,
      description:
          "An internal app for the Saudi Port Authority to manage vessel and port workflows. Offers offline support, real-time tracking, and calendar integration for port operations.",
      tech: const ["Flutter", "Riverpod", "AutoRoute", "Dio", "CameraAwesome", "l18n"],
      keyFeatures: const [
        "Offline Support",
        "Multi-Port Management",
        "Calendar Integration",
        "Port and Vessel Tracking",
      ],
      downloads: "1k+ downloads",
      platforms: [
        AndroidDeploy(url: "https://play.google.com/store/apps/details?id=com.tabadul.mawani.pmis"),
      ],
      screenshots: const [],
    ),
    Project(
      title: "Flutter Riverpod Simple Architecture",
      rating: 0,
      description:
          "A clean and extensible Flutter template with Riverpod, AutoRoute, Dio, FlexColorScheme, Hive, and Flash alerts. Ideal for starting scalable projects.",
      tech: const ["Dart", "Riverpod", "AutoRoute", "Dio", "FlexColorScheme", "Hive", "Flash", "Mason"],
      keyFeatures: const [
        "Best-practice App Architecture",
        "Offline-ready Setup",
        "Pre-configured Theme System",
        "Networking and Routing Built-in",
      ],
      downloads: "1k+ downloads",
      platforms: [
        OtherDeploy(
          name: "mason bricks",
          url: "https://brickhub.dev/bricks/riverpod_simple_architecture/2.1.5",
        ),
      ],
      screenshots: const [],
    ),
    Project(
      title: "talker_rhttp_logger",
      rating: 0,
      description: "A Flutter package for logging HTTP requests and responses using Talker.",
      tech: const ["Flutter", "Talker", "HTTP", "Logging"],
      keyFeatures: const ["HTTP request logging", "HTTP response logging", "Easy integration with Talker"],
      downloads: "83+ downloads",
      platforms: [
        PubDeploy(
          url: "https://pub.dev/packages/talker_rhttp_logger",
        ),
      ],
      screenshots: [],
    ),
    Project(
      title: "hijri_calendar",
      rating: 0,
      description:
          "A Dart library for Islamic dates. Explore the Hijri calendar with ease. Perfect for integrating Islamic date functionalities into your applications.",
      tech: const ["Dart", "Calendar", "Hijri", "Islamic Calendar"],
      keyFeatures: const ["Islamic date conversion", "Hijri calendar functionalities", "Easy to integrate"],
      downloads: "0+ downloads",
      platforms: [
        PubDeploy(url: "https://pub.dev/packages/hijri_calendar"),
      ],
      screenshots: const [],
    ),
    Project(
      title: "git_changie",
      rating: 0,
      platforms: [
        PubDeploy(url: "https://pub.dev/packages/git_changie"),
      ],
      description: "A changelog generator for GitHub.",
      tech: const ["Dart", "CLI", "Changelog", "Git", "GitHub"],
      keyFeatures: const ["Automated changelog generation", "Configurable", "GitHub integration"],
      downloads: "0+ downloads",
      screenshots: const [],
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
                  projects
                      .map(
                        (project) => ProjectCard(project: project),
                      )
                      .toList(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
