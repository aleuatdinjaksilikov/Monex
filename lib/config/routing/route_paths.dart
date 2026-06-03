class RoutePaths {

  static const home = '/home';
  static const contacts = '/contacts';
  static const settings = '/settings';

  
  static const contactDetailPath = '/contactDetail';
  static String contactDetail(int id) => '$contacts/$id';

  static const createTracnsactionPath = '/createTransaction';

  static const createContact = '/newContact';
}