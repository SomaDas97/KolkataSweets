
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/counterclass.dart';

class HomePage extends StatelessWidget {
   const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter App"),),

      body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         mainAxisSize: MainAxisSize.min,

         children: <Widget>[
            Text("Here we Count : ${Provider.of<Counterclass>(context).count}"),
         ],
       ),
    ),
      floatingActionButton:
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              key : const Key('decrement_floatingActionButton'),

                onPressed: () => Provider.of<Counterclass>(context,listen:false).decrement(),
                // onPressed: () => context.read<Counterclass>().decrement(),

              tooltip: 'decrement',
              child:const Icon(Icons.remove)
            ),
            const SizedBox(
              width: 20,
            ),
            FloatingActionButton(
                key : const Key('reset_floatingActionButton'),
                onPressed: () => Provider.of<Counterclass>(context, listen: false).reset(),

                // onPressed: () => context.read<Counterclass>().reset(),
                tooltip: 'reset',
                child:  Text("${Provider.of<Counterclass>(context).count}"),

                // const Icon(Icons.exposure_zero)
            ),
            const SizedBox(
              width: 20,
            ),
            FloatingActionButton(
                key : const Key('increment_floatingActionButton'),
                onPressed: () => Provider.of<Counterclass>(context, listen: false).increment(),

    // onPressed: () => context.read<Counterclass>().increment(),
                tooltip: 'increment',


                child:const Icon(Icons.add)
            )
          ],
        )


    );
  }
}
