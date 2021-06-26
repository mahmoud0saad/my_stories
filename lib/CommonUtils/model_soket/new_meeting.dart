class NewMeeting {
  Data data;
  String event;

  NewMeeting({this.data, this.event});

  NewMeeting.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    event = json['event'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['event'] = this.event;
    return data;
  }
}

class Data {
  int studentId;
  int teacherId;
  int meetingDbId;
  ZoomEmail zoomEmail;
  Meeting meeting;

  Data(
      {this.studentId,
        this.teacherId,
        this.meetingDbId,
        this.zoomEmail,
        this.meeting});

  Data.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    teacherId = json['teacher_id'];
    meetingDbId = json['meeting_db_id'];
    zoomEmail = json['zoom_email'] != null
        ? new ZoomEmail.fromJson(json['zoom_email'])
        : null;
    meeting =
    json['meeting'] != null ? new Meeting.fromJson(json['meeting']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_id'] = this.studentId;
    data['teacher_id'] = this.teacherId;
    data['meeting_db_id'] = this.meetingDbId;
    if (this.zoomEmail != null) {
      data['zoom_email'] = this.zoomEmail.toJson();
    }
    if (this.meeting != null) {
      data['meeting'] = this.meeting.toJson();
    }
    return data;
  }
}

class ZoomEmail {
  String username;
  String password;
  String meetingId;

  ZoomEmail({this.username, this.password, this.meetingId});

  ZoomEmail.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    meetingId = json['meeting_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['meeting_id'] = this.meetingId;
    return data;
  }
}

class Meeting {
  String uuid;
  int id;
  String hostId;
  String hostEmail;
  String topic;
  int type;
  String status;
  String startTime;
  int duration;
  String timezone;
  String createdAt;
  String startUrl;
  String joinUrl;
  String password;
  String h323Password;
  String pstnPassword;
  String encryptedPassword;
  Settings settings;

  Meeting(
      {this.uuid,
        this.id,
        this.hostId,
        this.hostEmail,
        this.topic,
        this.type,
        this.status,
        this.startTime,
        this.duration,
        this.timezone,
        this.createdAt,
        this.startUrl,
        this.joinUrl,
        this.password,
        this.h323Password,
        this.pstnPassword,
        this.encryptedPassword,
        this.settings});

  Meeting.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    id = json['id'];
    hostId = json['host_id'];
    hostEmail = json['host_email'];
    topic = json['topic'];
    type = json['type'];
    status = json['status'];
    startTime = json['start_time'];
    duration = json['duration'];
    timezone = json['timezone'];
    createdAt = json['created_at'];
    startUrl = json['start_url'];
    joinUrl = json['join_url'];
    password = json['password'];
    h323Password = json['h323_password'];
    pstnPassword = json['pstn_password'];
    encryptedPassword = json['encrypted_password'];
    settings = json['settings'] != null
        ? new Settings.fromJson(json['settings'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['id'] = this.id;
    data['host_id'] = this.hostId;
    data['host_email'] = this.hostEmail;
    data['topic'] = this.topic;
    data['type'] = this.type;
    data['status'] = this.status;
    data['start_time'] = this.startTime;
    data['duration'] = this.duration;
    data['timezone'] = this.timezone;
    data['created_at'] = this.createdAt;
    data['start_url'] = this.startUrl;
    data['join_url'] = this.joinUrl;
    data['password'] = this.password;
    data['h323_password'] = this.h323Password;
    data['pstn_password'] = this.pstnPassword;
    data['encrypted_password'] = this.encryptedPassword;
    if (this.settings != null) {
      data['settings'] = this.settings.toJson();
    }
    return data;
  }
}

class Settings {
  bool hostVideo;
  bool participantVideo;
  bool cnMeeting;
  bool inMeeting;
  bool joinBeforeHost;
  bool muteUponEntry;
  bool watermark;
  bool usePmi;
  int approvalType;
  String audio;
  String autoRecording;
  bool enforceLogin;
  String enforceLoginDomains;
  String alternativeHosts;
  bool closeRegistration;
  bool registrantsConfirmationEmail;
  bool waitingRoom;
  bool requestPermissionToUnmuteParticipants;
  List<String> globalDialInCountries;
  List<GlobalDialInNumbers> globalDialInNumbers;
  bool registrantsEmailNotification;
  bool meetingAuthentication;

