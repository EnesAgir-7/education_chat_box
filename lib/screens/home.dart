import 'package:exam_helper/screens/subject/math_subject.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => MathTopics()));
                  }, 
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: const BorderSide(
                        color: Color.fromRGBO(165, 216, 255, 1.0),
                        width: 2
                      )
                    ),
                    backgroundColor: Color.fromRGBO(165, 216, 255, 1.0),
                    elevation: 0
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 30,),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                            color: Color.fromRGBO(165, 216, 255, 1.0),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(165, 216, 255, 1.0),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue[200] ?? Colors.grey,
                                    offset: const Offset(0.0, 0.0),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                              child: Image.asset('assets/subject/math.png')),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: Color.fromRGBO(165, 216, 255, 1.0),
                          ),
                          child: Center(
                            child: Text('Mathematik',
                              maxLines: 1,
                              softWrap: false,
                              overflow: TextOverflow.fade,
                              style: TextStyle(color: Colors.blue[700], fontWeight: FontWeight.w800, fontSize: 32)
                            )
                          )
                        ),
                      ),
                    ],
                  )
                ),
              )
            ),
            Expanded(
              child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15), side: const BorderSide(color: Color.fromRGBO(252, 194, 215, 1.0), width: 2)),
                      backgroundColor: Color.fromRGBO(252, 194, 215, 1.0),
                      elevation: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                            color: Color.fromRGBO(252, 194, 215, 1.0),
                          ),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(252, 194, 215, 1.0),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.pink[200] ?? Colors.grey,
                                    offset: const Offset(0.0, 0.0),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                              child: Image.asset('assets/subject/deutsch.png')),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: Color.fromRGBO(252, 194, 215, 1.0),
                          ),
                          child: Center(
                            child: Text('Mathematik',
                              maxLines: 1,
                              softWrap: false,
                              overflow: TextOverflow.fade,
                              style: TextStyle(color: Colors.pink[700], fontWeight: FontWeight.w800, fontSize: 32)
                            )
                          )
                        ),
                      ),
                    ],
                  )
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}