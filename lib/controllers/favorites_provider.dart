import 'package:flutter/material.dart';
import '../core/enum/request_status.dart';

class FavoritesProvider with ChangeNotifier {
  final RequestStatus _requestStatus = RequestStatus.isLoading;

  RequestStatus get requestStatus => _requestStatus;
}
