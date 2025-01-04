import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/pets_categories.dart';
import 'package:flutter_application_2/screens/detail.dart';
import 'package:google_fonts/google_fonts.dart';

class PetsHomeScreen extends StatefulWidget {
  const PetsHomeScreen({super.key});

  @override
  State<PetsHomeScreen> createState() => _PetsHomeScreenState();
}

class _PetsHomeScreenState extends State<PetsHomeScreen> {
  int slectColor = 0;

  @override
  Widget build(BuildContext context) {
    List<List<PetsModel>> categories = [cats, dogs, birds, snakes, other];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 22, top: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('images/mySticker.jpg'),
                  ),
                  // sized
                  SizedBox(width: 5),
                  // name
                  Text(" Khaled Fetah , Istanbul",
                      style: GoogleFonts.aBeeZee(
                          textStyle: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )))
                ],
              ),
            ),
            // SizedbBox
            SizedBox(height: 30),
            // Adopt
            Padding(
              padding: EdgeInsets.only(left: 22),
              child: Text.rich(
                TextSpan(
                  text: "Adopt\n",
                  style: GoogleFonts.aBeeZee(
                      textStyle: TextStyle(
                    height: 1.2,
                    fontSize: 37,
                    fontWeight: FontWeight.bold,
                  )),
                  children: [
                    TextSpan(
                        text: "your pet's here!",
                        style: GoogleFonts.aBeeZee(
                          textStyle: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.normal,
                          ),
                        ))
                  ],
                ),
              ),
            ),
            // SizedbBox
            SizedBox(height: 20),
            // categories
            categorySelector(),
            //
            slectColor < categoryList.length
                ? (Padding(
                    padding: EdgeInsets.only(left: 22),
                    child: SizedBox(
                      height: 570,
                      child: ListView.builder(
                          itemCount: categories[slectColor].length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                      pets: categories[slectColor][index],
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.only(top: 30, right: 15),
                                child: Row(
                                  children: [
                                    // Ex 1
                                    Expanded(
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            height: 50,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 30),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: categories[slectColor]
                                                        [index]
                                                    .color,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              height: 230,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 230,
                                            child: Center(
                                              child: Image.asset(
                                                categories[slectColor][index]
                                                    .image,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    // Expanded 2 for discreption
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 25),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: categories[slectColor]
                                                      [index]
                                                  .color
                                                  .withOpacity(0.2),
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                              )),
                                          height: 150,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              left: 15,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // 1 name
                                                Text(
                                                    categories[slectColor]
                                                            [index]
                                                        .name,
                                                    style: GoogleFonts.aBeeZee(
                                                      textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 25,
                                                      ),
                                                    )),
                                                // SIZED
                                                SizedBox(height: 5),
                                                // 2 discreption
                                                Text(
                                                  categories[slectColor][index]
                                                      .breed,
                                                  style: GoogleFonts.aBeeZee(
                                                      textStyle: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15,
                                                  )),
                                                ),
                                                //
                                                Row(
                                                  children: [
                                                    // animal sex
                                                    Text(
                                                        categories[slectColor]
                                                                [index]
                                                            .sex,
                                                        style:
                                                            GoogleFonts.aBeeZee(
                                                          textStyle: TextStyle(
                                                            fontSize: 15,
                                                          ),
                                                        )),
                                                    // animal sex
                                                    Text(
                                                      ",${categories[slectColor][index].age} Year old",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ))
                : SizedBox(),
          ],
        ),
      )),
    );
  }

  // categorySelector METH?OD
  SizedBox categorySelector() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: categoryList.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: ((context, index) {
          // categorist list touch
          return GestureDetector(
            onTap: () {
              setState(() {
                slectColor = index;
              });
            },
            child: Padding(
              padding: EdgeInsets.only(
                left: 30,
                top: 10,
              ),
              child: Column(
                children: [
                  Container(
                    height: 80,
                    width: 75,
                    decoration: BoxDecoration(
                      color: slectColor == index
                          ? Color(0xffFF9166)
                          : Color(0xffFF9166).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: slectColor == index
                              ? Color(0xffFF9166).withOpacity(0.5)
                              : Colors.transparent,
                          blurRadius: 12,
                          spreadRadius: 1,
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(categoryList[index],
                          style: GoogleFonts.aBeeZee(
                            textStyle: TextStyle(
                              color: slectColor == index
                                  ? Colors.white
                                  : Colors.amber,
                              fontWeight: slectColor == index
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: 18,
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
