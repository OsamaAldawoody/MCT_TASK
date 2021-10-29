class Payment {
  final int id;
  final String trxRef;
  final int fromEntityId;
  final int toEntityId;
  final double amount;
  final String trxDate;
  final String mobileNumber;
  final String? fullNameAR;
  final String fullNameEN;
  final String corporateFullNameAR;
  final String? corporateFullNameEN;
  final dynamic trxDetails;

  Payment(
    this.id,
    this.trxRef,
    this.fromEntityId,
    this.toEntityId,
    this.amount,
    this.trxDate,
    this.mobileNumber,
    this.fullNameEN,
    this.fullNameAR,
    this.corporateFullNameAR,
    this.corporateFullNameEN,
    this.trxDetails,
  );

  factory Payment.fromJson(json) => Payment(
      json['id'],
      json['trxRef'],
      json['fromEntityId'],
      json['toEntityId'],
      json['amount'],
      json['trxDate'],
      json['mobileNumber'],
      json['fullNameEN'],
      json['fullNameAR'],
      json['corporateFullNameAR'],
      json['corporateFullNameEN'],
      json['trxDetails']);
}
