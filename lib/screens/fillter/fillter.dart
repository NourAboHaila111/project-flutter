import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petopia/model/filtter_model.dart';
import 'package:petopia/screens/fillter/cubit/cubit.dart';
import 'package:petopia/screens/fillter/cubit/states.dart';
import 'package:petopia/shared/style/colors.dart';

import '../../shared/components/appLocal.dart';

class FilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${getLang(context, "Filter")}'),
      ),
      body: BlocProvider(
        create: (_) => FilterCubit(),
        child: FilterForm(),
      ),
    );
  }
}

class FilterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        FilterModel filter;
        if (state is FilterInitial) {
          filter = state.filter;
        } else if (state is FilterUpdated) {
          filter = state.filter;
        } else {
          filter = FilterModel(); // default value
        }

        return _buildForm(context, filter);
      },
    );
  }

  Widget _buildForm(BuildContext context, FilterModel filter) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField<String>(
            iconEnabledColor:appColor ,
            icon:Icon(Icons.keyboard_arrow_down),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              labelText: '${getLang(context, "animal kind")}',
              hintText: '${getLang(context,"Select your animal kind")}',
            ),
            value: filter.animal,
            onChanged: (value) {
              context.read<FilterCubit>().updateFilter('animal', value);
            },
            items: ['Dog', 'cat','cawo'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            validator: (value) {
              if (value == null) {
                return '${getLang(context,"Please select your animal breed")}';
              }
              return null;
            },
          ),
          SizedBox(
            height: 15,
          ),
          DropdownButtonFormField<String>(
            iconEnabledColor:appColor ,
            icon:Icon(Icons.keyboard_arrow_down_outlined),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              labelText: '${getLang(context,"Please select your animal breed")}',
              hintText: '${getLang(context,"Select your animal breed")}',
            ),
            value: filter.breed,
            onChanged: (value) {
              context.read<FilterCubit>().updateFilter('breed', value);
            },
            items: ['Dachshund', 'Bulldog'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            validator: (value) {
              if (value == null) {
                return '${getLang(context,"Please select your animal breed")}';
              }
              return null;
            },
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              SizedBox(
                width: 21,
              ),
              Text(
                '${getLang(context,"Price range")}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
              ),
            ],
          ),
          Slider(
            activeColor:appColor,
            value: filter.priceRange,
            min: 0,
            max: 2000,
            divisions: 20,
            label: filter.priceRange.round().toString(),
            onChanged: (value) {
              context.read<FilterCubit>().updateFilter('priceRange', value);
            },
          ),
          Row(
            children: [
              SizedBox(width: 20,),
              Text(
                '0\$',
                style: TextStyle(
                    fontSize: 14,
                ),
              ),
              Spacer(),
              Text(
                '1000\$',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Spacer(),
              Text(
                '2000\$',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(width: 15,),

            ],
          ),

          SizedBox(
            height: 15,
          ),
          Text(
            '${getLang(context,"Gender")}',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ToggleElevatedButton(

                  label: '${getLang(context,"Male")}',
                  isSelected: filter.gender == 'Male',
                  onPressed: () {
                    context.read<FilterCubit>().updateFilter('gender', 'Male');
                  },
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: ToggleElevatedButton(
                  label: '${getLang(context,"Female")}',
                  isSelected: filter.gender == 'Female',
                  onPressed: () {
                    context.read<FilterCubit>().updateFilter('gender', 'Female');
                  },
                ),
              ),
            ],
          ),
          // ToggleButtons(
          //   children: [Text('Male'), Text('Female')],
          //   isSelected: [filter.gender == 'Male', filter.gender == 'Female'],
          //   onPressed: (index) {
          //     context.read<FilterCubit>().updateFilter('gender', index == 0 ? 'Male' : 'Female');
          //   },
          // ),
          SizedBox(
            height: 15,
          ),
          Text(
            '${getLang(context,"Age")}',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),
          ),
          Slider(
            activeColor: appColor,
            value: filter.age.toDouble(),
            min: 0,
            max: 2,
            divisions: 2,
            label: filter.age.round().toString(),
            onChanged: (value) {
              context.read<FilterCubit>().updateFilter('age', value.round());
            },
          ),

          Row(
            children: [
              SizedBox(width: 20,),
              Text(
                '${getLang(context,"Up to 4 month")}',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Spacer(),
              Text(
                '${getLang(context,"Up to 1 year")}',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Spacer(),
              Text(
                '${getLang(context,"over 1 year")}',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(width: 15,),

            ],
          ),

          SizedBox(
            height: 15,
          ),
          Text(
            '${getLang(context,"Character")}',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),
          ),
          Wrap(
            spacing: 6,
            children: [
              '${getLang(context,"Active")}', '${getLang(context,"Friendly")}', '${getLang(context,"Playful")}', '${getLang(context,"Calm")}',
                '${getLang(context,"Gentle")}', '${getLang(context,"Fierce")}', '${getLang(context,"Wise")}',
              '${getLang(context,"Docile")}', '${getLang(context,"Independent")}', '${getLang(context,"Social")}', '${getLang(context,"Quiet")}', '${getLang(context,"Resilient")}', '${getLang(context,"Healthy")}',

            ].map((character) {
              return ChoiceChip(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Optional: Set border radius
                ),
                selectedColor: appColor,
                label: Text(
                  character,
                  style: TextStyle(
                    color: filter.character.contains(character) ? Colors.white : Colors.black,
                  ),
                ),
                selected: filter.character.contains(character),
                onSelected: (selected) {
                  context.read<FilterCubit>().toggleCharacter(character);
                },
              );

            }).toList(),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(70, 110, 181, 1),
                  Color.fromRGBO(60, 0, 128, 0.6),
                ],
                begin: Alignment.topLeft,
                end: Alignment.topRight,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
            width: double.infinity,
            child: MaterialButton(
              textColor: Colors.white,
              onPressed: () {},
              child: Text('${getLang(context,"Apply")}'),
            ),
          )
        ],
      ),
    );
  }
}
class ToggleElevatedButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  ToggleElevatedButton({
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        foregroundColor: isSelected ? Colors.white : Colors.grey, backgroundColor: isSelected ? appColor : Colors.white,
        side: BorderSide(
          color: isSelected ? appColor : Colors.grey, // Change border color based on selection
          width: 2.0, // Set the border width
        ),

      ),
      child: Text(label),
    );
  }
}
