sealed class DeployPlatform {
  final String name;
  final String? url;

  DeployPlatform({
    this.name = "",
    this.url,
  });
}

class AndroidDeploy extends DeployPlatform {
  final String icon;
  AndroidDeploy({
    super.name = "Android",
    super.url,
    this.icon = "",
  });
}

class IosDeploy extends DeployPlatform {
  IosDeploy({
    super.name = "iOS",
    super.url,
  });
}

class WebDeploy extends DeployPlatform {
  WebDeploy({
    super.name = "Web",
    super.url,
  });
}

class LinuxDeploy extends DeployPlatform {
  LinuxDeploy({
    super.name = "Linux",
    super.url,
  });
}

class WindowsDeploy extends DeployPlatform {
  WindowsDeploy({
    super.name = "Windows",
    super.url,
  });
}

class MacOsDeploy extends DeployPlatform {
  MacOsDeploy({
    super.name = "macOS",
    super.url,
  });
}

class OtherDeploy extends DeployPlatform {
  OtherDeploy({
    required super.name,
    super.url,
  });
}

class PubDeploy extends DeployPlatform {
  PubDeploy({
    super.name = "Pub.dev",
    super.url,
  });
}
