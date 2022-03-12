import 'package:simple_chat_application/core/action_response.dart';

import '../../../config/constants/constants.dart';
import '../../../utils/shared_objects.dart';
import '../models/session_model.dart';

class LoginUtils {
  static Future<ActionResponse<bool>> login({required String phoneNumber, required String username}) async {
    await SharedObjects.prefs.setBool('login', false);
    await SharedObjects.prefs.setString(Constants.sessionUid, phoneNumber);
    await SharedObjects.prefs.setString(Constants.sessionUsername, username);
    await SharedObjects.prefs.setString(Constants.fullName, username);
    initialSession(username: username, phoneNumber: phoneNumber, fullName: username);

    ActionResponse<bool> actionResponse = ActionResponse.success(true);

    return actionResponse;
  }
}
