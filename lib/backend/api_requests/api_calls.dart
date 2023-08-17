import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ListCardsNuveiCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? uid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ListCardsNuvei',
      apiUrl: 'https://ccapi-stg.paymentez.com/v2/card/list',
      callType: ApiCallType.GET,
      headers: {
        'Auth-Token': '${authToken}',
      },
      params: {
        'uid': uid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic last4digits(dynamic response) => getJsonField(
        response,
        r'''$.cards[:].number''',
        true,
      );
  static dynamic tokens(dynamic response) => getJsonField(
        response,
        r'''$.cards[:].token''',
        true,
      );
  static dynamic numofcards(dynamic response) => getJsonField(
        response,
        r'''$.result_size''',
      );
  static dynamic first6digits(dynamic response) => getJsonField(
        response,
        r'''$.cards[:].bin''',
        true,
      );
  static dynamic statusofcard(dynamic response) => getJsonField(
        response,
        r'''$.cards[:].status''',
        true,
      );
  static dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.cards[:].holder_name''',
        true,
      );
  static dynamic year(dynamic response) => getJsonField(
        response,
        r'''$.cards[:].expiry_year''',
        true,
      );
  static dynamic month(dynamic response) => getJsonField(
        response,
        r'''$.cards[:].expiry_month''',
        true,
      );
  static dynamic cardType(dynamic response) => getJsonField(
        response,
        r'''$.cards[:].type''',
        true,
      );
}

class DeleteNuveiCall {
  static Future<ApiCallResponse> call({
    String? tokensInApi = '',
    String? authToken = '',
    String? userId = '4',
  }) {
    final body = '''
{
   "card": {
        "token": "${tokensInApi}"
    },
    "user": {
        "id": "${userId}"
    }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DeleteNuvei',
      apiUrl: 'https://ccapi-stg.paymentez.com/v2/card/delete/',
      callType: ApiCallType.POST,
      headers: {
        'Auth-Token': '${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.TEXT,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddCardSwaggerAICall {
  static Future<ApiCallResponse> call({
    int? number,
    String? cardname = '',
    String? monthExpiary = '',
    String? yearExpiary = '',
    String? userId = '7403',
    int? token,
  }) {
    final body = '''
{
  "firebaseUserId": "${userId}",
  "number": ${number},
  "cardName": "${cardname}",
  "monthExpiry": "${monthExpiary}",
  "yearExpiry": "${yearExpiary}",
  "token": ${token},
  "status": 0,
  "message": "string",
  "payment_date": "string",
  "amount": 0,
  "transactionId": "string",
  "status_detail": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddCardSwaggerAI',
      apiUrl: 'https://naubank-api.herokuapp.com/api/v1/cards/add_card',
      callType: ApiCallType.POST,
      headers: {
        'accept': '*/*',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DeleteSwaggerAPICall {
  static Future<ApiCallResponse> call({
    String? cardnumber = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'DeleteSwaggerAPI',
      apiUrl:
          'https://naubank-api.herokuapp.com/api/v1/cards/delete_card_by_number/${cardnumber}',
      callType: ApiCallType.DELETE,
      headers: {
        'accept': '*/*',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DebitWithTokenCall {
  static Future<ApiCallResponse> call({
    String? userid = '',
    String? email = '',
    double? amount,
    String? description = 'Normal',
    String? devReference = '',
    double? vat = 0.00,
    String? cardToken = '',
    String? authToken = '',
    int? taxPercentange = 10,
    int? vatAmount = 10,
  }) {
    final body = '''
{
  "user": {
    "id": "${userid}",
    "email": "example@gmail.com"
  },
  "order": {
    "amount": ${amount},
    "description": "pozole",
    "dev_reference": "referencia",
    "vat": 0,
    "tax_percentage": 0
  },
  "card": {
    "token": "${cardToken}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DebitWithToken',
      apiUrl: 'https://ccapi-stg.paymentez.com/v2/transaction/debit/',
      callType: ApiCallType.POST,
      headers: {
        'Auth-Token': '${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.transaction.id''',
      );
  static dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.transaction.payment_date''',
      );
  static dynamic methodtype(dynamic response) => getJsonField(
        response,
        r'''$.transaction.payment_method_type''',
      );
  static dynamic carrier(dynamic response) => getJsonField(
        response,
        r'''$.transaction.carrier''',
      );
  static dynamic amount(dynamic response) => getJsonField(
        response,
        r'''$.transaction.amount''',
      );
  static dynamic installmenttype(dynamic response) => getJsonField(
        response,
        r'''$.transaction.installments_type''',
      );
  static dynamic cardOrgin(dynamic response) => getJsonField(
        response,
        r'''$.card.origin''',
      );
  static dynamic devReference(dynamic response) => getJsonField(
        response,
        r'''$.transaction.dev_reference''',
      );
  static dynamic carrierCode(dynamic response) => getJsonField(
        response,
        r'''$.transaction.carrier_code''',
      );
  static dynamic productDescription(dynamic response) => getJsonField(
        response,
        r'''$.transaction.product_description''',
      );
  static dynamic currentStatus(dynamic response) => getJsonField(
        response,
        r'''$.transaction.current_status''',
      );
  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.transaction.message''',
      );
  static dynamic statuscode(dynamic response) => getJsonField(
        response,
        r'''$.transaction.status_detail''',
      );
  static dynamic authorizatonCode(dynamic response) => getJsonField(
        response,
        r'''$.transaction.authorization_code''',
      );
  static dynamic lotNumber(dynamic response) => getJsonField(
        response,
        r'''$.transaction.lot_number''',
      );
  static dynamic transStatus(dynamic response) => getJsonField(
        response,
        r'''$.transaction.status''',
      );
  static dynamic cardlist(dynamic response) => getJsonField(
        response,
        r'''$.card''',
      );
  static dynamic bin(dynamic response) => getJsonField(
        response,
        r'''$.card.bin''',
      );
  static dynamic cardvalid(dynamic response) => getJsonField(
        response,
        r'''$.card.status''',
      );
  static dynamic cardtoken(dynamic response) => getJsonField(
        response,
        r'''$.card.token''',
      );
  static dynamic cardyear(dynamic response) => getJsonField(
        response,
        r'''$.card.expiry_year''',
      );
  static dynamic cardmonth(dynamic response) => getJsonField(
        response,
        r'''$.card.expiry_month''',
      );
  static dynamic transactionRef(dynamic response) => getJsonField(
        response,
        r'''$.card.transaction_reference''',
      );
  static dynamic cardtype(dynamic response) => getJsonField(
        response,
        r'''$.card.type''',
      );
  static dynamic cardnumber(dynamic response) => getJsonField(
        response,
        r'''$.card.number''',
      );
  static dynamic tracenumber(dynamic response) => getJsonField(
        response,
        r'''$.transaction.trace_number''',
      );
  static dynamic installments(dynamic response) => getJsonField(
        response,
        r'''$.transaction.installments''',
      );
  static dynamic transactionlist(dynamic response) => getJsonField(
        response,
        r'''$.transaction''',
      );
}

class StoreTransactionCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? status = '',
    String? date = '',
    String? authCode = '',
    int? installments,
    String? devReference = '',
    String? message = '',
    String? carrierCode = '',
    String? transactionId = '',
    int? statusDetail,
    String? installmentsType = '',
    String? paymentType = '',
    String? paymentDescription = '',
    String? cardBin = '',
    String? cardExpiryYear = '',
    String? cardExpiryMonth = '',
    String? cardTransactionReference = '',
    String? cardType = '',
    String? cardNumber = '',
    String? cardOrgin = '',
    double? amount,
  }) {
    final body = '''
{
  "userId": "${userId}",
  "transaction_status": "${status}",
  "transaction_payment_date": "${date}",
  "transaction_amount": ${amount},
  "transaction_authorization_code": "${authCode}",
  "transaction_installments": ${installments},
  "transaction_dev_reference": "${devReference}",
  "transaction_message": "${message}",
  "transaction_carrier_code": "${carrierCode}",
  "transactionId": "${transactionId}",
  "transaction_status_detail": ${statusDetail},
  "transaction_installments_type": "${installmentsType}",
  "transaction_payment_method_type": "${paymentType}",
  "transaction_product_description": "${paymentDescription}",
  "card_bin": "${cardBin}",
  "card_expiry_year": "${cardExpiryYear}",
  "card_expiry_month": "${cardExpiryMonth}",
  "card_transaction_reference": "${cardTransactionReference}",
  "card_type": "${cardType}",
  "card_number": "${cardNumber}",
  "card_origin": "${cardOrgin}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'StoreTransaction',
      apiUrl:
          'https://naubank-api.herokuapp.com/api/v1/transactions/create_transaction',
      callType: ApiCallType.POST,
      headers: {
        'accept': '*/*',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic success(dynamic response) => getJsonField(
        response,
        r'''$.success''',
      );
  static dynamic payload(dynamic response) => getJsonField(
        response,
        r'''$.payload''',
      );
  static dynamic payloadid(dynamic response) => getJsonField(
        response,
        r'''$.payload.id''',
      );
  static dynamic payloaddateCreated(dynamic response) => getJsonField(
        response,
        r'''$.payload.dateCreated''',
      );
  static dynamic payloaduserId(dynamic response) => getJsonField(
        response,
        r'''$.payload.userId''',
      );
  static dynamic payloadtransactionamount(dynamic response) => getJsonField(
        response,
        r'''$.payload.transaction_amount''',
      );
  static dynamic payloadtransactioninstallments(dynamic response) =>
      getJsonField(
        response,
        r'''$.payload.transaction_installments''',
      );
  static dynamic payloadtransactionstatusdetail(dynamic response) =>
      getJsonField(
        response,
        r'''$.payload.transaction_status_detail''',
      );
}

class GetTransactionSwaggerIDCall {
  static Future<ApiCallResponse> call({
    String? uid = '14',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetTransactionSwaggerID',
      apiUrl:
          'https://naubank-api.herokuapp.com/api/v1/transactions/get_all_transactions_by_user_id/${uid}',
      callType: ApiCallType.GET,
      headers: {
        'accept': '*/*',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic transactionId(dynamic response) => getJsonField(
        response,
        r'''$.payload[:].transactionId''',
        true,
      );
  static dynamic productdescription(dynamic response) => getJsonField(
        response,
        r'''$.payload[:].transaction_product_description''',
        true,
      );
  static dynamic transactionreference(dynamic response) => getJsonField(
        response,
        r'''$.payload[:].card_transaction_reference''',
        true,
      );
  static dynamic transactionamount(dynamic response) => getJsonField(
        response,
        r'''$.payload[:].transaction_amount''',
        true,
      );
  static dynamic dateCreated(dynamic response) => getJsonField(
        response,
        r'''$.payload[:].dateCreated''',
        true,
      );
}

class UpdateTransactionRatingCall {
  static Future<ApiCallResponse> call({
    String? id = '',
    int? rating,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateTransactionRating',
      apiUrl:
          'https://naubank-api.herokuapp.com/api/v1/transactions/update_transactions_rating/${id}?rating=${rating}',
      callType: ApiCallType.GET,
      headers: {
        'accept': '*/*',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetTransactionDetailsByCardNumberCall {
  static Future<ApiCallResponse> call({
    String? cardnumber = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetTransactionDetailsByCardNumber',
      apiUrl:
          'https://naubank-api.herokuapp.com/api/v1/transactions/get_all_transactions_by_card_number/${cardnumber}',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'cardnumber': cardnumber,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic transactionId(dynamic response) => getJsonField(
        response,
        r'''$.payload[:].transactionId''',
        true,
      );
  static dynamic transactionamount(dynamic response) => getJsonField(
        response,
        r'''$.payload[:].transaction_amount''',
        true,
      );
  static dynamic transactionreference(dynamic response) => getJsonField(
        response,
        r'''$.payload[:].card_transaction_reference''',
        true,
      );
  static dynamic dateCreated(dynamic response) => getJsonField(
        response,
        r'''$.payload[:].dateCreated''',
        true,
      );
  static dynamic productdescription(dynamic response) => getJsonField(
        response,
        r'''$.payload[:].transaction_product_description''',
        true,
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
