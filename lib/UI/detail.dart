import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/Model/movie.dart';

class MovieDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;
  final String movieImage;

  const MovieDetails({Key key, this.movieName, this.movie, this.movieImage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movieName),
        backgroundColor: Colors.blueGrey.shade900,
      ),
        body: ListView(
          children: [
              movieDetailsThumbnail(thumbnail: movie.Images[0]),
              movieDetailHeader(movie: movie,),
              HorizontalLine(),
              movieCast(movie: movie,),
              HorizontalLine(),
              movieImages(posters: movie.Images)
          ],
        ),
// body: Container(
//   child: Center(
//     child: RaisedButton(
//       child: Text("Go back"),
//       onPressed: (){
//         Navigator.pop(context);
//       },
//     ),
//   ),
// ),
    );
  }

}

class movieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;

  const movieDetailsThumbnail({Key key, this.thumbnail}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 190,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(thumbnail),
                    fit: BoxFit.cover
                  )
                ),
              ),
            Icon(Icons.play_circle_outline,size: 100,
            color: Colors.white)
          ],
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color(0x00f5f5f5),Color(0xfff5f5f5)],
            begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            )
          ),
          height: 80,
        )
      ],
    );
  }
}
class movieDetailHeader extends StatelessWidget {
  final Movie movie;

  const movieDetailHeader({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          moviePoster(poster: movie.Images[1].toString()),
          SizedBox(width: 16,),
          Expanded(
              child: movieHeader(movie: movie)
          )
        ],
      ),
    );
  }
}




class moviePoster extends StatelessWidget {
  final String poster;

  const moviePoster({Key key, this.poster}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width/4,
          height: 160,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(poster),
              fit: BoxFit.cover
            )
          ),
        ),
      ),
    );
  }
}

class movieHeader extends StatelessWidget {
  final Movie movie;

  const movieHeader({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${movie.Year} . ${movie.Genre}".toUpperCase(),
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.cyan
        ),
        ),
        Text(movie.Title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 32
        ),
        ),
        Text.rich(TextSpan(style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w300
        ),
        children: [
          TextSpan(
            text: movie.Plot
          ),
          TextSpan(
            text: "More....",
            style: TextStyle(
              color: Colors.indigoAccent
            )
          )
        ]
        ))

      ],
    );
  }
}
class movieCast extends StatelessWidget {
  final Movie movie;

  const movieCast({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          MovieField(field: "Cast",value: movie.Actors),
          MovieField(field: "Directors",value: movie.Director),
          MovieField(field: "Awards",value: movie.Awards,)
        ],
      ),
    );
  }
}
class MovieField extends StatelessWidget {
  final String field;
  final String value;

  const MovieField({Key key, this.field, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$field :",style: TextStyle(
          color: Colors.black38,
          fontSize: 12,
          fontWeight: FontWeight.w300
        ),),
        Expanded(
          child: Text(value,style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w300
          ),),
        )
      ],
    );
  }
}
class HorizontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
      child: Container(
        height: 0.5,
        color: Colors.grey,
      ),
    );
  }
}
class movieImages extends StatelessWidget {
  final List posters;

  const movieImages({Key key, this.posters}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left:15.0),
          child: Text("More movie posters".toUpperCase(),style: TextStyle(
            fontSize: 14,
            color: Colors.black26
          ),),
        ),
        Container(
          height: 200,
          padding: EdgeInsets.symmetric(vertical: 16),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  width: MediaQuery.of(context).size.width /4,
                  height: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(posters[index]),
                    fit: BoxFit.cover
                    )
                  ),
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(width: 8,),
              itemCount: posters.length),
        )
      ],
    );
  }
}






