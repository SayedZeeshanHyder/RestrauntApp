class UserModel {
  UserModel({
    required this.uid,
    required this.phoneNo,
    required this.email,
    required this.bookings,
    required this.dob,
    required this.orders,
    required this.isGold,
    required this.vouchers,
    required this.prevOrders,
    required this.friends,
    required this.deviceToken
  });
  late final String uid;
  late final List<dynamic> bookings;
  late final String deviceToken;
  late final int phoneNo;
  late final String email;
  late final String dob;
  late final List<dynamic> orders;
  late final bool isGold;
  late final List<dynamic> vouchers;
  late final List<dynamic> prevOrders;
  late final List<dynamic> friends;

  UserModel.fromJson(Map<String, dynamic> json){
    deviceToken = json['deviceToken'];
    uid = json['uid'];
    phoneNo = json['phoneNo'];
    email = json['email'];
    dob = json['dob'];
    orders = List.castFrom<dynamic, dynamic>(json['orders']);
    isGold = json['isGold'];
    vouchers = List.castFrom<dynamic, dynamic>(json['vouchers']);
    prevOrders = List.castFrom<dynamic, dynamic>(json['prevOrders']);
    friends = List.castFrom<dynamic,dynamic>(json['friends']);
    bookings = List.castFrom<dynamic,dynamic>(json['bookings']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['deviceToken'] = deviceToken;
    data['uid'] = uid;
    data['phoneNo'] = phoneNo;
    data['email'] = email;
    data['dob'] = dob;
    data['orders'] = orders;
    data['isGold'] = isGold;
    data['vouchers'] = vouchers;
    data['prevOrders'] = prevOrders;
    data['friends'] = friends;
    data['bookings'] = bookings;
    return data;
  }
}