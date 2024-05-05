class InSight {
  CustomerData? customerData;
  SalesData? salesData;
  TransactionsData? transactionsData;
  MostSpendingCustomerThisMonth? mostSpendingCustomerThisMonth;

  InSight({
    this.customerData,
    this.salesData,
    this.transactionsData,
    this.mostSpendingCustomerThisMonth,
  });

  factory InSight.fromJson(Map<String, dynamic> json) => InSight(
        customerData: json["customer_data"] == null
            ? null
            : CustomerData.fromJson(json["customer_data"]),
        salesData: json["sales_data"] == null
            ? null
            : SalesData.fromJson(json["sales_data"]),
        transactionsData: json["transactions_data"] == null
            ? null
            : TransactionsData.fromJson(json["transactions_data"]),
        mostSpendingCustomerThisMonth:
            json["most_spending_customer_this_month"] == null
                ? null
                : MostSpendingCustomerThisMonth.fromJson(
                    json["most_spending_customer_this_month"]),
      );

  Map<String, dynamic> toJson() => {
        "customer_data": customerData?.toJson(),
        "sales_data": salesData?.toJson(),
        "transactions_data": transactionsData?.toJson(),
        "most_spending_customer_this_month":
            mostSpendingCustomerThisMonth?.toJson(),
      };
}

class CustomerData {
  int? newCustomers;
  double? percentageChange;

  CustomerData({
    this.newCustomers,
    this.percentageChange,
  });

  factory CustomerData.fromJson(Map<String, dynamic> json) => CustomerData(
        newCustomers: json["new_customers"],
        percentageChange: json["percentage_change"],
      );

  Map<String, dynamic> toJson() => {
        "new_customers": newCustomers,
        "percentage_change": percentageChange,
      };
}

class MostSpendingCustomerThisMonth {
  int? id;
  String? name;
  String? code;
  String? address;
  String? phone;
  String? email;
  String? deliveryAddress;
  double? loyaltyPoints;
  String? tier;
  int? totalVisits;
  double? totalAmountSpent;
  double? credit;

  MostSpendingCustomerThisMonth({
    this.id,
    this.name,
    this.code,
    this.address,
    this.phone,
    this.email,
    this.deliveryAddress,
    this.loyaltyPoints,
    this.tier,
    this.totalVisits,
    this.totalAmountSpent,
    this.credit,
  });

  factory MostSpendingCustomerThisMonth.fromJson(Map<String, dynamic> json) =>
      MostSpendingCustomerThisMonth(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        address: json["address"],
        phone: json["phone"],
        email: json["email"],
        deliveryAddress: json["delivery_address"],
        loyaltyPoints: json["loyalty_points"],
        tier: json["tier"],
        totalVisits: json["total_visits"],
        totalAmountSpent: json["total_amount_spent"],
        credit: json["credit"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "address": address,
        "phone": phone,
        "email": email,
        "delivery_address": deliveryAddress,
        "loyalty_points": loyaltyPoints,
        "tier": tier,
        "total_visits": totalVisits,
        "total_amount_spent": totalAmountSpent,
        "credit": credit,
      };
}

class SalesData {
  double? salesForToday;
  double? percentageChange;

  SalesData({
    this.salesForToday,
    this.percentageChange,
  });

  factory SalesData.fromJson(Map<String, dynamic> json) => SalesData(
        salesForToday: json["sales_for_today"],
        percentageChange: json["percentage_change"],
      );

  Map<String, dynamic> toJson() => {
        "sales_for_today": salesForToday,
        "percentage_change": percentageChange,
      };
}

class TransactionsData {
  double? transactionsForToday;
  double? percentageChange;

  TransactionsData({
    this.transactionsForToday,
    this.percentageChange,
  });

  factory TransactionsData.fromJson(Map<String, dynamic> json) =>
      TransactionsData(
        transactionsForToday: json["transactions_for_today"],
        percentageChange: json["percentage_change"],
      );

  Map<String, dynamic> toJson() => {
        "transactions_for_today": transactionsForToday,
        "percentage_change": percentageChange,
      };
}

class GraphData {
  List<String>? keys;
  List<double>? values;

  GraphData({
    this.keys,
    this.values,
  });

  factory GraphData.fromJson(Map<String, dynamic> json) => GraphData(
        keys: json["keys"] == null
            ? []
            : List<String>.from(json["keys"]!.map((x) => x)),
        values: json["values"] == null
            ? []
            : List<double>.from(json["values"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "keys": keys == null ? [] : List<String>.from(keys!.map((x) => x)),
        "values":
            values == null ? [] : List<double>.from(values!.map((x) => x)),
      };
}
