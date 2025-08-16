import 'package:jaspr/browser.dart';
import 'package:jaspr_lucide/jaspr_lucide.dart' hide text;

class Certification extends StatefulComponent {
  @override
  State createState() => CertificationState();
}

class CertificationState extends State<Certification> {
  final certifications = [
    (
      name: 'Introduction to Flutter Development Using Dart',
      issuer: 'The App Brewery',
      date: 'June 2020',
      credentialId: 'GFC-2023-001',
      link: '#',
    ),
    (
      name: 'Web Development with Kotlin',
      issuer: 'Udemy',
      date: 'July 2021',
      credentialId: 'AWS-SAA-2022',
      link: '#',
    ),
    (
      name: 'The Essential Android O Developer Course (Java)',
      issuer: 'Google Cloud',
      date: 'July 2020',
      credentialId: 'FCE-2022-456',
      link: '#',
    ),
  ];
  @override
  Iterable<Component> build(BuildContext context) sync* {
    // Certifications
    yield div(
      classes: 'backdrop-blur-lg bg-white/10 border border-white/20 rounded-2xl p-8',
      [
        h3(
          classes: 'text-2xl font-bold text-white mb-6 flex items-center gap-3',
          [
            award(classes: 'w-6 h-6 text-yellow-400'),
            text('Professional Certifications'),
          ],
        ),
        div(classes: 'grid md:grid-cols-2 gap-6', [
          for (var cert in certifications)
            div(
              classes: 'group backdrop-blur-md bg-white/10 border border-white/20 rounded-xl p-6 hover:bg-white/20 transition-all duration-300 transform hover:scale-105',
              [
                div(classes: 'flex items-start justify-between mb-3', [
                  h4(
                    classes: 'font-semibold text-white group-hover:text-yellow-300 transition-colors duration-300',
                    [text(cert.name)],
                  ),
                  a(
                    href: cert.link,
                    classes: 'text-white/60 hover:text-white transition-colors duration-300',
                    [externalLink(classes: 'w-4 h-4')],
                  ),
                ]),
                p(classes: 'text-white/70 text-sm mb-2', [text(cert.issuer)]),
                div(
                  classes: 'flex items-center justify-between text-xs text-white/60',
                  [
                    span([text('Issued: ${cert.date}')]),
                    span([text('ID: ${cert.credentialId}')]),
                  ],
                ),
              ],
            ),
        ]),
      ],
    );
  }
}
