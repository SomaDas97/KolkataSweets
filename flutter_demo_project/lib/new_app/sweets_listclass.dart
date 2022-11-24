
class SweetList{
   final int? id;
   final String? name;
   final String? image;
   final int? price;
   // final int? count;

   SweetList({this.id,this.name,this.image,this.price , });


   factory SweetList.fromMap(Map<String , dynamic>map){
     return SweetList(
       id: map["id"],
       name: map["name"],
       image: map["image"],
       price: map["price"],
       //count: map["count"]
     );
   }

   Map<String,dynamic> toMap() => {
     "name": name,
     "image": image,
     "price": price,
     //"count" : count,
   };
}