import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/pets_categories.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.pets});
  final PetsModel pets;
  @override
  Widget build(BuildContext context) {
    Size sized = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            height: sized.height,
            width: sized.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Sized
                  SizedBox(height: sized.height * 0.75),
                  // Animal Name
                  Text(pets.name,
                      style: GoogleFonts.aBeeZee(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      )),
                  // description
                  Text(
                      textAlign: TextAlign.center,
                      pets.description,
                      style: GoogleFonts.aBeeZee(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black54),
                      )),
                ],
              ),
            ),
          ),
          // image container
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: sized.height * 0.7,
              width: sized.width,
              decoration: BoxDecoration(
                color: pets.color,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    // animal image
                    Center(
                      child: Image.asset(
                        pets.image,
                        height: sized.height * 0.5,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // sized
                    SizedBox(height: 20),
                    // animal details
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AgeSexOrigin(pets.age, "Age"),
                            AgeSexOrigin(pets.sex, "Sex"),
                            AgeSexOrigin(pets.origin, "Origin"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // pop icon
          Positioned(
              top: 60,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black54,
                  size: 40,
                ),
              ))
        ],
      ),
    );
  }

  Container AgeSexOrigin(value, name) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black45,
            ),
          ),
          //
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black26,
            ),
          ),
        ],
      ),
    );
  }
}
