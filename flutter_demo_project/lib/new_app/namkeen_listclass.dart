class NamkeenList{
  final int? id;
  final String? name;
  final String? image;
  final int? price;

  NamkeenList({this.id,this.name,this.image,this.price});


  factory NamkeenList.fromMap(Map<String , dynamic>map){
    return NamkeenList(
        id: map["id"],
        name: map["name"],
        image: map["image"],
        price: map["price"]
    );
  }

  toMap()=>{
    id: ["id"],
    name: ["name"],
    image: ["image"],
    price: ["price"]
  };
}