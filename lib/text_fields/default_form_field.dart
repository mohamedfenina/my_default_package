import 'package:flutter/material.dart';


class DefaultFormField extends StatefulWidget {
  final TextEditingController contoller;
  final TextInputType type;
       Function? validate;
       Function? onChange;
      final String label;
      bool suffix ;
      bool isPassword ;
      bool? isUpdate;



   DefaultFormField({super.key, required this.contoller, required this.type,  this.validate,
     required this.label,  this.suffix = false,this.onChange  ,this.isUpdate,
     this.isPassword = false});

  @override
  State<DefaultFormField> createState() => _DefaultFormFieldState();
}

class _DefaultFormFieldState extends State<DefaultFormField> {
  Function? submited;

      Function? tab;

  Function? suffixPressed;

      IconData? prefix;

  Color color = Colors.blue;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label,
          style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w500),),
        SizedBox(
        height: 10,
        ),
        TextFormField(
          readOnly: widget.isUpdate == true ? true : false,
          onTapOutside: (event){
            FocusManager.instance.primaryFocus!.unfocus();
          },
          onChanged: (value){

             widget.onChange!(value);
          },


          maxLines: 1,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          scrollPadding: EdgeInsets.zero,
          cursorHeight: 20,
          controller: widget.contoller ,
          keyboardType: widget.type,
          validator: (String? value){
            return widget.validate!(value);
          },


          onTap: ()
          {
            tab!();
          },

          style: TextStyle(
              fontSize: 14,
              color: Colors.black,),



          cursorColor: color ,
          obscureText: widget.isPassword,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.fromLTRB(10, 18, 10, 18),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(

              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1.0,
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                  color: Colors.blue,
                  width: 1.5
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.0,
              ),
            ),

            // errorBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(10.0),
            //   borderSide: BorderSide(
            //     color: redColor,
            //     width: 2.0,
            //   ),
            // ),





            prefixIcon: prefix != null ? Icon(prefix,
              color:color,
            ) : null,
            suffixIcon: widget.suffix == true ? IconButton(icon:
            Icon(widget.isPassword == true ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              color: Colors.black,
            size: 22,),
              onPressed: (){
              setState(() {
                widget.isPassword = !widget.isPassword;
              });
            },
            ) : null,

          ),
        ),
      ],
    );
  }
}
