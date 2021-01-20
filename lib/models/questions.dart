class Question {
  int _qno;
  String _ques;
  String _opt1;
  String _opt2;
  String _opt3;
  String _opt4;
  int _ans;

  Question(this._qno, this._ques, this._opt1, this._opt2, this._opt3,
      this._opt4, this._ans);

  int get qno => _qno;
  String get ques => _ques;
  String get opt1 => _opt1;
  String get opt2 => _opt2;
  String get opt3 => _opt3;
  String get opt4 => _opt4;
  int get ans => _ans;

  set quesno(int newqno) {
    this._qno = newqno;
  }

  set quest(String newques) {
    this._ques = newques;
  }

  set optn1(String newopt1) {
    this._opt1 = newopt1;
  }

  set optn2(String newopt2) {
    this._opt2 = newopt2;
  }

  set optn3(String newopt3) {
    this._opt3 = newopt3;
  }

  set optn4(String newopt4) {
    this._opt4 = newopt4;
  }

  set ansr(int newans) {
    this._ans = newans;
  }

  //convert question object to Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (qno != null) {
      map['qno'] = qno;
    }
    map['ques'] = ques;
    map['opt1'] = opt1;
    map['opt2'] = opt2;
    map['opt3'] = opt3;
    map['opt4'] = opt4;
    map['ans'] = ans;

    return map;
  }

  //convert map object to question object
  Question.fromMap(Map<String, dynamic> map) {
    this._qno = map['qno'];
    this._ques = map['ques'];
    this._opt1 = map['opt1'];
    this._opt2 = map['opt2'];
    this._opt3 = map['opt3'];
    this._opt4 = map['opt4'];
    this._ans = map['ans'];
  }
}
