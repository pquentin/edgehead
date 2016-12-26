// GENERATED CODE - DO NOT MODIFY BY HAND

part of stranded.fight.counter_attack_situation;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class CounterAttackSituation
// **************************************************************************

class _$CounterAttackSituation extends CounterAttackSituation {
  @override
  final int counterAttacker;
  @override
  final int id;
  @override
  final int target;
  @override
  final int time;

  factory _$CounterAttackSituation(
          [updates(CounterAttackSituationBuilder b)]) =>
      (new CounterAttackSituationBuilder()..update(updates)).build();

  _$CounterAttackSituation._(
      {this.counterAttacker, this.id, this.target, this.time})
      : super._() {
    if (counterAttacker == null)
      throw new ArgumentError.notNull('counterAttacker');
    if (id == null) throw new ArgumentError.notNull('id');
    if (target == null) throw new ArgumentError.notNull('target');
    if (time == null) throw new ArgumentError.notNull('time');
  }

  @override
  CounterAttackSituation rebuild(updates(CounterAttackSituationBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CounterAttackSituationBuilder toBuilder() =>
      new CounterAttackSituationBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (other is! CounterAttackSituation) return false;
    return counterAttacker == other.counterAttacker &&
        id == other.id &&
        target == other.target &&
        time == other.time;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, counterAttacker.hashCode), id.hashCode),
            target.hashCode),
        time.hashCode));
  }

  @override
  String toString() {
    return 'CounterAttackSituation {'
        'counterAttacker=${counterAttacker.toString()},\n'
        'id=${id.toString()},\n'
        'target=${target.toString()},\n'
        'time=${time.toString()},\n'
        '}';
  }
}

class CounterAttackSituationBuilder
    implements Builder<CounterAttackSituation, CounterAttackSituationBuilder> {
  CounterAttackSituation _$v;

  int _counterAttacker;
  int get counterAttacker => _$this._counterAttacker;
  set counterAttacker(int counterAttacker) =>
      _$this._counterAttacker = counterAttacker;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  int _target;
  int get target => _$this._target;
  set target(int target) => _$this._target = target;

  int _time;
  int get time => _$this._time;
  set time(int time) => _$this._time = time;

  CounterAttackSituationBuilder();

  CounterAttackSituationBuilder get _$this {
    if (_$v != null) {
      _counterAttacker = _$v.counterAttacker;
      _id = _$v.id;
      _target = _$v.target;
      _time = _$v.time;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CounterAttackSituation other) {
    _$v = other;
  }

  @override
  void update(updates(CounterAttackSituationBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  CounterAttackSituation build() {
    final result = _$v ??
        new _$CounterAttackSituation._(
            counterAttacker: counterAttacker,
            id: id,
            target: target,
            time: time);
    replace(result);
    return result;
  }
}
