import 'package:flutter_stripe/flutter_stripe.dart';

import 'amount_details.dart';
import 'automatic_payment_methods.dart';
import 'metadata.dart';

class PaymentIntentModel {
  String id;
  String object;
  int amount;
  int amountCapturable;
  AmountDetails amountDetails;
  int amountReceived;
  dynamic application;
  dynamic applicationFeeAmount;
  AutomaticPaymentMethods automaticPaymentMethods;
  dynamic canceledAt;
  dynamic cancellationReason;
  String captureMethod;
  String clientSecret;
  String confirmationMethod;
  int created;
  String currency;
  dynamic customer;
  dynamic description;
  dynamic invoice;
  dynamic lastPaymentError;
  dynamic latestCharge;
  bool livemode;
  Metadata metadata;
  dynamic nextAction;
  dynamic onBehalfOf;
  dynamic paymentMethod;
  PaymentMethodOptions paymentMethodOptions;
  List<String> paymentMethodTypes;
  dynamic processing;
  dynamic receiptEmail;
  dynamic review;
  dynamic setupFutureUsage;
  dynamic shipping;
  dynamic source;
  dynamic statementDescriptor;
  dynamic statementDescriptorSuffix;
  String status;
  dynamic transferData;
  dynamic transferGroup;

  PaymentIntentModel({
    required this.id,
    required this.object,
    required this.amount,
    required this.amountCapturable,
    required this.amountDetails,
    required this.amountReceived,
    required this.application,
    required this.applicationFeeAmount,
    required this.automaticPaymentMethods,
    required this.canceledAt,
    required this.cancellationReason,
    required this.captureMethod,
    required this.clientSecret,
    required this.confirmationMethod,
    required this.created,
    required this.currency,
    required this.customer,
    required this.description,
    required this.invoice,
    required this.lastPaymentError,
    required this.latestCharge,
    required this.livemode,
    required this.metadata,
    required this.nextAction,
    required this.onBehalfOf,
    required this.paymentMethod,
    required this.paymentMethodOptions,
    required this.paymentMethodTypes,
    required this.processing,
    required this.receiptEmail,
    required this.review,
    required this.setupFutureUsage,
    required this.shipping,
    required this.source,
    required this.statementDescriptor,
    required this.statementDescriptorSuffix,
    required this.status,
    required this.transferData,
    required this.transferGroup,
  });

  factory PaymentIntentModel.fromJson(Map<String, dynamic> json) =>
      PaymentIntentModel(
        id: json["id"] ?? '',
        object: json["object"] ?? '',
        amount: json["amount"],
        amountCapturable: json["amount_capturable"],
        amountDetails: AmountDetails.fromJson(json["amount_details"]),
        amountReceived: json["amount_received"],
        application: json["application"],
        applicationFeeAmount: json["application_fee_amount"],
        automaticPaymentMethods:
            AutomaticPaymentMethods.fromJson(json["automatic_payment_methods"]),
        canceledAt: json["canceled_at"],
        cancellationReason: json["cancellation_reason"],
        captureMethod: json["capture_method"] ?? '',
        clientSecret: json["client_secret"] ?? '',
        confirmationMethod: json["confirmation_method"] ?? '',
        created: json["created"],
        currency: json["currency"] ?? 'usd',
        customer: json["customer"],
        description: json["description"],
        invoice: json["invoice"],
        lastPaymentError: json["last_payment_error"],
        latestCharge: json["latest_charge"],
        livemode: json["livemode"],
        metadata: Metadata.fromJson(json["metadata"]),
        nextAction: json["next_action"],
        onBehalfOf: json["on_behalf_of"],
        paymentMethod: json["payment_method"],
        paymentMethodOptions:
            PaymentMethodOptions.fromJson(json["payment_method_options"]),
        paymentMethodTypes:
            List<String>.from(json["payment_method_types"].map((x) => x)),
        processing: json["processing"],
        receiptEmail: json["receipt_email"],
        review: json["review"],
        setupFutureUsage: json["setup_future_usage"],
        shipping: json["shipping"],
        source: json["source"],
        statementDescriptor: json["statement_descriptor"] ?? '',
        statementDescriptorSuffix: json["statement_descriptor_suffix"] ?? '',
        status: json["status"] ?? '',
        transferData: json["transfer_data"],
        transferGroup: json["transfer_group"],
      );
}
