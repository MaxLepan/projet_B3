class Node {
  final int id;
  final String data;
  final String? questionKey;
  final String? image;

  Node(this.id, this.data, this.questionKey, this.image);

  @override
  bool operator ==(Object other) => other is Node && other.id == id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => '<$id -> $data>';
}
