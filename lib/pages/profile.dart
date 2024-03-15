import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff09032f),
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios, color: Colors.white),
        title: Text("Profile"),
        elevation: 0,
        backgroundColor: Color(0xff09032f),
        actions: [
          Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.more_vert_outlined, color: Colors.white))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             Padding(
              padding: EdgeInsets.only(left: 25.0, top:8),
              child:  CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/1.jpeg'),
              ),
             ),
             Padding(
              padding: EdgeInsets.only(left: 35),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Avanya", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on, color: Colors.white, size: 18),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text("Indore- IN", style: TextStyle(color: Colors.white, wordSpacing: 2, letterSpacing: 4),),
                        )
                      ],
                    ),
                  )
                ],
              ),
             )
           
            ],
          ),


          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("18K",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
                    Text("Followers",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, ),),
                    
                  ],
                ),
                Container(
                  color: Colors.white,
                  width: 0.2,
                  height: 22,
                ),
                 Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("400",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
                    Text("Following",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, ),),
                    
                  ],
                ),
                Container(
                  color: Colors.white,
                  width: 0.2,
                  height: 22,
                ),

                Container(
                  padding: EdgeInsets.only(left: 18, top: 8 ,right: 18, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(33)),
                    gradient: LinearGradient(
                      colors: [Color(0xff6d0eb5), Color(0xff4059f1)],
                      begin: Alignment.bottomRight,
                      end: Alignment.centerLeft
                    )
                  ),
                  child: Text("Follow", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                )
              ],  
            ),
          ),


          Container(
            height: 44,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index){
                return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.white12)
                      ),
                    margin: EdgeInsets.only(right: 10),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 14, bottom: 5, right: 20, left: 20),
                      child: Text("tag ${index}", style: TextStyle(color: Colors.white)),
                    ),
                );
              },
            ),
          ),




          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: Color(0xffefefef),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),

              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top:30, right: 25, left: 25),
                    child: Text("Protfllio", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                  ),

                  Container(
                    padding: EdgeInsets.only(right: 25, left: 25),
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                       itemBuilder: (BuildContext context, int index){
                        return Padding(
                          padding: const EdgeInsets.only(right: 17, top:3),
                          child: index ==1 ?
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Seleted", style: TextStyle(color:Color(0xff434ae8), fontSize: 20)),
                                  CircleAvatar(
                                    radius: 2,
                                    backgroundColor: Color(0xff434ae8),
                                  )
                                ],
                              )
                            :  Text("Featured ${index}", style: TextStyle(color:Colors.grey.withOpacity(0.9), fontSize: 18)),
                        );                 
                        
                         Container();
                       }
                    ),
                  ),



                  Expanded(
                    child: Stack(
                      alignment:Alignment.bottomCenter,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            padding: EdgeInsets.only(right: 25, left: 25),
                            // height: 300,
                            child: ListView(
                              shrinkWrap: true,
                              children: [

                                  StaggeredGrid.count(
                              crossAxisCount: 4,
                              mainAxisSpacing: 4,
                              crossAxisSpacing: 4,
                              children: [
                                  StaggeredGridTile.count(
                                    crossAxisCellCount: 2, mainAxisCellCount: 2, 
                                    child: Image.asset('assets/images/1.jpeg', fit: BoxFit.cover)
                                  ),

                                  StaggeredGridTile.count(
                                    crossAxisCellCount: 2, mainAxisCellCount: 1, 
                                    child: Image.asset('assets/images/2.jpeg', fit: BoxFit.cover,)
                                  ),

                                   StaggeredGridTile.count(
                                    crossAxisCellCount: 1, mainAxisCellCount: 1, 
                                    child: Image.asset('assets/images/3.jpeg', fit: BoxFit.cover,)
                                  ),
                                   StaggeredGridTile.count(
                                    crossAxisCellCount: 1, mainAxisCellCount: 1, 
                                    child: Image.asset('assets/images/4.jpg', fit: BoxFit.cover)
                                  ),


                                  StaggeredGridTile.count(
                                    crossAxisCellCount: 4, mainAxisCellCount: 2, 
                                    child: Image.asset('assets/images/1.jpeg', fit: BoxFit.cover)
                                  ),

                                   StaggeredGridTile.count(
                                    crossAxisCellCount: 2, mainAxisCellCount: 2, 
                                    child: Image.asset('assets/images/2.jpeg', fit: BoxFit.cover)
                                  ),

                                   StaggeredGridTile.count(
                                    crossAxisCellCount: 2, mainAxisCellCount: 2, 
                                    child: Image.asset('assets/images/3.jpeg', fit: BoxFit.cover)
                                  ),


                                   StaggeredGridTile.count(
                                    crossAxisCellCount: 1, mainAxisCellCount: 2, 
                                    child: Image.asset('assets/images/1.jpeg', fit: BoxFit.cover)
                                  ),

                                  StaggeredGridTile.count(
                                    crossAxisCellCount: 1, mainAxisCellCount: 2, 
                                    child: Image.asset('assets/images/2.jpeg', fit: BoxFit.cover,)
                                  ),

                                   StaggeredGridTile.count(
                                    crossAxisCellCount: 2, mainAxisCellCount: 1, 
                                    child: Image.asset('assets/images/3.jpeg', fit: BoxFit.cover,)
                                  ),
                                   StaggeredGridTile.count(
                                    crossAxisCellCount: 2, mainAxisCellCount: 1, 
                                    child: Image.asset('assets/images/4.jpg', fit: BoxFit.cover)
                                  ),


                              ],
                            )
                              
                              ],
                            ),
                            
                            
                           
                          ),
                        ),

                      ],
                    ),
                    
                  )
                  
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}