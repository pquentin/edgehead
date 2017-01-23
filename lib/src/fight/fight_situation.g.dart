// GENERATED CODE - DO NOT MODIFY BY HAND

part of stranded.fight.fight_situation;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class FightSituation
// **************************************************************************

class _$FightSituation extends FightSituation {
  @override
  final BuiltList<int> enemyTeamIds;
  @override
  final BuiltMap<int, TimedEventCallback> events;
  @override
  final String groundMaterial;
  @override
  final int id;
  @override
  final BuiltList<int> playerTeamIds;
  @override
  final int time;

  factory _$FightSituation([updates(FightSituationBuilder b)]) =>
      (new FightSituationBuilder()..update(updates)).build();

  _$FightSituation._(
      {this.enemyTeamIds,
      this.events,
      this.groundMaterial,
      this.id,
      this.playerTeamIds,
      this.time})
      : super._() {
    if (enemyTeamIds == null) throw new ArgumentError.notNull('enemyTeamIds');
    if (events == null) throw new ArgumentError.notNull('events');
    if (groundMaterial == null)
      throw new ArgumentError.notNull('groundMaterial');
    if (id == null) throw new ArgumentError.notNull('id');
    if (playerTeamIds == null) throw new ArgumentError.notNull('playerTeamIds');
    if (time == null) throw new ArgumentError.notNull('time');
  }

  @override
  FightSituation rebuild(updates(FightSituationBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  FightSituationBuilder toBuilder() =>
      new FightSituationBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! FightSituation) return false;
    return enemyTeamIds == other.enemyTeamIds &&
        events == other.events &&
        groundMaterial == other.groundMaterial &&
        id == other.id &&
        playerTeamIds == other.playerTeamIds &&
        time == other.time;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, enemyTeamIds.hashCode), events.hashCode),
                    groundMaterial.hashCode),
                id.hashCode),
            playerTeamIds.hashCode),
        time.hashCode));
  }

  @override
  String toString() {
    return 'FightSituation {'
        'enemyTeamIds=${enemyTeamIds.toString()},\n'
        'events=${events.toString()},\n'
        'groundMaterial=${groundMaterial.toString()},\n'
        'id=${id.toString()},\n'
        'playerTeamIds=${playerTeamIds.toString()},\n'
        'time=${time.toString()},\n'
        '}';
  }
}

class FightSituationBuilder
    implements Builder<FightSituation, FightSituationBuilder> {
  FightSituation _$v;

  ListBuilder<int> _enemyTeamIds;
  ListBuilder<int> get enemyTeamIds =>
      _$this._enemyTeamIds ??= new ListBuilder<int>();
  set enemyTeamIds(ListBuilder<int> enemyTeamIds) =>
      _$this._enemyTeamIds = enemyTeamIds;

  MapBuilder<int, TimedEventCallback> _events;
  MapBuilder<int, TimedEventCallback> get events =>
      _$this._events ??= new MapBuilder<int, TimedEventCallback>();
  set events(MapBuilder<int, TimedEventCallback> events) =>
      _$this._events = events;

  String _groundMaterial;
  String get groundMaterial => _$this._groundMaterial;
  set groundMaterial(String groundMaterial) =>
      _$this._groundMaterial = groundMaterial;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  ListBuilder<int> _playerTeamIds;
  ListBuilder<int> get playerTeamIds =>
      _$this._playerTeamIds ??= new ListBuilder<int>();
  set playerTeamIds(ListBuilder<int> playerTeamIds) =>
      _$this._playerTeamIds = playerTeamIds;

  int _time;
  int get time => _$this._time;
  set time(int time) => _$this._time = time;

  FightSituationBuilder();

  FightSituationBuilder get _$this {
    if (_$v != null) {
      _enemyTeamIds = _$v.enemyTeamIds?.toBuilder();
      _events = _$v.events?.toBuilder();
      _groundMaterial = _$v.groundMaterial;
      _id = _$v.id;
      _playerTeamIds = _$v.playerTeamIds?.toBuilder();
      _time = _$v.time;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FightSituation other) {
    _$v = other;
  }

  @override
  void update(updates(FightSituationBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  FightSituation build() {
    final result = _$v ??
        new _$FightSituation._(
            enemyTeamIds: enemyTeamIds?.build(),
            events: events?.build(),
            groundMaterial: groundMaterial,
            id: id,
            playerTeamIds: playerTeamIds?.build(),
            time: time);
    replace(result);
    return result;
  }
}
