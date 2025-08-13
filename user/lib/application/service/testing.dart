
// void main(List<String> args) {
//    String ?a;

//    print(a) ;
//    A b=A()..a=10
//    ..hi();

//    List<int>g=[];
//    g.forEach((value){
//     print(value);
//    });
//  String pal='madam';

//  for(int i=0;i<pal.length;i++){
//    if(pal[i]!=pal[pal.length-1]){
    
//    }
//  }
 
 
// }

// void hey({required String name, int a=10}){

// }



// class Trinode{
//   Map<String,Trinode>children={};
//   bool isEndofWord=false;
// }


// class A{
//   int a=10;
//   hi(){

//   }

// }




// Logout Button

//  BlocListener<AuthBloc, AuthState>(
//           listener: (context, state) {
//             if (state is AuthLogOUt) {
//               Navigator.of(context).pushAndRemoveUntil(
//                 MaterialPageRoute(builder: (context) => SigninScreen()),
//                 ((Route route) => false),
//               );
//             }

//             if (state is AuthFailure) {
//               CostumWidget.showCustomSnackbar(
//                 context: context,
//                 message: state.message,
//                 backgroundColor: AppColors.red,
//               );
//             }
//           },

//           child: ElevatedButton(
//             onPressed: () {
//               context.read<AuthBloc>().add(LogoutEvent());
//             },
//             child: Text('Logout'),
//           ),
//         ),


void main(List<String> args) {
  String a='apple';
  String b='banana';
   int h=a.compareTo(b);
print(h);
}