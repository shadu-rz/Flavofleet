class AddressModel {
  String name;
  String address;
  String phone;
  String pincode;
  AddressModel({
    required this.name,
    required this.address,
    required this.phone,
    required this.pincode,
  });

  Map<String ,dynamic> toJson()=>{
    "name":name,
    "address":address,
    "phone":phone,
    "pincode":pincode,
  };
}
