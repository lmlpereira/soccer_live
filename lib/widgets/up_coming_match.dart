import 'package:flutter/material.dart';
import 'package:soccer_live/model/up_comming_model.dart';
import 'package:soccer_live/patterns.dart';

class UpComingMatches extends StatelessWidget {
  const UpComingMatches({
    super.key,
    required this.upMatch,
  });

  final UpcomingMatch upMatch;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 5, bottom: 5),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
              
              borderRadius: BorderRadius.circular(25), 
              color: Colors.white, 
              boxShadow: [BoxShadow(offset: const Offset(0, -5),color: upMatch.isFavorite ? kprimaryColor : Colors.black12)]
            ),
            child: Row(
              children: [
                Text(upMatch.homeTitle,style: TextStyle(fontSize: 16.5, color: Colors.grey.shade700, letterSpacing: -1.5, fontWeight: FontWeight.bold),),
                const Spacer(),
                Column(
                  children: [
                    Image.asset(upMatch.homeLogo, height: 45, width: 45,),
                    const Text("Home",style: TextStyle(fontSize: 11, letterSpacing: -1),)
                  ],
                ),
                const SizedBox(width: 10,),
                Column(
                  children: [
                      Text(upMatch.time,style: const TextStyle(fontSize: 18, color: Colors.black, letterSpacing: -1, fontWeight: FontWeight.bold),),
                      Text(upMatch.date, style: const TextStyle(fontSize: 12),)
                  ],
                ),
                const SizedBox(width: 10,),
                Column(
                  children: [
                    Image.asset(upMatch.awayLogo, height: 45, width: 45,),
                    const Text("Away",style: TextStyle(fontSize: 11, letterSpacing: -1),)
                  ],
                ),
                // ignore: prefer_const_constructors
                Spacer(),
                Text(upMatch.awayTitle,style: TextStyle(fontSize: 16.5, color: Colors.grey.shade700, letterSpacing: -1.5, fontWeight: FontWeight.bold),),
    
              ],
            ),
          ),
          Positioned(
            top: 12,
            left: 12,
            child: Icon(Icons.star, color: upMatch.isFavorite? kprimaryColor : Colors.white,))
        ],
      ),
    );
  }
}