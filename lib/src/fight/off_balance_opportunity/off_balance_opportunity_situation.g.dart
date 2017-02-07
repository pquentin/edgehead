// GENERATED CODE - DO NOT MODIFY BY HAND

part of stranded.fight.off_balance_situation;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class OffBalanceOpportunitySituation
// **************************************************************************

class _$OffBalanceOpportunitySituation extends OffBalanceOpportunitySituation {
  @override
  final int actorId;
  @override
  final int culpritId;
  @override
  final int id;
  @override
  final int time;

  factory _$OffBalanceOpportunitySituation(
          [updates(OffBalanceOpportunitySituationBuilder b)]) =>
      (new OffBalanceOpportunitySituationBuilder()..update(updates)).build();

  _$OffBalanceOpportunitySituation._(
      {this.actorId, this.culpritId, this.id, this.time})
      : super._() {
    if (actorId == null) throw new ArgumentError.notNull('actorId');
    if (id == null) throw new ArgumentError.notNull('id');
    if (time == null) throw new ArgumentError.notNull('time');
  }

  @override
  OffBalanceOpportunitySituation rebuild(
          updates(OffBalanceOpportunitySituationBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  OffBalanceOpportunitySituationBuilder toBuilder() =>
      new OffBalanceOpportunitySituationBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! OffBalanceOpportunitySituation) return false;
    return actorId == other.actorId &&
        culpritId == other.culpritId &&
        id == other.id &&
        time == other.time;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, actorId.hashCode), culpritId.hashCode), id.hashCode),
        time.hashCode));
  }

  @override
  String toString() {
    return 'OffBalanceOpportunitySituation {'
        'actorId=${actorId.toString()},\n'
        'culpritId=${culpritId.toString()},\n'
        'id=${id.toString()},\n'
        'time=${time.toString()},\n'
        '}';
  }
}

class OffBalanceOpportunitySituationBuilder
    implements
        Builder<OffBalanceOpportunitySituation,
            OffBalanceOpportunitySituationBuilder> {
  OffBalanceOpportunitySituation _$v;

  int _actorId;
  int get actorId => _$this._actorId;
  set actorId(int actorId) => _$this._actorId = actorId;

  int _culpritId;
  int get culpritId => _$this._culpritId;
  set culpritId(int culpritId) => _$this._culpritId = culpritId;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  int _time;
  int get time => _$this._time;
  set time(int time) => _$this._time = time;

  OffBalanceOpportunitySituationBuilder();

  OffBalanceOpportunitySituationBuilder get _$this {
    if (_$v != null) {
      _actorId = _$v.actorId;
      _culpritId = _$v.culpritId;
      _id = _$v.id;
      _time = _$v.time;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OffBalanceOpportunitySituation other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other;
  }

  @override
  void update(updates(OffBalanceOpportunitySituationBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  OffBalanceOpportunitySituation build() {
    final result = _$v ??
        new _$OffBalanceOpportunitySituation._(
            actorId: actorId, culpritId: culpritId, id: id, time: time);
    replace(result);
    return result;
  }
}
