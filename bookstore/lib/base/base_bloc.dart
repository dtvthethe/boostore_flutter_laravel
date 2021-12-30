import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:bookstore/base/base_event.dart';

abstract class BaseBloc {
  StreamController<BaseEvent> _baseEventController =
      StreamController<BaseEvent>();
  // TODO: cai nay dung de lam gi
  StreamController<BaseEvent> _baseProcessController =
      StreamController<BaseEvent>();
  StreamController<bool> _loaddingStreamController = StreamController<bool>();

  Sink<BaseEvent> get eventSink => _baseEventController.sink;
  Sink<bool> get loaddingSink => _loaddingStreamController.sink;
  Stream<bool> get loadingStream => _loaddingStreamController.stream;
  Sink<BaseEvent> get processSink => _baseProcessController.sink;
  Stream<BaseEvent> get processStream => _baseProcessController.stream;

  BaseBloc() {
    _baseEventController.stream.listen((event) {
      if (event is! BaseEvent) {
        throw Exception('BaseBloc: event is not belong to BaseEvent');
      }

      dispatchEvent(event);
    });
  }

  void dispatchEvent(BaseEvent event);

  @mustCallSuper
  void dispose() {
    _baseEventController.close();
    _baseProcessController.close();
    _loaddingStreamController.close();
  }
}
