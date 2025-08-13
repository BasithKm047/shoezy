import 'package:flutter/material.dart';
import 'package:shoezy/presentation/widgets/dots_button.dart';
import 'package:shoezy/presentation/widgets/drawer.dart';
import 'package:shoezy/utils/const/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 150),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10),
          child: AppBar(
            title: Column(
              children: [
                SizedBox(height: 5,),
                Text(
                  'Shipping location',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                  
                ),
                // SizedBox(height: ,),
                Row(
                  children: [
                    SizedBox(width: 25.0,),
                    Icon(Icons.location_on_outlined,
                    size: 20,
                    color: AppColors.orange,),
                    SizedBox(width: 2,),
                    Text('Tirurangadi',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                    ),),
                  ],
                )
              ],
            ),
            leading: Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Builder(
                builder: (context) => GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: DotsButton(),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 17),
                child: Row(
                  children: [
                    IconButton(onPressed: (){
                    
                    }, icon: Icon(Icons.notifications_none,
                    color: AppColors.black,)),
                    SizedBox(width: 10,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
