// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    required this.id,
    required this.email,
    required this.username,
    required this.nicename,
    required this.url,
    required this.message,
    required this.registeredAt,
    required this.firstName,
    required this.lastName,
    required this.displayName,
    required this.activeMemberships,
    required this.activeTxnCount,
    required this.expiredTxnCount,
    required this.trialTxnCount,
    this.subCount,
    required this.loginCount,
    required this.firstTxn,
    required this.latestTxn,
    required this.address,
    required this.profile,
    required this.recentTransactions,
    required this.recentSubscriptions,
  });

  int id;
  String email;
  String username;
  String nicename;
  String url;
  String message;
  DateTime registeredAt;
  String firstName;
  String lastName;
  String displayName;
  List<dynamic> activeMemberships;
  String activeTxnCount;
  String expiredTxnCount;
  String trialTxnCount;
  dynamic subCount;
  String loginCount;
  FirstTxn firstTxn;
  FirstTxn latestTxn;
  Address address;
  Profile profile;
  List<FirstTxn> recentTransactions;
  List<RecentSubscription> recentSubscriptions;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["id"],
    email: json["email"],
    username: json["username"],
    nicename: json["nicename"],
    url: json["url"],
    message: json["message"],
    registeredAt: DateTime.parse(json["registered_at"]),
    firstName: json["first_name"],
    lastName: json["last_name"],
    displayName: json["display_name"],
    activeMemberships: List<dynamic>.from(json["active_memberships"].map((x) => x)),
    activeTxnCount: json["active_txn_count"],
    expiredTxnCount: json["expired_txn_count"],
    trialTxnCount: json["trial_txn_count"],
    subCount: json["sub_count"],
    loginCount: json["login_count"],
    firstTxn: FirstTxn.fromJson(json["first_txn"]),
    latestTxn: FirstTxn.fromJson(json["latest_txn"]),
    address: Address.fromJson(json["address"]),
    profile: Profile.fromJson(json["profile"]),
    recentTransactions: List<FirstTxn>.from(json["recent_transactions"].map((x) => FirstTxn.fromJson(x))),
    recentSubscriptions: List<RecentSubscription>.from(json["recent_subscriptions"].map((x) => RecentSubscription.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "username": username,
    "nicename": nicename,
    "url": url,
    "message": message,
    "registered_at": registeredAt.toIso8601String(),
    "first_name": firstName,
    "last_name": lastName,
    "display_name": displayName,
    "active_memberships": List<dynamic>.from(activeMemberships.map((x) => x)),
    "active_txn_count": activeTxnCount,
    "expired_txn_count": expiredTxnCount,
    "trial_txn_count": trialTxnCount,
    "sub_count": subCount,
    "login_count": loginCount,
    "first_txn": firstTxn.toJson(),
    "latest_txn": latestTxn.toJson(),
    "address": address.toJson(),
    "profile": profile.toJson(),
    "recent_transactions": List<dynamic>.from(recentTransactions.map((x) => x.toJson())),
    "recent_subscriptions": List<dynamic>.from(recentSubscriptions.map((x) => x.toJson())),
  };
}

class Address {
  Address({
    required this.meprAddressOne,
    required this.meprAddressTwo,
    required this.meprAddressCity,
    required this.meprAddressState,
    required this.meprAddressZip,
    required this.meprAddressCountry,
  });

  String meprAddressOne;
  String meprAddressTwo;
  String meprAddressCity;
  String meprAddressState;
  String meprAddressZip;
  String meprAddressCountry;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    meprAddressOne: json["mepr-address-one"],
    meprAddressTwo: json["mepr-address-two"],
    meprAddressCity: json["mepr-address-city"],
    meprAddressState: json["mepr-address-state"],
    meprAddressZip: json["mepr-address-zip"],
    meprAddressCountry: json["mepr-address-country"],
  );

  Map<String, dynamic> toJson() => {
    "mepr-address-one": meprAddressOne,
    "mepr-address-two": meprAddressTwo,
    "mepr-address-city": meprAddressCity,
    "mepr-address-state": meprAddressState,
    "mepr-address-zip": meprAddressZip,
    "mepr-address-country": meprAddressCountry,
  };
}

class FirstTxn {
  FirstTxn({
    required this.membership,
    required this.member,
    required this.coupon,
    required this.subscription,
    required this.id,
    required this.amount,
    required this.total,
    required this.taxAmount,
    required this.taxRate,
    required this.taxDesc,
    required this.taxClass,
    required this.transNum,
    required this.status,
    required this.txnType,
    required this.gateway,
    required this.prorated,
    required this.createdAt,
    required this.expiresAt,
    required this.corporateAccountId,
    required this.parentTransactionId,
    required this.taxCompound,
    required this.taxShipping,
    this.response,
  });

  String membership;
  String member;
  String coupon;
  String subscription;
  String id;
  String amount;
  String total;
  String taxAmount;
  String taxRate;
  String taxDesc;
  String taxClass;
  String transNum;
  String status;
  String txnType;
  String gateway;
  String prorated;
  DateTime createdAt;
  DateTime expiresAt;
  String corporateAccountId;
  String parentTransactionId;
  String taxCompound;
  String taxShipping;
  dynamic response;

