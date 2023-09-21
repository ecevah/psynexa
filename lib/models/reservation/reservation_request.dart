class ReservationRequest {
  ReservationRequest({
    required this.data,
  });
  late final Data data;

  ReservationRequest.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.meetingDate,
    required this.isActive,
    required this.client,
    required this.psychologist,
    required this.meetingId,
  });
  late final String meetingDate;
  late final bool isActive;
  late final String client;
  late final String psychologist;
  late final String meetingId;

  Data.fromJson(Map<String, dynamic> json) {
    meetingDate = json['meetingDate'];
    isActive = json['isActive'];
    client = json['client'];
    psychologist = json['psychologist'];
    meetingId = json['meetingId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['meetingDate'] = meetingDate;
    _data['isActive'] = isActive;
    _data['client'] = client;
    _data['psychologist'] = psychologist;
    _data['meetingId'] = meetingId;
    return _data;
  }
}
