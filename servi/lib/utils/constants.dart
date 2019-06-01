

class LayoutDimensions {
  static const leftPadding = 8;
  static const rightPadding = 8;
}

enum ServiceType { TALK, WORKSHOP, EVENT, }

class ServiceMethod {
  final ServiceType serviceType;

  ServiceMethod(this.serviceType);

  String getServiceMethod() {
    switch (serviceType) {
      case ServiceType.TALK:
        return "Talk";
        break;
      case ServiceType.WORKSHOP:
        return "Workshop";
        break;
      case ServiceType.EVENT:
        return "Event";
        break;
      default:
        return "";
        break;
    }
  }
}