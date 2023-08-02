class AddressModel {
  String name;
  String address;
  String phone;
  String pincode;
  String id;
  AddressModel({
    required this.name,
    required this.address,
    required this.phone,
    required this.pincode,
    required this.id
  });

  Map<String ,dynamic> toJson()=>{
    "name":name,
    "address":address,
    "phone":phone,
    "pincode":pincode,
    "id":id,
  };
}
