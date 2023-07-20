class Geeta {
  final String no;
  final String san;
  final String eng;
  final String guj;
  final String hindi;

  Geeta(
      {required this.eng,
        required this.guj,
        required this.hindi,
        required this.no,
        required this.san});

  factory Geeta.formMap({required Map data}) {
    return Geeta(
        eng: data['eng'],
        guj: data['guj'],
        hindi: data['hindi'],
        no: data['no'],
        san: data['san']);
  }
}