  Settings(
      {this.hostVideo,
        this.participantVideo,
        this.cnMeeting,
        this.inMeeting,
        this.joinBeforeHost,
        this.muteUponEntry,
        this.watermark,
        this.usePmi,
        this.approvalType,
        this.audio,
        this.autoRecording,
        this.enforceLogin,
        this.enforceLoginDomains,
        this.alternativeHosts,
        this.closeRegistration,
        this.registrantsConfirmationEmail,
        this.waitingRoom,
        this.requestPermissionToUnmuteParticipants,
        this.globalDialInCountries,
        this.globalDialInNumbers,
        this.registrantsEmailNotification,
        this.meetingAuthentication});

  Settings.fromJson(Map<String, dynamic> json) {
    hostVideo = json['host_video'];
    participantVideo = json['participant_video'];
    cnMeeting = json['cn_meeting'];
    inMeeting = json['in_meeting'];
    joinBeforeHost = json['join_before_host'];
    muteUponEntry = json['mute_upon_entry'];
    watermark = json['watermark'];
    usePmi = json['use_pmi'];
    approvalType = json['approval_type'];
    audio = json['audio'];
    autoRecording = json['auto_recording'];
    enforceLogin = json['enforce_login'];
    enforceLoginDomains = json['enforce_login_domains'];
    alternativeHosts = json['alternative_hosts'];
    closeRegistration = json['close_registration'];
    registrantsConfirmationEmail = json['registrants_confirmation_email'];
    waitingRoom = json['waiting_room'];
    requestPermissionToUnmuteParticipants =
    json['request_permission_to_unmute_participants'];
    globalDialInCountries = json['global_dial_in_countries'].cast<String>();
    if (json['global_dial_in_numbers'] != null) {
      globalDialInNumbers = new List<GlobalDialInNumbers>();
      json['global_dial_in_numbers'].forEach((v) {
        globalDialInNumbers.add(new GlobalDialInNumbers.fromJson(v));
      });
    }
    registrantsEmailNotification = json['registrants_email_notification'];
    meetingAuthentication = json['meeting_authentication'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['host_video'] = this.hostVideo;
    data['participant_video'] = this.participantVideo;
    data['cn_meeting'] = this.cnMeeting;
    data['in_meeting'] = this.inMeeting;
    data['join_before_host'] = this.joinBeforeHost;
    data['mute_upon_entry'] = this.muteUponEntry;
    data['watermark'] = this.watermark;
    data['use_pmi'] = this.usePmi;
    data['approval_type'] = this.approvalType;
    data['audio'] = this.audio;
    data['auto_recording'] = this.autoRecording;
    data['enforce_login'] = this.enforceLogin;
    data['enforce_login_domains'] = this.enforceLoginDomains;
    data['alternative_hosts'] = this.alternativeHosts;
    data['close_registration'] = this.closeRegistration;
    data['registrants_confirmation_email'] = this.registrantsConfirmationEmail;
    data['waiting_room'] = this.waitingRoom;
    data['request_permission_to_unmute_participants'] =
        this.requestPermissionToUnmuteParticipants;
    data['global_dial_in_countries'] = this.globalDialInCountries;
    if (this.globalDialInNumbers != null) {
      data['global_dial_in_numbers'] =
          this.globalDialInNumbers.map((v) => v.toJson()).toList();
    }
    data['registrants_email_notification'] = this.registrantsEmailNotification;
    data['meeting_authentication'] = this.meetingAuthentication;
    return data;
  }
}

class GlobalDialInNumbers {
  String countryName;
  String number;
  String type;
  String country;

  GlobalDialInNumbers({this.countryName, this.number, this.type, this.country});

  GlobalDialInNumbers.fromJson(Map<String, dynamic> json) {
    countryName = json['country_name'];
    number = json['number'];
    type = json['type'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_name'] = this.countryName;
    data['number'] = this.number;
    data['type'] = this.type;
    data['country'] = this.country;
    return data;
  }
}