import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProductDetail extends StatefulWidget {
  @override
  ProductDetailState createState() => ProductDetailState();
}

class ProductDetailState extends State<ProductDetail> {
  String _currentSelectedCountry="India";
  List<Color> colors = [
    Colors.blue,
    Colors.amber,
    Colors.pink,
    Colors.deepPurple,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.orange
  ];

  @override
  Widget build(BuildContext context) {
   
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Detail",
          style: TextStyle(color: Colors.deepOrange),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10),
                height: 350,
                decoration: BoxDecoration(color: Colors.deepOrange),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text("Hello Madhujeet"),
                    ),
                    Expanded(
                        child:
                        Text("dshfihjksdjhfkdshhisdfdsbfdjbhfhjkdhuhdfhdsf"))
                  ],
                ),
              ),
              Container(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: colors.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: ()=> debugPrint("Click: $index"),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: colors[index],

                        ),
                      );
                    }),
              ),
              getDropdown(),
              descriptionLayout(),
              addToCartView(),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget descriptionLayout() {
    List<Description> descriptions=[new Description("Head", "Top part of the body"),
      new Description("Ear", "Top part of the body"),
      new Description("Eye", "Top part of the body"),
      new Description("Nose", "Top part of the body"),
      new Description("Stomach", "Middle part of the body"),
      new Description("Heart", "Above Stomach part of the body")];

    return Container(
      child: Column(
        children: <Widget>[
          Text(
            "More Description", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          ListView.builder(shrinkWrap:true, itemCount:descriptions.length,itemBuilder: (context, index) {
            return Container(child: Container(
              margin: EdgeInsets.all(10),
              child: Row(children: <Widget>[
                Text(descriptions[index]._title, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black87, fontSize: 20.0),),
                Text(descriptions[index]._description)

              ],),
            ),);
          }),



        ],
      ),
    );
  }

 Widget addToCartView() {
    return Container(margin:EdgeInsets.all(5),child: RaisedButton(child:Text("Add To Cart"),onPressed: ()=> debugPrint("clicked"), elevation: 3,),);
 }

 Widget getDropdown() {
   List<String> countries=["India", "Australia", "Afganistan", "Libya"];


    return DropdownButton<String>(

    onChanged: (String newValue)
      {
        setState(() {
          this._currentSelectedCountry=newValue;
        });
      },
      items: countries.map<DropdownMenuItem<String>>((String country)
      {
return DropdownMenuItem<String>(value: country,child: Text(country));
      }).toList(),

      value: _currentSelectedCountry,
    );

 }

}

class Description
{
  String _title;
  String _description;
  Description(this._title, this._description);
}
