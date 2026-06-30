class CheckOutViewEntity {
  final String title;
  final String? number;

  CheckOutViewEntity({required this.title, this.number});
  static List<CheckOutViewEntity> checkOutList = [
    CheckOutViewEntity(title: 'الشحن', number: '1'),
    CheckOutViewEntity(title: 'العنوان', number: '2'),
    CheckOutViewEntity(title: 'الدفع', number: '3'),
    CheckOutViewEntity(title: 'المراجعه', number: '4'),
  ];
}
