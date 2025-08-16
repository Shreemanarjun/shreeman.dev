import 'package:jaspr/jaspr.dart';
import 'package:jaspr_lucide/jaspr_lucide.dart' hide section, text;
import 'package:js_interop_utils/js_interop_utils.dart';
import 'package:universal_web/web.dart' as web;
import 'package:universal_web/web.dart' as webc;

class Contact extends StatefulComponent {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  // State variables equivalent to useState in React
  bool isVisible = false;
  Map<String, String> formData = {
    'name': '',
    'email': '',
    'subject': '',
    'message': '',
  };

  // To hold the IntersectionObserver instance
  web.IntersectionObserver? _observer;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      if (mounted) {
        observer();
      }
    });
  }

  void observer() {
    // Set up the IntersectionObserver, equivalent to useEffect with an empty dependency array
    _observer = web.IntersectionObserver(
      (
            JSArray<web.IntersectionObserverEntry> entries,
            web.IntersectionObserver observer,
          ) {
            final entry = entries[0];
            if (entry.isIntersecting && !isVisible) {
              setState(() {
                isVisible = true;
              });
            }
          }
          .toJS,
      webc.IntersectionObserverInit(threshold: [0.1].toJSDeep),
    );
    final element = webc.document.getElementById('contact');
    if (element != null) {
      // Observe the component's root element
      _observer!.observe(element);
    }
  }

  @override
  void dispose() {
    // Disconnect the observer on component disposal, equivalent to the useEffect cleanup function
    _observer?.disconnect();
    super.dispose();
  }

  // Handles form input changes
  void handleInputChange(dynamic event) {
    final target = event.target;
    setState(() {
      formData[target.name] = target.value;
    });
  }

  // Handles form submission
  void handleSubmit(dynamic event) {
    event.preventDefault();
    // In a real app, you would send this data to a server

    ///Get Date
    web.window.alert("Form submitted!");
  }

  // Data for contact info and social links
  final List<Map<String, dynamic>> contactInfo = [
    {
      'icon': mail(classes: 'w-6 h-6'),
      'title': 'Email',
      'value': 'shreemanarjunsahu@gmail.com',
      'link': 'mailto:shreemanarjunsahu@gmail.com',
    },
    {
      'icon': phone(classes: 'w-6 h-6'),
      'title': 'Phone',
      'value': '+91 82499 43298',
      'link': 'tel:+91824994398',
    },
    {
      'icon': mapPin(classes: 'w-6 h-6'),
      'title': 'Location',
      'value': 'Angul,Odisha,India',
      'link': 'https://maps.app.goo.gl/xTz8YEnApCNFkeCg9',
    },
  ];

  final List<Map<String, dynamic>> socialLinks = [
    {
      'icon': github(classes: 'w-6 h-6'),
      'name': 'GitHub',
      'url': 'https://github.com/Shreemanarjun',
      'color': 'hover:text-gray-300',
    },
    {
      'icon': linkedin(classes: 'w-6 h-6'),
      'name': 'LinkedIn',
      'url': 'https://www.linkedin.com/in/shreemanarjun/',
      'color': 'hover:text-blue-400',
    },
    {
      'icon': twitter(classes: 'w-6 h-6'),
      'name': 'Twitter',
      'url': 'https://twitter.com/shreemanarjun/',
      'color': 'hover:text-blue-300',
    },
  ];

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section(id: 'contact', classes: 'py-20 relative overflow-hidden', [
      // Background Elements
      div(classes: 'absolute inset-0', [
        div(
          classes: 'absolute top-1/4 left-10 w-72 h-72 bg-indigo-500/10 rounded-full filter blur-3xl',
          [],
        ),
        div(
          classes: 'absolute bottom-1/4 right-10 w-96 h-96 bg-purple-500/10 rounded-full filter blur-3xl',
          [],
        ),
      ]),

      div(classes: 'container mx-auto px-6 relative z-10', [
        div(classes: 'max-w-6xl mx-auto', [
          div(
            classes: 'text-center mb-16 transition-all duration-1000 ${isVisible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-10'}',
            [
              h2(
                classes: 'text-4xl md:text-5xl font-bold bg-gradient-to-r from-indigo-400 to-purple-600 bg-clip-text text-transparent mb-6',
                [text("Let's Work Together")],
              ),
              p(
                classes: 'text-xl text-white/80 max-w-3xl mx-auto leading-relaxed',
                [
                  text(
                    "Have a project in mind? I'd love to hear about it and discuss how we can bring your ideas to life.",
                  ),
                ],
              ),
            ],
          ),
          div(classes: 'grid lg:grid-cols-2 gap-12', [
            // Contact Information
            div(
              classes: 'space-y-8 transition-all duration-1000 delay-300 ${isVisible ? 'opacity-100 translate-x-0' : 'opacity-0 -translate-x-10'}',
              [
                div(
                  classes: 'backdrop-blur-lg bg-white/10 border border-white/20 rounded-2xl p-8',
                  [
                    h3(classes: 'text-2xl font-bold text-white mb-6', [
                      text('Get in Touch'),
                    ]),
                    p(classes: 'text-white/70 leading-relaxed mb-8', [
                      text(
                        "I'm always interested in hearing about new opportunities and exciting projects. Whether you have a question or just want to say hi, feel free to reach out!",
                      ),
                    ]),
                    div(classes: 'space-y-6', [
                      for (final info in contactInfo)
                        a(
                          href: info['link'],
                          classes: 'flex items-center gap-4 p-4 rounded-xl backdrop-blur-md bg-white/10 border border-white/20 hover:bg-white/20 transition-all duration-300 transform hover:scale-105 group',
                          [
                            div(
                              classes: 'text-indigo-400 group-hover:scale-110 transition-transform duration-300',
                              [info['icon']],
                            ),
                            div([
                              div(classes: 'text-white/60 text-sm', [
                                text(info['title']),
                              ]),
                              div(classes: 'text-white font-medium', [
                                text(info['value']),
                              ]),
                            ]),
                          ],
                        ),
                    ]),
                    div(classes: 'mt-8 pt-8 border-t border-white/20', [
                      h4(classes: 'text-lg font-semibold text-white mb-4', [
                        text('Connect with me'),
                      ]),
                      div(classes: 'flex gap-4', [
                        for (final social in socialLinks)
                          a(
                            href: social['url'],
                            classes: 'p-3 backdrop-blur-md bg-white/10 border border-white/20 rounded-lg text-white/80 ${social['color']} transition-all duration-300 transform hover:scale-110 hover:shadow-lg',
                            attributes: {'title': social['name']},
                            [social['icon']],
                          ),
                      ]),
                    ]),
                  ],
                ),
              ],
            ),

            // Contact Form
            div(
              classes: 'transition-all duration-1000 delay-500 ${isVisible ? 'opacity-100 translate-x-0' : 'opacity-0 translate-x-10'}',
              [
                form(
                  events: {'submit': handleSubmit},
                  classes: 'backdrop-blur-lg bg-white/10 border border-white/20 rounded-2xl p-8',
                  [
                    h3(classes: 'text-2xl font-bold text-white mb-6', [
                      text('Send a Message'),
                    ]),
                    div(classes: 'space-y-6', [
                      div(classes: 'grid md:grid-cols-2 gap-6', [
                        div([
                          label(
                            attributes: {'for': 'name'},
                            classes: 'block text-white/80 text-sm font-medium mb-2',
                            [text('Name')],
                          ),
                          input(
                            type: InputType.text,
                            id: 'name',
                            name: 'name',
                            value: formData['name'],
                            attributes: {
                              "required": "true",
                              "placeholder": 'Your name',
                            },
                            classes: 'w-full px-4 py-3 backdrop-blur-md bg-white/10 border border-white/20 rounded-lg text-white placeholder-white/50 focus:outline-none focus:border-indigo-400 focus:bg-white/20 transition-all duration-300',
                            events: {'input': handleInputChange},
                          ),
                        ]),
                        div([
                          label(
                            attributes: {'for': 'email'},
                            classes: 'block text-white/80 text-sm font-medium mb-2',
                            [text('Email')],
                          ),
                          input(
                            type: InputType.email,
                            id: 'email',
                            name: 'email',
                            value: formData['email'],
                            attributes: {
                              "required": "true",
                              "placeholder": 'your@email.com',
                            },
                            classes: 'w-full px-4 py-3 backdrop-blur-md bg-white/10 border border-white/20 rounded-lg text-white placeholder-white/50 focus:outline-none focus:border-indigo-400 focus:bg-white/20 transition-all duration-300',
                            events: {'input': handleInputChange},
                          ),
                        ]),
                      ]),
                      div([
                        label(
                          attributes: {'for': 'subject'},
                          classes: 'block text-white/80 text-sm font-medium mb-2',
                          [text('Subject')],
                        ),
                        input(
                          type: InputType.text,
                          id: 'subject',
                          name: 'subject',
                          value: formData['subject'],
                          attributes: {
                            "required": "true",
                            "placeholder": 'Project inquiry',
                          },
                          classes: 'w-full px-4 py-3 backdrop-blur-md bg-white/10 border border-white/20 rounded-lg text-white placeholder-white/50 focus:outline-none focus:border-indigo-400 focus:bg-white/20 transition-all duration-300',
                          events: {'input': handleInputChange},
                        ),
                      ]),
                      div([
                        label(
                          attributes: {'for': 'message'},
                          classes: 'block text-white/80 text-sm font-medium mb-2',
                          [text('Message')],
                        ),
                        textarea(
                          name: 'message',
                          attributes: {
                            "value": formData['message'] ?? '',
                            "id": 'message',
                          },
                          required: true,
                          rows: 6,
                          placeholder: 'Tell me about your project...',
                          classes: 'w-full px-4 py-3 backdrop-blur-md bg-white/10 border border-white/20 rounded-lg text-white placeholder-white/50 focus:outline-none focus:border-indigo-400 focus:bg-white/20 transition-all duration-300 resize-none',
                          events: {'input': handleInputChange},
                          [],
                        ),
                      ]),
                      button(
                        type: ButtonType.submit,

                        classes:
                            'w-full flex items-center justify-center gap-3 py-4 bg-gradient-to-r from-indigo-500 to-purple-600 rounded-lg text-white font-semibold hover:from-indigo-600 hover:to-purple-700 transition-all duration-300 transform hover:scale-105 hover:shadow-xl group',
                        [
                          send(
                            classes: 'w-5 h-5 group-hover:translate-x-1 transition-transform duration-300',
                          ),
                          text('Send Message'),
                        ],
                      ),
                    ]),
                  ],
                ),
              ],
            ),
          ]),
        ]),
      ]),
    ]);
  }
}
