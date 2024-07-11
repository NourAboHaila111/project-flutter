
import 'package:petopia/constant/classes/statuesrequest.dart';

handlingData(response) {
  if (response is StatuesRequest) {
    return response;
  } else {
    return StatuesRequest.success;
  }
}
