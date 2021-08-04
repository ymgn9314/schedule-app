import 'package:high_hat/domain/schedule/value/schedule_id.dart';
import 'package:high_hat/domain/user/value/answer.dart';
import 'package:high_hat/domain/user/value/avatar_url.dart';
import 'package:high_hat/domain/user/value/user_comment.dart';
import 'package:high_hat/domain/user/value/user_id.dart';
import 'package:high_hat/domain/user/value/user_name.dart';
import 'package:high_hat/domain/user/value/user_profile_id.dart';

class User {
  User({
    required this.id,
    required UserName userName,
    required UserProfileId userProfileId,
    required AvatarUrl avatarUrl,
    required List<UserId> userFriend,
    required Map<ScheduleId, List<Answer>> answersToSchedule,
    required Map<ScheduleId, UserComment> scheduleComment,
  })  : _userName = userName,
        _userProfileId = userProfileId,
        _avatarUrl = avatarUrl,
        _userFriend = userFriend,
        _answersToSchedule = answersToSchedule,
        _scheduleComment = scheduleComment;

  // 識別子
  final UserId id;
  // ユーザー名
  final UserName _userName;
  // ユーザーID
  final UserProfileId _userProfileId;
  // アバターurl
  final AvatarUrl _avatarUrl;
  // 友達
  final List<UserId> _userFriend;
  // スケジュールに対する回答
  final Map<ScheduleId, List<Answer>> _answersToSchedule;
  // スケジュールごとのコメント
  final Map<ScheduleId, UserComment> _scheduleComment;

  UserName get userName => _userName;
  UserProfileId get userProfileId => _userProfileId;
  AvatarUrl get avatarUrl => _avatarUrl;
  List<UserId> get userFriend => _userFriend;
  Map<ScheduleId, List<Answer>> get answerToSchedule => _answersToSchedule;
  Map<ScheduleId, UserComment> get scheduleComment => _scheduleComment;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is User && other.id == id);

  @override
  int get hashCode => runtimeType.hashCode ^ id.hashCode;
}
