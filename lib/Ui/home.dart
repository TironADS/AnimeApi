import 'package:anime/Bloc/anime_bloc.dart';
import 'package:anime/Repository/ModelClass/AnimeModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}




late AnimeModel data;
class _HomeState extends State<Home> {
  @override
  void initState() {
    BlocProvider.of<AnimeBloc>(context).add(FetchAnime());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: BlocBuilder<AnimeBloc, AnimeState>(
  builder: (context, state) {

    if(state is AnimeBlocLoading){
      return Center(child: CircularProgressIndicator(),);
    }
    if( state is AnimeBlocError){
      return Center(
        child: Text('something else !!'),
      );
    }
    if(state is AnimeBlocLoaded){
   data=BlocProvider.of<AnimeBloc>(context).animeModel;

    return ListView.separated(
            itemBuilder: (BuildContext context, int index){
              return Row(
                children: [
                  Image.network(data.data![index].image.toString(),height: 100,width: 70,),
                  SizedBox(width: 10,),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(width:220,child: Text(data.data![index].title.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.lightGreenAccent),)),
                      Row(
                        children: [
                          Text('Episodes :  ',style: TextStyle(fontSize: 12,color: Colors.white),),
                          Text(data.data![index].episodes.toString(),style: TextStyle(fontSize: 12,color: Colors.white),),
                        ],
                      ),
                    ],
                  )
                ],
              );
            },
            separatorBuilder:(BuildContext context, int index) =>
            const Divider(),
            itemCount: data.data!.length);}else{
      return SizedBox();
    }
  },
),
      ),
    );
  }
}
