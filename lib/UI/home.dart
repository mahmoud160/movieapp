

import 'package:flutter/material.dart';
import 'package:movieapp/Model/movie.dart';
import 'package:movieapp/UI/detail.dart';



class MovieListView extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();
  final List movies = [
    "Titanic",
    "Blade Runner",
    "Rambo",
    "The Avengers",
    "Avatar",
    "I Am Legend",
    "300",
    "The Wolf Of Wall Street",
    "Interstellar",
    "Game Of Thrones",
    "Vikings"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index){
          return Stack(children:[
            Positioned(child: movieCard(movieList[index], context)),

            Positioned(
                top: 10,
                child: movieImage(movieList[index].Images[0])
            )
          ]);
       //return Card(
       //  elevation: 4.5,
       //  color: Colors.white,
       //  child: ListTile(
       //    subtitle: Text(movieList[index].Title),
       //    leading: CircleAvatar(
       //      //backgroundColor: Colors.transparent,
       //     // child: Card(
       //        //child: Text("H"),
       //        //color: Colors.blue,
       //     // ),
       //      backgroundImage: NetworkImage(movieList[index].Images[0]),
       //    ) ,
       //    title: Text(movieList[index].Title),
       //    onTap: (){
       //      Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetails(movieName: movieList[index].Title
       //      ,movieImage: movieList[index].Images[0],
       //      )));
       //    },
       //    //onTap: () => debugPrint("movie name: ${movies[index]}"),
       //  ),
       //);
    }),
    );
  }
  Widget movieCard(Movie movie,BuildContext context){
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width,
        height: 120,
            child: Card(
              
              color: Colors.black45,
              child: Padding(
                padding: const EdgeInsets.only(top:8.0,bottom: 8.0,left: 54),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Text(movie.Title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 17
                          ),
                          ),
                        ),
                        Text("Rating: ${movie.imdbRating} /10",style: TextStyle(
                          color: Colors.grey
                        ),)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Released: ${movie.Released}",style: TextStyle(color: Colors.grey),),
                        Text(movie.Runtime,style: TextStyle(color: Colors.grey),),
                        Text(movie.Rated,style: TextStyle(color: Colors.grey),)
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ),
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetails(movieName: movie.Title,movie: movie,)))
      }
      );
  }
  Widget movieImage(String imageUrl)
  {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover
        )
      ),
    );
  }
}
