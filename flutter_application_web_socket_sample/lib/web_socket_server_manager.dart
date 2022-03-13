import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../config/config.dart';
import '../config/socket_event_constants.dart';

class WebSocketServerManager {
  late Socket _socket;

  bool connect(String userId) {
    _socket = io(
        WebSocketConfiguration.webSocketUrl,
        OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect()
            .setTimeout(10000)
            .build());

    _socket.connect();

    _socket.onConnect((_) {
      print('connect');
      _socket.emit(SocketEventContants.joinOwnRoom, userId);
    });

    _socket.on(SocketEventContants.sendNewMessageBroadcast, (data) {
      receivedMessage(data);
    });

    _socket.on('connect_error', (data) {
      print('connect_error:' + data.toString());
    });

    _socket.on('error', (data) {
      print('error:' + data.toString());
    });

    _socket.on('connect_timeout', (data) {
      print('connect_timeout:' + data.toString());
    });

    _socket.on('reconnect_failed', (data) {
      print('reconnect_failed:' + data.toString());
    });

    _socket.on('reconnect_error', (data) {
      print('reconnect_error:' + data.toString());
    });

    return true;
  }

  void receivedMessage(dynamic data) {
    print(data.toString());
  }

  void sendMessage(String message) {
    _socket.emit(SocketEventContants.sendNewMessageBroadcast, message);
  }
}
