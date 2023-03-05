class Constant {

  static const baseUrl= 'https://turkish.hexacit.com/api/v1/';
  static const getEventUrl= 'events';
  static const addEventUrl= 'createEvent';
  static const getPartnerUrl= 'partners';
  static const ContactUrl= 'contact';
  static const CategoryUrl= 'categories';
  static  String eventDetailsUrl({required id}){
  return 'eventDetails/$id';
}
}