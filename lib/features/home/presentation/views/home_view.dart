import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/styles.dart';
import 'package:todo_app/features/home/presentation/views/components/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.task), label: "Tasks"),
            BottomNavigationBarItem(icon: Icon(Icons.done), label: "Done"),
            BottomNavigationBarItem(
              icon: Icon(Icons.archive),
              label: "Archive",
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (_) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: 150),
                    height: 520,
                    decoration:BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)
                    ) ,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Add New Task" , style: AppStyles.style22.copyWith(
                            color: Colors.black
                          )),
                          SizedBox(height: 10,),
                          SizedBox(
                            height: 45,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                label: Text("Title" , style: AppStyles.style14.copyWith(
                                  fontSize: 16
                                ),),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: outlineInputBorder(),
                                focusedBorder: outlineInputBorder()
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          SizedBox(
                            height: 45,
                            child: TextFormField(
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                label: Text("Date" , style: AppStyles.style14.copyWith(
                                  fontSize: 16
                                ),),
                                
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: outlineInputBorder(),
                                focusedBorder: outlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          SizedBox(
                            height: 45,
                            child: TextFormField(
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                label: Text("Time" , style: AppStyles.style14.copyWith(
                                  fontSize: 16
                                ),),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: outlineInputBorder(),
                                focusedBorder: outlineInputBorder()
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.btnColor
                            ),
                            child: Text("Add Task" , style: AppStyles.style18.copyWith(
                              color: Colors.white
                            ),),
                          )
                        ],
                      ),
                    ),
                    
                    
                  ),
                );
              },
            );
          },
          backgroundColor: AppColors.blueBg,
          shape: StadiumBorder(),
          child: Icon(Icons.edit, color: Color.fromARGB(255, 23, 107, 122)),
        ),
        body: HomeViewBody(),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(122, 37, 78, 86),
                              ),
                              borderRadius: BorderRadius.circular(8)
                            );
  }
}