  factory FirstTxn.fromJson(Map<String, dynamic> json) => FirstTxn(
    membership: json["membership"],
    member: json["member"],
    coupon: json["coupon"],
    subscription: json["subscription"],
    id: json["id"],
    amount: json["amount"],
    total: json["total"],
    taxAmount: json["tax_amount"],
    taxRate: json["tax_rate"],
    taxDesc: json["tax_desc"],
    taxClass: json["tax_class"],
    transNum: json["trans_num"],
    status: json["status"],
    txnType: json["txn_type"],
    gateway: json["gateway"],
    prorated: json["prorated"],
    createdAt: DateTime.parse(json["created_at"]),
    expiresAt: DateTime.parse(json["expires_at"]),
    corporateAccountId: json["corporate_account_id"],
    parentTransactionId: json["parent_transaction_id"],
    taxCompound: json["tax_compound"],
    taxShipping: json["tax_shipping"],
    response: json["response"],
  );

  Map<String, dynamic> toJson() => {
    "membership": membership,
    "member": member,
    "coupon": coupon,
    "subscription": subscription,
    "id": id,
    "amount": amount,
    "total": total,
    "tax_amount": taxAmount,
    "tax_rate": taxRate,
    "tax_desc": taxDesc,
    "tax_class": taxClass,
    "trans_num": transNum,
    "status": status,
    "txn_type": txnType,
    "gateway": gateway,
    "prorated": prorated,
    "created_at": createdAt.toIso8601String(),
    "expires_at": expiresAt.toIso8601String(),
    "corporate_account_id": corporateAccountId,
    "parent_transaction_id": parentTransactionId,
    "tax_compound": taxCompound,
    "tax_shipping": taxShipping,
    "response": response,
  };
}

class Profile {
  Profile();

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
  );

  Map<String, dynamic> toJson() => {
  };
}

class RecentSubscription {
  RecentSubscription({
    required this.coupon,
    required this.membership,
    required this.member,
    required this.id,
    required this.subscrId,
    required this.gateway,
    required this.price,
    required this.period,
    required this.periodType,
    required this.limitCycles,
    required this.limitCyclesNum,
    required this.limitCyclesAction,
    required this.limitCyclesExpiresAfter,
    required this.limitCyclesExpiresType,
    required this.proratedTrial,
    required this.trial,
    required this.trialDays,
    required this.trialAmount,
    required this.trialTaxAmount,
    required this.trialTotal,
    required this.status,
    required this.createdAt,
    required this.total,
    required this.taxRate,
    required this.taxAmount,
    required this.taxDesc,
    required this.taxClass,
    required this.ccLast4,
    required this.ccExpMonth,
    required this.ccExpYear,
    required this.token,
    required this.taxCompound,
    required this.taxShipping,
    this.response,
  });

  String coupon;
  String membership;
  String member;
  String id;
  String subscrId;
  String gateway;
  String price;
  String period;
  String periodType;
  String limitCycles;
  String limitCyclesNum;
  String limitCyclesAction;
  String limitCyclesExpiresAfter;
  String limitCyclesExpiresType;
  String proratedTrial;
  String trial;
  String trialDays;
  String trialAmount;
  String trialTaxAmount;
  String trialTotal;
  String status;
  DateTime createdAt;
  String total;
  String taxRate;
  String taxAmount;
  String taxDesc;
  String taxClass;
  String ccLast4;
  String ccExpMonth;
  String ccExpYear;
  String token;
  String taxCompound;
  String taxShipping;
  dynamic response;

  factory RecentSubscription.fromJson(Map<String, dynamic> json) => RecentSubscription(
    coupon: json["coupon"],
    membership: json["membership"],
    member: json["member"],
    id: json["id"],
    subscrId: json["subscr_id"],
    gateway: json["gateway"],
    price: json["price"],
    period: json["period"],
    periodType: json["period_type"],
    limitCycles: json["limit_cycles"],
    limitCyclesNum: json["limit_cycles_num"],
    limitCyclesAction: json["limit_cycles_action"],
    limitCyclesExpiresAfter: json["limit_cycles_expires_after"],
    limitCyclesExpiresType: json["limit_cycles_expires_type"],
    proratedTrial: json["prorated_trial"],
    trial: json["trial"],
    trialDays: json["trial_days"],
    trialAmount: json["trial_amount"],
    trialTaxAmount: json["trial_tax_amount"],
    trialTotal: json["trial_total"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    total: json["total"],
    taxRate: json["tax_rate"],
    taxAmount: json["tax_amount"],
    taxDesc: json["tax_desc"],
    taxClass: json["tax_class"],
    ccLast4: json["cc_last4"],
    ccExpMonth: json["cc_exp_month"],
    ccExpYear: json["cc_exp_year"],
    token: json["token"],
    taxCompound: json["tax_compound"],
    taxShipping: json["tax_shipping"],
    response: json["response"],
  );

  Map<String, dynamic> toJson() => {
    "coupon": coupon,
    "membership": membership,
    "member": member,
    "id": id,
    "subscr_id": subscrId,
    "gateway": gateway,
    "price": price,
    "period": period,
    "period_type": periodType,
    "limit_cycles": limitCycles,
    "limit_cycles_num": limitCyclesNum,
    "limit_cycles_action": limitCyclesAction,
    "limit_cycles_expires_after": limitCyclesExpiresAfter,
    "limit_cycles_expires_type": limitCyclesExpiresType,
    "prorated_trial": proratedTrial,
    "trial": trial,
    "trial_days": trialDays,
    "trial_amount": trialAmount,
    "trial_tax_amount": trialTaxAmount,
    "trial_total": trialTotal,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "total": total,
    "tax_rate": taxRate,
    "tax_amount": taxAmount,
    "tax_desc": taxDesc,
    "tax_class": taxClass,
    "cc_last4": ccLast4,
    "cc_exp_month": ccExpMonth,
    "cc_exp_year": ccExpYear,
    "token": token,
    "tax_compound": taxCompound,
    "tax_shipping": taxShipping,
    "response": response,
  };
}
