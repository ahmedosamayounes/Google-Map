import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theming/my_colors.dart';
import '../../data/model/places/place_model.dart';
import '../../logic/cubit/places/places_cubit.dart';
import '../../logic/cubit/places/places_state.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloatingSearchBar extends StatelessWidget {
  const FloatingSearchBar({
    super.key,
    required this.onPlaceSelected,
    required this.onClear,
    required this.searchController,
    required this.searchFocusNode,
  });
  final TextEditingController searchController;
  final FocusNode searchFocusNode;
  final Function(PlaceModel) onPlaceSelected;
  final VoidCallback onClear;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10.h,
      left: 20.w,
      right: 20.w,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(15.r),

            child: TypeAheadField<PlaceModel>(
              controller: searchController,
              focusNode: searchFocusNode,
              hideOnEmpty: false,
              hideOnLoading: false,
              hideOnError: false,
              hideOnSelect: true,

              constraints: BoxConstraints(maxHeight: 300.h),

              offset: Offset(0, 8.h),

              suggestionsCallback: (search) async {
                if (search.trim().isEmpty) {
                  return null;
                }

                // call cubit
                final placesCubit = context.read<PlacesCubit>();
                // 1 give search from suggestionsCallback (ui) to cubit
                await placesCubit.searchPlaces(search);

                final currentState = placesCubit.state;
                if (currentState is PlacesSearchLoaded) {
                  // list from Model (data)
                  return currentState.places;
                } else if (currentState is PlacesSearchError) {
                  throw Exception(currentState.errorMessage);
                }
                return null;
              },

              itemBuilder: (context, PlaceModel place) {
                return ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: MyColors.primaryColor,
                    size: 24.r,
                  ),
                  title: Text(
                    place.displayName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14.sp),
                  ),
                );
              },

              // when choose place
              onSelected: onPlaceSelected,

              emptyBuilder: (context) => SizedBox(
                height: 50.h,
                child: Center(
                  child: Text(
                    "No results found",
                    style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                ),
              ),

              errorBuilder: (context, error) => SizedBox(
                height: 50.h,
                child: Center(
                  child: Text(
                    "Error: ${error.toString()}",
                    style: TextStyle(color: Colors.red, fontSize: 14.sp),
                  ),
                ),
              ),

              loadingBuilder: (context) => SizedBox(
                height: 50.h,
                child: Center(
                  child: LinearProgressIndicator(color: MyColors.primaryColor),
                ),
              ),

              builder: (context, controller, focusNode) {
                return TextField(
                  controller: controller,
                  focusNode: focusNode,
                  style: TextStyle(fontSize: 15.sp),
                  decoration: InputDecoration(
                    hintText: "Search location",
                    hintStyle: TextStyle(fontSize: 15.sp),
                    prefixIcon: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: MyColors.primaryColor,
                        size: 24.r,
                      ),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (controller.text.isNotEmpty)
                          IconButton(
                            icon: Icon(
                              Icons.clear,
                              color: Colors.grey,
                              size: 22.r,
                            ),
                            onPressed: () {
                              controller.clear();
                              onClear();
                            },
                          ),
                        Padding(
                          padding: EdgeInsets.only(right: 12.w),
                          child: Icon(
                            Icons.search,
                            color: MyColors.primaryColor,
                            size: 24.r,
                          ),
                        ),
                      ],
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(vertical: 15.h),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
